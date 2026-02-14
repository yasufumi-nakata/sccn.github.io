---
layout: default
title: IMAT
long_title: IMAT
parent: Plugins
render_with_liquid: false
nav_order: 15
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/imat).

# IMAT - 独立した変調器解析ツールボックス

## IMAとは?
インディペンデント・モジュレータ・アナリシス(IMA)は、「スパティオ・スペクトラム・スペクトラム・モジュレータ・プロセス」に、温かみのある独立したEEGソースのスペクトル変動を分解する方法です。 そのようなプロセスは、コルチコの皮下または感覚的角質ループで生成された変調の影響、またはドパミン、セロトニン、ノラドレナリンなどを使用して脳幹中心のインポート認識システムからシグナル伝達することにより、など、機能的に独立した変調因子の調整から派生する可能性があります。 (以下の図を参照) [Onton & Makeig, 2009 _ オントン&メイク](https://www.frontiersin.org/articles/10.3389/neuro.09.061.2009/full))。 1/fベースラインスペクトラム上に重ねられた狭いバンドプロセスを識別するために、コンポーネントプロセスの平均電力スペクトルを分解しようとするよりも、IMATは、時折、スペクトル電力 * varies*をスペクトルする特性周波数帯を識別します。 IMAは*both*の狭く、広いバンド モードを見つけることを可能にします。 また、識別されたモードは単数ではありません。 たとえば、IMAは、内因性ベータバンドの変動によるオーバーラップ周波数範囲からのアルファまたはムリズムおよびその調和の関節活動を分離します。 IMAは、脳内でローカライズしたり、特定のスカルプ筋肉など、データ内の独立したコンポーネント(IC)ソースプロセスに適用されます。 IMAは、指定されたIM周波数帯域に連結されたICサブセットを識別します。これらは、共通の影響と感受性を持つコモデーションネットワークとして考えられるかもしれません。

<img src="./Docs/figs/IndependentModulators.png" width="400">  

EEGスペクトルダイナミクスの多くの研究は、あらかじめ定義された広帯域または狭い周波数帯域のセットにスペクトルデータを分離し、これらのバンドの対策を抽出し、操作します。 他のアプローチは、広帯域と狭帯域部分に平均電力スペクトル自体を分解しようとします。 しかし、EEGに寄与するローカルフィールドダイナミクスの機能的役割、および振動動における個々の違いをより柔軟に理解するために、スペクトルダイナミクスのデータ駆動型モデルが必要です。  
 

IMA法では、複数のチャネルEEGデータは、独立したコンポーネント分析(ICA)を使用して空間的に安定し、最大に温度の独立したコンポーネント(IC)のソースプロセスに最初に分解されます。 その後、並列ジョイントICログ分光器内の一時的な変動は、最大で独立した(IM)プロセスに分解されます(ソースと周波数の重み)*(下図を参照) [Onton & Makeig, 2006年, 2006年, 2006年, 2006年, 2006年, 2006年, 2006年](https://sccn.ucsd.edu/~julie/HBM2006PosterMini.pdf))。 注意: IMA分解では、結果のIMの独立性が最大化されるのは、時間の経過とともに**非**であるが、ソースと周波数の重みを越える。

<img src="./Docs/figs/IMA.png" width="600"> 

ヨハンダ・ワグナー、ラモン・マルティネズ・カンチーノ、スコット・マシェイグがジュリー・オントンとスコットによる研究をベースとした開発[Onton & Makeig, 2009 _ オントン&メイク](https://www.frontiersin.org/articles/10.3389/neuro.09.061.2009/full), [Onton & Makeig, 2006年, 2006年, 2006年, 2006年, 2006年, 2006年, 2006年](https://sccn.ucsd.edu/~julie/HBM2006PosterMini.pdf)) Julie による Matlab スクリプト。


## EEGLABにIMATプラグインをインストールする
IMATを含むEEGLABのすべてのプラグインは、2つの方法でインストールすることができます。 IMATをインストールするには:

1. **EEGLABプラグインマネージャから:** EEGLABを起動し、メニュー項目を選択**ファイル> EEGLAB拡張機能**をメインのEEGLABウィンドウで管理します。 プラグインマネージャーウィンドウがポップアップ表示されます。 IMAT プラグインを探し、選択し、**Install/Update** を押します。

2. **Webから:** IMATプラグインのzipファイルをダウンロードする [お問い合わせ](https://github.com/sccn/imat) GitHubのページ(「Zip」をダウンロード)または [EEGLAB wikiプラグインページ](https://sccn.ucsd.edu/wiki/Plugin_list_all) (*IMAT**を選択してください) メインEEGLABフォルダ(*../eeglab/plugins/*)のプラグインフォルダにzipファイルを解凍します。

EEGLABを再起動します。 インストールが成功した場合は、メニュー項目を入力、**ツール> IMAT**によるICスペクトグラムを分解し、EEGLABメニューに表示します。
 

## よくある質問
1. IMATは、独立したコンポーネント分析(ICA)を使用して得られた脳情報源に取り組んでいるので、IMATを実行する前にICA分解を使用して、EEGデータを独立したコンポーネント(IC)に分解する必要があります。 EEGデータの処理とICAの実行方法についての説明は、 [eeglab ウィキ](https://eeglab.org/tutorials/06_RejectArtifacts/RunICA.html#run-ica).
2. コンポーネントの選択とクラスタリングは、脳ベースのICの同等の電流ダイポールモデルを推定する利点です。 
3. EEGLABプラグインをインストールするコンポーネントの自動選択のために [ICのラベル](https://sccn.ucsd.edu/wiki/ICLabel)  
4. EEGLABプラグインのFieldTripライトをインストールする必要がありますクラスターのダイポール密度をプロットするために。   
5. IMATは、epochedまたは連続したデータを処理できます。 epochedデータの場合、epochはIMAが計算される最低の頻度の少なくとも3つの周期を収容する長さがあるべきであることに注意してください。 

EEGLABプラグインをインストールする方法については、上記のセクションを参照してください。 


## 単一の主題の分析

## 走る IMAT
IMATを実行する前に、EEGLABを起動し、EEGデータセットをロードします。

読み込まれたデータセットでIMATを実行するには、MATLABコマンドラインで*pop_runIMA*を入力するか、EEGLABメニューからそれを呼び出して**Tools >を選択することにより、実行IMA(*pop_runIMA*)ウィンドウを起動します。 IMA > IMA** を実行し、以下の図で強調表示します。

<img src="./Docs/figs/RunIMA.png" width="1000"> 
結果のウィンドウ(右)では、次のように指定できます。

1. IMAを実行する独立したコンポーネント(IC) - コンポーネントのリスト(**IC Indices**)またはICLabelを使用して、ICを異なるタイプに自動的に分類することができます(**ICLabelタグ**)。 IMATは、ICLabelを使用してICを選択する際に、異なるICカテゴリの個々のしきい値を設定することができます。   
2. IMAを計算する周波数範囲(**Freq.限界(Hz)**) 
3. ログスケールの周波数スケール(**Freq scale**)リニア 
4. ICA分解前のPCA寸法削減(**pcfac**)を使用してスペクトルデータの時間ウィンドウの寸法減少を調節する要因 - *pcfac*が小さいほど、より多くの寸法が保持されます *ndims = (freqsxIC)/pcfac* 推定周波数の数であり、*ICs*はICの数です(デフォルトは7です)
5. その他のIMAオプション(**pop_runimaオプション**) - ICAアルゴリズムを使用する例(詳細は、*pop_runima*ヘルプを参照してください)


**コマンドラインからIMAを起動**

*[EEG, IMA] = pop_runIMA(EEG, 'freqscale', 'log', 'frqlim', [6 120], 'pcfac', 7, 'cycles', [6 0.5], 'selectICs', {'brain'}, 'icatype');*

ここでは、ICLabelを使用して「Brain ICs」を選択し、時間周波数分解のためのパラメータで計算IMAです:ログ周波数スケーリング、周波数制限:6〜120 Hz, ウェーブレットサイクル [6 0.5], タイムウィンドウの寸法を減らす
pfac 7を用いた時間/頻度分解、ICA分解のAMICA使用


## IMAの構造
  
*pop_runIMA* は IMA 構造で IMA 結果を保存します。EEG ファイルが実行されているフォルダと同じです。  

IMA(gui またはコマンドラインから) IMA を実行した後、Maatlab コマンドラインで *IMA* を入力して IMA 構造を表示します。  
 
IMA ファイルが IMA ファイルをロードすることもできます。   

*IMA = load([EEG.etc.IMA.filepath '/' EEG.etc.filename], '-mat');*

**IMAの構造* * 必須

IMAの構造には次の分野があります:

```matlab
             wts: [21×21 double]
             sph: [21×21 double]
         meanpwr: [14×229 double]
         timevec: [1260×1 double]
         freqvec: [1×229 double]
       freqscale: 'log'
         freqlim: [6 120]
            npcs: 21
        complist: [1 2 3 4 5 6 8 9 10 11 17 21 27 38]
           srate: 500
         ntrials: 42
      ntw_trials: 30
         winsize: 0.5000
          eigvec: [1260×21 double]
              pc: [21×3206 double]
        timefreq: [1260×3206 double]
     meanpwrCond: []
     timepntCond: [1×1260 double]
       condition: []
    subjfilename: {'RestEC_S03_ContAMICAdip.set'}
    subjfilepath: {'/Volumes/ExtremeSSD/IMAT_project/IM/PreSTUDY/S03'}
```

**IMAの出力の記述:**  

*IMA.wts - IMA分解の混合重量行列*  
*IMA.sph - IMA分解の混入球マトリックス*  
*IMA.meanpwr -単一のICの力スペクトルを意味します*  
*IMA.timevec - レイテンシーのベクトル*  
*IMA.freqvec - Hzの周波数のベクトル*  
*IMA.freqscale - 計算されたスペクトルの周波数スケーリング ('log' または 'linear')*  
*IMA.freqlim - スペクトル周波数制限*  
*IMA.npcs - IMAの分解の前に分光器に残される次元の数*   
*IMA.complist - IMAが実行された独立したコンポーネントのインデックス*  
*IMA.srate - スペクトルを計算するために使用されるEEGデータの元のサンプリングレート*  
*IMA.ntrials - 時間頻度分解を計算するために使用される試験の数*  
*IMA.ntw_trials - トライアルあたりの時間ウィンドウ数*  
*IMA.winsize - 時間周波数分解における計算スペクトルのウィンドウ長(秒単位)*
*IMA.eigvec - PCのバックプロジェクト時間*  
*IMA.pc - PCスペクトルバックプロジェクション*  
*IMA.timefreq - 周波数分解(各ICのスペクトグラム)*  
*IMA.timepntCond - 時間頻度分解の時間のポイントの数*  
*IMA.timevec - 時間頻度分解の完全な長さのレイテンシーのベクトル*  
*IMA.subjfilename - .imaファイルのファイル名*  
*IMA.subjfilepath - .imaファイルのファイルパス*  


## IMAT結果の可視化

IMAT結果を視覚化するための3つの主要なプロット機能があります。

1. 優れたコンポーネント
2. スペクトル封筒
3. タイムコース


**1. 超imposed コンポーネント** (*pop_plotspecdecomp*) 

IM の分解を視覚化するため、**Tools> を起動します。 IMAによる分解のスペクトル > Plot IMAの結果 > 過激なコンポーネント**

<img src="./Docs/figs/plotspecdecomp.png" width="1000"> 
結果のウィンドウ(右)では、次のように指定できます。 

1. プロットの種類(ドロップダウンメニューから)   
    - IMモード分解   
    - 重ねられた IC モード  
    - 想定されるIMモード    
2. プロットする周波数範囲(IMAが計算された周波数の範囲内)
3. ICとIMをプロットする


**IMモード分解* * 必須   
すべての IM および IC のために別にプロットのスペクトルの型板。   
コマンドラインで入力: *pop_plotspecdecomp(EEG、'plottype'、'comb')*  

<img src="./Docs/figs/IMA_decomposition.png" width="2000"> 


**優れたICモード**   
各 IM の IC の分光テンプレートをプロットします。  
コマンドラインで入力: *pop_plotspecdecomp(EEG, 'plottype', 'ics', 'comps', [1:7], 'factors', [1:8]*  

<img src="./Docs/figs/SuperimposedICmodes.png" width="1000"> 


**Superimposed IMモード**   
各ICのプロットを重ねたスペクトルIMテンプレート。  
コマンドラインで入力: *pop_plotspecdecomp(EEG, 'plottype', 'ims', 'comps', [1:6 8], 'factors', [1:8])*

<img src="./Docs/figs/SuperimposedIMmodes.png" width="1000"> 


**2. スペクトルエンベロープ** (*pop_plotspecenv*)

IMs の貢献を IC の平均ログスペクトラムに可視化するには、**Tools > を起動します。 IMAによる分解のスペクトル > Plot IMAの結果 > スペクトル封筒* * 必須

<img src="./Docs/figs/plotspecenv.png" width="1000">
結果のウィンドウ(右)では、次のように指定できます。 

1. プロットの種類(ドロップダウンメニューから)   
    - フルエンベロープ: IMスペクトルの変動の第1と第99パーセントをプロット
    - 上部の封筒: IM のスペクトルのバリエーションの 99 パーセントをプロット
    - より低い封筒: IM のスペクトルの変動の 1 パーセントをプロットします  
2. プロットする周波数範囲(IMAが計算された周波数の範囲内)
3. ICとIMの指標をプロットする

コマンドラインで:  
*pop_plotspecenv(EEG、'comps'、[1 2 5]、'factors'、[1 2 3 6]、'frqlim'、[6 120]、'plotenv'、'full');*

ここでは、IC パワースペクトラの影響の IMs **Full envelope** をプロットする例を示します。 IC は、ログ出力スペクトラムを黒のトレースとして示します。 アウターライトグレーの限界は、IMに関連するICスペクトルの変動の第1と第99パーセントを表します。 ダークグレーの領域は、IMA分析で使用されるPCA削減スペクトルデータの第1および99パーセントを表しています。

<img src="./Docs/figs/plotenv_EC.png" width="600">


**3. タイムコース** (*pop_plotIMtimecourse*)

IMの有効化を時間をかけてプロットするには、**Tools>を起動します。 IMAによる分解のスペクトル > Plot IMAの結果 > タイムコース**

<img src="./Docs/figs/plottimecourse.png" width="1000">
結果のウィンドウ(右)では、次のように指定できます。 

1. プロットの種類(ドロップダウンメニューから)   
    - ICスペクトグラム   
    - Summed IM プロジェクト  
    - 複合IC-IMスペクトル
    - IMタイムコース    
2. プロットする周波数範囲(IMAが計算された周波数の範囲内)
3. ICとIMをプロットする

**IC スペクトグラム* * 必須   
正規化(メアンログスペクトラム削除) IC スペクトグラムをプロットします。  
コマンドラインで入力: *pop_plotIMtimecourse(EEG, 'comps', [1 2 6], 'frqlim', [6 120], 'plotICtf', 'on')* 
 
<img src="./Docs/figs/ICspectogram.png" width="500">


**約束されたIMのバックプロジェクション**  
PCA を Plots は、IMA が計算した上で、正規化 (ログスペクトラム削除) IC のスペクトグラムを削減しました。    
コマンドラインでIC1、2、6にIMの複合効果を視覚化するには、*pop_plotIMtimecourse(EEG、'comps'、[1 2 6]、'frqlim'、[6 120]、'plotPCtf'、'on')*
 
<img src="./Docs/figs/summedICbackprojection.png" width="500">


**組込みIC-IMスペクトル**  
単一ICのための時間を渡る単一のIMのスペクトル重量のバックプロジェクトをプロットして下さい。    
コマンドラインでIC1、2、6にIM1の併用効果を視覚化するには、*pop_plotIMtimecourse(EEG、'comps'、[1 2 6]、'frqlim'、[6 120]、'factors'、 [1]、'plotIMtf'、'on')*

<img src="./Docs/figs/IMspectralweights.png" width="500">


**IMタイムコース**  
時間の経過とともにIMの活性化をプロットします。  
コマンドラインでIM 1、2、3のタイムコースを視覚化するには、*pop_plotIMtimecourse(EEG、'frqlim'、[6 120]、'factors'、[1 2 3]、'smoothing'、40、'plotIMtime'、'on')*

<img src="./Docs/figs/IMweightbackprojection.png" width="500">


## 複数の条件とグループ分析 

## 走る IMAT 

複数の条件またはグループ分析のためにIMATを実行する前に、EEGLABでSTUDYを構築する必要があります。 [eeglab wiki] で STUDY を作成する方法に関する情報を見つけることができます (https://sccn.ucsd.edu/wiki/Chapter_02:_STUDY_Creation)。 複数の条件では、各条件ごとに別の .set ファイルを作成する必要があります。 例えば、2つの条件(say、Eyes_open、Eyes_closed)で記録されたEEGデータでIMAを実行したい場合は、STUDYを作成する前に、*Eyes_open*と1つのEEGファイル用のEEGファイルを作成する必要があります。 

IMATを実行する前に、EEGLABを起動し、STUDYセットをロードします。

ロードされた STUDY で IMAT を実行するには、MATLAB コマンドラインで *pop_runIMA_study* を入力するか、MATLAB コマンドラインで EEGLAB メニューから呼び出すことで、**STUDY > スタディIMA > STUDY IMA** を以下の図に示すように実行します。 それぞれの被験者に対して別々の IMA 分解を実行します。 つまり、ジョイントIMAは、STUDYの各科目の全ての条件で計算されています。

<img src="./Docs/figs/runSTUDYIMA.png" width="1000"> 
結果のウィンドウ(右)では、次のように指定できます。

1. ICLabel を使用して、IC を複数のカテゴリに自動的に分類することができます(**ICLabel タグ**)。 指定されたカテゴリでICを選択するために、IMATを使用すると、異なるカテゴリの個々の不利なしきい値を設定することができます。 STUDY が作成されたときに分析のために指定された IC を使用します。
2. IMAを計算する周波数範囲(**Freq.限界(Hz)**)。
3. 周波数スケーリング(**Freq scale**)、リニアまたはログ。 
4. 分光器 ICA 分解前の PCA を用いた分光データの時間ウィンドウの寸法減少を調節する要因(**pcfac**) - pcfac が小さいほど、より寸法が保持されます。 *ndims = (freqsxIC)/pcfac* は、 *freqs* が推定周波数の数であり、 *ICs* は IC の数です(デフォルトは 7 です)
5. その他のIMAオプション(**pop_runima_studyオプション**) - ICAアルゴリズムを使用する例(詳細は、*pop_runima_study*を参照してください)


**コマンドラインからIMAを起動**

*[STUDY] = pop_runIMA_study(STUDY、ALLEEG、'freqscale'、'log'、'frqlim'、 [6 120]、
                                          'pcfac'、7、
                                          'cycles', [6 0.5],
                                          'selectIC', {'brain'}, 'selectICs', {'brain'}, 'brain'}, 'brain'}, 'brain'}, 'brain'}, 'brain'}, 'brain'}, 'brain'}, 'brain'}, 'brain'}, 'brain'},
                                          'icatype', 'amica';*
                                          
