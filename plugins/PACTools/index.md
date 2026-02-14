---
layout: default
title: PACTools
nav_title: "パックツール"
long_title: PACTools
parent: Plugins
render_with_liquid: false
nav_order: 19
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/PACTools).

# エッグラボ イベント関連パックツール
イベント関連PACTools(PACTools)は、単一の被験者データにおける相振度結合を計算するEEGLABプラグインです。 
PACを計算するための伝統的な方法に加えて、プラグインには、相互情報フェーズ振幅カップリング方法(MIPAC)の即時およびイベント関連実装(Martinez-Cancino et al 2019参照)が含まれます。
このツールボックスは、UCSD、La Jolla、カリフォルニアのComputational NeurosciencesのSwartz CenterでEEGLABチームによって開発され、現在、主要な開発者であるRamon Martinez-Cancinoによって維持されています。

## コンテンツの表
1. [神経科学における位相差結合](#phase-amplitude-coupling-in-neurosciences)
2. [ツールボックスで実装されたメソッド](#methods-implemented-in-the-toolbox)
   1. [連続信号](#continuous-signal)
   2. [Epoched信号](#epoched-signal)
3. [プラグインアーキテクチャとワークフロー](#plugin-architecture-and-workflow)
	1. [プラグインアーキテクチャ]([#plugin-architecture])
	2. [プラグインの設定](#plug-in-setup)
	3. [グラフィカルなユーザーインターフェイス](#graphical-user-interface)
	   1. [Pop_pacでPACを計算する](#computing-pac-with-pop_pac)
	   2. [Pop_plotpacでPACを可視化](#visualizing-pac-with-pop_plotpac)
	4. [出力の構造](#structure-of-outputs)  
4. [デモ](#demos)
   1. [計算方法ベクトル長さの変調 連続信号のインデックス](#computing-mean-vector-length-modulation-index-in-a-continuous-signal)
      1. [コンピューティング](#computation)
      2. [可視化](#visualization)
   2. [瞬時の計算 連続的な信号のMIPAC](#computing-instantaneous-mipac-in-a-continuous-signal)
      1. [コンピューティング](#computation)
      2. [可視化](#visualization)
5. [貢献とフィードバック](#contributions-and-feedback)

## 神経科学におけるフェーズ振幅のカップリング 
クロス周波数カップリング(CFC)は、振動現象(*Sotero、2016*)の周波数、フェーズ、および振幅の間の任意の可能な相互作用を参照することができます。 この分野のほとんどの実験的な仕事はCFCの3つのタイプに焦点を合わせました:振幅振幅振幅振幅のカップリング(AAC)または調整、バイコヒーレンスを含む位相相カップリング(PPC)、および位相振幅のカップリング(PAC)。 PACは、脳情報処理における潜在的な役割の証拠の増大量と、流行精神(*López-Azcárate et al.、2010;De Hemptinne et al.、2013*)を含む病理学的条件下の変化の有益性を高めました。 PACでは、信号内の高周波数帯域の瞬間広さは、(またはその他のリンク)同じ(または異なる)信号の低周波数帯の瞬間段階によって調整されます。


## Toolboxで実装されたメソッド
 相振幅カップリングの対策の計算に取り組むためにいくつかの方法が提案されていますが、金規格として確立されていません。 この事実は、電気脳データを分析するための主要な学術オープンソースプログラムのほとんどが、その分布(例えば、フィールドトリップ、Brainstorm、MNE)で複数の方法を実行している理由について説明しています。 PACTools で EEGLAB では違いません。 PACToolsでは、最も広く使用されている対策の4つを実施しました。 平均ベクトル長変調指数(MVLmi) (*Canolty et al., 2006*), Kullback-Leibler Modulation Index (KLmi) (*Tort et al., 2010*), Phase-Locking Value (plv) (*Lachaux et al., 1999*), 一般線形モデル変調指数 (GLMmi) (*ペニー ら., 2008a*). これらの実装は、連続およびエポケされた信号で操作できることを確認します。 epoched シグナルの場合、*Voytek et al., 2013* によって提案されたもの(*Penny et al., 2008*)の試験の寸法(レイテンシーによる試験の数に等しい寸法のデータ行列)に類似したスキームを使用します。 これらの対策に加えて、最近、グループが開発した「MIPAC」(*Martinez-Cancino et al., 2019*)の相互情報相振幅カップリング(MIPAC)が含まれています。 この方法は、自然に時間分解されたPACの計算を連続したデータとエッチングデータの両方で行うことができます。

## 連続信号
下表では、連続信号でPACを計算するために実装されたメソッドがリストされています。 特定のメソッドへの参照は、テーブルの2番目の行にリストされています。 PAC値の寸法は、テーブルの3番目の行に示されています。 

| 方法 | 参照 | 出力寸法 お問い合わせ 
| ---------                             | -----------                                                                            | --------------   | 
| 平均ベクトル長変調指数 | [Canolty ら., 2006](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2628289/)          | 単価 |
| クルバックリーザー変調指数 | [トート ら., 2010](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2941206/)             | 単価 |
| 一般リニアモデル変調指数 | [ペニー ら., 2008](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2675174/)            | 単価 |
お問い合わせ フェーズロックバリュー | [Lachaux ら., 1999](https://www.ncbi.nlm.nih.gov/pubmed/10619414)                   | 単価 |
| 瞬間的な相互情報 PAC | [Martinez-Cancino ら., 2019](https://www.ncbi.nlm.nih.gov/pubmed/30342235)          | ユニディカル |


### Epoched信号
下の表では、ツールボックスで実装された現在のメソッドを一覧表示して、epochedデータのPACを推定します。 Epochedデータは通常、関心のあるイベントにタイムロックされた信号のスニペットを抽出する結果です。 ここでは、レイテンシー(タイムポイント)の数のエポック(トライアル)の寸法を持つデータ行列としてフォーマットされていると仮定します。 表にリストされている最初の4つの方法は、前のセクションにリストされたメソッドの自然な拡張ですが、それぞれのレイテンシにエポックの寸法に沿ってそれらを適用します。 このスキームの最初のアプリケーションは、*Penny et al., 2008* によるメソッドの拡張として *Voytek et al., 2013* によって提案されました。 これらのメソッドは、すべての試験で*'average'* PACの動的を記述する時間シリーズを返します。 このタイプのデータでは、イベント関連のMIPACメソッドは、各試験のPACタイムシリーズを返します。

| 方法 | 参照 | 出力寸法 お問い合わせ
| ---------                             | -----------                                                                           | --------------   | 
| 平均ベクトル長変調指数 | [Canolty ら., 2006](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2628289/)         | ユニディカル |
| クルバックリーザー変調指数 | [トート ら., 2010](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2941206/)            | ユニディカル |
| 一般リニアモデル変調指数 | [Voytek ら., 2013](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2675174/)          | ユニディカル |
お問い合わせ フェーズロックバリュー | [Lachaux ら., 1999](https://www.ncbi.nlm.nih.gov/pubmed/10619414)                  | ユニディカル |
| イベント関連情報 PAC | [Martinez-Cancino ら., 2019](https://www.ncbi.nlm.nih.gov/pubmed/30342235)         | 寸法 |


# プラグインアーキテクチャとワークフロー
### プラグインアーキテクチャ
プラグイン PACTools は EEGLAB プラグインとして開発されています。 これを考えると、機能の構造と階層、およびEEGLABとしてのデータフォーマット(.set)に関する同じ哲学を共有します。 PACToolsでは、Matlabの専門知識のレベルに応じて、ユーザーはグラフィックインターフェイス(GUI)とのみやり取りすることができます。また、Matlabのコマンドラインから直接関数を呼び出すか、EEGLAB関数と構造を使用して独自のMatlabスクリプトを書くことができます。 この配列は、PACToolsで使用される2レベルの関数によって実装された階層を定義します。 
 
 PACToolsは、それぞれPACを計算し、視覚化するために実装された2つのトップレベルの機能で構成されています。 pop_pac と pop_plotpac いいえ(または少数)引数(EEGLAB GUI から)で呼び出され、これらの関数はクエリウィンドウをポップアップし、追加のパラメータ選択を収集します。 これらの関数は、Maatlab コマンドラインやMaatlab スクリプトから直接呼び出すこともできます。 
 
関数 pop_pac.m は、ツールボックスのフロントエンドインターフェイスも内部レイヤー関数、eeg\_pac.m にブリッジとして機能します。 関数 eeg\_pac.m は、実際には、PAC 計算のコア関数であり、入力データとオプションの処理と解析を担当し、セクションで説明した PAC メソッドの各計算を担当します。 [Toolboxで実装されたメソッド](#methods-implemented-in-the-toolbox).

**コードアクセラレーション**。 PACの計算は、非常に計算的に集中的なタスクにすることができます。 これは、フェーズと振幅の複数の周波数を扱うときに特に当てはまります。 ワークロードに追加するには、epochedデータ(複数のトライアル)を使用して計算すると、計算がより要求されます。 PACToolのPAC計算を高速化するために、MATLAB Parallel Computing Toolboxを使用してコードを並列化しました。 Neurosciences Gateways (NSG) による高性能コンピューティングへの直接アクセスも行っています。 このオプションを使用することで、NSG の有効なアカウントを持つユーザーは、PACTools 内で直接 NSG でホストされている HPC リソースに PAC 計算を提出できます。 有効な NSG アカウントを持つことに加えて、この新機能を利用するには、EEGLAB プラグインをインストールする必要があります。 [ログイン](https://github.com/sccn/nsgportal)

### プラグインの設定
PACToolsはEEGLABのプラグインです。 したがって、EEGLABプラグインマネージャから直接インストールすることができます(EEGLAB GUIで参照:ファイル -> EEGLAB拡張機能の管理
代替方法は、PACToolsファイルをユーザーのローカルコンピュータにダウンロードすることです。 その後、フォルダを全てのファイルとコピーして、EEGLABフォルダに*./eeglab/plugins/*にあるEEGLABフォルダにコピーし、EEGLABを再起動します。 ツールボックスは、EEGLAB のメニュー *Tools* の下に設置できます(下の図を参照)。

![サイトマップ](https://github.com/user-attachments/assets/2cb685bd-9c6c-4935-aa0c-c39402d928a4)

### グラフィカルなユーザーインターフェイス
現在のバージョンでは、ツールボックスは、コマンドラインコールから実行できるPACを計算し、またはこれらの端のために作成されたグラフィカルなユーザーインターフェイス(GUI)から視覚化するための基本的な機能を提供します。 EEGLAB GUI から *Tools > PAC Tools* から GUI へのアクセスを実行できます。 ここでは、*Estimate PAC* または *Visualize PAC* のオプションを付与します。 

#### Pop_pacでPACを計算する 
EEGLAB GUI から PAC を計算するために GUI を呼び出すには、メニュー *Tools > PAC Tools > PAC* を刺激します。そうしないと、MATLAB コマンドウィンドウから GUI を起動できます。 `EEG = pop_pac(EEG)` (下図参照) ここでは、PACが計算したいEEGセットを既に読み込まれていると仮定します。  

![サイトマップ](https://github.com/user-attachments/assets/9f6c95cf-002c-4895-88ec-a4b25c474dd3)
    
GUI はラベルによって指定された5つの部分に分けられます。 **データ型**, **PACメソッド**, **任意入力**、**Significanceのテスト**および** NSG**の計算。
最初のセクション(**Data type**)では、PAC計算に使用されるデータの種類は、チャネルデータ(*Channels*)またはICA分解データ(*Components*)の間で選択できます。 
以下では、**Phase data** と**Amplitude data** に関連するオプションを入力するフィールドを使用して、データストリームと周波数帯のプロパティを定義できます。 例えば、 最初の列では、**Dataタイプ**メニューで設定された選択に応じて、ユーザーは現在のチャンネルまたはコンポーネントのリストからPACを計算するためにチャンネルまたはコンポーネントを選択することができます**Select Comp/chan**。 ここでは、PACの計算は、**Phase data**と**Amplitude data**メニューから選択されたチャンネル/コンポーネントのペアによって行われます。そのため、両方のフィールドでチャネル/コンポーネントの同じ数を選択する必要があります。

2番目の列(**Freq範囲[lo hi](Hz)**)では、インスタンスのフェーズと振幅を計算するための周波数(Hz)の範囲を定義できます。 これらの範囲の周波数の数は、4列(**# Frequencies**)で定義できます。 2つのチェックボックスは、チェック時に周波数スケール、*logarithmic*を設定し、チェックを外すと*linear*が最後の列に見つけることができます。 デフォルトではログスケーリングが設定されています。 現在、周波数値のスケーリングは、フェーズと振幅値の両方(チェックボックス選択はリンクされます)に適用されます。

次の2つのセクションでは、PACメソッド(**PACメソッド**)の選択と**オプションの入力でポップアップ_pacオプションパラメータの入力を可能にします。 po_pac オプションのパラメーターをリストするには、左下のボタンで pop_pac.m のヘルプを参照します**Help**。

以下のセクションでは、PAC統計(**Significance Testing**)の計算の設定を構成しています。 ここでは、代理者(**# surrogates**)、代理者(**# data block**)を生成するためのデータをシャッフルするために使用するブロックの数、重要な閾値(**Significance threshold(0<p<1)**)、および複数の比較補正(**Correct for MultipleCompars**)を設定できます。 
 
ラベル「**Compute on NSG**」で指定されている「POP_pac GUI」の最後のセクションでは、Neurosciences Gateway を通じて PAC の計算を有効にし、設定するために、チェックボックスで有効になっています。 次のセクションでこの機能を拡大します。

最後に、ヘルプ文書(button:**Help**)を起動するために指定されたGUIの下部にある3つのボタンが配置され、追加のアクションなしでGUIの実行をキャンセル(button:**Cancel**)し、提供される設定(button:**OK**)でPACの計算の実行を開始します。

#### Pop_plotpacでPACを可視化
 PACが*pop_pac.m*を使用して計算されると、結果はEEG構造に格納されます(次のセクションの詳細は参照)。 結果の可視化は、コマンドラインから関数 *pop_plotpac* を呼び出して実行できます。`pop_plotpac(EEG)`) または EEGLAB メニューから *ツール > PAC ツール > PAC*を視覚化(下図参照)。  

![サイトマップ](https://github.com/user-attachments/assets/7d340eed-d694-4dec-a8f2-2abc8a93a3ed)
  
poc_pacplot の GUI は 4 つの主要なセクション (上の図で記述) で構成されます。
セクションA: このセクションでは、ユーザーは、現在のEEGセットに格納されているPACの計算に使用されるパラメータの迅速な一目を得ることができます。
セクションB: PACが計算されたすべてのチャネル/コンポーネントのペアを表示します。 ペアの最初の要素は、インスタンスのフェーズを計算するために使用されるストリームに相当します。2番目の要素はインスタンスの振幅に使用するものに対応しています。

セクションC: ここでは、選択したデータストリームペアでPACを計算するために使用されるメソッドが表示されます。 ユーザーは、プロットしたい測定を選択する必要があります。 チェックボックスは、以前に計算された(現在はコモーダログラムでのみ利用可能)場合、PAC以上の重要なマスクのプロットを有効にします。

セクションD:PACの結果は、このセクションからプロットすることができます。 インターフェイスの右側にある4つのボタンは、ポップアップから生成できる4種類のプロットに対応しています。 これらは:
 (1)* プロットのコモーダック*: Plot PACは、フェーズと振幅の周波数の機能として値します。 すべての方法およびデータ フォーマットのために利用できる。
(2)* プロットの一時的なコモードグラム*: Plot PAC は、フェーズの周波数、振幅の周波数およびレイテンシー(時間)の機能として値します。 このプロットは、即時MIPACが計算されている場合、連続的なデータのために利用可能です。 イベント関連のepochedデータでは、実装されたすべてのメソッドでこのプロットが利用できます。
(3)* Plot freq-time PAC*: Plot PAC は、相周波数(または振幅周波数)とレイテンシー(時間)の機能として値します。 このプロットは、即時MIPACが計算されている場合、連続的なデータのために利用可能です。 イベント関連のepochedデータでは、実装されたすべてのメソッドでこのプロットが利用できます。
(4)* Plot トライアルベース PAC*: PLot PAC は、各試験の値を時間関数として値します。 Event-Related MIPAC を使用した PAC の計算のみが有効です。

以前はPACを計算し、計算された方法の選択に基づいて、プロットボタンは自動的に有効/無効にします。 各プロットボタンの右側に、ユーザーは、左側の各プロットに固有の周波数とレイテンシ範囲などのパラメータを定義できます。

### 出力の構造
PAC が pop\_pac.m で計算されると、計算の結果はフィールド *EEG.etc.pac.eegpac* 構造に格納されます。 下のコードサンプルでは、一般的なリニアモデル(*glm*)、即時MIPAC(*instmipac*)、Kullback-Leibler Modulation Index(*klmi*)、Meanvector length Modulation Index(*mvlmi*)の2つのチャネルで計算されたPAC値を保存する一般的な構造を示しています。
 
```matlab
>> EEG.etc.eegpac

  1×2 struct array with fields:

    dataindx
    datatype
    labels
    params
    cache
    glm
    instmipac
    klmi
    mvlmi

```
組込みの1つに対応する構造の1つに潜入すると、PAC計算に関する詳細情報がわかります。

```matlab
>> EEG.etc.eegpac(1)

  struct with fields:

     dataindx: [1 1]
     datatype: 1
       labels: {'Chan1-Chan1'}
       params: [1×1 struct]
        cache: [1×1 struct]
          glm: [1×1 struct]
    instmipac: [1×1 struct]
         klmi: [1×1 struct]
        mvlmi: [1×1 struct]
```

ここで最後の4つのフィールドは、測定が計算されていることを示しています。 これらのフィールドは、計算に使用するメソッドに与えられた短い名前を取ります。 練習では、このようなPAC対策として多くの分野が分かち合います。 これらのフィールドは、一般的に、PAC値、出力の寸法を保存し、計算されたメソッド固有の結果を表示します。 フィールド *dataindx* には、それぞれ PAC を計算するために、フェーズと振幅を抽出するために使用されるコンポーネントまたはチャネルのインデックスが含まれています。 これらのデータストリームのラベルはフィールド*label*に保存されます。 フィールド *datatype* は、PAC、ICA が分解した(0)、またはチャンネルデータ(1)を計算するために使用されるデータの種類を示します。 
相周波数(*freqs_phase*)と振幅周波数(*freqs_amp*)がフィールド*params*に格納されているすべてのメソッドに共通するパラメータのセット。 以下は、上記の同じ*EEG.ect.eegpac*構造からのサンプルパラメータ構造を示しています。
 
```matlab
>> >> EEG.etc.eegpac(1).params

  struct with fields:

    freqs_phase: [4 4.6328 5.3657 6.2145 7.1976 8.3362 9.6549 11.1822 12.9512 15]
      freqs_amp: [30.0000 31.9625 34.0535 36.2812 38.6546 41.1833 43.8774 46.7478 49.8059 53.0641 56.5354 60.2338 64.1742 68.3723 72.8451 77.6105 82.6876 88.0968 93.8599 100.0000]
         signif: [1×1 struct]
          srate: 500
```
         
最後に、フィールド *cache* は、現在の PAC 計算に使用するシリアライズされた(エンコード) パラメータを保存します。 このフィールドは、新しい計算で提供されるパラメータと高速な比較を可能にし、ユーザーがRecomputeを防止し、すでにPAC測定を計算することができます。
#### 方法固有のフィールド
(進行中の作業)

## デモデモ
### 瞬時の計算 連続信号におけるMIPACとMVLMI

#### コンピューティング

このデモでは、*pop_pac* GUI とコマンドライン呼び出しを使用して PAC を計算する方法を示します。 そのためには、まず、ツールボックス、*Simpac\_famp\_60\_fphs\_8.set*、EEGLABにサンプルデータセットをロードします。 データセットは、EEGLAB GUI またはコマンドウィンドウから次のコードを使用してロードできます。 

```matlab
EEG = pop_loadset('filename','Simpac_famp_60_fphs_8.set');
eeglab redraw; 
```

Note: このサンプルコードでは、現在のディレクトリがツールボックスを含むフォルダであることを想定しています。

このデータセットは、信号の2つのセグメント(下の図を参照)の間に、60Hzの即時フェーズと60Hzの瞬時の振幅が相まって、シミュレートされたPAC信号が含まれています。

![サイトマップ](https://github.com/user-attachments/assets/253d0a6c-620e-4328-b8d1-ea7e0637f7e1)

データセットをロードした後、PACToolsとPACToolsを*pop_pac* GUIで計算します。 GUI を起動するには、*Tools > PAC Tools > EEGLAB GUI で PAC* を推定します。 代わりに、あなたは使用することができます `EEG = pop_pac(EEG)` MATLABコマンドウィンドウから。 ここでは、範囲内の10相周波数間の平均ベクトル長さ変調インデックスメソッド(*mvlmi*)を使用してPACを計算します [4 15]Hz および範囲内の20の振幅周波数 [30 100]Hz. この計算を実行するには、以下の図に示すように*pop_pac* GUIを設定し、**Ok**をクリックします。

![サイトマップ](https://github.com/user-attachments/assets/f2dbe558-8096-4062-b828-67e5f8b8a6c8)

この計算を実行するための同等のコマンドライン呼び出しは、コマンドで再処理できます `eegh`お問い合わせ この場合、最後のエントリで返します。

`EEG = pop_pac(EEG,'Channels',[4  15],[30  90],[1 2],[1 2],'method','mvlmi','nboot',200,'alpha',[],'nfreqs1',10,'nfreqs2',20,'freqscale','log','bonfcorr',0);`

追加の測定と同じ設定で PAC を計算するには、以前の計算に使用するパラメータの同じセットを設定した後、*pop_pac* GUI を再び呼び出して、新しいメソッドを選択します。 上記のセクションの仕様に従って、新しい計算からの結果はEEG構造で保存されます。 ユーザーが前の計算から保存されたものから異なるパラメータを設定した場合、 *pop_pac* 古い計算を削除し、新しいものを続行します。 この例では、上記のパラメータを使用してPACを計算しますが、Instantaneous MIPAC(*instmipac*):

`EEG = pop_pac(EEG,'Channels',[4  15],[30  90],[1 2],[1 2],'method','instmipac','nboot',200,'alpha',[],'nfreqs1',10,'nfreqs2',20,'freqscale','log','bonfcorr',0);`

結果へのクイックルックは、結果の次の構造をもたらす:

```matlab
>> EEG.etc.eegpac(1)

  struct with fields:

     dataindx: [1 1]
     datatype: 1
       labels: {'Chan1-Chan1'}
       params: [1×1 struct]
        cache: [1×1 struct]
    instmipac: [1×1 struct]
        mvlmi: [1×1 struct]
```

そして、 

```matlab
>> EEG.etc.eegpac(1)

  struct with fields:

     dataindx: [2 2]
     datatype: 1
       labels: {'Chan2-Chan2'}
       params: [1×1 struct]
        cache: [1×1 struct]
    instmipac: [1×1 struct]
        mvlmi: [1×1 struct]
```

#### 可視化
以前に計算した PAC 値を視覚化するには、 *pop_plotpac* GUI を使用します( *Tools > PAC Tools > PAC* を視覚化)。 *pop_plotpac* GUI では、チャンネルのペアと視覚化のための測定を選択し、GUI のセクション D で有効なプロットを使用して PAC 結果をプロットします。 以下の図は、この測定のために利用可能なプロットオプションのそれぞれからInstantaneous MIPAC(*instmipac*)のために生成されたプロットを示しています。 *Comodulogram*、*Temporal comodulogram*および*Freq.-time PAC*。 ここではデフォルトのプロットオプションを使用しますが、ユーザーは異なるプロットパラメータオプションが視覚化をどのように変更するかを調べることをお勧めします。

![サイトマップ](https://github.com/user-attachments/assets/ed4dd87d-9d9f-4c26-ada4-41be78a910f0)

### 貢献とフィードバック
定番開発に関するオープンソースプロジェクトです。 投稿者への連絡は、nuruuscub@gmail.comまでお願いします。 問題トラッカーの使用は推奨されます。 
