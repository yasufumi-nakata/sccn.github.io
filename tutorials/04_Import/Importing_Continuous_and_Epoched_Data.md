---
layout: default
title: a. Continuous data
nav_title: "a. 連続データ"
long_title: a. Continuous data
parent: 4. Import data
grand_parent: Tutorials
---
連続したデータをインポートする
=======
お問い合わせ

参照して下さい [クイックスタートガイド](/tutorials/02_Quickstart/quickstart.html) します します します チュートリアルでは、EEGLABのプラグインは、 

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

翻訳済み EEG ファイルの読み込み、ファイル .cnt のファイル、Neuroscan または ANT の生ファイル 、 次の4つの異なる。
1. メニュー項目が利用可能かどうかを調べる <span style="color: brown">ダウンロード → EEGLAB関数とプラグイン</span>お問い合わせ メニューを選択し、ファイルをインポートします。

2. メニュー項目を使用する <span style="color: brown">ファイル → IO インターフェイス</span>EEGLAB は、EEGLAB の略奪、File-IO のプラグインです。 を を を File-IO は、FieldTrip のファイルです。 [ファイルIO文書](https://www.fieldtriptoolbox.org/development/module/fileio/) 詳細については、. 

3. メニュー項目を使用する <span style="color: brown">ファイル → BIOSIG インターフェイス</span>このサイトについて[コンテンツへスキップ](http://biosig.sf.net)) 含まれる
MATLAB のリリース EEGLAB は、EEGLAB の略称です。 を を を

4. メニュー項目を使用する <span style="color: brown">EEGLABの機能拡張</span> プラグインの検索(右上のマニファイアを使用する)。 使用しているアンプの名前を例に使用します。 プラグインをインストールしたら、新しく作成したサブメニュー項目を呼び出します。 <span style="color: brown">ダウンロード → EEGLAB関数とプラグイン</span>.

90% の場合、EEGデータが生成されます。 このページの先頭へ

EEGLAB(エグラボ)
--------------------

EEGLAB と LabStrdreamingLayer (LSL) は、UCSD の SCCN ラボで発起点と接地に接近する。 [*lsl_app_MATLABビューア*](https://github.com/labstreaminglayer/App-MATLABViewer/) 拡張子、メニュー項目 <span style="color: brown">MATLAB LSLビューア</span>EEG LSL に mac と Windows の に 、 で 、 で 、 で 、 で 、 で 、 で 、 で 、 で 、 と の 、 と の 、 と の 、 と の 、 と の 、 と の 、 と の は 、 と の に 、 と の は 、 と と の と の 、 と と の と の は 、 と と と の と と と と の と の は と と と と と と の の と と の と と の と と の と と と の と と と と と の と と と は と と と と と と と と と と と と と と と と と  EEGLAB .set ファイルの読み込み  この に に に ストリーム として として として として として として として Mobilab は、EEGLAB が XDF を オープンソース に インストールします。

サポートされているデータフォーマットのリスト
--------------------

ふりがな [プラグイン](https://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php) お問い合わせ 外部リンク プラグインは、EEGLABのプラグインです。 <span style="color: brown">EEGLABの機能拡張</span> メニュー項目。 プラグインに問題が発生した場合は、プラグインの作者に連絡することをお勧めします。 プラグインには、独自のドキュメントもあります。

EEGLABのプラグインは、EEGLABのプラグインとして、 このページの先頭へ

データインポートプラグインとカスタムインポート
--------------------

### BIOSIGのメリット

BIOSIG は、 * * * MATLABでは、 MATLABの特徴 次の記事 MATLAB に EEGLAB を組み込む

### MATLABの実装

EEG は、 'eegdata' を 'eegdata' に 設定します。
チャネルと列がデータポイントであるデータ:

``` matlab
eegdata = rand(32, 256*100);
% build a matrix of random test data (32 channels, 100 seconds at 256 Hz)
```


これらのデータをインポートするには、メニュー項目を選択します。 <span style="color: brown">ファイル →
ASCII/floatファイル orMATLAB へインポートする</span>お問い合わせ MATLAB変数の設定
*eegdata* 名 名 名 名 Ok*は、
データセットパラメータは自動的に調整されます。


![](/assets/images/pop_importdata12.png)



他のファイル形式からデータをインポートすることに注意してください。 連続輸入
MATLABの *.mat*ファイルについて
MATLAB *.mat*ファイルボックス

注意: MATLAB *.mat* は、MATLAB * .mat* は、MATLAB * .mat* は、MATLAB は、MATLAB は、MATLAB * .mat* は、MATLAB * .mat* は、MATLAB は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLAB * は、MATLABは、MATLABは、MATLAB * は、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、MATLABは、 は、
1つのMATLAB変数。(32ビット)バイナリフロート測定値
*float le* (little-endian) と *float の2つの異なるオプション。
お問い合わせ
ビット注文が不明な場合は、それぞれを試してください。 注意:
ツールボックスコマンドライン機能 [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=shortread.m) また、
(日本語) 最近の投稿 MATLABの実績
EEGLAB は、

データをインポートしたら、参照してください。 [クイックスタートガイド](/tutorials/02_Quickstart/quickstart.html) データをスクロールする。

### MATLABは、

MATLABファイルについて
とは とは とは
タブ EEGLAB は、MATLAB のファイルとして、このフレームワークを実装しています。 MATLABは、
MATLABは、

``` matlab
mydata = load(‘-mat’, ‘your_file.mat’)
```

「mydata」は、 
*mydata.eeg* , 生EEGデータ(チャンネル)のコンパイルを解除します。
例) このサイトでは、MATLAB の変数を、

``` matlab
myeeg = mydata.eeg; % This is an example, the name of the field "eeg" might differ for you
```

代表挨拶 <span style="color: brown">ファイル → インポートデータ →
ASCII/floatファイル MATLAB は、</span> メニュー
最初の編集ボックス(前のセクションにはインポートの詳細があります)
MATLABの配列

### データ平均のインポートセット

エッグラボ は は は は <b>チュートリアルのこのセクションにもかかわらず、データ平均の処理とインポートを強くお勧めします</b> お問い合わせ  お問い合わせ  お問い合わせ  お問い合わせ
緊急事態(ERP)
視覚化されるが、直接輸入してはならない。

このページの先頭へ PereperPのエポックは、
EEGLABの特徴
意味する。 EEGLABにStacksを配布する
以下に説明する配列の1つ。

まず、異なる条件のデータ平均をインポートする必要があります
マトラボ たとえば、これらの平均値をテキスト形式でエクスポートすることができます。
TLABの特徴

```matlab
>> load -ascii filename.txt
```

ASCIIは、すべてのレコード名、行は、これらのドメインを使用することができます。
名前は削除されなければなりません。

データ平均を連結する必要があります。 例えば、
3つの異なる条件を実験的に実行する
1000のサンプリング率 Hz、-100 から 600 までの ms のカバー
stimulus のオンセット (各被写体を適切に処理する)
その後、被写体全体で結果を比較します。
分析)。

MATLAB で入力 *>> whos* が返答されます。

``` matlab
Name                       Size               Bytes                 Class
avgcond1                   31x600             14880                 double array
avgcond2                   31x600             14880                 double array
avgcond3                   31x600             14880                 double array

Grand total is 55800 elements using 446400 bytes
```

注意: クライアント, ディレクトリをtranspose(そう)
colunmns=サンプル, つまり chan\*samp (必須)
この例です。 その後、配列を連結します。

```matlab
>> allcond = [ avgcond1 avgcond2 avgcond3 ];
```

最後に、 MATLAB を EEGLAB に 統合 ライセンス供与
メニュー項目を選択 <span style="color: brown">ファイル → データのインポート → から
ascii/floatファイル MATLABの配列</span> 前のセクションの1つに示すように。

### その他/非対応のデータ形式

EEGLAB のコメントアーカイブ、ユーザーからメッセージまで。
特定のデータフォーマットをインポートします。 リストアーカイブを検索できます。
サイトマップ Webサイトについて

追加する意欲
EEGLABにコメントする [サイトマップ](http://sccn.ucsd.edu/eeglab/plugin_uploader/upload_form.php)EEGLAB は、EEGLAB のソフトウェアを開発し、EEGLAB のソフトウェア開発を行ないます。