ここでは、STUDYセットに含まれる被写体データに IMA を計算しています。各被写体のデータを別々に IMA 分解します。 周波数分解のパラメータを持つICLabelを使用して脳ICを選択します:ログ周波数スケーリング、周波数制限:6〜120 Hz, ウェーブレットサイクル [6 0.5], pfac 7, tf 分解の時間の窓の寸法を減らし、IMA 分解のための AMICA を使用して


## STUDY環境におけるIMA構造
  
*pop_runIMA_study* は IMA の結果を IMA 構造に保存します。これは、対象の EEG ファイルと関連し、 EEG ファイルと同じフォルダーに保存されます。 
 
対象の IMA ファイルのファイル名が保存されます。
{% raw %}
*STUDY等IMA * 必須
   
     subjfilename: {{1×2 cell}}
     サブjfilepath: {{1×2 cell}}
      imafilename:{'S3_S3_RestECEO.ima'}
      imafilepath:{'/Volumes/ExtremeSSD/IMAT_project/IM/PreSTUDY/S03'}
          件名: {'S3'}
         clustidx: [15×4倍]
         距離: [15×3倍]
     
{% endraw %} 
対象となる IMA ファイルが読み込まれる   

*IMA = ロード([] STUDY.etc.IMA.imafilepath{subjectindex}ファイルep STUDY.etc.IMA.imafilename{subjectindex}], '-mat';*
   

