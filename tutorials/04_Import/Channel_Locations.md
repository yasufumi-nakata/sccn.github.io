---
layout: default
title: c. Channel Locations
nav_title: "c. チャネルの場所"
long_title: c. Importing channel locations
parent: 4. Import data
grand_parent: Tutorials
---
チャネルの場所のインポート
===========================
お問い合わせ

EEGのスカルプマップを2Dまたは3Dフォーマットでプロット、または引用
データコンポーネントのソース, ソース, ソース
記録電極のスカルプ位置に関する情報。 あなたも参照することができます  [EEGLAB座標系](../ConceptsGuide/coordinateSystem.md) 必須の定義と概念のためのページ。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>


EEGLAB をロードする
------

選択する <span style="color: brown">ファイル</span> メニュー項目および出版物
<span style="color: brown">既存のデータセットをロードする</span> サブメニュー項目。

![サイトマップ](/assets/images/Pop_loadset.png)

チュートリアルファイル「eeglab_data.set」
EEGLABの「sample_data」のフォルダにあるツールボックス。 *Open*ファイルの開き。

チャンネルの場所を見る
------

このセクションでは、チュートリアルデータセットは使用しません。 その意図は提供することです
チャンネル時にチャンネルの場所を自動的に検索するためのガイドライン
名前は必須です。
の場所 の場所 の場所
ダウンロード ????????????
その後、チャンネル編集ウィンドウを呼び出すと、関数が現れます
385 の定義されたチャンネル・ラベルのデータベースの 10-10 チャネルの場所、ファイル
"functions/supportfiles" サブフォルダ "Standard-10-5-Cap385.sfp"
EEGLAB分布。
ご希望の場合はこのファイルへ。 2021年と同様に、デフォルト
現在位置: 2021年
BESA の球面のファイル。

データセットに含まれるチャネル位置情報をロードまたは編集するには、
選択する <span style="color: brown">編集 → チャネルの場所</span>.
ダイアログボックス(以下に示す)が表示されますので、ご希望の場合は、
輸入された電極に基づく標準的なチャネルの場所を使用するため
デスクトップファイル
延長インターナショナル10-20システム。

![サイトマップ](/assets/images/Editchannelinfo_auto.png)

複数のテンプレートから選ぶことができます。 出演予定者
ソースのローカリゼーション, あなたが第二を選択することを強くお勧め
"BEM Dipfit のモデルのMNI座標関数"(オプション)
「BESA」のコアは、
今、obsolete。 プレス *Ok*。

![](/assets/images/Gui_pop_chanedit2.jpg)

### コマンド・ライン・チャネルの位置は、例を調べる

以下では、チャネルラベルのみを使用してチャネル構造を構築します。
チャンネル登録 MATLABウィンドウで、
タイプ:

```matlab
chanlocs = struct('labels', { 'cz' 'c3' 'c4' 'pz' 'p3' 'p4' 'fz' 'f3' 'f4'});
pop_chanedit( chanlocs );
```

呼び出し <span style="color: brown">編集 → チャネルの場所</span> お問い合わせ *Plot 2-D* チャンネル編集ウィンドウを右折する(*Cancel* )、次の投稿へ進む

![投稿ナビゲーション](/assets/images/Topoplotlookup.gif)

ファイルからチャネルの場所をロードする
------

再オープン <span style="color: brown">編集 → チャネルの場所</span> お問い合わせ を * * * * * * 所在地*ボタンを押します。 現在のデータファイルの場合、デスクトップファイル *eeglab_chan32.locs* など。
(EEGLABの*sample_data*サブディレクトリへ)
分布)。

![サイトマップ](/assets/images/Loadchannellocation.png)

指定しない場合
関数は、
ファイル名拡張子を使用して、その形式を評価します。 ボタンを押します
*ビューするには、メインチャンネルのグラフィックインターフェイスウィンドウでヘルプ*を読み込みます
株式について 次のウィンドウで、Ok*Ok*が開きます。 

![](/assets/images/Chanedit_fileformat_gui.jpg)

下のウィンドウでは、チャンネルフィールドの値でスクロールできます。
*\<* および *→* ボタン、または 10 のステップで *\<\<*> を 1 つずつ
と *\>\>*。

![](/assets/images/Gui_pop_chanedit2.jpg)

