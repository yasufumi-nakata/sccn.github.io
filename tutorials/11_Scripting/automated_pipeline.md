---
layout: default
title: e. Automated pipeline
parent: 11. Write scripts
grand_parent: Tutorials 
---
EEGLABを用いた自動処理パイプライン
=====
お問い合わせ

STUDYで同時にすべてのデータセットを処理するスクリプトを書く必要はありません。 お問い合わせ [ビデオ](https://www.youtube.com/watch?v=-jL3PuHD3aY) EEGLABのグラフィックインターフェイスからバッチ処理を実行する方法について説明します。 このセクションでは、スクリプトを使用して同様のパイプラインを実行します。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'simple_study_pipeline.m'));">MATLABコマンドを表示する</button>

STUDYの作成やBIDSからのインポート
------------------------------------

データのダウンロード [https://openneuro.org/datasets/ds003061/](https://openneuro.org/datasets/ds003061/) そしてこのフォルダに移動し、次のセクションでスクリプトを実行します。

または、利用可能ないずれかを使用する [EEGLAB研究](../tutorial_data.html)お問い合わせ これらの研究のいくつかは既にそのデータが処理済みであり、自動化された処理には適さないことに注意してください。

ERPパイプラインの実行
----------------

下のパイプラインは、すべての被験者から生データを取り、データを消去し、利益のエポックを抽出し、壮大な平均ERPをプロットします。

まず、データをインポートします。 その後、clean_rawdata(デフォルトパラメータはここで使用されますが、データ品質に基づいて調整が必要な場合があります)で清掃されます。 ICAはすべてのデータセットで実行され、ICLabelは悪いICAコンポーネントをフラグするために使用されます。 

その後、オッズボールと標準の刺激エポックが抽出され、ベースラインが削除されます(-1000から0ミリ秒まで)、ERPは計算され、プロットされます。 独自の EEGLAB スタディでこのパイプラインを実行したい場合は、データエポックを抽出するための行を変更する必要があります(イベントの名前が異なる場合があります)。

```matlab
% check folder
eeglab;
if ~exist('task-P300_events.json', 'file')
    error('Download the data from https://openneuro.org/datasets/ds003061/ and go to the downloaded folder');
else
    filepath = fileparts(which('task-P300_events.json'));
end

% import data
pop_editoptions( 'option_storedisk', 1); % only one dataset in memory at a time
[STUDY, ALLEEG] = pop_importbids(filepath, 'studyName','Oddball', 'subjects', [1:2]); % when using all subjects, one subject is truncated and cause the pipeline to return an error

% remove non-ALLEEG channels (it is also possible to process ALLEEG data with non-ALLEEG data
ALLEEG = pop_select( ALLEEG,'rmchannel',{'EXG1','EXG2','EXG3','EXG4','EXG5','EXG6','EXG7','EXG8', 'GSR1', 'GSR2', 'Erg1', 'Erg2', 'Resp', 'Plet', 'Temp'});

% compute average reference
ALLEEG = pop_reref( ALLEEG, []);

% clean data using the clean_rawdata plugin
ALLEEG = pop_clean_rawdata( ALLEEG,'FlatlineCriterion',5,'ChannelCriterion',0.87, ...
    'LineNoiseCriterion',4,'Highpass',[0.25 0.75] ,'BurstCriterion',20, ...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian', ...
    'WindowCriterionTolerances',[-Inf 7] ,'fusechanrej',1);

% recompute average reference
ALLEEG = pop_reref( ALLEEG,[]);

% run ICA reducing the dimension by 1 to account for average reference 
plugin_askinstall('picard', 'picard', 1); % install Picard plugin
ALLEEG = pop_runica(ALLEEG, 'icatype','picard','concatcond','on','options',{'pca',-1});

% run ICLabel and flag artifactual components
ALLEEG = pop_iclabel(ALLEEG, 'default');
ALLEEG = pop_icflag( ALLEEG,[NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);

% Optional: remove flagged ICA components (otherwise done at the STUDY level), then recompute the  
% average reference using the Huber method interpolating missing channels (and removing them again 
% after average reference). See tutorial section 5.b.
if 0
    ALLEEG = pop_subcomp(ALLEEG, []);
    ALLEEG = pop_reref( ALLEEG, [], 'huber', 25, 'interpchan',[], 'refica', 'remove');
end

% extract data epochs
ALLEEG = pop_epoch( ALLEEG,{'oddball_with_reponse','standard'},[-1 2] ,'epochinfo','yes');
ALLEEG = eeg_checkset( ALLEEG );
ALLEEG = pop_rmbase( ALLEEG,[-1000 0] ,[]);

% create STUDY design
STUDY = std_maketrialinfo(STUDY, ALLEEG);
STUDY = std_makedesign(STUDY, ALLEEG, 1, 'name','STUDY.design 1','delfiles','off', ...
    'defaultdesign','off','variable1','type','values1',{'oddball_with_reponse','standard'},...
    'vartype1','categorical','subjselect', STUDY.subject);

% precompute ERPs at the STUDY level
[STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, {},'savetrials','on','rmicacomps','on','interp','on','recompute','on','erp','on');

% plot ERPS
STUDY = pop_erpparams(STUDY, 'topotime',350);
chanlocs = eeg_mergelocs(ALLEEG.chanlocs); % get all channels from all datasets
STUDY = std_erpplot(STUDY,ALLEEG,'channels', {chanlocs.labels}, 'design', 1);

% revert default option
pop_editoptions( 'option_storedisk', 0);
```

下の図に似ている数字がプロットされます。 数値は、上記のアーティファクトと拒絶の手順の一部がランダムにデータを選択すると異なる場合があります。 パイプラインを再現できるようにするには、上記のスクリプトの先頭に「rng(1)」を追加します。 上記のスクリプトは最初の2人の参加者のみを処理することに注意してください。 *pop_importbids()* にすべての参加者を処理するコールを更新します。

![](/assets/images/p300_simple_study.png)

スペクトルパイプラインを実行
----------------

下のパイプラインは、すべての被験者から生データを取り、データをクリーンにし、関心のあるエポックを抽出し、条件を比較するためのスペクトルをプロットします。 最初の部分は、上記のERPスクリプトと同じです。 スクリプトの終端はスペクトルを計算します。 連続データがある場合、エポックを抽出する必要はありません。 上記と同じデータセットを再利用したいので、このケースでエポックを抽出しました。

```matlab
% check folder
eeglab;
if ~exist('task-P300_events.json', 'file')
    error('Download the data from https://openneuro.org/datasets/ds003061/ and go to the downloaded folder');
else
    filepath = fileparts(which('task-P300_events.json'));
end

% import data
pop_editoptions( 'option_storedisk', 1); % only one dataset in memory at a time
[STUDY, ALLEEG] = pop_importbids(filepath, 'studyName','Oddball', 'subjects', [1:2]); % when using all subjects, one subject is truncated and cause the pipeline to return an error

% remove non-ALLEEG channels (it is also possible to process ALLEEG data with non-ALLEEG data
ALLEEG = pop_select( ALLEEG,'rmchannel',{'EXG1','EXG2','EXG3','EXG4','EXG5','EXG6','EXG7','EXG8', 'GSR1', 'GSR2', 'Erg1', 'Erg2', 'Resp', 'Plet', 'Temp'});

% compute average reference
ALLEEG = pop_reref( ALLEEG, []);

% clean data using the clean_rawdata plugin
ALLEEG = pop_clean_rawdata( ALLEEG,'FlatlineCriterion',5,'ChannelCriterion',0.87, ...
    'LineNoiseCriterion',4,'Highpass',[0.25 0.75] ,'BurstCriterion',20, ...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian', ...
    'WindowCriterionTolerances',[-Inf 7] ,'fusechanrej',1);

% recompute average reference interpolating missing channels (and removing
% them again after average reference - STUDY functions handle them automatically)
ALLEEG = pop_reref( ALLEEG, []);

% run ICA reducing the dimension by 1 to account for average reference 
plugin_askinstall('picard', 'picard', 1); % install Picard plugin
ALLEEG = pop_runica(ALLEEG, 'icatype','picard','concatcond','on','options',{'pca',-1});

% run ICLabel and flag artifactual components
ALLEEG = pop_iclabel(ALLEEG, 'default');
ALLEEG = pop_icflag( ALLEEG,[NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);

% Optional: remove flagged ICA components (otherwise done at the STUDY level), then recompute the  
% average reference using the Huber method interpolating missing channels (and removing them again 
% after average reference). See tutorial section 5.b.
if 0
    ALLEEG = pop_subcomp(ALLEEG, []);
    ALLEEG = pop_reref( ALLEEG, [], 'huber', 25, 'interpchan',[], 'refica', 'remove');
end

% extract data epochs
% this is not necessary if you have resting state data or eyes open
% eyes closed data, you need to define the design in the STUDY
ALLEEG = pop_epoch( ALLEEG,{'oddball_with_reponse','standard'},[-1 2] ,'epochinfo','yes');
ALLEEG = eeg_checkset( ALLEEG );

% create STUDY design
STUDY = std_maketrialinfo(STUDY, ALLEEG);
STUDY = std_makedesign(STUDY, ALLEEG, 1, 'name','STUDY.design 1','delfiles','off', ...
    'defaultdesign','off','variable1','type','values1',{'oddball_with_reponse','standard'},...
    'vartype1','categorical','subjselect', STUDY.subject);

% precompute ERPs at the STUDY level
[STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, {},'savetrials','on','rmicacomps','on','interp','on','recompute','on','spec','on');

% plot ERPS
STUDY = pop_specparams(STUDY, 'topofreq',10);
chanlocs = eeg_mergelocs(ALLEEG.chanlocs); % get all channels from all datasets
STUDY = std_specplot(STUDY,ALLEEG,'channels', {chanlocs.labels}, 'design', 1, 'ylim', [40 55]););

% revert default option
pop_editoptions( 'option_storedisk', 0);
```

次のようなプロットが表示されます。 上記のアーティファクトを削除するためのオプションが変更されているため、若干異なります。

![スクリーンショット 2023-02-08 に 8 44 04 PM](https://user-images.githubusercontent.com/1872705/217720016-2b5573d5-5a04-46e3-ab42-ac65e37b9f1b.png)


データのパイプラインの最適化
-------------------------------------

### フィルタリング

*clean_rawdata*プラグイン(楕円フィルタ)で適用されるフィルタよりも異なるフィルタを適用したい場合があります。 たとえば、標準の FIR フィルターを適用するには、次の方法で *clean_artifacts* 関数に呼び出しを置き換える必要があります。

```matlab
EEG = pop_eegfiltnew( EEG,'locutoff',0.5);
EEG = clean_artifacts( EEG,'FlatlineCriterion',5,'ChannelCriterion',0.8, ...
    'LineNoiseCriterion',4,'Highpass','off' ,'BurstCriterion',20, ...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian', ...
    'WindowCriterionTolerances',[-Inf 7] ,'fusechanrej',1);
```

*clean_rawdata* プラグインからアーティファクトをきれいにするために関数を呼び出すと、*highpass* 引数は *off* に設定され、フィルタリングを無効にします。

### なぜ2回参照できますか?

*clean_rawdata*を使用してアーティファクトのクリーニングは通常平均的な参照データでよりよく動作します。 このトピックに公開された記事はありませんが、データを処理する際にこの観察を行いました。 悪いチャンネルを削除した後、再度平均参照を計算する必要があります。 2 番目の平均参照計算は、この上で説明するように、最初の 1 つを undoes します。 [サイトマップ](../05_Preprocess/rereferencing.html).

### 自動洗浄パラメータ

*clean_artifacts* への呼び出しはデフォルトの EEGLAB パラメータを使用します。 しかし、常に最適ではありません。 特に、*'ChannelCriterion'* は、複数のチャネルを拒否するために変更される場合があります。 *'BurstCriterion'*は別の重要な変数です。 あまりにも多くのデータ領域が拒否されていると感じた場合、例えば(または一部の人が100を推奨)40に増加します。 プラグインで詳細情報が利用可能 [wikiページ](https://github.com/sccn/clean_rawdata).

データをクリーニングするための最適なパラメータを見つけることは、パイプラインの設計に不可欠です。 被験者数を実験してみると最高でしょう。 また、すべての被験者に対してパイプラインを実行すると、各被験者に対してどれだけのデータが削除されたかを確認する必要があります。 場合によっては、データの80%は、いくつかの被験者のために削除されます。

データをクリーニングするための代替ソリューションは、複数の回のデータクリーニングを実行することです。 悪いチャンネルと大規模なアーティファクトを削除したら、アーティファクトの拒否を実行します。 その後、ICAを実行した後、もう一度実行して、より小さいアーティファクトを削除することができます。 このアプローチの利点は、最初のデータクリーニングは、アイブリンクを削除しないということです(ICAは、これらのデータを保存できるようにデータを抽出することができます)。 このアプローチの例は、 [このチュートリアルのセクション](11_Scripting/Analyzing_EEG_BIDS_data_in_EEGLAB.html).

### 使用するICA

上記のスクリプトは EEGLAB のデフォルトである *runica* (Infomax) を使用します。 関連するプラグインをインストールするために必要なその他の一般的な選択肢は、*Amica*、*Picard*、および*FastICA*です。 異なるICAソリューションを比較しました。 [ペーパー](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0030135)お問い合わせ 要するに、理想的なアルゴリズムはありません。
- *Runica*は最も多く使用されました。 堅牢ですが遅いです。
- *picard*は*runica*と同じ目的機能を最大限に活用します。 それはより速くそしてより低い残留物と収束します。 また、ICAの先駆者であるジャン=フランコワ・カルドソが設計しました。 それにもかかわらず、EEGデータの他のユーザーと徹底的に比較されていない新しいアルゴリズム(2022の時点で)です。
- *FastICA*はEEGデータで広く使われているICAアルゴリズムです。 アルゴリズムの作者は、反復的なものではなく対称的なアプローチを使用して助言します(デフォルトです)。
- *Amica*は、当社のベースで最高のICAアルゴリズムです。 [比較比較](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0030135)お問い合わせ それにもかかわらず、それは遅くなります。 また、単一のEEGデータセットにのみ適用できます。

### 自動化されたICAのアーティファクト拒絶のアルゴリズムは何ですか。

上記のスクリプトで *ICLabel* を使用します。 彼らは他の人です。 たとえば、*MARA* は、アーティファクチュアル ICA コンポーネントを検出する別の一般的な EEGLAB プラグインです。 

※ICLabel*の場合、人工成分を検出する閾値を設定できます。 上記のスクリプトでは、目の動きのアーティファクト(点滅または横方向の目の動き)と、筋肉になる可能性の90%にしきい値を設定しています。 これは非常に保守的であり、被写体ごとに1〜5個のコンポーネントのみを拒否します。 一部の研究者は保存性が低いため、閾値が下がります。 ふりがな [ICラベル](https://github.com/sccn/ICLabel) このページには、この件に関する詳細情報が含まれています。

### ICAコンポーネントとICAコンポーネントのクラスタリングのダイポールを見つける

ICA コンポーネントと ICA コンポーネントのクラスタリングのダイポールを STUDY レベルで見つけることもできます。例えば、以下のコードの小さなスニペットを使用します。

```matlab
% find dipoles for all ICA components of all subjects
dipfitPath = fileparts(which('pop_dipfit_settings.m'));
EEG = pop_dipfit_settings( EEG,'hdmfile', fullfile(dipfitPath, 'standard_BEM', 'standard_vol.mat'), ...   
'coordformat','MNI','mrifile',fullfile(dipfitPath, 'standard_BEM', 'standard_mri.mat'), ...
'chanfile',fullfile(dipfitPath, 'standard_BEM','elec','standard_1005.elc'), ...
'coord_transform',[-4.8299e-05 1.4553e-05 -0.00010483 2.9747e-06 5.8989e-06 -1.5708 1 1 1] );
EEG = pop_multifit( EEG,[],'threshold',100,'plotopt',{'normlen','on'});

% cluster dipoles which are close to each other and plot one cluster
[STUDY ALLEEG] = std_preclust(STUDY, ALLEEG, 1,{'dipoles','weight',1});
[STUDY] = pop_clust(STUDY, ALLEEG, 'algorithm','Affinity Propagation');
STUDY = std_dipplot(STUDY,ALLEEG,'clusters',2, 'design', 1);
```

詳しくは、 [ICAクラスタリングセクション](../10_Group_analysis/component_clustering_tools.html) チュートリアルの。

### より高度なパイプライン

* ERPsの代わりにスペクトルをプロットしたいのは? 上記の例は ERPs にありました。 しかし、これで説明されているように他の対策をプロットするのは簡単です。 [サイトマップ](command_line_study_functions.html).
* パイプラインで統計を実行できますか? はい、ERPや他の対策をプロットし、チュートリアルで説明する統計的に重要な領域を計算することができます [他のセクション](../10_Group_analysis/study_statistics.html)お問い合わせ また、カスタムコードを書くことで、紙の数字を生成できます。
* パイプラインでLIMOを使うことはできますか? もちろんです。 お問い合わせ [この紙](https://www.frontiersin.org/articles/10.3389/fnins.2020.610388/full) そして、 [リモウィキ](https://github.com/LIMO-EEG-Toolbox/limo_meeg/wiki) 参照のため。 

その他のEEGLABパイプライン
----------------------

その他EEGLABパイプラインです。 

* [PREPパイプライン](https://vislab.github.io/EEG-Clean-Tools/) EEGLABプラグインです。 自動化されたアーティファクト検出が潜在的であるため、古いパイプライン(2022年時点)ですが、2014年から2020年までに関連したパイプラインであり、それには根本的に誤りはありません。
* [マコトの加工パイプライン](https://sccn.ucsd.edu/wiki/Makoto's_preprocessing_pipeline) 別の参照です。 初心者にはお勧めできません。 それにもかかわらず、EEG処理に関する重要な情報が含まれています。
* [Danielle Gruberのパイプライン](https://medium.datadriveninvestor.com/streamline-your-eeglab-experience-8803c805c5a7)お問い合わせ Danielle Gruber は、パイプラインを共有した EEGLAB ユーザーです。 それは長く、詳細であり、また(2022の)古いです。 パイプラインの基本的なエラーは見つかりませんでした。 それは単一注入のパイプラインです。
* [BIDSデータスクリプト](Analyzing_EEG_BIDS_data_in_EEGLAB.html) このチュートリアルの一部であり、このページに提示されたものと比較して、同様のパイプライン(より複雑なもの)です。
* [HAPPEパイプライン](https://www.frontiersin.org/articles/10.3389/fnins.2018.00097/full)お問い合わせ EEGLABベースのパイプラインは評価していませんが、人気のあるパイプラインです。
* [エポック](https://osf.io/cw5qv/) このプロジェクトでは、EEGLAB を使用して標準化された EEG 分析を簡単に取得できるスクリプトを提供します。 掲載情報 [神経科学のフロンティア](https://www.frontiersin.org/articles/10.3389/fnins.2021.660449/full).
* [Apiceの前処理パイプライン](https://github.com/neurokidslab/eeg_preprocessing) 乳幼児向けデータ
* [EEGLABベースのパイプラインを作成するGUI](https://github.com/fardinafdideh/EEG-Signal-Cleaning-Pipeline-Management-EEGLAB-based-) エッグ 信号のクリーニングのパイプライン管理。
* [リラックス](https://github.com/NeilwBailey/RELAX) ICA と ICLabel を使用した完全自動 EEGLAB プリプロセスプラグイン。

EEGLAB、FieldTrip、Brainstorm、MNEパイプラインを最適化したリポジトリもあります。 各ソフトウェアパッケージに最適なアーティファクト拒否しきい値を見つけるためのパラメータをスキャンしました。 どのパイプラインが最高だったかを推測します。

[https://github.com/sccn/eeg_pipelines](https://github.com/sccn/eeg_pipelines)