**IMAの構造* * 必須

IMAの構造には次の分野があります:

              wts: [21×21 ダブル]
              sph: [21×21 ダブル]
          Meanpwr: [14×229 ダブル]
          freqvec: [1×229 ダブル]
          timevec: [2430×1 ダブル]
     timevec_cond: {[30×42倍] [30×39倍]}
        freqscale: 「ログ」 お問い合わせ
          freqlim: [6 120]
             npcs: 21の
         コンリスト: [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30]
            レート: 500
          ntrials: [42 39]
       ntw_trials:30
          ウィンサイズ: 0.5000
      epochlength: 6月6日
           eigvec: [2430×21 ダブル]
               PC: [21×3206 ダブル]
         timefreq: [2430×3206 ダブル]
      平均pwrCond: [2×14×229 ダブル]
      timepntCond: {[1×1260 ダブル] [1×1170 ダブル]}
        条件: {'EC' 'EO'}
        STUDYname: RestECEO.study お問い合わせ
    STUDYfilepath: '/ボリューム/IM/PreSTUDY/S03 お問い合わせ
             サブj: {'S3'}
     subjfilename: {'RestEC_S03_ContAMICAdip.set' 'RestEO_S03_ContAMICAdip.set'}
     サブjfilepath: {'/Volumes/IM/PreSTUDY/S03' '/Volumes/IM/PreSTUDY/S03'}
         ファイル名: 'S3_RestECEO.ima お問い合わせ
       前方: [1×1 struct]