*チャンネルタイプ* ボタンの種類* を 設定します。
'EmeG'、'EMG'、'ECG'、
他の EEGLAB の関数は、Centre のクラスで、Centre のクラスでは、Centre のクラスで、Centre のクラスでは、Centre のクラスで、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスでは、Centre のクラスを に分けます。
チャネルタイプをデータに追加する手間はかかります。 それは必須です
ウィンドウ ウィンドウ * *
EEGLABのWindows、*channel Location*は、

チャネルの場所を見る
------

再オープン <span style="color: brown">編集 → チャネルの場所</span> 閉じる 

### 2DのPlotの

* * *
*Read Locations* ボタンの特別2D*。 EEGLABのコメント
選ぶことによって <span style="color: brown">投稿ナビゲーション
お名前 (必須)</span>. 
どちらのコマンドでも、以下のようにウィンドウがポップアップ表示されます。 デフォルト設定をご使用ください。

*注記:
このプロットは、チャンネル番号を参照するために任意のチャンネルラベルをクリックします。

![サイトマップ](/assets/images/Channellocationname.png)

<span style="color: red">警告</span>: 'チャンネルの場所' を 'チャンネルの場所'
*electrode* は、任意の場所から始まる
'参照チャンネル' EEGチャンネル
2つの電極の電圧の違い --
参照チャンネル 交通アクセス
貢献した電極の1つは、チャネルとしてかなり非推奨です
2 の *either* に の に の に の に の に の に の に の に の に の に の に の に の に の に の に の に 等 の に の の に の の に の の に の の に の の に の の に の の の の に の の に の に の の の に の の の に の の に の の の の の の に の の の の に に の の の の の の に の の の の の の の の の の の に に に の の の の の の の の の の の に の の の の の 
または scalp の 利点
 
ヘッド漫画の外側にプロットされた電極は、ミッドヘッドライン(つまり、
ネガティブ z (ja) は、
首页 大会 で で で の 漫画 に の 漫画 に の 漫画 に の に の に の に の に の に の に の に の に の に の に の に の に の の に の に の に の の に の の に の の に の の に の の に の の に の の に の の に の の に の の に の の に の の に の の に の の の の に の の の の の に の の の の の の の に の の の の の の の の の の の に の の の の の の の の の の の 漫画 の の の の の の
Radus* の編集箱。
表示 の の の の 2Dスカルプ
ディスプレイや(場合によっては) EgLabでは、すべてのカルプトポグラフィに合格しました。 

記録されたフィールドに十分見えない場合は、このダイアログ ボックスを 1.0 に設定します。
すべての可能なスカルプチャネルを含むスカルプマップをインターポレートし、表示します
示される(0.5)頭部の下の頭部の部分が付いている場所、
漫画の頭文字の「シャツ」または「ハロ」の領域(more)
どのチャネルの場所がプロットする精密な別の制御はあります
scalp のメッセージ
地図のプロット機能 [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m)).

### なぜ電極は頭の限界の外側にプロットされていますか?
  
ふりがな [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m) 関数はそれらをプロットします
漫画の頭の外側に、
(arc_length = 0.5) ヘッド中心的. によって
デフォルトでは、 arc_lengths \<= 1.0 (頭の最下) を 設定します。
補間に使用され、プロットに示されます。 から
コマンドライン, [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m) ユーザが指定することを可能にします
半径(*intrad**plotrad) および
漫画の半径(*headrad*)。 *ヘッドラッド*
現在、その中身の回り値(0.5)をリベートして、EEGLABグラフィカルに交換する。

2Dでプロットする、SepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepperのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepperのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSepcalのSpcalのSepcalのSpcalのSpcalのSpcalのSpcalのSpcalのSpcalのSepcalのSepcalのSepcalのSepperのSepcalのS
頂点。 これは頭部の側面の電極をそのまま保持します
自分のポジションのトップダウンビューにいるようにまとめました。
この大きな円柱の投影は、下部の位置を広げます
電極。 したがって、上の図では、(トップ)電極がプロットされています
'skirt's's は、 その、その、その、その、その、その
比較的狭い面面に束ねられます。 の組み合わせ
top-down と big-circle のプロジェクション、完全なコンポーネント
プロジェクション(または生データスカルプマップ)は、許可しながら明確に見えます
プロット機能の3D
連続したデータをインポートする

