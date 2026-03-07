---
layout: default
title: c. Channel Locations
nav_title: "c. チャネル位置"
long_title: c. Importing channel locations
parent: 4. Import data
grand_parent: Tutorials
---
チャネルの場所のインポート
===========================

EEGのスカルプマップを2Dまたは3Dフォーマットでプロットしたり、データコンポーネントのソース位置を推定するには、EEGLABデータセットに記録電極のスカルプ位置に関する情報が含まれている必要があります。[EEGLAB座標系](../ConceptsGuide/coordinateSystem.html) のページも参照してください。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>


EEGLAB をロードする
------

<span style="color: brown">ファイル</span> メニューを選択し、
<span style="color: brown">既存のデータセットをロードする</span> サブメニュー項目を選択します。

![こちら](/assets/images/Pop_loadset.png)

チュートリアルファイル「eeglab_data.set」
EEGLABの「sample_data」フォルダにあります。*Open*を押してファイルを開きます。

チャンネルの場所を見る
------

このセクションでは、チュートリアルデータセットは使用しません。ここでは、チャンネル名が標準的な10-20システムのラベルである場合に、チャンネルの場所を自動的に検索するためのガイドラインを提供します。
チャンネル編集ウィンドウを呼び出すと、関数はEEGLABの「functions/supportfiles」サブフォルダにある「Standard-10-5-Cap385.sfp」ファイルに含まれる385の定義済みチャンネルラベルのデータベースから10-10チャネルの場所を検索します。
必要に応じてこのファイルを編集できます。EEGLAB 2021以降、デフォルトのチャネル位置ファイルはBESAの球面座標ファイルに代わり、MNI座標に基づくファイルを使用しています。

データセットに含まれるチャネル位置情報をロードまたは編集するには、
選択する <span style="color: brown">編集 → チャネルの場所</span>.
ダイアログボックス（以下に示す）が表示され、チャネルラベルに基づいて拡張国際10-20システムの標準的なチャネル位置を自動的に検索するかどうかを選択できます。

![こちら](/assets/images/Editchannelinfo_auto.png)

複数のテンプレートから選ぶことができます。ソースローカリゼーションを行う場合は、2番目のオプション「BEM Dipfit モデルのMNI座標」を選択することを強くお勧めします（「BESA」オプションは現在非推奨です）。*Ok* を押します。

![](/assets/images/Gui_pop_chanedit2.jpg)

### コマンド・ライン・チャネルの位置は、例を調べる

以下では、チャネルラベルのみを使用してチャネル構造を構築します。
MATLABコマンドウィンドウで以下を入力します:

```matlab
chanlocs = struct('labels', { 'cz' 'c3' 'c4' 'pz' 'p3' 'p4' 'fz' 'f3' 'f4'});
pop_chanedit( chanlocs );
```

呼び出し <span style="color: brown">編集 → チャネルの場所</span> から *Plot 2-D* ボタンを押して（チャンネル編集ウィンドウは *Cancel* で閉じます）、以下のプロットが表示されます

![投稿ナビゲーション](/assets/images/Topoplotlookup.gif)

ファイルからチャネルの場所をロードする
------

再オープン <span style="color: brown">編集 → チャネルの場所</span> から *Read Locations* ボタンを押します。チュートリアルデータの場合、*eeglab_chan32.locs* ファイルを選択します（EEGLABの *sample_data* サブディレクトリにあります）。

![こちら](/assets/images/Loadchannellocation.png)

ファイル形式を指定しない場合、関数はファイル名拡張子を使用して形式を判定します。*Read help* ボタンを押すと、サポートされているファイル形式の一覧を確認できます。*Ok* を押してウィンドウを閉じます。

![](/assets/images/Chanedit_fileformat_gui.jpg)

下のウィンドウでは、*\<* および *\>* ボタンで1つずつ、または *\<\<* と *\>\>* で10ステップずつチャンネルフィールドの値をスクロールできます。

![](/assets/images/Gui_pop_chanedit2.jpg)

*チャンネルタイプ* ボタンでチャネルタイプ（'EEG'、'EMG'、'ECG' など）を設定できます。他のEEGLABの関数は、チャネルタイプ情報を使用してEEGチャネルと他のチャネルタイプを区別します。チャネルタイプをデータに追加することは推奨されます。

チャネルの場所を見る
------

再オープン <span style="color: brown">編集 → チャネルの場所</span> を選択します。

### 2Dプロット

チャンネル編集ウィンドウの *Plot 2-D* ボタンを押します。EEGLABメニューから <span style="color: brown">プロット → チャネルの場所 → 名前で</span> を選択しても同様です。どちらのコマンドでも、以下のようにウィンドウがポップアップ表示されます。デフォルト設定をご使用ください。

*注記:* このプロットでは、任意のチャンネルラベルをクリックするとそのチャンネル番号が表示されます。

![こちら](/assets/images/Channellocationname.png)