この例では、 IMA が 1 つの主題に対して複数の条件(別の EEG.set ファイルで保存)で実行されているため、 IMA ファイルが 2 つの EEG ファイル (同じ主題の 2 つの条件) に関連付けられています。


**IMAの出力の記述:**

*IMA.wts - IMA 分解 wtx 混合行列*  
*IMA.sph - IMA分解の球の混合のマトリックス*  
*IMA.meanpwr -単一ICは力スペクトルを意味します * 必須  
*IMA.timevec - 時刻のベクトル*  
*IMA.freqvec - 周波数のベクトル*  
*IMA.freqscale - 計算されたスペクトル('log' または 'linear')の周波数スケーリング*  
*IMA.freqlim - スペクトル周波数制限*  
*IMA.npcs - IMA が分解する前にデータが削減された寸法の数*  
*IMA.complist - IMAが実行されたコンポーネントのインデックス*  
*IMA.srate - スペクトルを計算するために使用されるEEGデータの元のサンプリングレート*  
*IMA.ntrials - 時間頻度分解を計算するために使用される試験の数*  
*IMA.ntw_trials - トライアルあたりの時間ウィンドウ数*  
*IMA.winsize - 時間頻度分解のspectraを計算するのに使用される窓の長さ*  
*IMA.epochlength - 秒単位で時間の頻度分解を計算するのに使用されるepochの長さ*
*IMA.eigvec - PCのバックプロジェクト時間*  
*IMA.pc - PCのスペクトルのバックプロジェクション*  
*IMA.timefreq - 周波数分解(各ICのスペクトグラム)*  
*IMA.timepntCond - 時間頻度の時間のポイントの総数
                  各条件の分解*  
