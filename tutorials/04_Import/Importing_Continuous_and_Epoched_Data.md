---
layout: default
title: a. Continuous data
long_title: a. Continuous data
parent: 4. Import data
grand_parent: Tutorials
---
連続したデータをインポートする
=======
お問い合わせ

参照して下さい [クイックスタートガイド](/tutorials/02_Quickstart/quickstart.html) EEGデータファイルを読み込み、データをスクロールします。 チュートリアルのこのセクションでは、EEGLABプラグインでのみ利用可能な原材料のファイルを異なるフォーマットでインポートすることに対処します。 

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

連続した生データファイルを簡単にインポートする4つのステップ
------------------

まず、元の EEG のデータファイルがある場合、ファイルの形式を決定します(拡張子 .cnt のファイルについては、Neuroscan または ANT の生ファイルであり、2 つの異なるフォーマットです)。 その後、次の4つのステップに従ってください。
1. メニュー項目が利用可能かどうかを調べる <span style="color: brown">ファイル → EEGLAB関数とプラグインの使用</span>お問い合わせ メニューを選択し、ファイルをインポートします。

2. メニュー項目を使用する <span style="color: brown">ファイル → ファイル IO インターフェイスの使用</span>お問い合わせ EEGLABは、既にインストールされていない場合は、File-IOプラグインをインストールすることがあります。 関数がエラーを返さないと、ファイルがインポートされます。 File-IOは、さまざまなデータフォーマットをインポートするFieldTripモジュールです。 参照して下さい [ファイルIO文書](https://www.fieldtriptoolbox.org/development/module/fileio/) 詳細については、. 

3. メニュー項目を使用する <span style="color: brown">ファイル → BIOSIG インターフェイスの使用</span>お問い合わせ バイオシグツールボックス (Biosig Toolbox)[バイオシグ.sf.net](http://biosig.sf.net)) 含まれる
MATLABの他のEEGデータフォーマットを読む機能へのリンク。 EEGLABは既にインストールされていない場合は、BIOSIGプラグインをインストールすることがあります。 関数がエラーを返さないと、ファイルがインポートされます。

4. メニュー項目を使用する <span style="color: brown">ファイル → EEGLAB 拡張機能の管理</span> プラグインの検索(右上のマニファイアを使用する)。 使用しているアンプの名前を例に使用します。 プラグインをインストールしたら、新しく作成したサブメニュー項目を呼び出します。 <span style="color: brown">ファイル → EEGLAB関数とプラグインの使用</span>.

90%の場合、上記のソリューションはEEGデータファイルをインポートします。 動作しない場合は、このページの残りの部分には、他のファイル形式をインポートするためのドキュメントが含まれています。

EEGLAB内のEEGデータを取得
--------------------

EEGLAB と LabStreamingLayer (LSL) は、UCSD の SCCN ラボで発起点したと密接に結び付けられます。 インストールすることで [*lsl_app_MATLABビューア*](https://github.com/labstreaminglayer/App-MATLABViewer/) 拡張子、メニュー項目 <span style="color: brown">ファイル → MATLAB LSL ビューア</span>EEG LSL ストリームをネットワーク (Mac と Windows) で可視化するだけでなく、EEGLAB .set データファイルとして録画することもできます。 この拡張子は、一度に1回のストリームを記録できるだけに注意してください。 ストリームをヒューズするには、LabRecorder python アプリケーションを使用して XDF としてデータを記録し、Mobilab プラグインを使用して EEGLAB ファイルに XDF ファイルをインポートします。

サポートされているデータフォーマットのリスト
--------------------

ふりがな [プラグイン](https://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php) ページには、すべてのインポートプラグインが含まれています。 特定のファイル拡張子またはアンプ名を検索します。 プラグインの同じリストは、EEGLABプラグインマネージャを介して利用可能です。 <span style="color: brown">ファイル → EEGLAB 拡張機能の管理</span> メニュー項目。 プラグインに問題が発生した場合は、プラグインの作者に連絡することをお勧めします。 プラグインには、独自のドキュメントもあります。

EEGLABプラグインマネージャでは珍しいEEGLABプラグインが利用できず、代わりにアンプメーカーのzipファイルとして配布される場合があります。 データフォーマットのプラグインが見つからない場合は、EEGアンプメーカーにお問い合わせください。

データインポートプラグインとカスタムインポート
--------------------

### BIOSIGのコマンドラインmexSloadを使用してデータをインポートする

BIOSIG は、データをインポートするための C 関数を分離しています。 これらの関数は、*mexSload* 関数を介してMATLABでインターフェイスできます。 その機能のグラフィックインターフェイスはありません。 ただし、*mexSload* 関数を使用して、MATLAB コマンドラインでデータをインポートし、次のセクションで MATLAB 配列を EEGLAB にインポートします。

### MATLAB配列のインポート

EEG をシミュレートした 2 D MATLAB 配列 'eegdata' を最初に構築します。
チャネルと列がデータポイントであるデータ:

``` matlab
eegdata = rand(32, 256*100);
% build a matrix of random test data (32 channels, 100 seconds at 256 Hz)
```


これらのデータをインポートするには、メニュー項目を選択します。 <span style="color: brown">ファイル →
ASCII/floatファイルまたはMATLAB配列からデータをインポートする</span>お問い合わせ リストからオプションMATLAB変数をクリックし、設定します。
*eegdata* の名前。 サンプリング周波数を256Hzに設定し、*Ok*を押します。 その他
データセットパラメータは自動的に調整されます。


![](/assets/images/pop_importdata12.png)



他のファイル形式からデータをインポートすることに注意してください。 連続輸入
MATLABの配列ではなくMATLAB *.mat*ファイルからデータをスクロール
MATLAB *.mat*ファイルを表示するボックスの選択肢のリスト。

注意: MATLAB *.mat* ファイルを読み込むとき、EEGLAB はそれだけを含んでいると仮定します
1つのMATLAB変数。 (32ビット)バイナリフロート形式のデータを読み込みます
*float le* (little-endian) と *float の2つの選択肢があります。
be* (大英) ここで正しい選択は、オペレーティングシステムによって異なります。 お問い合わせ
ビット注文が不明な場合は、それぞれを試してください。 注意:
ツールボックスコマンドライン機能 [ショートレッド。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=shortread.m) また、
(16ビット) 短整数ファイルからデータを読み込みます。 MATLAB の実績
上記のように、配列は EEGLAB にインポートできます。

データをインポートしたら、参照してください。 [クイックスタートガイド](/tutorials/02_Quickstart/quickstart.html) データをスクロールする。

### MATLAB構造を含むファイルをインポートする

MATLABファイルにはさまざまなフォーマットがあります。 彼らは単に容器です
(Excelファイルとは異なる方法で整理されたデータが含まれる場合があります)
異なるタブ)。 EEGLABはMATLABファイルの内部フォーマットを推測できませんので、このステップを自分で行う必要があります。 MATLABファイルが最適
MATLABコマンドラインでインポート

``` matlab
mydata = load(‘-mat’, ‘your_file.mat’)
```

たとえば、データが「mydata」構造にある場所を参照してください。 
*mydata.eeg* には、生EEGデータ(チャンネル)を含む配列が含まれる場合があります。
サンプルによって)。 このデータをMATLAB変数に置きます。

``` matlab
myeeg = mydata.eeg; % This is an example, the name of the field "eeg" might differ for you
```

次に、EEGLABを選択 <span style="color: brown">ファイル → インポートデータ →
ASCII/floatファイルまたはMATLAB配列から</span> メニュー項目に「myeeg」を入れて下さい
最初の編集ボックス(前のセクションにはインポートの詳細があります)
MATLAB配列)。

### データ平均のインポートセット

EEGLAB は、単一の検索データを処理し、視覚化するために作られました。 <b>チュートリアルのこのセクションにもかかわらず、データ平均の処理とインポートを強くお勧めします</b>お問い合わせ 代わりに、イベントの平均値が抽出される可能性がある単一trialデータをインポートする必要があります。
イベント関連の潜在能力(ERP)の平均も処理し、
視覚化されるが、直接輸入してはならない。

ただし、旧データの場合、データ平均のみが利用可能です。 3つの平均ERPのエポックを処理できるのは、
単一trial epochs (この場合は EEGLAB の機能の一部ではない)
意味のある)。 EEGLABに壮大なエポックをインポートするには、さまざまな条件をスタック
以下に説明する配列の1つ。