<span style="color: red">警告</span>: 「チャンネルの場所」は「電極の場所」と同義ではありません。各EEGチャンネルは2つの電極間の電圧差を記録するため、参照電極もデータに寄与しています。したがって、チャンネルは2つの電極位置の*いずれか*に配置されるか、頭皮上の任意のポイントとして表現される可能性があります。

ヘッド漫画の外側にプロットされた電極は、ミッドヘッドライン（すなわち負のz座標）より下にある電極です。*plotrad* の編集ボックスで値を変更することで、2Dスカルプマップの表示範囲を調整できます。EEGLABでは、すべてのスカルプトポグラフィに適用されます。

記録フィールドが十分に表示されない場合は、この値を1.0に設定すると、すべてのスカルプチャネルの場所を含むスカルプマップが補間・表示されます。デフォルト値（0.5）では頭部の下半分が含まれ、頭部漫画の「スカート」または「ハロー」領域として表示されます。より精密な制御については、スカルプマッププロット関数 [topoplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m) を参照してください。

### なぜ電極は頭の限界の外側にプロットされていますか?
  
[topoplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m) 関数は、ヘッド中心からの弧の長さ（arc_length）が0.5を超える電極を頭部漫画の外側にプロットします。デフォルトでは、arc_length \<= 1.0（頭の最下部）の電極が補間に使用され、プロットに表示されます。コマンドラインでは、[topoplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m) で補間半径（*intrad*）、プロット半径（*plotrad*）、および頭部漫画の半径（*headrad*）を指定できます。*headrad* のデフォルト値は0.5です。

2Dでプロットする場合、球面投影法を使用して電極位置を頂点から投影します。これは頭部の側面の電極をそのままの位置関係で保持し、トップダウンビューにまとめます。
この投影法は下部の電極の位置を広げます。したがって、上の図で「スカート」領域にプロットされている電極は、実際にはスカルプ上では比較的狭い領域に集まっています。このトップダウン投影では、完全なコンポーネントマップ（または生データスカルプマップ）を明確に表示しつつ、すべての電極位置を確認できます。

### 3Dプロット

*Plot 3-D* ボタンを押すと、3Dでチャネルの場所が表示されます。マウスで画面を回転できます:

![サイズ:3dlpotxyz.gif](/assets/images/3dlpotxyz.gif)

ロードされたチャンネルラベルと座標が [pop_chanedit.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanedit.m) ウィンドウに表示されます。チャンネルエディタは極座標、Cartesian座標、球面座標を一貫して保持します。極座標を含むファイルを読み込むと、自動的にCartesianおよび球面座標に変換されます。編集ボックスを使用して手動でチャンネルの座標を変更することもできます。ただし、変更後は他の座標形式も更新する必要があります。例えば、極座標を変更した場合は、右側の *polar → s. & xyz* 変換ボタン（[pop_chanedit.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanedit.m) ウィンドウ参照）を押して、他の座標形式に変換してください。

サポートされているデータ形式
-------------------------------------

サポートされているデータフォーマットは、[readlocs.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=readlocs.m) 関数のヘルプメッセージに記載されています。サポートされている形式は次のとおりです。

- '.loc', '.locs', '.eloc' ファイル拡張子: EEGLAB 極座標ファイル
- '.ced' ファイル拡張子: 極座標、Cartesian座標、球面座標を含むEEGLABファイル
- '.sph' 拡張子: MATLABの球面座標
- '.elc' ファイル拡張子: EETrak Cartesian座標
- '.elp' ファイル拡張子: Polhemus-.'elp' Cartesian 座標
- '.elp' 文字列:BESA-'.elp' 球面座標
- '.xyz' ファイル拡張子: MATLAB/EEGLAB Cartesian座標
- '.asc' と '.dat' ファイル拡張子: Neuroscan座標
- '.mat' ファイル拡張子: Brainstrom
- '.sfp' ファイル拡張子:BESA/EGI-xyz Cartesian 座標系

[readlocs.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=readlocs.m) 関数は、任意のファイル形式からチャンネルの場所を読み込むことができます。EEGLABは様々なチャネル位置形式に対応しています。

-   極座標ファイル（ファイル拡張子 *.loc*）の4チャネルの例（ヘッダー行なし）:

<table>
<tbody>
<tr>
<td><b>#</b>
</td>
<td><b>角度</b>
</td>
<td><b>半径</b>
</td>
<td><b>ラベル</b>
</td>
</tr>
<tr>
<td>1
</td>
<td>-18
</td>
<td>,352
</td>
<td>Fp1
</td>
</tr>
<tr>
<td>2
</td>
<td>18
</td>
<td>.352
</td>
<td>Fp2
</td>
</tr>
<tr>
<td>3
</td>
<td>-90
</td>
<td>,181
</td>
<td>C3
</td>
</tr>
<tr>
<td>4
</td>
<td>90
</td>
<td>,181
</td>
<td>C4</td>
</tr>
</tbody>
</table>


- .sph* , 球面座標系ファイル:

