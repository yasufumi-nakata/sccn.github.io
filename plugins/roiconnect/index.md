---
layout: default
title: ROIconnect
nav_title: "ROIconnectについて"
long_title: ROIconnect
parent: Plugins
render_with_liquid: false
nav_order: 3
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/roiconnect).

# ROIconnectとは?

ROIconnectは、オープンソースプラグインを自由に利用できるため [エッグラボ](https://github.com/sccn/eeglab) EEGデータ解析用 ソースレベルでの利息(ROI)の領域間の線形および非線形機能接続解析を実行できます。 結果は2次元、3次元で視覚化できます。 ROIは、一般的なfMRIアトラスに基づいて定義され、ソースローカリゼーションは、LCMVビームフォーミングまたはeLORETAを介して行うことができます。 コヒーレンスベースのメソッド、Granger Causality、Time-reversed Granger Causality、Multivariate Interaction Measure、Maximized Imaginary Coherency、Phase-amplitudeのカップリング、その他のメソッドを使用して、すべての脳領域間の接続解析を行うことができます。 このプラグインは、FieldTrip、Brainstorm、NFTヘッドモデルと互換性があります。

お問い合わせ 次の論文をチェックして、コネクティビティ実験の推奨方法とパイプラインについて学びます。
> Pellegrini、F.、Delorme、A.、Nikulin、V.、及びHafe、S. (2023)。 EEG からの相互地域線形機能接続を検出するための良い慣行を特定します。 NeuroImage、120218。 [土井: 10.1016/j.neuroimage.2023.120218](https://doi.org/10.1016/j.neuroimage.2023.120218)
> 
> Pellegrini, F., Nguyen, T. D., Herrera, T., Nikulin, V., Nolte, G., & Haufe, S. (2023). アンチシムエマル化ビスペラを使用して、サイト内位相差カップリングから区別します。 バイオRxiv 2023.10.26.564193. [https://doi.org/10.1101/2023.10.26.564193](https://doi.org/10.1101/2023.10.26.564193)

⚠️ 免責事項: このプラグインは、我々が研究設定のために特定したベストプラクティスパイプラインを実装します。 こういった環境では、躊躇することなく使用できると確信しています。 実験を完全に再現するための追加コードが提供されます。 [別のリポジトリ](https://github.com/fpellegrini/FCsim)お問い合わせ 中期では、このプラグインを他のユースケースに拡張し、それぞれのバリデーション試験でバックアップします。

EEGLAB GUIからコア機能にアクセスすることができます。 経験豊富なユーザーは、コマンドラインから追加のユーティリティにアクセスすることができます。 コマンドラインから関数を実行する場合は、コードで提供される各ドキュメントを参照してください。 


Tien Dung Nguyen、Franziska Pellegrini、Stefan Haufe、EEGLABインターフェイス、Coregistration、3-Dビジュアライゼーション、Arnaud DelormeによるFieldTrip統合により開発されたコード。

# EEGLABプラグインマネージャを使用したインストール

まず、EEGLABをインストールします。 メニュー項目 *File > EEGLAB拡張機能*を管理し、*ROIconnect*を選択し、インストールします。 ROIconnectメニュー項目は、*Tools* EEGLABメニューにあります。

# 手動取付け
お問い合わせ [エッグラボ](https://github.com/sccn/eeglab#installingcloning) インストール。 プロジェクトレイアウトは次の通りです。

```
eeglab/	 				
├── functions/ 							
├── plugins/ 								
├── sample_data/ 					
├── sample_locs/		
├── tutorial_scripts/						
└── /.../ 					
```
ROIconnect プラグインをインストールする必要があります。 `plugins` フォルダ。 一番簡単な方法は、リポジトリをクローンするだけです。 ナビゲート `plugins` 型づけによるフォルダ。 
```
cd <eeglab_install_location>/eeglab/plugins
``` 
次にリポジトリをクローンします。
```
git clone https://github.com/sccn/roiconnect.git
```
です。 プラグインを実行したい場合は、起動してください [エッグラボ](https://github.com/sccn/eeglab#to-use-eeglab) まずは。 EEGLAB を追加する必要があります。 [MATLABパス](https://de.mathworks.com/help/matlab/ref/addpath.html)お問い合わせ 一部の機能は追加のインストールが必要な場合があります  [フィールドトリップ(ライトまたはノーマル)](https://www.fieldtriptoolbox.org) そして、 [ブラインド映画](https://github.com/arnodelorme/brainmovie).

なぜこの EEGLAB プラグインは EEGLAB プラグインマネージャではありませんか? プラグインはベータです。 完了したら、EEGLABプラグインマネージャに追加されます。 

📌 `test_pipes/` 始めるために使用できるテストパイプラインが含まれています。

# 主な特長
ツールボックスの特徴は、次の3つの主な機能で実装されています。 `pop_roi_activity`, `pop_roi_connect` そして、 `pop_roi_connectplot`お問い合わせ これらの関数は対応するメニュー(ドキュメントが近日公開)を持っています。 現在、これらの関数のコマンドライン版のみを以下に文書化します。

## データの準備
ROIconnectを使用するために、関連するアトラスでリードフィールド行列が必要になります。 リードフィールド行列は、DIPFIT EEGLABプラグイン(メニュー項目 *ツール >)を使用して計算することができます DIPFITを用いたソースローカリゼーション > ヘッドモデル設定*以降 *ツール > DIPFIT > 分散型リードフィールドマトリクス*を用いたソースローカリゼーション このリードフィールドマトリクスは、ROIconnectによって自動的に認識されます。

## 源の復興
`pop_roi_activity` EEGセンサーのアクティビティ、ヘッドモデルのポインタ、ソースモデル、アトラス名、および寸法減少のためのPCの数を含むEEGの指示を要求して下さい。 また、この機能もサポートしています。 [FOOOF分析](https://fooof-tools.github.io/fooof/)お問い合わせ FOOOF を含むコマンドライン例は次のとおりです。

```matlab
EEG = pop_roi_activity(EEG, 'leadfield',EEG.dipfit.sourcemodel,'model','LCMV','modelparams',{0.05},'atlas','LORETA-Talairach-BAs','nPCA',3, 'fooof', 'on', 'fooof_frange', [1 30]);
```

ソースプロジェクションフィルタを計算し、センサーデータに適用することで、ソース再構築を行います。 パワーは、voxel のタイム シリーズの Welch メソッドを使用して計算され、地域内の voxels 間で集計されます。 地域指向のFC計算を有効にするには、各地域の時間シリーズにPCAを適用します。 それぞれの領域で*n*最強のPCを選択します。 得られた時間シリーズはで貯えられます `EEG.roi.source_roi_data`、および力は貯えられます `EEG.roi.source_roi_power`.

関数はデータが約100Hzであるように要求します、従ってそれはデータを再サンプリングするためにユーザーを尋ねます。 また、連続データの自動エポック(セグメント)抽出を変更し、エポック数のパラメータを追加しました。 コネクティビティの値はデータの長さによって異なるため、同じ数のエポックを常に保有しています。

エポック数を60(2秒)に設定します。 連続データを提供すると、非重複エポックが抽出されます。 60 以上の場合、関数は 60 をランダムに選択します。 60 未満の場合、機能が epoch オーバーラップを増加させ、データを抽出しようとすると、再び epoch を抽出します。 入力(単一試用ERP)としてデータepochsを提供し、それらに十分でないと、それらは目的の番号に達するためにブートストラップされています。

## 接続性分析
`pop_roi_connect` 下記の入力を受け付けます: EEG の指示は、 `pop_roi_activity` FCメトリックの名前。 データの長さによるバイアスを避けるため、すべての条件の定数のデータを保存することをお勧めします。 そのため、60 s の長さ (デフォルト) のタイムスニペットで FC を推定する関数を、平均値 (デフォルト) または後で統計分析のために入力として使用することができます。 以下のコマンドライン例では、デフォルト値(この例の入力パラメータとして明示的に渡された)を使用してスニペットのFC解析を実行する関数を要求します。 

```matlab
EEG = pop_roi_connect(EEG, 'methods', { 'MIM', 'TRGC'}, 'snippet', 'on', 'snip_length', 60, 'fcsave_format', 'mean_snips');
```

関数は、周波数分解された方法ですべてのFCメトリックを計算します。つまり、出力には、すべての周波数調整式の組み合わせのためのFCスコアが含まれています。 この関数の出力は保存されます `EEG.roi.<fc_metric_name>`.

> **注意**<br>
> スニペット分析は、エッチングと同等ではありません。 データ長が接続推定のバイアスを阻害していることを発見しました。 したがって、データの長さ(スニペットの長さ、デフォルト60秒)を比較すべきすべての実験条件に保つことをお勧めします。 iCOHとMIM/MICに最も適しています。 デフォルトでは、スニペット解析がオフになります(デフォルト: `'snippet', 'off'`)。 詳しくはこちら [詳しくはこちら](https://github.com/arnodelorme/roiconnect/pull/14#issuecomment-1263531505).

## 可視化
さまざまなモードでパワーとFCを呼び出して見える化 `pop_roi_connectplot`お問い合わせ 以下では、[[[1]](#1)]の実際のデータ例から1つの被写体の結果を表示します。 MATLABのコードと対応する分析をご覧いただけます。 [詳しくはこちら](https://github.com/fpellegrini/MotorImag)お問い合わせ プロットは、左モーターの画像条件でパワーまたはFCを表示します。 タスクの性質上、8〜13Hzの周波数帯で結果を表示しますが、あなたが望む任意の周波数または周波数帯域を選択することは自由です。 

:プッシュピン: あなたにとって画像のどれも小さい場合は、クリックするだけで、別のタブでフルサイズで開きます。<br>
:round_pushpin: PlottingはPSD、MIM/MICおよびGC/TRGCのために特に最大限に活用されます。 

### 地域のバープロットとしての電力
パワーをバープロットだけ可視化したい場合、必ず明示的にターンしてください `plotcortex` デフォルトでオンになっているのでオフ。 
```matlab
EEG = pop_roi_connectplot(EEG, 'measure', 'roipsd', 'plotcortex', 'off', 'plotbarplot', 'on', 'freqrange', [8 13]) % alpha band;
```
<p float="middle">
  <img src="https://github.com/Hiyeri/roiconnect/blob/master/resources/power_barplot_left.jpg?raw=true" width="400"/>     
  &nbsp;&nbsp;
</p>

### ソースレベルの皮質な表面のトポグラフィーとして力
```matlab
EEG = pop_roi_connectplot(EEG, 'measure', 'roipsd', 'plotcortex', 'on', 'freqrange', [8 13]);
```
<p float="middle">
  <img src="https://github.com/Hiyeri/roiconnect/blob/master/resources/power_cortex_left.jpg?raw=true" width="400"/>     
  &nbsp;&nbsp;
</p>

### 地域対地域行列としてのFC 
繰り返しますが、コルテックスプロットを見たい場合は、明示的にターンする必要があります `plotcortex` オフ。 フルサイズで見たい場合は、図をクリックしてください。
```matlab
EEG = pop_roi_connectplot(EEG, 'measure', 'mim', 'plotcortex', 'off', 'plotmatrix', 'on', 'freqrange', [8 13]);
```
<p float="middle">
  <img src="https://github.com/Hiyeri/roiconnect/blob/master/resources/FC_MIM_matrix.png?raw=true" width="400"/>     
  &nbsp;&nbsp;
</p>

半球で行列をグループ化したい場合は、以下のコードを実行することで行える。
```matlab
pop_roi_connectplot(EEG, 'measure', 'mim', 'plotcortex', 'off', 'plotmatrix', 'on', 'freqrange', [8 13], 'grouphemispheres', 'on');
```

<p float="middle">
  <img src="https://github.com/Hiyeri/roiconnect/blob/master/resources/FC_MIM_matrix_groupedhems.png?raw=true" width="400"/>     
  &nbsp;&nbsp;
</p>

特定の脳ローブに属する半球および地域によってさらにフィルタリングできます。 例として、左半球のFCが見えるように見えます。

```matlab
pop_roi_connectplot(EEG, 'measure', 'mim', 'plotcortex', 'off', 'plotmatrix', 'on', 'freqrange', [8 13], 'hemisphere', 'left');
```
<p float="middle">
  <img src="https://github.com/Hiyeri/roiconnect/blob/master/resources/FC_MIM_matrix_left.png?raw=true" width="400"/>     
  &nbsp;&nbsp;
</p>

### 表面地形としてのネットFC
ここは、全ての地域から全ての地域へ FC を視覚化しています。
```matlab
pop_roi_connectplot(EEG, 'measure', 'mim', 'plotcortex', 'on', 'freqrange', [8 13]);  
```
<p float="middle">
  <img src="https://github.com/Hiyeri/roiconnect/blob/master/resources/FC_MIM_cortex_left.jpg?raw=true" width="400"/>     
  &nbsp;&nbsp;
</p>

### シーズFCは、角面地形として
ここには、種地域のFCを他の地域に可視化しています。
```matlab
pop_roi_connectplot(EEG, 'measure', 'mim', 'plotcortex', 'on', 'freqrange', [8 13], 'plotcortexseedregion', 49); 
```
<p float="middle">
  <img src="https://github.com/Hiyeri/roiconnect/blob/master/resources/FC_MIM_cortex_seed49_left.jpg?raw=true" width="400"/>     
  &nbsp;&nbsp;
</p>

### グループ分析

ROIconnect プラグインは EEGLAB STUDY フレームワークと互換性があります。 つまり、グループ分析用のSTUDYを作成したら、データセットのグループで接続を計算するためにROIconnectメニューを選択できます。 接続が完了すると、グループレベルでROIconnectの結果を集計する方法が2つあります。 この段階では、コマンドラインコードのどちらの方法も含まれます。 最も簡単な方法は、すべてのデータセットでROIconnectを実行し、それらの上でマトリックスを収集し、統計を実行することです。 

すべてのデータセットの接続(例えば、多変量的相互作用測定)と各被写体に対して、条件1と条件2のためのデータセット(配列では、最初のデータセットは1条件1、第2の第2の主題1条件1、第2の主題1条件2、第3は2条件1、等で、コードを使うことができます:

```matlab
% aggregate all subjects for each condition in one matrix
numSubject = length(ALLEEG)/2; % number os subjects
cond1 = zeros( [ size(ALLEEG(1).roi.MIM) numSubject] ); % dimensions are frequency x roi x roi x subject
cond2 = zeros( [ size(ALLEEG(1).roi.MIM) numSubject] );
for iSubj = 1:numSubject
	cond1(:,:,:,iSubj) = ALLEEG(((iSubj-1)*2+1)).roi.MIM; % get the MIM (multivariate interaction measure) for all odd datasets 
	cond2(:,:,:,iSubj) = ALLEEG(((iSubj-1)*2+2)).roi.MIM; % get the MIM (multivariate interaction measure) for all even datasets 
end

% compute statistics and plot
[t,df,p] = statcond({ cond1 cond2 }); % parametric here but you can also use permutations
[~,indAlpha] = min(abs(ALLEEG(1).roi.freqs - 10));
tAlpha = squeeze(t(indAlpha,:,:));
pAlpha = squeeze(pFdr(indAlpha,:,:));
figure; subplot(1,2,1); imagesc(tAlpha); title('t-value');
figure; subplot(1,2,2); imagesc(-log10(pAlpha)); title('p-value (0 for p=1; 1 for p=0.1; 2 for p=0.01 ...)');
% or replace matrix MIM in one of the dataset and plot using the ROIconnect menus or command line functions
```

または、任意の研究設計(双方向ANOVAを含む)からROIconnectデータを取得するには、強力なstd_readdata関数を、ドキュメントに記載されているように使用できます。 [eegstats プラグイン](https://github.com/sccn/eegstats). 

{% raw %}
```matlab
[~,condsMat] = std_readdata(STUDY, ALLEEG, 'customread', 'std_readeegfield', 'customparams', {{ 'roi', 'MIM' }}, 'ndim', 4, 'singletrials', 'on’);
```
{% endraw %}

その後、計算統計とプロットを上記(この場合は*condsMat = { cond1 cond2 }*)として使用してください。 STUDYとSTUDYの設計を作成する方法については、 [EEGLAB ドキュメント](https://eeglab.org/tutorials/10_Group_analysis/study_creation.html).

# スクリプト

ROIconnectのテストフォルダには様々なスクリプトが含まれています。 関心のあるのは、EEGLABチュートリアルデータセットで接続解析を実行する*test_pipes/pipeline_connectivity.m*です。 このスクリプトは他のデータを処理するために簡単に変更できます。

# 参考文献
<a id="1">[1]</a> 
Pellegrini、F.、Delorme、A.、Nikulin、V.、及びHafe、S. (2023)。 EEG からの相互地域線形機能接続を検出するための良い慣行を特定します。 NeuroImage、120218。 [土井: 10.1016/j.neuroimage.2023.120218](https://doi.org/10.1016/j.neuroimage.2023.120218)

<a id="3">[2]</a> 
Pellegrini, F., Nguyen, T. D., Herrera, T., Nikulin, V., Nolte, G., & Haufe, S. (2023). アンチシムエマル化ビスペラを使用して、サイト内位相差カップリングから区別します。 バイオRxiv 2023.10.26.564193. [https://doi.org/10.1101/2023.10.26.564193](https://doi.org/10.1101/2023.10.26.564193)

<a id="2">[3]</a> 
https://github.com/fpellegrini/FCsim

<a id="3">[4]</a> 
https://github.com/fpellegrini/MotorImag


