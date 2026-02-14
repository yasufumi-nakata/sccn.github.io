---
layout: default
title: RELICA
long_title: RELICA
parent: Plugins
render_with_liquid: false
nav_order: 22
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/relica).

<img src="./images/relica.png" width="600">

# RELICA EEGLABプラグイン

## RELICAとは?
インディペンデントコンポーネント分析(ICA)は、頭皮電極へのボリューム伝導によって混合され、脳と非脳EEGソース信号を解析するための広く応用データ駆動方式で、最大温度および機能的に独立したコンポーネント(IC)プロセスのセットに使用されます。 詳しくはこちら ICは正確な脳生理学的(または非脳)の起源と識別することができる。 しかし、このプロセスは、ノイズ、非静止、または不十分なデータから発生する可能性のあるICA結果の部分的な不安定性によって妨げられます。 ここでは、Fiorenzo Artoni(Fiorenzo Artoni)による新しい方法であるRELICA(RELiable ICA)の分解を実行するためのEEGLAB拡張機能の使用について説明しています。[アルトーニ ら., 2014](https://www.sciencedirect.com/science/article/pii/S1053811914007526))ICAの分解によって識別されるICプロセスのデータセット内の統計的な信頼性を特徴付けるため。 

大規模なデータセットの RELICA 分解を有効にするには、EEGLAB GUI または MATLAB コマンドラインから、米国の XCEDE ネットワークの高性能コンピューティング (HPC) リソースの RELICA 処理をオプションで実行できるようになりました。 [神経科学ゲートウェイ](https://www.nsgportal.org)お問い合わせ お問い合わせ [Delorme ら., 2019](https://sccn.ucsd.edu/~scott/pdf/Delorme_Open_EEGLAB_Portal_NER18.pdf) 詳しくはこちら

RELICAの目標は、データフレームやエポックの多くのランダムなブートストラップ選択を渡る分解データから最も安定的に分離されるICプロセスを特定することです。 RUNICAの結果は、個々のICについて描画された結論や、対流ICクラスターの安定性について自信を判断することができます。

RELICAは、最初に、ICAアルゴリズムの選択肢(最も強力なAMICA)を使用してデータを分解する参照を計算します。 それから、入力データのbootstrap surrogateバージョンの複数の分解を実行します(いくつかのデータフレームや、置換のデータからランダムに選択したトレーニングデータにあるEPochs)。 計算を高速化するために、ユーザーはこれらの分解のために使用するために、より速く(少し効果的)ICAアルゴリズムを選ぶことができます。

次に、各ICが分解するごとに、RELICAはICスカルプマップの分極性を計算し、生理学的プルーシビリティの測定()[Delorme ら., 2012](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0030135))。 その後、時間コース間の相関に基づいて、分離されたICを分離します。 クラスターの数は計算されたICの数(通常入力チャンネル数)です。 ブートストラップのデータセットが 1 つのクラスターに 2 つ以上の IC に貢献した場合、そのブートストラップの分解は、コンバージに失敗する可能性があるため、計算から削除されます。 各クラスターは、クラスター測定スペースのクラスターの遠心分離機に最も近いICで選択された試験器ICで識別することができます。 ブーツトラップICクラスターの小型化のQLcは、各ICのIC信頼性の内流測定を提供します。 RELICAは、その結果の有益な視覚化を返すこともできます。 

## EEGLABにRELICAプラグインをインストールする
RELICA を含む EEGLAB のすべてのプラグインは 2 つの方法でインストールできます。 RELICAをインストールするには:

1. **EEGLABプラグインマネージャから:** EEGLABを起動し、メニュー項目を選択**ファイル> EEGLAB拡張機能**をメインのEEGLABウィンドウで管理します。 プラグインマネージャーウィンドウがポップアップ表示されます。 RELICA プラグインを探し、選択し、**Install/Update** を押します。

2. **Webから:** RELICAプラグインのzipファイルをダウンロードする [お問い合わせ](https://github.com/sccn/relica) GitHub のページ (「Zip をダウンロード」) または [EEGLAB wikiプラグインページ](https://sccn.ucsd.edu/wiki/Plugin_list_all) (*RELICA**を選択してください) メインのeeglabフォルダ(*../eeglab/plugins/*)のプラグインフォルダにzipファイルを解凍します。

EEGLABを再起動します。 インストールが成功すると、RELICA, **Tools > Run RELICA** を呼び出すメニュー項目が EEGLAB メニューに表示されます。

## ランニングリライカ
RELICAを実行する前に、EEGLABを起動し、EEGデータセットをロードします。 ここでは、サンプル EEGLAB データセット、 *.../eeglab/sample\_data/eeglab\_data\_epochs\_ica.set* を使用します。

### コンピュータ上でローカルでRELICAを実行
ロードされたデータセットで RELICA を実行するには、まずメイン RELICA (*pop\_relica*) ウィンドウを起動します。MATLAB コマンドラインで *relica* を入力するか、EEGLAB メニューからそれを呼び出して、**Tools > RELICA > Run RELICA** を選択します。

<img src="./images/relica_gui1.jpg" width="600">

結果の RELICA のメインウィンドウ (右) から、次のように指定できます。

1. ICA は (**ICA メソッド**) を使用するアルゴリズムを分解します。デフォルトは、拡張した Infomax ICA を実装する EEGLAB の 'runica' です。 つまり、より速く (もう少し有効) の分解アプローチもサポートされています。
2. RELICAがブートストラップを実行する方法(**RELICAモード**) - フレームバイフレームまたはトライアルバイトライアルバイトライアル 
3. ブートストラップのバージョンを分解する(**Bootstraps**) - デフォルトは50
4. RELICA 結果を保存するフォルダーのパス名(**Output フォルダー**)
5. その他のRELICAオプション(**RELICAオプション**) - 選択したメソッドのICAオプション(詳細は*pop_relica*ヘルプを参照してください)

次のセクションで他のインターフェイス要素が導入されます。

### 神経科学ゲートウェイ(NSGportal.org)を用いた高性能コンピューティングリソースでRELICAを実行
Open EEGLABポータルからNeuroscience Gateway(NSGportal.org)までのXSEDEネットワークスーパーコンピュータでRELICAの計算を実行するには、Neuroscience Gateway(NSGportal.org)に最初に無料のNSGユーザ資格**を取得し、EEGLABプラグインを持っている必要があります。 [ログイン](https://github.com/sccn/nsgportal/) コンピュータにインストールします。 そのためには、 [サイトマップ](https://github.com/sccn/nsgportal/wiki).

次に、上記のRELICAメインウィンドウから:

1. RELICA ウィンドウのチェックボックス (** NSG** で計算) を選択します。: これは RELICA のデフォルトではありません。
2. 任意の NSG パラメータ ('NSG オプション') – *pop\_nsg* のヘルプを参照してください。 

RELICAウィンドウ**Help**ボタンは、利用可能なすべてのオプションをリストするRELICA(*pop\_relica.m)*機能ヘルプメッセージが表示されます。

### 例1:RELICAをローカルで実行する。 
テストケース例(以下に示す)では、ICAメソッドBEAMICA(非拡張インフォマックスの実装)を選択し、ブートストラップの分解回数を100に設定します。 RELICA 結果フォルダーをデータフォルダー(*../eeglab/sample_data/*)に設定し、デフォルト値を使用する他の選択を解除します。

<img src="./images/relica_gui1_example1.jpg" width="400">

### 例2:NSGでRELICAを実行します。 
RELICAの長いステップは、リファレンスを実行し、繰り返しブートストラップICAの分解を行います。 データセットが大きい(および/または指定されたブートストラップの数が大きい)場合、このプロセスは長い場合があります。 RELICAの*nsgportal*コードは、NSG経由でXSEDE HPCリソースで処理するためのRELICA計算書を提出できるようにしました。 この処理は上記と同じ*pop\_relica*ウィンドウから管理されます。 XSEDEネットワークのHPCリソースを使用して、プロセスのこのセクションが並列化され、シーケンシャル処理と比較して多くのフォールド速度を上げます。

NSG**でRELICAの計算を実行するには、NSGのアカウント**が必要です。EEGLABのプラグイン* nsgportal*は既にコンピュータにインストールされています。 詳細はこちら [*nsgportal* ウィキ](https://github.com/sccn/nsgportal/wiki) 詳しくはこちら *nsgportal* プラグインがコンピューターにインストールされると、NSG の認証情報と設定がセットされると、NSG による RELICA ブートストラップの分解を簡単に実行できます。 リクエストされた最大実行時間(<=48時間)とカスタム*jobID*名を含む追加のNSGパラメータは、編集ウィンドウ**NSGオプション**で設定できます。 詳しくは、*pop\_relica*ヘルプメッセージ(**Help**を使用して)を参照してください。 選択した設定でRELICAを実行するには、**OK**を押します。 
カスタム*jobID*がNSGオプションとして提供されていない場合、*pop\_relica*は、プレフィックス'*relicansg\_*'から構成されるジョブIDを6つのランダム数字(例えば:*relicansg\_123456*)で割り当てます。 必要に応じてカスタムジョブ名を割り当てることもできます。 ジョブ ID は、NSG ジョブが発行されたときに MATLAB コマンドウィンドウに表示されます。 ジョブのステータスを追跡するには、*pop\_nsg* ウィンドウを参照してください。 RELICA ジョブに割り当てられた jobID を使用して、そのジョブを見つけます。

## RELICA結果の取得
RELICA出力にアクセスするには3つの方法があります。

1.***ローカル計算を下げる:*** RELICA が実行された同じ EEGLAB セッションでは、RELICA の結果は EEG 構造サブフィールド *EEG.etc に保存されます。 リリカ*
2. *RELICA結果の読み込み:* 現在読み込まれたデータセットの EEG 構造に RELICA 結果のファイル情報を読み込むには、EEGLAB メニュー項目 **ツール > RELICA > ディスク**からRELICAをロードし、読み込まれたデータセットに対応する*RELICA.mat*ファイルを選択します。
3. ***NSG-assistedコンピューティングのフォロー:*** * NSG**オプションのCompute が RELICA ウィンドウで選択され、その結果、NSG ジョブが完了しました(ステータスを確認する方法を学ぶ) [詳しくはこちら](https://github.com/sccn/nsgportal/wiki/nsgportal-graphical-user-interface:-pop_nsg))、結果を取得するには、RELICA ジョブの *jobID* を使用します。 たとえば、選択した(カスタム) RELICA *jobID* が *relicatest_data* の場合、MATLAB コマンドウィンドウから次のコードを実行できます。  
```>> EEG = pop_relica('relicatest_data');```
After performing any of these steps, the RELICA results of your job will be stored in the EEG data structure subfield *EEG.etc.RELICA*.

## Visualizing RELICA results
Once the RELICA run is complete and its results retrieved, we can visualize the results by selecting the EEGLAB submenu item ‘**Tools > Run RELICA > Plot Results**‘. Selecting this menu will launch the *pop\_relica\_plots* window (shown in the figure below, right). Here specify the type of plot in the *pop\_relica\_plots* window. Three RELICA plot types are available:

<img src="./images/relica_guiplot.jpg" width="500">

#### Plot type 1: Bootstrap IC clusters.
This will generate a plot showing the relative compactness of, and relationships between clusters of similar ICs returned by the bootstrap decompositions, with inter-IC distances visualized in 2-D using Curvilinear Component Analysis ([Himberg et al., 2004](https://www.sciencedirect.com/science/article/pii/S1053811904001661)). Select the **Plot type** option **Bootstrap IC clusters** from the *pop\_relica\_results* window (above right) and press **Plot**. A figure similar to that below will be displayed. This figure shows the 2-D CCA projection of IC distances in clustering space, in particular highlighting the differences in quality (compactness, stability, reproducibility) of the IC clusters.

<img src="./images/relica_clusters.jpg" width="600">

In the figure above, the colored dots are individual bootstrap ICs. Here dot color represents the cluster they belong to. Cluster centroids are represented by dots of the same color, but have a black border, the cluster number indicated next to it. Note the difference in cluster compactness (i.e., IC reproducibility across bootstrap decompositions) of Cluster 2 (center) versus Cluster 14 (right). 

#### Plot type 2: Cluster exemplar maps
Select the option **Cluster exemplar maps** from the **Plot type** menu in the *pop\_relica_results* window, then press **Plot**. A figure like the one below will be displayed.

<img src="./images/relica_realicmaps.jpg" width="800">

Above, the title of each plot panel shows the cluster number and the component stability index from [Himberg et al. 2004](https://www.sciencedirect.com/science/article/pii/S1053811904001661) (heuristic measure of the quality of the estimates, ideally 100%) for each IC cluster.

#### Plot type 3: Cluster scalp maps
To plot the scalp maps of the ICs in a single IC cluster, select option **Cluster scalp maps** and then specify the cluster number to plot (**Cluster to plot**), using the cluster numbers shown in the **Bootstrap IC clusters** or **Cluster exemplar maps** plots (cluster 2 above). Specify the maximum number of IC scalp maps from the cluster to plot (**Max number of maps**). Pressing **Plot** displays the figure below.

 <img src="./images/relica_cluster1.jpg" width="400">

Above, each figure panel shows the scalp map for a member of the selected IC cluster (Cluster 2), beginning with the first bootstrap. When the number of cluster ICs (and bootstraps) is large, only the requested number are shown (default: one page of 20 maps).

## Running and visualizing RELICA from the MATLAB command line
Running RELICA, either locally or using NSG, and retrieving and visualizing the results can also be performed from the MATLAB command line or by a MATLAB script. For syntax of these calls, refer to the help messages for the functions *pop\_relica.m*  and *pop\_relica_results.m*.

## References

1) Artoni, F., Menicucci, D., Delorme, A., Makeig, S., & Micera, S. (2014). *RELICA: a method for estimating the reliability of independent components*. NeuroImage, 103, 391-400.          

2) Artoni, F., Delorme A., Makeig S. (2018) *Applying dimension reduction to EEG data by Principal Component Analysis reduces the quality of its subsequent Independent Component decomposition*, Neuroimage 175 176-187

3) Delorme, A., Palmer, J., Onton, J., Oostenveld, R. and Makeig, S., 2012. *Independent EEG sources are dipolar.* PloS One, 7(2), p.e30135.

4) Delorme, A., Majumdar, A., Sivagnanam, S., Martinez-Cancino, R., Yoshimoto, K. and Makeig, S., 2019, March. *The Open EEGLAB portal*. In: 2019 9th International IEEE/EMBS Conference on Neural Engineering (NER) (pp. 1142-1145). IEEE.

## Acknowledgments

Author:  Dr. Fiorenzo Artoni, 2019

This project was in part supported by the European Union's Horizon 2020 research and innovation programme under Marie Sklodowska-Curie Action agreement no. 750947 (BIREHAB)

Acknowledgments to Ramon Martinez-Cancino (SCCN/INC/UCSD 2019) for parallelizing the RELICA code and implementing its extension for computation on NSG HPC resources, for including other ICA algorithms, reworking all the GUIs, and generating the online documentation with Scott Makeig.

Acknowledgments also to Prof. Arnaud Delorme and Prof. Scott Makeig (SCCN/INC/UCSD 2019) for input and ideas to perfect the project.

EEGLAB [https://sccn.ucsd.edu/eeglab/] and many of its plug-in packages were created and are maintained at the Swartz Center for Computational Neuroscience, UCSD [https://sccn.ucsd.edu] directed by Scott Makeig. Arnaud Delorme is the chief EEGLAB software architect.

Clustering and relative visualization within RELICA makes use of  modified  routines from J. Himberg's open source FastICA - ICASSO package

Beamica is part of C. Kothe's  open source BCILAB toolbox 