<table>
<tbody>
<tr>
<td><b>#</b></td>
<td><b>アジミュート</b></td>
<td><b>ホライズ.</b></td>
<td><b>ラベル</b></td>
</tr>
<tr>
<td>1</td>
<td>-63.36</td>
<td>-72</td>
<td>Fp1</td>
</tr>
<tr>
<td>2</td>
<td>63.36</td>
<td>72</td>
<td>Fp2</td>
</tr>
<tr>
<td>3</td>
<td>32.58</td>
<td>0</td>
<td>C3</td>
</tr>
<tr>
<td>4</td>
<td>32.58</td>
<td>0</td>
<td>C4</td>
</tr>
</tbody>
</table>


- Cartesian座標ファイルの例は以下の通りです。

<table>
<tbody>
<tr>
<td><b>#</b>
</td>
<td><b>X</b>
</td>
<td><b>Y</b>
</td>
<td><b>Z</b>
</td>
<td><b>ラベル</b>
</td>
</tr>
<tr>
<td>1</td>
<td>-0.8355</td>
<td>-0.2192</td>
<td>-0.5039</td>
<td>Fp1</td>
</tr>
<tr>
<td>2</td>
<td>-0.8355</td>
<td>0.2192</td>
<td>0.5039</td>
<td>Fp2</td>
</tr>
<tr>
<td>3</td>
<td>0.3956</td>
<td>0</td>
<td>-0.9184</td>
<td>C3</td>
</tr>
<tr>
<td>4</td>
<td>0.3956</td>
<td>0</td>
<td>0.9184</td>
<td>C4</td>
</tr>
</tbody>
</table>

チャンネル編集ウィンドウの *Save (as .xyz etc.)* ボタンで、チャネル位置を他の形式で保存できます。

### 利用可能なチャンネルの場所ファイル

その他のチャンネル位置ファイルは、以下のWebサイトから入手できます。

-   [サンプルファイル](ftp://sccn.ucsd.edu/pub/locfiles/)

-   [Neuroscan社ホームページ](http://www.neuro.com/)

-   [EGI チャンネル](ftp://sccn.ucsd.edu/pub/philips_neuro)

-   [EasyCap電極位置](http://www.easycap.de)

-   [BIOSEMIチャンネル](https://sccn.ucsd.edu/eeglab/download/BIOSEMI_cap_coords_all.xls)

測定された3Dチャネル位置のインポート
------------------------------

このセクションでは、チュートリアルデータセットは使用しません。3Dデジタイザ（Polhemusなど）で測定されたCartesian座標のチャンネル位置をインポートするためのガイドラインを提供します。
EEGLABメニュー <span style="color: brown">編集 → チャンネルの場所</span> またはタイプ
MATLABでは、次のコマンドを実行します。

```matlab
pop_chanedit([]);
```

空のチャンネル編集ウィンドウが表示されます。

![こちら](/assets/images/Editchannelinfo.jpg)

*Read Locations* ボタンを押して、EEGLABの *sample_data* サブフォルダから *scanned72.dat* ファイルを読み込みます。これはNeuroscanソフトウェアを使用してPolhemusシステムで測定されたチャンネル位置です（Zoltan Mariによる提供）。ファイルが読み込まれたら、*Plot 2-D* ボタンを押します。以下のプロットがポップアップ表示されます。

![こちら](/assets/images/Scanlocs1.gif)

測定された3Dチャンネル位置が2Dプロットで正しく表示されないのは、測定値がヘッドセンターにシフトされていないためです。これを修正するには、最も適したヘッド球の中心を見つける必要があります。
*Opt. head center*（ヘッドセンターの最適化）ボタンを押します。次のウィンドウがポップアップ表示されます。

![こちら](/assets/images/Pop_chancenter.gif)

おそらく、一部のチャンネルはヘッドセンターの最適化に含めるべきではありません（頭皮上にない電極や、記録位置が不明な電極など）。除外する電極のインデックスを編集ウィンドウに入力します（ここでは 1:3 33 35 64:72）。*Browse*ボタンを押してチャンネルを選択することもできます。
*Ok* を押すと、ウィンドウに示すようにチャンネルのインデックスがコピーされます。その後、*Plot 2-D* ボタンを押してください。

![こちら](/assets/images/Scanlocs2.gif)

上記のビューでは、いくつかのチャンネルの場所はまだ間違っています。*Force to sphere* ボタンを押して、「Cz」電極を頭頂部に整列させます。次のウィンドウがポップアップ表示されます:

![こちら](/assets/images/Forcelocs.gif)

「Cz」をデフォルトの位置に整列させ、*Plot 2-D* ボタンを押します。

![こちら](/assets/images/Scanlocs3.gif)

このセクションでは、測定された電極位置をEEGLABで使用するために実行する操作を説明しました。

プロットオプションを調整する
--------------------------

[topoplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m) 関数には多くのプロットオプションがあります。
<i>EEG.chaninfo.topoplot</i> にオプションを設定すると、EEGLABのすべての2Dスカルプマッププロットに適用されます。例:

```
EEG.saved = 'no';
EEG.chaninfo.topoplot = { 'headrad' 0.68 };
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG); % save data in ALLEEG
```