*IMA.timevec_cond - 完全な長さ(すべての条件)の時間頻度のための時間のベクトル
                   各条件の分解*  
*IMA.meanpwrCond - 各ICおよび各条件のための力スペクトルを意味します*
*IMA.condition - 条件の名前と順序*  
*IMA.STUDYname - IMA decomposition の STUDY のファイル名 *  
*IMA.(島) STUDYfilepath - STUDYのファイルパス IMAの分解が属する*  
*IMA.subj - IMAの分解は*で計算されました  
*IMA.subjfilename - IMAデコンポジションが計算されたEEGデータのファイル名*  
*IMA.subjfilepath - IMAが計算されたEEGデータのファイルパス*  
*IMA.precluster - 収集されたスペクトルのテンプレートと関連するディップソースとスカルプマップを事前に含んだ。 * 必須


## STUDYおよび複数の条件の単一の主題のためのIMATの結果を視覚化して下さい

複数のSTUDY条件の単一の主題のためのIMATの結果を視覚化するための3つの主要なプロット機能があります。 これらの機能は、上記の単一のサブジェクトIMAT視覚化に非常に似ています。

1. 優れたコンポーネント
2. スペクトル封筒
3. タイムコース

**1. 過激なコンポーネント** (*pop_plotspecdecomp_study*)

