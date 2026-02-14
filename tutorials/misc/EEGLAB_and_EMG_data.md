---
layout: default
title: EEGLAB and EMG data
long_title: EEGLAB and EMG data
parent: Reference Topics
grand_parent: Tutorials
---
EEGLABとEMGデータ
====================

EEGLABは、EEGおよびMEGデータに加えて、電子画像(EMG)データを処理する支援を行っています。 このチュートリアルでは、BIDS形式でEMGデータを分析し、EMGイベント関連の潜在能力(EMG-ERP)を計算し、異なる条件で筋肉の活性化パターンを比較する方法を説明します。

ご利用にあたって [emg2qwerty データセット](https://nemar.org/dataexplorer/detail?dataset_id=nm000104) NEMAR では、QWERTY キーボードのタッチタイピング時に、フェーアームの筋肉から表面 EMG の記録を含む。

## データセットの概要

emg2qwerty データセットには以下が含まれます。
- 32 双極 EMG チャネル (16 パーフォーアーム)
- リストバンドセンサーからの表面EMGの録音
- 正確なタイミングでキーストロークイベント
- 見本抽出率:~2000 Hzの
- タスク: プロンプトされたテキストを入力するタッチ

このデータセットは、EMG-ERP解析のデモに最適です。
1. イベント(keystrokes)は正確なタイミングを持っています
2. 別のキーは別の筋肉パターンを活動化させます
3. 左対右手比較が可能
4. 共通のキーのための高い試験の計算

## EMG BIDSデータのインポート

EEGLAB は、BIDS-formatted EMG データをインポートすることができます。 [bids-matlab ツール](https://github.com/sccn/bids-matlab-tools) プラグイン。 EEGLABを起動した後、メニュー項目を使用する <span style="color: brown">ファイル > インポートデータ > BIDSフォルダ構造から</span>.

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

インポート後、EEGLABはデータセット情報を表示します。

![BIDSインポート結果](/assets/images/emg-bidsimport-shot.png)

<img src="/assets/images/emg-eeglabview-shot.png" alt="EEGLAB Interface" style="width:60%">

BDFファイルを直接ロードすることもできます。

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

前処理の前に、EEGLABの可視化ツールを使用してデータ品質と構造を確認することが重要です。

### 生EMGデータのプロット

EEGLABのスクロールデータビューアを使用して、原材料EMG信号とイベントを検査します。

```matlab
% Use EEGLAB menu: Plot > Channel data (scroll)
% Or from command line:
pop_eegplot(EEG, 1, 1, 1);
```

これは、あなたができるインタラクティブなウィンドウを開きます。
- 連続したEMGデータをスクロール
- 縦線でマークされたキーストロークイベントを見る
- 騒々しいチャンネルやアーティファクトを特定する
- ディスプレイスケールとタイムウィンドウを調整する

![未加工EMG データビューア](/assets/images/emg-rawdata-shot.png)

**EMGの注意:** スクロールビューアは EEG と同じですが、期待します。
- 高振幅信号(μV～mV)
- 高周波振動(20-250Hz)
- キーストロークイベントと並ぶ活動のバースト

### イベント構造の点検

EEGLABのイベントビューアを使用してイベントのタイミングとタイプを確認します。

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

### 計算力スペクトル密度(PSD)

EEGLABのスペクトルプロット機能を使用して、EMG周波数コンテンツを確認します。

```matlab
% Use EEGLAB menu: Plot > Channel spectra and maps
% Or from command line:
% Note: 'freq', [] disables topoplots which are NOT meaningful for EMG
figure; pop_spectopo(EEG, 1, [0 EEG.xmax*1000], 'EEG', ...
    'freqrange', [0 500], ...
    'freq', []);
```

この表示:
- すべてのチャネルのoverlaidのための力のスペクトル密度
- 500Hzまでの周波数範囲(EMGの適切な)
- **重要**:私達は置きました `'freq', []` topoplots を無効にするには - 電極が外れ筋にあるので、EMG データは意味がありません。

![EMGについて パワースペクトラム](/assets/images/emg-spectopo-shot.png)

**期待パターン:** ほとんどのEMG力は筋肉活動のための50-150 Hzのまわりのピークと20-250 Hzの範囲で集中されるべきです。

## EMGの前処理

EMG 信号は EEG より別の前処理を要求します:

### 周波数範囲
EMG は EEG よりも高い周波数が含まれています。
- **EEG**:典型的に1-50のHz
- **EMG**:典型的に20-450 Hz (モーター仕事:20-250 Hz)

### バンドパスフィルタリング

```matlab
% Apply bandpass filter for EMG
lowcut = 20;   % Hz - removes slow drifts
highcut = 250; % Hz - removes high-frequency noise

EEG = pop_eegfiltnew(EEG, 'locutoff', lowcut, 'hicutoff', highcut);
```

### チャネルの品質チェック

EMG の場合、異常な分散のチャンネルを確認します。

```matlab
% Calculate variance for each channel
channel_vars = var(EEG.data, 0, 2);
mean_var = mean(channel_vars);
std_var = std(channel_vars);

% Flag channels outside 3 standard deviations
bad_chan_idx = find(channel_vars < mean_var - 3*std_var | ...
                    channel_vars > mean_var + 3*std_var);
```

## clean_rawdata によるデータのクリーニング

**重要:** EMGのデータは非常に騒々しいチャネルか悪い区分を持つことができます。 これらは、エンベロープを計算するBEFOREをきれいにする必要があります。そうしないとアーティファクトはERPに保存されます。

### EMGのクリーニングが重要な理由

- **電極の変位**:リストバンドの動きは大きい広さのアーティファクトを作成します
- **悪いチャネル**: 一部のチャネルは、セッション全体に不接触の可能性があります
- **モーションアーティファクト**: タイプの腕/手首の動き
- **セッションの分散性**: いくつかのセッションは、他の人よりもはるかに悪い品質を持っている

### clean_rawdataのインストール プラグイン

既にインストールされていない場合:

```matlab
% From EEGLAB menu: File > Manage EEGLAB extensions
% Search for 'clean_rawdata' and install

% Or from command line:
plugin_askinstall('clean_rawdata');
```

### ASR(アーティファクトサブスペース再構築)の使用

ASRは、良いセグメントを保存しながら、悪いデータ部分を削除します。

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

### EMG の ASR パラメータを理解する

調節する**主変数:**

1. **BurstCriterion** (デフォルト: EMGの20、EEGの5)
   - より高い値=より少ない積極的なクリーニング
   - EEGよりも自然に高い振幅
   - Too積極的な(低値)は本物の筋肉の活動を取除きます
   - EMGの推奨:15-25

2. **ChannelCriterion** (0.8推奨)
   - 隣人と相関しないチャンネルを削除
   - チャンネルが似ているべきリストバンド配列のために重要

3. **WindowCriterion** (0.25)
   - チャンネルの >25% が悪い時間ウィンドウを削除します。
   - 複数のチャネルに影響を与える動きのアーティファクトに有用

### ASRの代替:手動悪いチャネル除去

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
1. バンドパスフィルタ(20-250 Hz) - 低/高周波数ノイズを除去します
2. 明らかに悪いチャンネルを識別します。 (ビジュアル検査)
3. 保守的なパラメータ(BurstCriterion=20)でASRを適用
4. クリーンなデータの外観検査
5. 計算セッション品質メトリック
6. セッションを維持または除外するかどうかを決定

**セッション全体を除外する場合:**
- ASRで削除されたデータの30%
- >削除されたチャネルの50%
- 非常に広さのアーティファクトはクリーニングの後で主張します
- 主題レベルRMS >3 SD から 平均

### 重要なメモ

- **クリーンBEFORE envelope**: フィルタされたデータのアーティファクトは、封筒に保存されます
- **EMG **のための保守的**:EMGは、EEGよりも高い振幅を持っています, オーバークリーニングしないでください
- **セッションレベルの決定**: いくつかのセッションは、サルベージにあまりにもうるさいかもしれません
- **ドキュメント除外**: どのセッション/チャンネルが除外されたかを把握

## 線形封筒の計算(EMG-ERPのためのCRITICAL)

**重要:**標準ERP分析は、生EMGデータにうまく動作しません。 なぜですか?

### なぜ生EMG ERPsが失敗するのか

EMGは高周波振動信号(20-250Hz)です。 生EMGのエポックを一緒に平均すると:
- 振動の肯定的なフェーズは否定的なフェーズをキャンセルします
- 結果:真の筋肉の活発化を反映しない弱い、騒々しいERPs
- 平均化は、私たちが気にしている広さ情報を破壊します

### ソリューション: 線形封筒

**linear envelope** は、問題のある発振を除去する際の広さ情報を保持します。

1. **資格**: 絶対値を取る(すべての値が正になります)
2. **ローパスフィルタリング**: 修正された信号(10-20 Hz)を滑らかにして下さい

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

1. **未加工信号** (青):基線騒音および漂流が付いているろ過されていないEMG
2. **バンド パス フィルター** (緑): 20-250 Hz は EMG をろ過しました-低頻度の漂流および高周波騒音を取除きます
3. **立方**(紫): フィルタされた信号の絶対値 - すべての値肯定的な
4. **ローパス フィルター/線形封筒** (マゼンタ): 筋肉活動の広さを捕獲する滑らかな封筒(20のHzの締切り)

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
- **5-10 Hz**: 最高の滑らかになること、遅い動きのための
- ** 20のHz**: タイプの速い仕事のための標準(推薦される)
- ** 30-40 Hz**: 非常に速い動きのための最低の滑らかになること、

タスクを入力するために、 **20 Hz**は高周波振動を滑らかにする間急速な指の動きを捕獲する速い応答を提供するので推薦されます。

## EMGデータの取得

**重要**: *envelope data** を省略します。, 生の濾過EMGではありません!

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

**トライアルバランスに注意:** 異なる試用カウントで条件全体でERPを比較する場合(例:'e'などの一般的なキーと'x'のようなまれなキー)、ランダムにより高いカウント条件をサブサンプリングすることを検討 `pop_select(EEG, 'trial', randperm(EEG.trials, n))` 試験のカウントに一致し、等しい信号に騒音の比率を保障するため。

EMG-ERPは、試験全体で**エンベロープデータ**を平均化することで計算されます。

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

### EEGLABでEMG-ERPを可視化

EEGLABのERPプロット機能を使用して、イベント関連の筋肉の活性化を視覚化します。

```matlab
% Use EEGLAB menu: Plot > Channel ERPs > In rectangular array
% Or from command line:
figure; pop_plottopo(EEG_a, [1:16], 'EMG-ERP for key "a" (left channels)', ...
    0, 'ydir', 1);
```

この図は、すべてのバースト・イニシャル・キーストロークのためのEMG-ERPを示しています, 手で分離 (左対右) そして、リストバンド. ステップ2bから封筒データを使用して、すべての32チャンネルが4つのパネルに表示されます。

![個々のチャネル 採用情報](/assets/images/emg_all_channels.png)

**トライアル選択**: 急なタイピングからエポックオーバーラップを避けるために、バースト・イニシャル・キーストロークのみ(前例:>500ms一時停止)が含まれています。 この記録セッションでは、約4,000の合計キーストロークから、バースト・イニシャル・クリテリオンは、クリーンなベースラインを確保しながら、信頼性のあるEMG-ERPに十分な1本あたり100〜300個のエポックを選択しています。 数字のタイトルに正確なエポックカウントが表示されます。

**横の活性化パターン**:左キー(a、s、d、e、r、...)は左リストバンド(左上)でより強い活性化を示し、右手キー(k、l、j、i、o、...)は右リストバンド(右下)でより強い活性化を示しています。

**EMGの重要:**
- EEGLABのtopoplot(スカルプマップ)はEMGデータには意味がありません
- チャネルERPおよび時間コースのプロットに焦点を合わせて下さい
- 同じ肢のチャネル間でERPを比較する

## 主な違い: EMG 対 EEG

| アスペクト | EEG | EMG |
|--------|-----|-----|
| **周波数範囲** | 1-50 Hz | 20-450 Hz |
|**広さ** | マイクロボルト | マイクロボルト
|**空間分解能** | 脳領域 | 特定の筋肉 |
|**Common artifacts** | 眼圧・筋肉張力 | 動き・電極変位 |
|**ベースライン** | 事前刺激期間 | 予報期間 |
|**ERPの計算** | 直接的な平均作品 | 線形封筒を最初に要求して下さい! お問い合わせ
お問い合わせ **概要措置** | ERPの振幅・遅延 | RMS、統合EMG、封筒の振幅 |

## EEGLABによるEMG-ERP解析のヒント

1. **ALWAYSは線形封筒**を使用します: 生EMGの直接平均化は機能しません! Epoching および平均化の前に Rectify およびローパス フィルター (タイプのための 20 Hz)。

2. **EEGLABの可視化ツールを使用する**:
   - `pop_eegplot()` 生データ検査のスクロール
   - `pop_spectopo()` 周波数解析(EMG の 500 Hz に範囲を拡張)
   - `pop_plottopo()` または `pop_plotdata()` ERPの視覚化のために
   - EEGLABの地理的地図(topoplot)を避ける - EMGの意味がない

3. **適切なフィルタを選択**: EEG(モータータスク用20-250Hz)よりも高いカットオフ周波数を使用 `pop_eegfiltnew()`.

4. **ベースライン補正が重要**: 使用条件 `pop_rmbase()` プレエベントベースラインを削除します。 封筒は、ほぼゼロベースラインを持っている必要があります。

5. **EEGLABでSanityチェック **:
   - Plotの未加工データと `pop_eegplot(EEG, 1, 1, 1)`
   - PSD を点検して下さい `pop_spectopo()` - 20-250の力を確認して下さい Hzの
   - メニューでイベントを調べる: 編集 > イベントの値

6. **トライアルカウントのアカウント**: より多くのトライアル = より良いSNR. 使用条件 `pop_epoch()` チェックイン `.trials` フィールド。 バランス条件の使用 `pop_select()`.

7. **横方向確認**: 動きを実行する手でより強い活発化を期待して下さい。

8. **個別トライアルの仮想化**: 使用条件 `pop_eegplot(EEG_epoched, 0, 1, 1)` トライアルバイトライアルの分散性を検査します。

9. **マルチサブジェクト解析の場合**: EEGLABのSTUDYフレームワーク(メニュー:ファイル > グループレベルの統計データを作成する

10. **比較封筒パラメーター**: ERPsが騒々しい場合は、封筒のカットオフ(5-20 Hz)と再エポックを調整してみてください。

## 追加リソース

- **データセット**: [NEMAR の emg2qwerty](https://nemar.org/dataexplorer/detail?dataset_id=nm000104)
- **ペーパー**: [NeurIPS 2024のemg2qwerty](https://arxiv.org/abs/2410.20081)

## 関連チュートリアル

- [EEGLABとMEGデータ](EEGLAB_and_MEG_data.html)
- [自動加工パイプライン](../11_Scripting/automated_pipeline.html)
- [EEGLABのEEG BIDSデータを分析](../11_Scripting/Analyzing_EEG_BIDS_data_in_EEGLAB.html)
