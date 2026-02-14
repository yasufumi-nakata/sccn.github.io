---
layout: default
title: e. Automated pipeline
parent: 11. Write scripts
grand_parent: Tutorials 
---
EEGLABの電子化
=====
お問い合わせ

STUDYは、すべての言語を翻訳する [ビデオ](https://www.youtube.com/watch?v=-jL3PuHD3aY) EEGLABの特長 この投稿をお気に入りにする

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'simple_study_pipeline.m'));">MATLABコマンド</button>

STUDYやBIDSを実装
------------------------------------

データのダウンロード [https://openneuro.org/datasets/ds003061/](https://openneuro.org/datasets/ds003061/) そしてこのフォルダに移動し、次のセクションでスクリプトを実行します。

または、利用可能ないずれかを使用する [EEGLAB研究](../tutorial_data.html)お問い合わせ これらの研究のいくつかは既にそのデータが処理済みであり、自動化された処理には適さないことに注意してください。

ERPの実行
----------------

下の すべての から から から から から の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の を の の の の の の の の の の の の の の の

現在、CLabel は、CLabel は、CLabel は、CLabel は、CLabel は、CLabel が実行するにあたり、Casino で実行されます。 

EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEG では、様々なイベントの開催を予定しています。

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

お問い合わせ とりあえず、 とりあえず、 とりあえず 「 「 「 *pop_importbids()* にすべての参加者が更新されます。

![](/assets/images/p300_simple_study.png)

スペクトルパイプラインを実行
----------------

下の に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に は、 このページの先頭へ エポックは、 このページではjavascriptを使用しています。

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

![2018年12月12日](https://user-images.githubusercontent.com/1872705/217720016-2b5573d5-5a04-46e3-ab42-ac65e37b9f1b.png)


データのパイプラインの最適化
-------------------------------------

### フィルタリング

*clean_rawdata* のプラグインは、以下のとおりです。

```matlab
EEG = pop_eegfiltnew( EEG,'locutoff',0.5);
EEG = clean_artifacts( EEG,'FlatlineCriterion',5,'ChannelCriterion',0.8, ...
    'LineNoiseCriterion',4,'Highpass','off' ,'BurstCriterion',20, ...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian', ...
    'WindowCriterionTolerances',[-Inf 7] ,'fusechanrej',1);
```

*clean_rawdata* プラグインは、 *off* と *highpass* で、 *off* は、

### なぜ2回参照できますか?

*clean_rawdata* は、よりよく参考にしてください。 この投稿をお気に入りに追加しました。 よく見る 2 . . . . . . 1 つを undoes にします。 [サイトマップ](../05_Preprocess/rereferencing.html).

### 自動洗浄パラメータ

*clean_artifacts* は、EEGLAB に あります。 特に、*'ChannelCriterion'* ????????????? *'BurstCriterion'* は別の変数です。 ???????????????????? お問い合わせ [ツイート](https://github.com/sccn/clean_rawdata).

データをクリーニングするための最適なパラメータを見つけることは、パイプラインの設計に不可欠です。 被験者数を実験してみると最高でしょう。 また、すべての被験者に対してパイプラインを実行すると、各被験者に対してどれだけのデータが削除されたかを確認する必要があります。 場合によっては、データの80%は、いくつかの被験者のために削除されます。

データを データを は は は は は は は は は は は は は は は は は は は は は は は は は は は は は ことです ことです は ことです ことです ことです ことです ことです ことです は は は ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです ことです 偽物や偽物、偽物、偽物、偽物など より、より高度なファクト処理を行ないます。 このサイトは、以下のとおりです。 この例は、 [このチュートリアルのセクション](11_Scripting/Analyzing_EEG_BIDS_data_in_EEGLAB.html).

### アメリカ

EEGLAB のデフォルトは *runica* (Infomax) です。 お問い合わせ [ペーパー](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0030135)お問い合わせ 要するに、理想的なアルゴリズムはありません。
- *Runica* は、 偽物 を 使っている。
- *picard* は、*runica* の機能を利用できるようにします。 より より より また、ICAの先駆者であるオランダジャン=フランコワ・カルドソが設計されました。  それ ユーザー ユーザー です です 20 20 20 20 です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です
- *FastICA* はEEGデータで購入可能です。 デフォルト デフォルト デフォルト デフォルト
- *Amica* は、ベースで英語を勉強しています。 [比較比較](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0030135)お問い合わせ お問い合わせ また、EyGデータセットは、

### アー の の

上記の で で * * * * * * * * * * * * * * * です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です です 

※ICLabel* では、一般公開中でも可視性が向上します。 のみ のみ のみ のみ のみ ふりがな [ICラベル](https://github.com/sccn/ICLabel) このページには、この件に関する詳細情報が含まれています。

### ICAコンポーネントのクラスタリングのダイキャスト

ICA コンポーネントのクラスタリングのダイキャストを スタディ ?????????????????????

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

詳しくは、 [ICAクラスタリング](../10_Group_analysis/component_clustering_tools.html) チュートリアルの。

### より高度なパイプライン

* ????? ERPs は、ERPs から、ERPs へ移行します。 [サイトマップ](command_line_study_functions.html).
* 統計解析 Eメール:erPssssss [他のセクション](../10_Group_analysis/study_statistics.html)お問い合わせ また、カスタムコードを書くことで、紙の数字を生成できます。
* パイプライン で お問い合わせ [この紙](https://www.frontiersin.org/articles/10.3389/fnins.2020.610388/full) そして、 [リモウィキ](https://github.com/LIMO-EEG-Toolbox/limo_meeg/wiki) 参照のため。 

ほんご
----------------------

お問い合わせ 

* [プレプ](https://vislab.github.io/EEG-Clean-Tools/) EEGLAB は、現在、現在、現在、現在、現在、現在、現在、現在、現在、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界中、世界
* [マコトの加工パイプライン](https://sccn.ucsd.edu/wiki/Makoto's_preprocessing_pipeline) お問い合わせ お問い合わせ
* [Danielle Gruberさん](https://medium.datadriveninvestor.com/streamline-your-eeglab-experience-8803c805c5a7)Danielle Gruber は、Danielle Gruber の略称です。Danielle Gruber は、Danielle Gruber の略称です。
* [BIDSファイル](Analyzing_EEG_BIDS_data_in_EEGLAB.html) このチュートリアルの一部であり、このページに提示されたものと比較して、同様のパイプライン(より複雑なもの)です。
* [お問い合わせ](https://www.frontiersin.org/articles/10.3389/fnins.2018.00097/full)EEGLABLabは、EEGLABを信頼しています。
* [エポック](https://osf.io/cw5qv/) このプロジェクトでは、EEGLABの を使用して 分析 分析 を提供します を提供します を提供します を提供します を提供します を提供します を提供します を提供します 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載   掲載 掲載 掲載 掲載 掲載     掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 掲載 [神経科学のフロンティア](https://www.frontiersin.org/articles/10.3389/fnins.2021.660449/full).
* [Apiceのこだわり](https://github.com/neurokidslab/eeg_preprocessing) 乳幼児向けデータ
* [EEGLABのコンセプト](https://github.com/fardinafdideh/EEG-Signal-Cleaning-Pipeline-Management-EEGLAB-based-) エッグ 信号のクリーニングのパイプライン管理。
* [リラックス](https://github.com/NeilwBailey/RELAX) ICA と ICLabel は、Windows で自動 EEGLAB のプリプロセスを実装しています。

EEGLAB、FieldTrip、Brainstorm、MNEは、各々の業務を担当しています。 各ソフトウェアパッケージは、偽物に誤りを許さないため、 最高 を を

[https://github.com/sccn/eeg_pipelines](https://github.com/sccn/eeg_pipelines)