単一の被験者のためのIM分解を視覚化するために、**STUDY>を起動します。 スタディIMA > Plot IMAの結果 > 過激なコンポーネント**

<img src="./Docs/figs/plotIMdecompSTUDY.png" width="1000"> 
結果のウィンドウ(右)では、次のように指定できます。 

1. あなたがプロットしたいIMが分解する主題のインデックス
2. プロットの種類(ドロップダウンメニューから)   
    - IMモード分解   
    - 重ねられた IC モード  
    - 想定されるIMモード    
3. プロットする周波数範囲(IMAが計算された周波数範囲内にある)
4. ICとIMの指標をプロットする

コマンドラインで:   
*pop_plotspecdecomp_study(STUDY、'plottype'、'comb'、'subject'、'3')*  
*pop_plotspecdecomp_study(STUDY、'plottype'、'ics'、'subject'、'3')*  
*pop_plotspecdecomp_study(STUDY、'plottype'、'ims'、'subject'、'3')*  

プロットの種類は、単一の被写体の視覚化と同じです。詳細については、上記のセクションを参照してください。 

**2. スペクトルエンベロープ** (*pop_plotspecenv_study*)

IMs の貢献を 1 つの主題の進水のための IC の平均ログスペクトルに加える視覚化するため**STUDY > スタディIMA > Plot IMAの結果 > スペクトル封筒* * 必須

<img src="./Docs/figs/envSTUDY.png" width="1000">
結果のウィンドウ(右)では、次のように指定できます。 

1. 対象となるインデックス
2. プロットの種類(ドロップダウンメニューから)   
    - 完全な封筒: IM の分光の影響の第 1 および 99 のパーセントをプロットして下さい
    - 上部の封筒: IM の分光の影響の 99 パーセントをプロット
    - より低い封筒: IM の分光の影響の 1 パーセントをプロットして下さい  
3. プロットする周波数範囲(IMAが計算された周波数範囲内にある)
4. ICとIMの指標をプロットする

関数は各条件のための別のスペクトルのローディングをプロットします。 ここでは、2つの*Eyes_open*と*Eyes_closed*条件を別々にIMの**フルエンベロープ**をプロットする例です。 IC は、ログ出力スペクトラムを黒のトレースとして示します。 アウターライトグレーの限界は、ICログスペクトルの変動の第1と第99パーセントを表します。 ダークグレーの領域は、IMA解析で使用されているPCA-reduced ICスペクトルデータのための1stと99thのパーセンシーを表しています。

コマンドラインで:  
*pop_plotspecenv_study(STUDY、'comps'、[1 2 5]、'factors'、[1 2 3 6]、'frqlim'、[6 120]、'plotcond'、'on'、'subject'、'3');*

<img src="./Docs/figs/envECSTUDY.png" width="500">

<img src="./Docs/figs/envEOSTUDY.png" width="500">


**3. タイムコース** (*pop_plotIMtimecourse_study*)

与えられた主題のためのIMの活発化(時間を渡る強さ)を、進水するために**STUDY> スタディIMA > Plot IMAの結果 > タイムコース**

<img src="./Docs/figs/timecourseSTUDY.png" width="1000">
結果のウィンドウ(右)では、次のように指定できます。 

1. 対象となるインデックス
2. プロットの種類(ドロップダウンメニューから)   
    - ICスペクトグラム   
    - Summed IM プロジェクト  
    - 複合IC-IMスペクトル
    - IMタイムコース    
