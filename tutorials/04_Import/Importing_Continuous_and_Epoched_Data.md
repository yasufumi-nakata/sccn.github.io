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

データのインポート方法については [クイックスタートガイド](/tutorials/02_Quickstart/quickstart.html) も参照してください。このチュートリアルでは、EEGLABのプラグインを使用したデータのインポート方法を説明します。

<details open markdown="block">
  <summary>
    目次
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

連続した生データファイルを簡単にインポートする4つのステップ
------------------

EEGファイル（例: Neuroscan .cntファイルやANT生ファイル）を読み込むには、以下の4つの方法があります。
1. <span style="color: brown">ファイル → インポートデータ</span> メニューに対応するフォーマットのメニュー項目があるか確認します。利用可能であれば、そのメニュー項目を選択してファイルをインポートします。

2. <span style="color: brown">ファイル → File-IO インターフェイス</span> メニュー項目を使用します。File-IOはFieldTripのファイル入出力プラグインです。詳細については [File-IO ドキュメント](https://www.fieldtriptoolbox.org/development/module/fileio/) を参照してください。

3. <span style="color: brown">ファイル → BIOSIG インターフェイス</span> メニュー項目を使用します。BIOSIGツールボックス（[biosig.sf.net](http://biosig.sf.net)）はEEGLABに含まれており、多数のファイル形式に対応しています。

4. <span style="color: brown">EEGLABの機能拡張</span> メニュー項目でプラグインを検索します（右上の検索ボックスを使用し、使用しているアンプの名前で検索します）。プラグインをインストールしたら、<span style="color: brown">ファイル → インポートデータ</span> サブメニューに新しいメニュー項目が追加されます。

90%以上の場合、上記の方法でEEGデータをインポートできます。

EEGLABとリアルタイムデータストリーミング
--------------------

EEGLABとLab Streaming Layer（LSL）は、UCSDのSCCNラボで開発されています。[*lsl_app_MATLABViewer*](https://github.com/labstreaminglayer/App-MATLABViewer/) プラグインをインストールすると、<span style="color: brown">MATLAB LSLビューア</span> メニュー項目からリアルタイムEEGデータをLSLストリームとして表示できます（macとWindowsに対応）。EEGLAB .set ファイルとしてストリームデータを保存することも可能です。MoBI Lab プラグインを使用すると、EEGLABでXDF形式のファイルをインポートできます。

サポートされているデータフォーマットのリスト
--------------------

利用可能な[プラグイン一覧](https://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php)を確認できます。プラグインは <span style="color: brown">EEGLABの機能拡張</span> メニュー項目からインストールできます。プラグインに問題が発生した場合は、プラグインの作者に連絡することをお勧めします。プラグインには独自のドキュメントもあります。

以下は、EEGLABのコアおよびプラグインでサポートされているデータ形式の一覧です。

データインポートプラグインとカスタムインポート
--------------------

### BIOSIGのメリット

BIOSIGツールボックスはEEGLABに含まれており、MATLABで多数のバイオシグナルファイル形式の読み書きに対応しています。

### MATLABの実装

EEG は、 'eegdata' を 'eegdata' に 設定します。
チャネルと列がデータポイントであるデータ:

``` matlab
eegdata = rand(32, 256*100);
% build a matrix of random test data (32 channels, 100 seconds at 256 Hz)
```


これらのデータをインポートするには、メニュー項目 <span style="color: brown">ファイル → インポートデータ → ASCII/floatファイル または MATLAB配列</span> を選択します。MATLAB変数名を *eegdata* と入力し、*Ok* を押すと、データセットパラメータは自動的に調整されます。


![](/assets/images/pop_importdata12.png)



他のファイル形式からデータをインポートする場合もこのメニューを使用できます。MATLABの *.mat* ファイルからの連続データインポートについては、以下のセクションを参照してください。

注意: MATLAB *.mat* ファイルには複数の変数が含まれている場合がありますが、EEGLABは
1つのMATLAB変数。(32ビット)バイナリフロート測定値
*float le*（little-endian）と *float be*（big-endian）の2つのオプションがあります。ビット順序が不明な場合は、それぞれ試してください。コマンドライン関数 [shortread.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=shortread.m) もバイナリデータの読み込みに使用できます。

データをインポートしたら、参照してください。 [クイックスタートガイド](/tutorials/02_Quickstart/quickstart.html) データをスクロールする。

### MATLAB .matファイルからのインポート

MATLABの *.mat* ファイルには複数の変数が含まれている場合があります。EEGLABでは、まずMATLABでファイルを読み込み、EEGデータを含む変数を特定する必要があります。以下のように読み込みます:

``` matlab
mydata = load(‘-mat’, ‘your_file.mat’)
```

「mydata」は構造体で、*mydata.eeg* に生EEGデータ（チャンネル×データポイント）が含まれている場合があります。この変数を以下のように取り出します:

``` matlab
myeeg = mydata.eeg; % This is an example, the name of the field "eeg" might differ for you
```

その後、<span style="color: brown">ファイル → インポートデータ → ASCII/floatファイル または MATLAB配列</span> メニューを使用し、最初の編集ボックスに変数名を入力します（前のセクションにインポートの詳細があります）。

### データ平均のインポートセット

EEGLABは主にシングルトライアルデータの解析を目的としています。<b>データ平均（ERP）は直接インポートするのではなく、シングルトライアルデータから計算することを強くお勧めします。</b>ただし、既に計算されたERPデータを視覚化することは可能です。

データ平均をEEGLABで使用するには、各条件の平均データを以下に説明する方法で配列として連結します。

まず、異なる条件のデータ平均をインポートする必要があります
MATLABにインポートします。たとえば、テキスト形式のデータ平均は以下のようにMATLABに読み込めます:

```matlab
>> load -ascii filename.txt
```

ASCIIファイルにヘッダ行（列名など）が含まれている場合は、事前に削除する必要があります。

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

注意: データが転置されている場合は、MATLABの transpose 関数を使用して、行がチャンネル、列がサンプルポイント（chan × samp）の形式にしてください。その後、配列を連結します:

```matlab
>> allcond = [ avgcond1 avgcond2 avgcond3 ];
```

最後に、連結した配列をEEGLABにインポートします。メニュー項目を選択 <span style="color: brown">ファイル → データのインポート → から
ascii/floatファイル MATLABの配列</span> 前のセクションの1つに示すように。

### その他/非対応のデータ形式

EEGLABのメーリングリストアーカイブには、特定のデータ形式のインポートに関するユーザーからの情報が含まれています。アーカイブを検索することをお勧めします。

新しいデータインポートプラグインを開発してEEGLABに追加したい場合は、[こちら](http://sccn.ucsd.edu/eeglab/plugin_uploader/upload_form.php)からプラグインをアップロードできます。

