---
layout: default
title: EEGLAB and EMG data
nav_title: "EEGLABとEMGデータ"
long_title: EEGLAB and EMG data
parent: Reference Topics
grand_parent: Tutorials
---
EEGLABとEMGデータ
====================

EEGLABは、EEGMEGMEGデータ解析、電子(EMG)データ解析、電子(EMG)データ解析、EMGイベント参加者の潜在能力(EMG-ERP)を計算し、各自の課題を解決します。

ご利用にあたって [emg2qwerty データセット](https://nemar.org/dataexplorer/detail?dataset_id=nm000104) NEMARは、QWERTYで キーボードのタッチタイで、フェーテルのストーリーから、EMG の記録まで。

## データセットの概要

emg2qwerty は、以下のとおりです。
- 32 双極 EMG チャネル (16 パーフォー)
- リストバンド
- 正確なタイミングでキーストロークイベント
- 見本抽出率:~2000 Hzの
- タスク: プロンプトされたテキストを入力するタッチ

このデータセットは、EMG-ERPの解析をおこないます。
1. イベント(keystrokes)
2. 別のキーは別の筋肉パターンを活動化させます
3. 左対右手比較が可能
4. 共通のキーのための高い試験の計算

## EMG BIDSについて

EEGLAB は、BIDS-formatted EMG の通信プロトコルです。 [bids-matlab ツール](https://github.com/sccn/bids-matlab-tools) EEGLABのメニューは、 <span style="color: brown">ファイル > インポートデータ > BIDSフォルダ構造</span>.

<img src="/assets/images/emg-bids-dialogbox-shot.png" alt="BIDS Import Dialog" style="width:60%">

あるいは、プログラムをプログラム的にインポートすることもできます。

```matlab
% Start EEGLAB
addpath('/path/to/eeglab');
eeglab nogui;

% Define BIDS root directory
bids_root = '/path/to/nm000104';
subject_id = 'sub-03734552';
session_id = 'ses-1620588853';

% Import using pop_importbids
[STUDY, ALLEEG] = pop_importbids(bids_root, ...
    'bidstask', 'typing', ...
    'subjects', subject_id(5:end));  % Remove 'sub-' prefix

EEG = ALLEEG(1);
```

EEGLAB は、データセットを実装しています。

![BIDS導入実績](/assets/images/emg-bidsimport-shot.png)

<img src="/assets/images/emg-eeglabview-shot.png" alt="EEGLAB Interface" style="width:60%">

BDF直通電話

```matlab
% Load BDF file
emg_file = fullfile(bids_root, subject_id, session_id, 'emg', ...
    sprintf('%s_%s_task-typing_emg.bdf', subject_id, session_id));
EEG = pop_biosig(emg_file);

% Load events from TSV file
events_file = fullfile(bids_root, subject_id, session_id, 'emg', ...
    sprintf('%s_%s_task-typing_events.tsv', subject_id, session_id));
events_table = readtable(events_file, 'FileType', 'text', 'Delimiter', '\t');

% Convert to EEGLAB event structure
for i = 1:height(events_table)
    EEG.event(i).latency = events_table.onset(i) * EEG.srate;
    EEG.event(i).type = char(events_table.value(i));
    if ~strcmp(events_table.key{i}, 'n/a')
        EEG.event(i).key = char(events_table.key(i));
    end
end

% Set data type
EEG.etc.datatype = 'emg';
EEG = eeg_checkset(EEG);
```

## サンティチェック: データの可視化

前処理,EEGLABのライブラリと構造解析

### 生EMGとは

EEGLABのテーマは、

```matlab
% Use EEGLAB menu: Plot > Channel data (scroll)
% Or from command line:
pop_eegplot(EEG, 1, 1, 1);
```

これは、あなたができるインタラクティブなウィンドウを開きます。
- 連続 連続
- 縦線でマークされたキーストロークイベントを見る
- 騒々しいチャンネルやアーティファクトを特定する
- ディスプレイスケールとタイムウィンドウを調整する

![Eメール](/assets/images/emg-rawdata-shot.png)

**EMG の注意:** は EEG です。
- 高信号幅(μV～mV)
- 振動(20-250Hz)
- キーストロークイベントと並ぶ活動のバースト

### イベント構造の点検

EEGLAB では、EEGLAB のスタッフとスタッフのスタッフを募集しています。

```matlab
% View events: Edit > Event values
% Or list event types from command line:
unique_events = unique({EEG.event.type});
fprintf('Found %d event types\n', length(unique_events));
fprintf('Total events: %d\n', length(EEG.event));

% Count specific keystroke types
keystroke_idx = find(contains({EEG.event.type}, 'keystroke_'));
fprintf('Keystroke events: %d\n', length(keystroke_idx));
```

### 計算力荷重(PSD)

EEGLAB のクラウドプロット機能

```matlab
% Use EEGLAB menu: Plot > Channel spectra and maps
% Or from command line:
% Note: 'freq', [] disables topoplots which are NOT meaningful for EMG
figure; pop_spectopo(EEG, 1, [0 EEG.xmax*1000], 'EEG', ...
    'freqrange', [0 500], ...
    'freq', []);
```

この表示:
-  すべての のための
- 500Hzの周波数範囲(EMGの頻度)
- **重要**:私達は置きました `'freq', []` topoplots にほんご - 電極は外れ筋に、EMG データは 。

![EMGとは](/assets/images/emg-spectopo-shot.png)

**パターン:** EMGの力はのための50-150 Hzのまわりののののののののの効率および20-250です Hz の範囲で

## EMG۪۫۰۰۪۫処理

EMG は EEG より別の前処理を要求します:

### 周波数範囲
EEG は、EEG を率いて、
- **EEG**:典型的1-50のHz
- **EMG**:典型的20-450 Hz (仕事:20-250 Hz)

### バンドパスフィルタリング

```matlab
% Apply bandpass filter for EMG
lowcut = 20;   % Hz - removes slow drifts
highcut = 250; % Hz - removes high-frequency noise

EEG = pop_eegfiltnew(EEG, 'locutoff', lowcut, 'hicutoff', highcut);
```

### チャネルの品質チェック

EMGについて ?????????????

```matlab
% Calculate variance for each channel
channel_vars = var(EEG.data, 0, 2);
mean_var = mean(channel_vars);
std_var = std(channel_vars);

% Flag channels outside 3 standard deviations
bad_chan_idx = find(channel_vars < mean_var - 3*std_var | ...
                    channel_vars > mean_var + 3*std_var);
```

## clean_rawdata は、

** 重要:** EMG は、EMG は、EMG を、Embe に、Embe を計算します。

### お問い合わせ

- **電極の変位**:リストバンドの動きは大きい広さのアーティファクトを作成します
- **悪いチャネル**: 一部のチャネルは、セッション全体に不接触の可能性があります
- **モーションアーティファクト**: タイプの腕/手首の動き
- **セッションの分散性**: いくつかのセッションは、他の人よりもはるかに悪い品質を持っている

### clean_rawdata がインストールされました。

既にインストールされていない場合:

```matlab
% From EEGLAB menu: File > Manage EEGLAB extensions
% Search for 'clean_rawdata' and install

% Or from command line:
plugin_askinstall('clean_rawdata');
```

### ASR(レイティファクトサブ再構築)

ASRは、

```matlab
% Apply clean_rawdata with ASR
% Parameters tuned for EMG data (more conservative than EEG defaults)
EEG = clean_rawdata(EEG, ...
    'FlatlineCriterion', 5, ...        % Remove channels flat for >5 seconds
    'ChannelCriterion', 0.8, ...       % Remove channels with <0.8 correlation to robust estimate
    'LineNoiseCriterion', 4, ...       % Line noise threshold
    'Highpass', [0.25 0.75], ...       % Already filtered, set to preserve
    'BurstCriterion', 20, ...          % ASR burst criterion (higher = more aggressive)
    'WindowCriterion', 0.25, ...       % Remove windows with >25% bad channels
    'BurstRejection', 'on', ...        % Enable ASR burst correction
    'Distance', 'Euclidean', ...       % Distance metric
    'WindowCriterionTolerances', [-Inf 7]); % Window tolerance

EEG = eeg_checkset(EEG);
```

### EMG の ASR パラメーター

調節する**主変数:**

1. **BurstCriterion** (デフォルト: EMGの20、EEGの5)
   - より高い値=より少ない積極的なクリーニング
   - EEGクリア
   - は の の の
   - EMGの推奨:15-25

2. **ChannelCriterion** (0.8推奨)
   - 隣人と相関しないチャンネルを削除
   - チャンネルが似ているべきリストバンド配列のために重要

3. **WindowCriterion** (0.25)
   - チャンネルの >25% が悪い時間ウィンドウを削除します。
   - 複数のチャネルに影響を与える動きのアーティファクトに有用

### ASRの代替品

手動制御を好む場合:

```matlab
% Mark bad channels
bad_channels = [5, 12, 23];  % Example indices

% Remove bad channels
EEG = pop_select(EEG, 'nochannel', bad_channels);

% Or interpolate (if you have spatial information)
% EEG = pop_interp(EEG, bad_channels, 'spherical');
```

### セッション品質メトリック

クリーニングの前に、セッションが除外されるべきであるかどうかを決定するために品質メトリックを計算します。

```matlab
% Compute RMS per channel
channel_rms = sqrt(mean(EEG.data.^2, 2));

% Identify outlier sessions (>3 SD from mean)
if mean(channel_rms) > subject_mean_rms + 3*subject_std_rms
    fprintf('WARNING: This session may be an outlier (high RMS)\n');
    fprintf('Consider excluding from group analysis\n');
end

% Check percentage of extreme values
pct_extreme = 100 * sum(abs(EEG.data(:)) > 1000) / numel(EEG.data);
if pct_extreme > 1
    fprintf('WARNING: %.2f%% of samples exceed 1000 µV\n', pct_extreme);
end
```

### ワークフローの削除

**推薦されたクリーニングの発注:**
1. バンドパス(20-250Hz) 高頻度で見る
2. 明らかに悪いチャンネルを識別します。 (ビジュアル検査)
3. パラメータ(BurstCriterion=20)
4. クリーンなデータの外観検査
5. 計算セッション品質メトリック
6. セッションを維持または除外するかどうかを決定

**セッション全体を除外する場合:**
- ASRで削除された30%
- >削除されたチャネルの50%
- 非常に広さのアーティファクトはクリーニングの後で主張します
- タイトルRMS >3 SD から パープル

### 重要なメモ

- ** ホテル RIVERBEFORE envelope**: マネージド ティファクト , 即日
- **EMG ** **:EMG は、EEG より一層高い評価を得ています。
- **セッションレベルの決定**: いくつかのセッションは、サルベージにあまりにもうるさいかもしれません
- **ドキュメント除外**: どのセッション/チャンネルが除外されたかを把握

## 線形の計算(EMG-ERP)

** 重要:**ERP分析は、生EMGデータによくある操作です。

### ERPs が公開されました

EMG は、以下のとおりです。
- 振動の肯定的なフェーズは否定的なフェーズをキャンセルします
- 結果:真の姿勢の有利化、素晴らし
- 平均化は、私たちが気にしている広さ情報を破壊します

### ソリューション: 線形封筒

*linear envelope** は、問題の解決に始まります。

1. **資格**: 絶対値を取る(すべての値が正になります)
2. **ローパスリング**: 修正された信号(10-20 Hz) を

```matlab
% Step 1: Rectify the filtered EMG
EEG.data = abs(EEG.data);

% Step 2: Low-pass filter to create envelope
envelope_cutoff = 20;  % Hz - 20 Hz provides faster response for typing tasks
EEG = pop_eegfiltnew(EEG, 'hicutoff', envelope_cutoff);

% Clip any negative values from zero-phase filtering
EEG.data(EEG.data < 0) = 0;

% Mark as envelope data
EEG.etc.is_envelope = true;
EEG.etc.envelope_cutoff = envelope_cutoff;
```

### 可視化: 線形封筒の計算

![封筒の計算](/assets/images/emg_envelope_computation.png)

この図は、2つの代表チャンネル(左と右リストバンド)の4つの処理段階を示しています。 赤いラインはキーストロークイベントをマークします。

1.  ** ** ** **
2. ** バンド** (グリーン): 20-250 Hz は、EMG を、EMG に取り除くことの頻度の残流の騒音を取り除きます
3. **立方**(紫): フィルタされた信号の絶対値 - すべての値肯定的な
4. ローパス ** ** ** ** ** ** ** ** **

この可視化を生成するコード:

```matlab
%% Visualize the envelope computation process
figure('Position', [100, 100, 1200, 800]);

% Select a time window with keystroke events (6 seconds)
time_window = [60, 66];
samples_window = round(time_window * EEG.srate);
time_vec = (samples_window(1):samples_window(2)-1) / EEG.srate;

% Select two representative channels (one left, one right wristband)
channels_to_plot = [1, 17];  % EMG0 (left), EMG16 (right)
channel_names = {'Left Wristband (EMG0)', 'Right Wristband (EMG16)'};

% Colors for each stage
colors = {[0.2 0.4 0.8], [0.3 0.7 0.3], [0.6 0.3 0.7], [0.8 0.2 0.5]};
stage_labels = {'raw signal', 'band-pass filter', 'rectified', 'low-pass filter (envelope)'};

for col = 1:length(channels_to_plot)
    chan_idx = channels_to_plot(col);

    % Get data for each stage (assuming EEG_raw, EEG_filtered, EEG are available)
    data_raw = EEG_raw.data(chan_idx, samples_window(1)+1:samples_window(2));
    data_bandpass = EEG_filtered.data(chan_idx, samples_window(1)+1:samples_window(2));
    data_rectified = abs(data_bandpass);
    data_envelope = EEG.data(chan_idx, samples_window(1)+1:samples_window(2));

    all_data = {data_raw, data_bandpass, data_rectified, data_envelope};

    for row = 1:4
        subplot(4, 2, (row-1)*2 + col);
        plot(time_vec, all_data{row}, 'Color', colors{row}, 'LineWidth', 1);

        if row == 1, title(channel_names{col}); end
        if row == 4, xlabel('Time (s)'); end
        if col == 1, ylabel(stage_labels{row}); end
        grid on;
    end
end
sgtitle('Linear Envelope Computation Process');
```

### 封筒の計算のための変数

**封筒の低パスの締切りの頻度: メニュー
- **5-10 Hz**: 最高の のための のための
- * 20 Hz**: 推薦
- 30-40 Hz**: 最低 最低

*20 Hz** は、次の点で、より一層のパフォーマンスを発揮します。

## EMGデータ取得

** 重要**: *envelope data** を省略します。

キーストロークイベントの周りのエポックを抽出します。

```matlab
% Define epoch window
epoch_start = -0.5;  % seconds before keystroke
epoch_end = 1.0;     % seconds after keystroke

% Find keystroke events
keystroke_types = {};
for i = 1:length(EEG.event)
    if contains(EEG.event(i).type, 'keystroke_')
        keystroke_types{end+1} = EEG.event(i).type;
    end
end
unique_keystrokes = unique(keystroke_types);

% Extract epochs
EEG = pop_epoch(EEG, unique_keystrokes, [epoch_start epoch_end], 'epochinfo', 'yes');
```

### ベースライン補正

ベースラインを削除してイベント関連のアクティビティに焦点を当てます。

```matlab
% Define baseline window (avoid 100ms immediately before keystroke)
baseline_window = [-0.5, -0.1];  % seconds

% Remove baseline
EEG = pop_rmbase(EEG, baseline_window * 1000);  % Convert to ms
```

## EMG-ERPの計算

** 取引条件:** 条件を満たす 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 に サブ サンプリング 条件 条件 条件 `pop_select(EEG, 'trial', randperm(EEG.trials, n))` 試験のカウントに一致し、等しい信号に騒音の比率を保障するため。

EMG-ERP は、EMG-ERP の略称です。

```matlab
% Identify channel groups
% NOTE: Verified empirically - adjust based on your hardware setup
left_wristband = 1:16;    % LEFT hand (EMG0-EMG15)
right_wristband = 17:32;  % RIGHT hand (EMG16-EMG31)

% NOTE: EEG should contain envelope data from step 2b!
% Extract epochs for specific keys
EEG_a = pop_epoch(EEG, {'keystroke_a'}, [epoch_start epoch_end]);
EEG_a = pop_rmbase(EEG_a, baseline_window * 1000);

EEG_k = pop_epoch(EEG, {'keystroke_k'}, [epoch_start epoch_end]);
EEG_k = pop_rmbase(EEG_k, baseline_window * 1000);

% Compute ERPs from envelope (average across trials)
ERP_a_left = mean(EEG_a.data(left_wristband, :, :), 3);
ERP_k_right = mean(EEG_k.data(right_wristband, :, :), 3);
```

### EEGLABのEMG-ERPは、

EEGLABのERPプロット機能、イベントの出発点は、

```matlab
% Use EEGLAB menu: Plot > Channel ERPs > In rectangular array
% Or from command line:
figure; pop_plottopo(EEG_a, [1:16], 'EMG-ERP for key "a" (left channels)', ...
    0, 'ydir', 1);
```

この図は、すべてのバースト・イニシャル・キーの対象となります。 Step2b は、全ての32 チャンネルが 4 個ある。

![個々のチャネル 採用情報](/assets/images/emg_all_channels.png)

* 選択 *: が含まれています から から から から から が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています が含まれています  この  この から から から から から 本 本 本 本 本 本 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 〜 タイトルのタイトルは、

横の左キー(a,s,d,e,r,...)は、左上にあるリストバンド(左上)より、右手キー(k,l,j,i,o,...)は右下にあるリストバンド(右下)より。

**EMGの重要:**
- EEGLABのtopoplot(スプカルマップ)は、EMGデータがそのままに
- コースのプロットコース
- 同じ の

## EMG 対 EEG

| アスペクト | EEG | EMG |
|--------|-----|-----|
| 周波数範囲** | 1-50Hz | 20～450Hz |
|**広さ** | マイクロボルト | マイクロボルト
|**空間分解能** | 脳領域 | 特定の筋肉 |
|**Common artifacts** | 眼圧・姿勢張力 | 球・電極変位 |
|**ベースライン** | 事前刺激期間 | 予報期間 |
|**ERPの計算** | 直近のパープル作品 | 直線に施された作品は、ぜひご覧ください。 お問い合わせ
お問い合わせ ERPの振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動・振動

## EEGLAB による EEGLAB の解析

1. AlwayS は、次の機能を備えています。 Epoching パーソナライゼーション およびローパス (タイプ 20 Hz)。

2. **EEGLABのツール**:
   - `pop_eegplot()` 生データ検査のスクロール
   - `pop_spectopo()` 周波数解析(EMG の 500 Hz を拡張する)
   - `pop_plottopo()` または `pop_plotdata()` ERPの使命
   - EEGLABの地理的地図(topoplot) - EMG について

3. 選択する EEG(自動車用20-250Hz) `pop_eegfiltnew()`.

4. **ベースライン補正が重要**: 使用条件 `pop_rmbase()` プレエベントベースラインを削除します。 封筒は、ほぼゼロベースラインを持っている必要があります。

5. **EEGLABでSanity** *:
   - Plot は、 `pop_eegplot(EEG, 1, 1, 1)`
   - PSDは、 `pop_spectopo()` - 20-250の力 Hzの
   - メニューでイベントを調べる: 編集 > イベントの値

6. * ドキュメントのアカウント**: リソース = ライセンス `pop_epoch()` チェックイン `.trials` フィールド。 バランス条件の使用 `pop_select()`.

7. **横方向確認**: 動きを実行する手でより強い活発化を期待して下さい。

8. **個別トライアルの仮想化**: 使用条件 `pop_eegplot(EEG_epoched, 0, 1, 1)` トライアルバイトライアルの分散性を検査します。

9. サブジェクトの場合**: EEGLABのSTUDYを継承するデータベース

10. ** 比較する** ERPs は、ERPs は、ERPs は、ERPs は、ERPs は、ERPs は、ERPs は、ERPs は、ERPs は、ERPs は、ERPs は、Ess は、Ess は、Es は、Es は、Ess は、Es は、Es は、Es は、Es は、Es は、Es は、Es は、Es は、Es は、Es s の の は、 は、 の は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 の は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 と は、 は、 は、 

## 追加リソース

- **データセット**: [NEMAR の emg2qwerty](https://nemar.org/dataexplorer/detail?dataset_id=nm000104)
- **ペーパー**: [NeurIPS 2024のemg2qwerty](https://arxiv.org/abs/2410.20081)

## 関連チュートリアル

- [EEGLABとMEGデータ](EEGLAB_and_MEG_data.html)
- [自動加工パイプライン](../11_Scripting/automated_pipeline.html)
- [EEGLABのEEG BIDS分析](../11_Scripting/Analyzing_EEG_BIDS_data_in_EEGLAB.html)