3. プロットする周波数範囲(IMAが計算された周波数内にある)
4. ICとIMの指標をプロットする

関数は条件間の境界線で黒い縦ラインを写します

**IC スペクトグラム* * 必須   
正規化(メアンログスペクトラム削除) IC スペクトグラムをプロットします。    
コマンドラインで入力: *pop_plotIMtimecourse_study(STUDY, 'comps', [1 2 6], 'frqlim', [6 120], 'plotcond', 'on', 'plotICtf', 'on', 'on', 'on', '3')*
 
<img src="./Docs/figs/ICspectogramSTUDY.png" width="500">


**約束されたIMのバックプロジェクション**  
IMAが計算されたPCA-reducedのnormalized (mean logのスペクトラムは取除かれました) ICのスペクトル。    
コマンドラインで入力: *pop_plotIMtimecourse_study(STUDY, 'comps', [1 2 6], 'frqlim', [6 120], 'plotcond', 'on', 'plotPCtf', 'on', 'on', 'on', 'on', '3')*
     
<img src="./Docs/figs/IMspectogramSTUDY.png" width="500">


**組込みIC-IMスペクトル** 
単一ICのための時間を渡る単一のIMのスペクトル重量のbackprojectionを転がして下さい。
コマンドラインで入力: *pop_plotIMtimecourse_study(STUDY, 'comps', [1 2 6], 'factors', [1], 'frqlim', [6 120], 'plotcond', 'on', 
    'plotIMtf'、'on'、'subject'、'3')*

<img src="./Docs/figs/ICIMspectogramSTUDY.png" width="500">


**IMタイムコース** 
条件間の相違を視覚化するために時間を渡るPlots IMの活発化。  
コマンドラインで入力: *pop_plotIMtimecourse_study(STUDY, 'factors', [1 2 3], 'frqlim', [6 120], 'plotcond', 'on', 'smoothing', 40,
    'plotIMtime'、'on'、'subject'、'3')*

<img src="./Docs/figs/IMtimecourseSTUDY.png" width="500">


## IMスペクトルテンプレートのクラスタリング

被写体(またはセッション)を渡るIMスペクトルテンプレートのクラスタリングには3つの主なステップがあります。
1. プレクラスタ
2. クラスタリング
3. プロットクラスター結果


**精密加工* * 必須  

クラスタリングの前に、関連するスペクトルテンプレートを選択し、関心の周波数範囲でアクティブでないスペクトルテンプレートを無視する必要があります。 クラスタリング用のスペクトルテンプレートを選択するには、**STUDY > STUDY IMA > Cluster IMs > テンプレートを収集* * 必須

<img src="./Docs/figs/Precluster.png" width="1000">
結果のウィンドウ(右)では、次のように指定できます。 

1. **Freqの範囲** 関連する周波数範囲: これは指定された周波数範囲でピークを持っているテンプレートのみを含みます。 空のテンプレート(任意の周波数範囲でアクティブ)を選択すると、低活性化のテンプレートが削除されます。
2. **Warp spectra ** スペクトラが与えられたピーク周波数に警告すべきかどうか:このリニアは、与えられた周波数範囲('Freq. range'によって定義される)でピークする周波数テンプレートを、サブジェクト固有のメディアンテンプレートピーク周波数('Freq. range'で定義されたバンド内)に拡張または縮小します。 定義済みのピーク('Target peak freq' で定義されている)に spectra をストレッチするためにこの関数を使用します。 注意して使用して下さい。 'Freq. range'、例えば、8-13で定義される狭い十分な周波数帯がときだけ推薦される Hz のアルファ、または等。ここでも自然なIMサブクラスター(低アルファ vs 高アルファ)を隠すことができます。         
3. **ターゲットピークfreq** ターゲットピーク周波数は、'stretch_spectra' フラグが 'on' の場合、 'Target peak freq' が空の場合、 'Freq の中央周波数を使用します。 ラインナップ お問い合わせ

コマンドラインで: 
*pop_collecttemplates(STUDY、'peakrange'、[8 12])、
                                    'stretch_spectra', 'on',
                                    'targetpeakfreq'、10、
                                    'plot_templ', 'on');*  
                                    
ここでは、アルファ周波数帯でピークを持っているクラスタリングのためのスペクトルテンプレートを収集 [8 12] Hz は、10 Hz の 'targetpeakfreq' に spectra を warp することを選びます。 収集したテンプレートのプロットを選択します。

収集されたスペクトルテンプレートと関連するディップソースとスカルプマップは、*IMA.precluster*の対象固有のIMAファイルに保存されます。 

     テンプレート: [15×229 ダブル]
     IMICindex: [15×2倍]
    dipsources: [1×15 struct]
     scalpmaps: [15×67×67倍]
       
