---
layout: default
title: f. BIDS pipeline
long_title: e. BIDS pipeline
parent: 11. Write scripts
grand_parent: Tutorials 
---
# EEG-BIDSについて
お問い合わせ

EEG-BIDSEEGLABに、EEGLABの通信方法を紹介しています。 [エグラボスタディ](https://sccn.github.io/tutorials/10_Group_analysis) 以下の グループ グループ グループ グループ グループ グループ グループ します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します を を を を を を を を を を を を を を 人気カテゴリー

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN3II4EnVQNjOeVl-UprWlnM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'bids_process_face_experiment.mlx'));">MATLABコマンド</button>

## EEG-BIDSについて 

このチュートリアルのデータは、 [EEG BIDSフォーマット](https://github.com/bids-standard/bids-specification/blob/master/src/04-modality-specific-files/03-electroencephalography.md)EEG-BIDSの特定性についてもっと読む [詳しくはこちら](https://www.nature.com/articles/s41597-019-0104-8)EEGLABは、 [EEG-BIDSについて](https://github.com/sccn/EEG-BIDS) BIDSデータセットのプラグインは、このプラグインは、EeGLABのプラグインです。 このBIDSでは、このサイトについて、以下の点について説明しています。

EEGLABにBIDSの統合について詳しく知る [bids-matlab-io - アダルトアフィリエイトプログラム モデル募集 モデルログイン](https://github.com/sccn/EEG-BIDS/wiki) EEGLABのプラグイン 

## データのダウンロード
この例では、 [ウェイクマンとヘンソン (2015)](https://www.nature.com/articles/sdata20151)このサイトでは、このサイトを運営しています。 各画像は3回繰り返しますが、それぞれの画像はパープル比例比例比例比例対称性分布です。

突然提示された顔のイメージの人間の認識は大きい作り出します
パーキールイベントの関連性について170ms(N170をdubbed)
ポスタースカルプチャンネル([ベントイン ら.,
1996](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2927138/)。 お問い合わせ
直接を含むいくつかの方法によって局在する可能性
耐腐食性(ECoG)
二国間fusiformジャイラス。 

Henson と Wakeman (2015) は、EEG/MEG のリリースです。
N170Sカルプマップ
応答機能を生成する劣性心皮質。 ボールド
fMRI研究([Kanwisher et])の領域の領域の領域は、
1997年(平成9年)https://www.ncbi.nlm.nih.gov/pubmed/9151747)。 長い電車
よくある質問
顔を撮る
[Kanwisher & Yovel] の処理
2006](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1857737/)または
より一般的な専門家の個人識別をサポートする処理
または重要なおよび長い規定された目的の大きいセットのためのサブカテゴリ
特許取得済(Gauthier et)
1999年(平成11年)https://www.ncbi.nlm.nih.gov/pubmed/10448223)). 

一般的に、
大きく 、「 、「
FUsiform BOの強み
住宅など 

[ウェイクマンとヘンソン (2015)](https://www.nature.com/articles/sdata20151) 使用するパラダイムを開発
ここで扱われたデータを収集し、繰り返しの決定(同じ)
顔のイメージシリーズのtachistoscopically提示「顔のversus」
自宅で実験する、EEGと非公開で、
よく知られている、未知の、およびスクランブルされた顔に対する反応が同じである方法
配列は異なります。 下の図のパラダイムの詳細をご覧ください。

![`center|400px`](/assets/images/Wakeman_henson_eegset.jpg)

EEGとMEGは、翻訳済みで、翻訳済みです。 データは、、、、 Ramon Martinez、Arnaud Delorme 作成者(EEG抽出、修正、再処理、イベントレイテンシー修正) [オープンニューロ](https://openneuro.org/datasets/ds002718).

## データの事前処理
データをダウンロードしたら [オープンニューロ](https://openneuro.org/datasets/ds002718/versions/1.0.2)下記のコードを実行できます。 [サイトマップ](/tutorials/04_Import/BIDS.html) データのダウンロードに問題がある場合)。

### EEGLABについて 

以下のスクリプトでは、 [EEGLABのgitバージョン](/others/How_to_download_EEGLAB.html) 2021年(昭和20年) は EEGLAB の は 初期の リリース で リリースされました。

``` matlab
clear
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
```

EGLABの「sample_data」は、 変数 変数 変数

``` matlab
eeglabPath = fileparts(which('eeglab'));
filepath = fullfile(eeglabPath, 'sample_data', 'ds002718');
```

### BIDSについて
*pop_importbids.m* は、BIDS は、EEGLAB にインポートします。 
'bidsevent' は、 BIDS .tsv は、 BIDS .tsv のファイルから、 BIDS .tsv は、 BIDS .tsv ファイルから BIDS .tsv ファイルへ、 EEG 'studyName' では、 お問い合わせ [BIDSのチュートリアル](/tutorials/04_Import/BIDS.html) BIDS研究は、

``` matlab
[STUDY, ALLEEG] = pop_importbids(filepath, 'eventtype','trial_type', 'bidsevent','on','bidschanloc','on', ...
    'studyName','Face_detection');

ALLEEG = pop_select( ALLEEG, 'nochannel',{'EEG061','EEG062','EEG063','EEG064'}); % remove EKG and EOG
EEG=pop_chanedit(EEG, 'eval','chans = pop_chancenter( chans, [],[]);'); % center channels

CURRENTSTUDY = 1; EEG = ALLEEG; CURRENTSET = [1:length(EEG)];
```

3つのステップでアーティファクト拒絶反応を行います。
1. ミルドアーティファクト拒絶による [clean_rawdata(クリーンロード)](https://github.com/sccn/clean_rawdata) プラグイン
2. 人工の独立したコンポーネントの拒絶
3. 攻撃的なアーティファクトの拒絶 [clean_rawdata(クリーンロード)](https://github.com/sccn/clean_rawdata) プラグイン

このサイトでは、以下のとおり個人情報保護方針を定めています。 前に で で 1。 ICAは、*clean_rawdata* よくある質問 全てが削除されます。 ICA は、データから削除/サブトランクト可能、望ましく焼きます。 とりあえず は ????????????????????????????????????????????????????????????????????????? 

多くの場合、ステップ1と2のみが必要です。 データに依存します。

### 極端なアーティファクトで活動の悪いチャンネルや地域を削除

関数,*pop_clean_rawdata.m* 関数,0.5 Hz で s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s s の s s の s s s の s s の s s s s s s の s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s
*pop_clean_rawdata.m* は、 [アーティファクト・サブスペースの復興](https://sccn.github.io/tutorials/ConceptsGuide/ASR_background.html) EEGLABに統合(ASR)モジュール [clean_rawdata() プラグイン](https://sccn.github.io/tutorials/ConceptsGuide/ASR_background.html) (EEGLABではデフォルトで) 

``` matlab
EEG = pop_clean_rawdata( EEG,'FlatlineCriterion',5,'ChannelCriterion',0.8,...
    'LineNoiseCriterion',4,'Highpass',[0.25 0.75],'BurstCriterion',40,...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian',...
    'WindowCriterionTolerances',[-Inf 10] );
``` 

### 平均参照を使用して再参照

処理中に平均的な参照が複数回適用される場合があります。 指定された時間に平均的な参照を適用すると、その前に行われるすべての再参照をキャンセルします。 必須ステップではありません。

``` matlab
EEG = pop_reref( EEG,[],'interpchan',[]);
```

### IClabel ICA と python の コンポーネントを 実行します。
'picard' 'runica' は、EEGLAB の 'Picard' で 'picard' で 'runica' に あります。'runica' は、 'Picard* は、 Infomax の ICA の 、 より、 理論的な は、 次のように なります。 ICA,EEGデータへ [専用セクション](/tutorials/06_RejectArtifacts/RunICA.html) EEGLABチュートリアル

IClabel は、EeGLAB でデフォルトで設定する EEGLAB では、各々のコンポーネントの型(CRA、目、位置、線維など)を計算します。
*pop_icflag.m* 'thresh' の2つの基本引数は、 コンポーネントを レイティファクトとして 選択値 最小値と最大値 値 です。 *Brain*、*Muscle*、*Eye*、*Heart*、*Line Noise*、*Channel Noise*、*Other*の6つの分類の...
Eye* または *Muscle* に 80% の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s に s の s の s の s の s の s の s の s s の s の s s s s s の の s s s s s の の の に の s s s s の s s の の の の の s s s s の の s の の s s s s s s s s s s s s s s s の の s s s s s s s s コンポーネントのみが削除されます。 IClabel は、 ICA コンポーネントが、データから削除されます。

``` matlab
EEG = pop_runica(EEG, 'icatype','runica','concatcond','on',...
                                'options',{'pca', -1});
EEG = pop_iclabel(EEG,'default');
EEG = pop_icflag(EEG,[NaN NaN;0.8 1;0.8 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);
EEG = pop_subcomp(EEG, [], 0, 0); %remove bad components

```

### 汚染されたデータの残りの部分を削除します。
ASR と *pop_clean_rawdata.m* は、現在では、より詳細な機能が提供されます。
ASRは、より複雑な部分(キャリブレーション)を、PCAの解析コンポーネントの構成要素を計算します。 それから それから 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 します します します します 。 します します します 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。  この より より より

``` matlab
EEG = pop_clean_rawdata( EEG,'FlatlineCriterion','off','ChannelCriterion','off',...
    'LineNoiseCriterion','off','Highpass','off','BurstCriterion',20,...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian',...
    'WindowCriterionTolerances',[-Inf 7] );
```

このプロセスは、このプロセスの初期化を行なうために、このプロセスの初期化は、このプロセスの初期化を行なう。 MATLAB は、各々の関数の言語で、
``` matlab
help pop_clean_rawdata
```

### 測定結果 
このイベントでは、このイベントの参加者は、イベントの参加者全員が、イベントの参加者全員が、イベントの参加者全員が、イベントの参加者全員が、イベントの参加者全員に、イベントの参加者全員が参加しています。 
ベースラインを削除しない(上記のハイパスフィルタリングは、この段階で十分です)。

```matlab
EEG = pop_epoch( EEG,{'famous_new','famous_second_early','famous_second_late','scrambled_new','scrambled_second_early','scrambled_second_late','unfamiliar_new','unfamiliar_second_early','unfamiliar_second_late'},[-0.5 1] ,'epochinfo','yes');
```

## データプロット

### STUDYデザイン

条件をよく知るSTUDYデザイン 

``` matlab
ALLEEG = EEG; % update ALLEEG structure
STUDY = std_checkset(STUDY, ALLEEG); % update epoch information
STUDY = std_makedesign(STUDY, ALLEEG, 1, 'name','Faces','delfiles','off','defaultdesign','off',...
    'variable1','face_type','values1',{'famous','scrambled','unfamiliar'},...
    'vartype1','categorical', ...
    'subjselect',{'sub-002','sub-003','sub-004','sub-005','sub-006','sub-007','sub-008','sub-009',...
    'sub-010', 'sub-011','sub-012','sub-013','sub-014','sub-015','sub-016','sub-017','sub-018','sub-019'});
```

EEGLAB ウィンドウが更新されます。

``` matlab
eeglab redraw
```

### チャネルの計算
研究設計を作成する前にこれを行うことができます。
参加申し込みフォーム 以下は、200ミリ秒から0ミリ秒のベースラインです。

``` matlab
[STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, {},'savetrials','on','rmicacomps','on','interp','on',...
    'recompute','on','erp','on','erpparams',{'rmbase',[-200 0] });
```

### サインイン プロットERP
それぞれの条件の1つを ERP でプロットする。 ファーストプロットパラメータ

``` matlab
STUDY = pop_erpparams(STUDY, 'timerange',[-200 1500], 'plotconditions','together');
```
その後、図を描きます(ここでは、元の出版物でチャンネル65を選択します)。

``` matlab
STUDY = std_erpplot(STUDY,ALLEEG,'channels',{'EEG065'}, 'design', 1);
```

![](/assets/images/erp_wh_bids2.png)

STUDY測定のプロットについて [STUDY文明化チュートリアル](/tutorials/10_Group_analysis/study_data_visualization_tools.html).

### パーキーズ パーキーズ

最初にプロットパラメータを変更して、スカルプトポグラフィを170ミリ秒後に作成します(160ミリ〜180ミリ秒間の潜在的な平均)。

 ``` matlab 
STUDY = pop_erpparams(STUDY, 'topotime',[160 180] ,'timerange',[]);
```
そして、スカルプトポグラフィを描いています。

``` matlab
STUDY = std_erpplot(STUDY,ALLEEG,'channels',{'EEG001','EEG002','EEG003','EEG004', ...
'EEG005','EEG006', 'EEG007','EEG008','EEG009','EEG010','EEG011','EEG012','EEG013', ...
'EEG014','EEG015','EEG016','EEG017','EEG018','EEG019','EEG020','EEG021','EEG022','EEG023','EEG024', ... 
'EEG025','EEG026','EEG027','EEG028','EEG029','EEG030','EEG031','EEG032','EEG033','EEG034','EEG035', ... 
'EEG036','EEG037','EEG038','EEG039','EEG040','EEG041','EEG042','EEG043','EEG044','EEG045','EEG046', ... 
'EEG047','EEG048','EEG049','EEG050','EEG051','EEG052','EEG053','EEG054','EEG055','EEG056','EEG057', ... 
'EEG058','EEG059','EEG060','EEG065','EEG066','EEG067','EEG068','EEG069','EEG070','EEG071', ... 
'EEG072','EEG073','EEG074'}, 'design', 1);    
```

![](/assets/images/topo_wh_bids2.png)

このチュートリアルでは、 このチュートリアルでは、 [統計情報](/tutorials/10_Group_analysis/study_statistics.html) または高度な処理 [脳のソース活動](/tutorials/10_Group_analysis/component_clustering_tools.html) このデータについて 見てみることもできます。 [LIMOプラグイン](https://github.com/LIMO-EEG-Toolbox/limo_meeg/wiki) 最近の投稿
