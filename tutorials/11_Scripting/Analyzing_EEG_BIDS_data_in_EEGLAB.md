---
layout: default
title: f. BIDS pipeline
long_title: e. BIDS pipeline
parent: 11. Write scripts
grand_parent: Tutorials 
---
# EEG-BIDSデータをEEGLABスクリプトで分析
お問い合わせ

ここでは、EEG-BIDSデータをEEGLABにインポートし、EEGLABを使用する方法を示します。 [エグラボスタディ](https://sccn.github.io/tutorials/10_Group_analysis) これらのデータをグループ分析するためのツールは、基本的なEEGLABグループレベルの処理を実行します。 また、以下の短いYouTube動画をご覧いただけます。 右上のアイコンをクリックして、プレイリスト内の動画のリストにアクセスします。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN3II4EnVQNjOeVl-UprWlnM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'bids_process_face_experiment.mlx'));">MATLABコマンドを表示する</button>

## EEG-BIDSについて 

このチュートリアルのデータは、 [EEG BIDSフォーマット](https://github.com/bids-standard/bids-specification/blob/master/src/04-modality-specific-files/03-electroencephalography.md)お問い合わせ EEG-BIDSフォーマットの特定性についてもっと読むことができます [詳しくはこちら](https://www.nature.com/articles/s41597-019-0104-8)お問い合わせ EEGLABには専用のプラグインがあります。 [EEG-BIDSについて](https://github.com/sccn/EEG-BIDS) BIDSデータセットのエクスポートとインポート このプラグインは、EEGLABプラグインマネージャを使用して利用でき、このチュートリアルでスクリプトを実行する前にインストールする必要があります。 このBIDSの例でファイルを整理する方法を調べるのは、しばらく費やす価値があります。

EEGLABにBIDSの統合について詳しく知るには、 [bids-matlab-io - アダルトアフィリエイトプログラム モデル募集 モデルログイン](https://github.com/sccn/EEG-BIDS/wiki) EEGLABプラグインのドキュメント。 

## データのダウンロード
この例で使われているEEGデータは、 [ウェイクマンとヘンソン (2015)](https://www.nature.com/articles/sdata20151)お問い合わせ この実験では、著名な、非有名、スクランブルな顔を見ながら、同時にMEG-EEGデータを収集しました。 各画像は3回繰り返され、左右のインデックスの指で2つのキーの1つを押下し、各画像が平均比例した対称性を示す。

突然提示された顔のイメージの人間の認識は大きい作り出します
平均的なイベント関連で約170ms(N170をdubbed)で負のピーク
ポスタースカルプチャンネル([ベントイン ら.,
1996](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2927138/)。 お問い合わせ
直接を含むいくつかの方法によって局在する可能性
腐食性表面から、腐食性表面への録音(ECoG)
二国間fusiformジャイラス。 

Henson と Wakeman (2015) がジョイント EEG/MEG を適用
N170ピークスカルプマップへのソース分析で、エリアを推定
応答機能を生成する劣性心皮質。 ボールド
fMRI研究([Kanwisher et)で同じ領域の信号増加が見られる
1997年(平成9年)https://www.ncbi.nlm.nih.gov/pubmed/9151747)。 長い電車
機能的なイメージングとEEG実験の質問を検討している
顔画像プレゼンテーションによるfusiformのジャイラスの活性化かどうか
インデックスフェイス固有の処理([Kanwisher & Yovel])
2006](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1857737/)または
より一般的な専門家の個人識別をサポートする処理
または重要なおよび長い規定された目的の大きいセットのためのサブカテゴリ
--例えば、自動車専門家による自動車グリル([Gauthier et])
1999年(平成11年)https://www.ncbi.nlm.nih.gov/pubmed/10448223)). 

一般的に、
顔のプレゼンテーションは、「N170」の可能性を大きく生み出しています。
FUsiform BOLDの活発化)は「顔のような」イメージの提示をします
住宅など 

[ウェイクマンとヘンソン (2015)](https://www.nature.com/articles/sdata20151) 使用するパラダイムを開発
ここで扱われたデータを収集し、繰り返しの決定(同じ)
顔のイメージ)シリーズのtachistoscopically提示された「顔のversus
家のイメージ実験は、EEGと同時応答の影響を受け、
よく知られている、未知の、およびスクランブルされた顔に対する反応が同じである方法
配列は異なります。 下の図のパラダイムの詳細をご覧ください。

![`center|400px`](/assets/images/Wakeman_henson_eegset.jpg)

EEGとMEGの両方を含む元のデータセットはかなり大きいので、生データはチュートリアルに使用できる形式に変換されました。 データは、Dung Truong、Ramon Martinez、Arnaud Delormeによって(EEG抽出、タイミング修正、電極位置再指向、イベントレイテンシー修正および名前変更)によって準備されました。 [オープンニューロ](https://openneuro.org/datasets/ds002718).

## データの事前処理
データをダウンロードしたら [オープンニューロ](https://openneuro.org/datasets/ds002718/versions/1.0.2)下記のコードを実行できます。 [サイトマップ](/tutorials/04_Import/BIDS.html) データのダウンロードに問題がある場合)。

### EEGLABを始める 

以下のスクリプトでは、 [EEGLABのgitバージョン](/others/How_to_download_EEGLAB.html) 2021年(昭和20年) スクリプトはEEGLABの以前のバージョンでは動作しません。

``` matlab
clear
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab;
```

以下のコードは、EEGLABの「sample_data」サブフォルダに保存したデータを想定しています。 この場合、以下のセルでファイルパス変数を調整します。

``` matlab
eeglabPath = fileparts(which('eeglab'));
filepath = fullfile(eeglabPath, 'sample_data', 'ds002718');
```

### BIDSデータのインポート
*pop_importbids.m* は、BIDS 形式のフォルダー構造を EEGLAB にインポートします。 
'bidsevent' が 'on' の場合、イベントは BIDS .tsv イベントファイルからインポートされ、 生バイナリ EEG ファイルのイベントは無視されます。 同様に、'bidschanloc'、'on' は BIDS .tsv ファイルからチャンネルの場所をインポートし、EEG ファイルの任意の場所を無視します。 'studyName' フィールドでは、新しく作成した STUDY の名前を指定できます。 詳細はこちら [BIDSのインポートチュートリアル](/tutorials/04_Import/BIDS.html) BIDSの研究をインポートする方法の詳細については、.

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

このデータでは、大量の高振度目のバリンクが多数あるため、アーティファクトを拒否するための3つのステップを使用しています。 ICAを実行する前に、データをステップで主要なアーティファクトをきれいにする必要があります 1。 ICA を実行する前に、*clean_rawdata* プラグインを使用して、自動攻撃的アーティファクト拒否を使用した場合、blink を含むすべてのデータ部分が削除されます。 ICAはデータからblinkを削除/サブトラクトできるため、これは望ましくありません。 それからステップ3で、データはICAによってきれいにされたら、他の残りのアーティファクトは*clean_rawdata*を使用して取除かれるかもしれません。 

多くの場合、ステップ1と2のみが必要です。 データに依存します。

### 極端なアーティファクトで活動の悪いチャンネルや地域を削除

ここでは、*pop_clean_rawdata.m* 関数を使用して、0.5 Hz でデータをフィルタリングし、異常なアクティビティでチャネルを拒否し、極端なアーティファクトアクティビティでデータ部分を削除します。
*pop_clean_rawdata.m* は、 [アーティファクト・サブスペースの復興](https://sccn.github.io/tutorials/ConceptsGuide/ASR_background.html) EEGLABに統合される(ASR)モジュール [clean_rawdata() プラグイン](https://sccn.github.io/tutorials/ConceptsGuide/ASR_background.html) (EEGLABでデフォルトでインストール) 

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

### IClabel を使用して ICA とフラグのアーファクト コンポーネントを実行します。
次に、ICAをデータに適用します。 EEGLAB用の*Picard*プラグインをインストールしている場合は、'picard'で'runica'を置き換えることができます。 'runica' として、*Picard* は Infomax ICA アルゴリズムですが、より速く、理論的により有効な newton の最適化方法を使用します。 ICAを使用して、EEGデータに埋め込まれたアーティファクトを読み取り、詳細を見つけることができます [専用セクション](/tutorials/06_RejectArtifacts/RunICA.html) EEGLABチュートリアル

その後、IClabelを使用してコンポーネントを分類します。 IClabel は、EEGLAB でデフォルトでインストールされている EEGLAB プラグインで、各独立したコンポーネントの型(脳、目、筋肉、線騒音など)の確率を計算します。
関数 *pop_icflag.m* 'thresh' の2番目の引数は、コンポーネントをアーティファクトとして選択するために使用される最小値と最大値を指定することです。 *Brain*、*Muscle*、*Eye*、*Heart*、*Line Noise*、*Channel Noise*、*Other*の6つの分類のICAの部品のために、順序で入ります。
そのため、*Eye* または *Muscle* に少なくとも 80% の自信で分類されている場合は、ICA コンポーネントのみを削除していることを確認してください。 IClabel によるアーティファクチュアルとしてフラグが付けられている ICA コンポーネントは、データから (削除) をサブトラクトします。

``` matlab
EEG = pop_runica(EEG, 'icatype','runica','concatcond','on',...
                                'options',{'pca', -1});
EEG = pop_iclabel(EEG,'default');
EEG = pop_icflag(EEG,[NaN NaN;0.8 1;0.8 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);
EEG = pop_subcomp(EEG, [], 0, 0); %remove bad components

```

### 汚染されたデータの残りの部分を削除します。
ASR と *pop_clean_rawdata.m* を使っていますが、ここでは残りのアーファクトアクティビティを含むデータの部分を積極的に削除します。
まず、ASRはデータのクリーンな部分(キャリブレーションデータ)を見つけ、PCA抽出されたコンポーネントの標準的な偏差を計算します(生理学的EEGアルファとそれらをフィルタリングすることにより、β波を無視します)。 それから、キャリブレーションデータの標準的な偏差が20回を超えると、データ領域を拒否します。 このしきい値の下、拒絶反応がより攻撃的である。

``` matlab
EEG = pop_clean_rawdata( EEG,'FlatlineCriterion','off','ChannelCriterion','off',...
    'LineNoiseCriterion','off','Highpass','off','BurstCriterion',20,...
    'WindowCriterion',0.25,'BurstRejection','on','Distance','Euclidian',...
    'WindowCriterionTolerances',[-Inf 7] );
```

データセット15(EEG(15)は、このプロセスの最後に残された15%のデータのみを持ち、上記の閾値があまりにも攻撃的であることに注意してください。 MATLAB 内の各関数のパラメーターの記述は、次のように入力できます。
``` matlab
help pop_clean_rawdata
```

### データを抽出する epochs 
以下では、指定したイベントタイプにタイムロックされたデータエポックを抽出することで、連続したEEGデータセットをエポケされたデータセットに変換します。 'timelim' の入力は、タイムロックイベントに対して秒単位で epoch のレイテンシ制限を定義します。ここでは、イベントが 1 秒後にイベントの前に -0.5 からウィンドウを定義します。 
ベースラインを削除しない(上記のハイパスフィルタリングは、この段階で十分です)。

```matlab
EEG = pop_epoch( EEG,{'famous_new','famous_second_early','famous_second_late','scrambled_new','scrambled_second_early','scrambled_second_late','unfamiliar_new','unfamiliar_second_early','unfamiliar_second_late'},[-0.5 1] ,'epochinfo','yes');
```

## データプロット

### STUDYデザインの作成

以下のコードは、条件全体で比較するためのSTUDYデザインを作成します。 

``` matlab
ALLEEG = EEG; % update ALLEEG structure
STUDY = std_checkset(STUDY, ALLEEG); % update epoch information
STUDY = std_makedesign(STUDY, ALLEEG, 1, 'name','Faces','delfiles','off','defaultdesign','off',...
    'variable1','face_type','values1',{'famous','scrambled','unfamiliar'},...
    'vartype1','categorical', ...
    'subjselect',{'sub-002','sub-003','sub-004','sub-005','sub-006','sub-007','sub-008','sub-009',...
    'sub-010', 'sub-011','sub-012','sub-013','sub-014','sub-015','sub-016','sub-017','sub-018','sub-019'});
```

メインの EEGLAB ウィンドウを更新します。

``` matlab
eeglab redraw
```

### チャネルの計算
研究設計を作成する前にこれを行うことができます。
ここではイベント関連の可能性を計算します。 それぞれのチャネルで計算されます。 以下では、我々は唯一のコンパスERP、200ミリ秒から0ミリ秒のベースライン。

``` matlab
[STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, {},'savetrials','on','rmicacomps','on','interp','on',...
    'recompute','on','erp','on','erpparams',{'rmbase',[-200 0] });
```

### 単一のチャネルでPlot ERP
これで、各条件の1つのチャネルでERPをプロットする予定です。 まずはプロットパラメータを指定します。

``` matlab
STUDY = pop_erpparams(STUDY, 'timerange',[-200 1500], 'plotconditions','together');
```
その後、図を描きます(ここでは、元の出版物でチャンネル65を選択します)。

``` matlab
STUDY = std_erpplot(STUDY,ALLEEG,'channels',{'EEG065'}, 'design', 1);
```

![](/assets/images/erp_wh_bids2.png)

STUDY測定のプロットに関する詳細は、 [STUDY視覚化チュートリアル](/tutorials/10_Group_analysis/study_data_visualization_tools.html).

### 平均的な地理的地図としてERP活動をプロット

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

このチュートリアルは、BIDSデータを処理する方法の簡単なデモでした。 この時点で、グループ分析チュートリアルを参照して実行することができます [統計情報](/tutorials/10_Group_analysis/study_statistics.html) または高度な処理 [脳のソース活動](/tutorials/10_Group_analysis/component_clustering_tools.html) このデータについて 見てみることもできます。 [LIMOプラグイン](https://github.com/LIMO-EEG-Toolbox/limo_meeg/wiki) 一般的なリニアモデルに基づいて統計分析を行うために同じBIDSデータを使用するチュートリアル。