*IMA.precluster.IMICindex*には、クラスタリング用に収集されたスペクトルテンプレートのインデックスが含まれています。 最初の列は、IM指数、第二列は、これらのIMに関連スペクトルローディングを持っているICのインデックスです。  
       
       
**Cluster IMスペクトルテンプレート** (*pop_clusterIMAtemplates*)

前のステップで収集したIMのスペクトルテンプレートをクラスターするには、**STUDY > を起動します。 STUDY IMA > クラスタ IM > クラスタ メニュー   

<img src="./Docs/figs/IMclustering.png" width="1000">  
結果のウィンドウ(右)では、次のように指定できます。 

1. **方法** 現在k-meansのみが実装されています。
2. **クラスターの数** 計算するクラスターの数          
3. **PC数** クラスタリングのために保持する IM のスペクトルのテンプレートの主な寸法の数
4. **料金制限** 周波数はクラスタリングを制限するために制限します([8 14]のアルファ周波数範囲など) Hz)。 デフォルトはIMAが計算された全周波数範囲です
5. **ダイポールの位置と補完的なクラスタリング** クラスタリングのスペクトルテンプレートマッチングに加えて、IC等分位位置を使用する
6. **重量を制限して下さい** スペクトルのテンプレートとダイポールの場所のクラスタリング時にクラスタリングするためのスペクトルテンプレートに割り当てる重量。 1と20の間の数字は1です。 より大きな数字は、ダイポールの位置と比較して、スペクトルテンプレートにより多くの重量を与えます。
7. **ダイポール重量** 分光テンプレートとダイポールの場所のクラスタリング時にダイポールの位置を割り当てる重量。 1と20の間の数字は1です。 より大きな数字は、スペクトルテンプレートと比較してダイポールの位置により多くの重量を与えます

コマンドラインで: 
*[STUDY] = pop_clusterIMAtemplates(STUDY、ALLEEG、'nclust'、5、'pcs'、10、'freqlim'、[8 14]、'dipole_locs'、'on'、'weightSP'、5、'weightDP'、2);*

ここでは、以前に収集したスペクトルテンプレートを5クラスターに集約し、クラスタリング用の10 IMスペクトルテンプレートのプリンシパル寸法を保持しています。 周波数範囲 8-14 Hz のクラスターを選択します。 また、IC等分岐位置(クラスター化されたIMは周波数テンプレートと脳位置の両方を閉じる必要があります)を含むクラスタリングを実装することを選択します。 ここでは、スペクトルテンプレートの相対的な重み 5 と 2 のダイポールの場所を割り当てます。 

各クラスターの遠心分離機からのIMのスペクトルの型板のクラスターのインデックスそして間隔(組み立てられた集約測定スペースで)は*STUDY.etcで貯えられます。 お問い合わせ 
   
     clustidx: [15×4倍]
     距離: [15×3倍]
     
*STUDY.etc.IMA.clustidx*は4つのコラムを持っています:コラム1は主題のインデックス、コラム2 IMのインデックス、コラム3のICのインデックスおよびコラム4のクラスターのインデックスを与えます-それはimの分光の型板を割り当てました。
*STUDY.etc.IMA.distance*はクラスターとして多くのコラムがあります。 各列には、特定のクラスターのセンテロイドにスペクトルIMテンプレートのeuclidean距離(構築されたクラスタリングスペース内)が含まれています。


**プロットクラスター結果**

クラスターの結果をプロットするには、**STUDY > STUDY IMA > クラスター IM > プロットクラスター**  

<img src="./Docs/figs/PlotClusters2.png" width="1000">  
結果のウィンドウ(右)では、次のように指定できます。 

1. **IMクラスター** プロットするクラスター
2. **Freqの限界**のプロット(lo、こんにちは)へのスペクトルの型板の頻度範囲            
3. **Freqのスケール** スペクトルテンプレートのプロットに使用する周波数スケーリング(線形またはログ)
4. **テンプレート**スペクトラムテンプレートクラスター
5. **Dipoles** スペクトルテンプレートクラスター('on'、'off')のダイポール密度のフラグプロット
6. **スカルプマップ** スペクトルテンプレートクラスター('on'、'off')のスカルプマップのフラグプロット

コマンドラインで:   
*pop_plotIMAcluster(STUDY、'clust'、[1 2 3]、'freqlim'、[6 40]、'freqscale'、'log'、'plottemplates'、'on'、'plotscalpmaps'、'on'、'plotdips'、'on')*


**テンプレート**

<img src="./Docs/figs/Clusterspectra_RestEC.png" width="500">  


**ダイポール* * 必須

<img src="./Docs/figs/Cluster1dipoledensity_RestEC.png" width="500">

<img src="./Docs/figs/Cluster2dipoledensity_RestEC.png" width="500">

<img src="./Docs/figs/Cluster3dipoledensity_RestEC.png" width="500">