### 3DのPlotの

3D's チャンネル * * ふりがな
画面 画面 で
マウス:

![サイズ:3dlpotxyz.gif](/assets/images/3dlpotxyz.gif)

ロードされたチャンネルラベルと座標が表示されるようになりました
お問い合わせ [チャンネル登録](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanedit.m) ウィンドウ。 チャンネルエディタは、ポーラをカルチェシアンに保つので、球面座標を一貫して保ちます。 ポーラ座標を含むファイルをチャネルラベルに読み込むと、自動的にカテージと球面座標に変換されます。 提供された編集ボックスを使用して手動でチャンネルの場所を変更することができます
各チャンネルの座標に。 ただし、各変更後の変更は必須です。
他の座標形式を更新します。 例えば、更新する場合
1つの異なる極極の座標は、*polar → s. & xyz*
右側のボタン [チャンネル登録](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanedit.m) ウィンドウ (参照)
上) これらの値を他の座標形式に変換します。

サポートされているデータ形式
-------------------------------------

サポートされているデータフォーマットは、ヘルプメッセージに記載されています [住 所 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=readlocs.m) 機能。 サポートされている形式は次のとおりです。

- '.loc', '.locs', '.eloc' ファイル拡張子: EEGLAB 極座標ファイル
- '.ced' ファイル拡張子: ポーラー、カテージ、および球面構成要素EEGLABファイル
- '.sph' 拡張子: MATLABの球面座標
- '.elc' ファイル拡張子: カルティ・シャン EETrak は、EETrak Software の略称です。 
- '.elp' ファイル拡張子: Polhemus-.'elp' Cartesian 座標
- '.elp' 文字列:BESA-'.elp' 球面座標
- '.xyz' ファイル拡張子: MATLAB/EEGLAB(マトラボ) ログイン
- '.asc' と '.dat' は、Neuroscan-.'asc' または '.dat' と '.dat' は、Craft で動作します。
- '.mat' ファイル拡張子: Brainstrom
- '.sfp' ファイル拡張子:BESA/EGI-xyz Cartesian 座標系

お問い合わせ [住 所 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=readlocs.m) チャンネル に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 EEGLAB は、EEGLAB のチャンネルで、EEGLAB は、EEGLAB のチャンネルで、EEGLAB は、EEGLAB のチャンネルで、EEGLAB は、EEGLAB のチャンネルで、EEGLAB は、EEGLAB のチャンネルで、EEGLAB は、EEGLAB のチャンネルで動作します。

-   極座標ファイルから4つのチャネル(ファイル名拡張子付き)
    *.loc*、(ライト・ブルー)ヘッダ・ラインは無料

<table>
<tbody>
<tr>
<td><b>#</b>
</td>
<td><b>お問い合わせ</b>
</td>
<td><b>ラディウス</b>
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
<td>Fp1の特長
</td>
</tr>
<tr>
<td>2
</td>
<td>18
</td>
<td>.352
</td>
<td>Fp2の特長
</td>
</tr>
<tr>
<td>3
</td>
<td>-90
</td>
<td>,181
</td>
<td>C3の特長
</td>
</tr>
<tr>
<td>4
</td>
<td>90
</td>
<td>,181
</td>
<td>C4の</td>
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
<td>Fp1の特長</td>
</tr>
<tr>
<td>2</td>
<td>63.36</td>
<td>72</td>
<td>Fp2の特長</td>
</tr>
<tr>
<td>3</td>
<td>32.58</td>
<td>0</td>
<td>C3の特長</td>
</tr>
<tr>
<td>4</td>
<td>32.58</td>
<td>0</td>
<td>C4の</td>
</tr>
</tbody>
</table>


- カルチェーシア通りは、以下の通りです。

<table>
<tbody>
<tr>
<td><b>#</b>
</td>
<td><b>ツイート</b>
</td>
<td><b>お問い合わせ</b>
</td>
<td><b>ツイート</b>
</td>
<td><b>ラベル</b>
</td>
</tr>
<tr>
<td>1</td>
<td>-0.8355</td>
<td>-0.2192</td>
<td>-0.5039</td>
<td>Fp1の特長</td>
</tr>
<tr>
<td>2</td>
<td>-0.8355</td>
<td>0.2192</td>
<td>0.5039</td>
<td>Fp2の特長</td>
</tr>
<tr>
<td>3</td>
<td>0.3956</td>
<td>0</td>
<td>-0.9184</td>
<td>C3の特長</td>
</tr>
<tr>
<td>4</td>
<td>0.3956</td>
<td>0</td>
<td>0.9184</td>
<td>C4の</td>
</tr>
</tbody>
</table>