まず、異なる条件のデータ平均をインポートする必要があります
マトラボ たとえば、これらの平均値をテキスト形式でエクスポートすることができます。
それから標準的なMATLAB機能を使用します

```matlab
>> load -ascii filename.txt
```

ASCIIファイルをMATLAB、すべてのカラム名、行にインポートすることに注意してください。
名前は削除されなければなりません。

データ平均を連結する必要があります。 例えば、
3つの条件実験では、3つのERP平均を導き出すことができます。
1000のサンプリング率 Hz、-100から600のmsへのカバーへの
stimulusのオンセット (各被写体を個別に処理する)
その後、被写体全体で結果を比較します。
分析)。

たとえば、MATLAB で入力 *>> whos* が返される可能性があります。

``` matlab
Name                       Size               Bytes                 Class
avgcond1                   31x600             14880                 double array
avgcond2                   31x600             14880                 double array
avgcond3                   31x600             14880                 double array

Grand total is 55800 elements using 446400 bytes
```

Note: 必要であれば、配列をtranspose(そう rows=channels)
colunmns=data サンプル, つまり chan\*samp (必須ではありません)
この例です。 その後、配列を連結します。

```matlab
>> allcond = [ avgcond1 avgcond2 avgcond3 ];
```

最後に、MATLAB 配列として EEGLAB に連結されたデータの平均値をインポートする必要があります。
メニュー項目を選択 <span style="color: brown">ファイル → データのインポート → から
ascii/floatファイルまたはMATLAB配列</span> 前のセクションの1つに示すように。

### その他/非対応のデータ形式

EEGLABのディスカッションリストアーカイブには、ユーザーからのメッセージも含まれています。
特定のデータフォーマットをインポートします。 リストアーカイブを検索できます。
Googleを使用してEEGLAB Webサイトの残りの部分とキーワードを追加*eeglablist*.

追加する意欲
EEGLABに関数をインポートする他のデータなので、プラグインを書いてこれを提出してください。 [サイトマップ](http://sccn.ucsd.edu/eeglab/plugin_uploader/upload_form.php)お問い合わせ EEGLABプラグインを作成して、サポートされていないデータフォーマットをインポートできるコンサルタントとの連絡も行っていますので、お気軽にお問い合わせください。