チャンネル編集ウィンドウの*Save(その他のタイプ)*ボタン、チャンネル設定ファイルを作成する

### 利用可能なチャンネルの場所ファイル

他のチャンネルでは、次のWebサイトとFTPを編集して追加してください。

-   [私達に送られるサンプル ファイル](ftp://sccn.ucsd.edu/pub/locfiles/)

-   [Neuroscan社ホームページ](http://www.neuro.com/)

-   [EGI チャンネル](ftp://sccn.ucsd.edu/pub/philips_neuro)

-   [容易なキャップの電極の位置](http://www.easycap.de)

-   [容易なキャップの電極の位置](http://www.easycap.de)

-   [BIOSEMIチャンネル](https://sccn.ucsd.edu/eeglab/download/BIOSEMI_cap_coords_all.xls)

特許取得済み3D
------------------------------

このセクションでは、チュートリアルデータセットは使用しません。 提供の意図
カルチェシアンで測定されたチャンネルの位置をインポートするためのガイドライン
3D 機器(Polhemis) を調節します。
EEGLABメニュー <span style="color: brown">編集 → チャンネルの場所</span> またはタイプ
MATLABでは、次のコマンドを実行します。

```matlab
pop_chanedit([]);
```

空のチャンネル編集ウィンドウが表示されます。

![サイトマップ](/assets/images/Editchannelinfo.jpg)

*Read Location*は、*scanned72.dat*のファイルです。
EEGLAB分布の*sample_data*サブフォルダから。
Neuroscan では、Polhemus のシステムで測定されたチャンネルで
ソフトウェア(ゾルタン・マリ)
ドキュメント ファイルが * * * * * * * * * * * * * * * * * * * * * します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します *Plot 2-D*は、
ボタン。 以下のプロットがポップアップ表示されます。

![サイトマップ](/assets/images/Scanlocs1.gif)

測定された3Dチャンネルは、
2Dモデルのモデル
測定値がヘッドセンターにシフトされていない。 これを修正するには
問題は、最初に最も適したヘッド球の中心を見つける必要があります
インポート * * * *
(ヘッドセンターの最適化) 次のウィンドウがポップアップ表示されます。

![サイトマップ](/assets/images/Pop_chancenter.gif)

おそらく、チャンネルの一部はヘッドセンターに含まれるべきではありません
ヘッドや/または録音されていない場合の最適化
場所。 使用するために電極のインデックスを入力します。 (ここでは、 1:3 33 35 64:72) で
編集ウィンドウ。 *Browse*ボタンを押します。
コメントはありません。 *Ok* で
ウィンドウに示すように、チャンネルのインデックスがコピーされます。
それから それから 後
※Plot 2-D*ボタンを入力してください。

![サイトマップ](/assets/images/Scanlocs2.gif)

上記のビューでは、いくつかのチャンネルの場所はまだ間違っています。 お問い合わせ
「Cz」は「Cz」で紹介しています。
こちらのウィンドウでは、
ポップアップ:

![サイトマップ](/assets/images/Forcelocs.gif)

'Cz' を 'Cz' に 'Cz' に 整列 (デフォルト) に 'Cz' を 'Cz' に 'Cz' に 'Cz'
*Plot 2-D*ボタンを右折すると、Plot 2D*ボタンを押します。

![サイトマップ](/assets/images/Scanlocs3.gif)

このセクションでは、適応するために実行したい操作を説明します
測定器 EEGLABの使い方は?????????????

プロットオプションを調整する
--------------------------

多くのプロットオプションがあります [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m))機能。 それらを追加することができます。 
コンテンツ <i>EEG.chaninfo.topoplot(エグシャン)</i> すべての すべての して下さい 第二 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の 内の

```
EEG.saved = 'no';
EEG.chaninfo.topoplot = { 'headrad' 0.68 };
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG); % save data in ALLEEG
```
