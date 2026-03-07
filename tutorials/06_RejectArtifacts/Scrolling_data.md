---
layout: default
title: b. Remove bad data
nav_title: "b. 不良データの除去"
long_title: b. Remove bad data by visual inspection
categories: artifact
parent: 6. Reject artifacts
grand_parent: Tutorials
---
データのスクロールと拒否 
======

ここでは、連続EEGデータの選択した部分を視覚化し、拒否する方法を学びます。

EEGLAB をロードする
--------------------------
メニュー項目<span style="color: brown">ファイル → 既存のデータセットをロードする</span>を選択してください。EEGLABの「sample_data」フォルダにある「eeglab_data.set」ファイルを選択します。

![こちら](/assets/images/Pop_loadset.png)

データのスクロール
--------------------------
現在のデータセットのチャネルデータをスクロールするには、
<span style="color: brown">Plot → チャンネルデータ（スクロール）</span>を選択してください。これにより
[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)関数が呼び出され、
下のスクロールデータ表示ウィンドウが開きます。

このサンプルEEGデータは「擬似連続」形式で表示されます。
実際には、8秒間の個別のデータエポックが連結されて構成されています
（エポックは後のチュートリアルで別途説明します）。
このため、一部のデータチャネルで突然の不連続が表示されることがあります。


![こちら](/assets/images/Scrollchannelactivities1.png)


プロットウィンドウの右側には、垂直スケールバーがあり、スケール値（単位はマイクロボルト）が表示されています。この場合、値は80（マイクロボルト）です。同じ値が右下の編集ボックスにも表示されており、直接変更することもできます。

電圧スケール
--------------------------
「Scale」の編集ボックスの値を50に変更します。*"-"*ボタンを繰り返しクリックするか、テキストボックスの値をキーボードから直接編集し、*Enter*キーを押してください。


![こちら](/assets/images/Scrollchannelactivities2.png)


スクロール時間ウィンドウの幅を調整する
--------------------------
表示される時間範囲（横方向のスケール）を調節するには、[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)のメニュー項目<span style="color: brown">設定 → 表示する時間範囲</span>を選択し、ウィンドウの長さを以下のように「10」秒に設定します。


![](/assets/images/I16change_window_length.png)




*Ok*を押すと、表示が以下のように変わります。


![こちら](/assets/images/Scrollchannelactivities3.png)



表示するチャネルの数
--------------------------
表示されるチャンネル数を調整するには、[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)のメニュー項目<span style="color: brown">設定 → 表示チャンネル数</span>を選択し、表示したいチャンネル数（例えば「16」）を入力してください。


![](/assets/images/I16chan_to_display.png)


表示チャンネル数を減らすと、[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)ウィンドウのプロット左側に垂直スライダーが表示されます。このスライダーを使用して、すべてのチャンネルをスクロール表示できます。


![こちら](/assets/images/Scrollchannelactivities4.png)

データのズーム
--------------------------
データウィンドウの特定の領域をズームするには、[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)のメニュー項目<span style="color: brown">設定 → ズームオフ/オン → ズームオン</span>を選択します。マウスを使用してデータ領域上に矩形をドラッグし、ズームしてください。以下のようなスクロールウィンドウが表示されます。マウスの右ボタンをクリックするとズームアウトします。メニュー項目<span style="color: brown">設定 → ズームオフ/オン → ズームオフ</span>を選択してズームオプションをオフにします。


![](/assets/images/I16scroll_zoom.png)

データの拒否
--------------------------
[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)ウィンドウでは、連続データの任意の部分を拒否（除去）することもできます。[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)関数は、メニュー項目<span style="color: brown">ツール → データを目視でインスペクト/リジェクト</span>と<span style="color: brown">Plot → チャンネルデータ（スクロール）</span>の両方から呼び出すことができます。

選択したデータを拒否するには、マウスの左ボタンを押したまま水平方向にドラッグして、拒否したい時間領域をマークします。この方法で複数の領域をマークすることもできます。

![](/assets/images/I16reject_scroll.png)

注意: ズームは、データの部分を選択するために無効でなければなりません。

注意: プロットウィンドウを超えてデータ部分を選択するには、マウスを新しい領域にドラッグして、既にマークされた領域に接続してください。例えば、次のプロットウィンドウでは、既に時間間隔2.1秒から3.4秒が選択されており（上記参照）、マウスを6.9秒から4.7秒にドラッグしています。

注意: マークされた領域をクリックすると選択を解除できます。
これにより、拒否のためにマークされたデータ部分を再検査することが可能になります。
例えば、ユーザーがより一貫した拒否基準やしきい値を
確立した後に再確認できます。

![](/assets/images/Iii1eegplot2.jpg)

データの一部をマークした後、*REJECT*ボタンを押すと、マークされた部分が除去された新しいデータセットが作成されます。

*Ok*を押すと、マークされた部分が除去された新しいデータセットが作成されます。

EEGLABは、データが拒否された位置に*boundary*（境界）イベントを挿入し、
拒否されたデータ部分の持続時間を保持する期間フィールドを設定します。
EEGLABは、元のイベント情報を*EEG.urevent*構造体に保持しています。
境界イベントにより、その後のエポック選択が非連続的な
拒否境界を横断しないことが保証されます。したがって、連続データでの拒否は
エポック化の前に行う必要があります。<span style="color: brown">Plot → チャンネルデータ（スクロール）</span>で以下のように新しいデータセットを表示できます（太い赤線のイベントマークが境界イベントです）。

![](/assets/images/Iii1eegplot1.jpg)

説明のために、この拒否操作は一時的なものとします。
元のデータセットに戻るには、EEGLABウィンドウのメニューから
<span style="color: brown">データセット → データセット1</span>を選択してください。

### データの悪い部分を除去するための戦略

*Stack*ボタン（[eegplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)ウィンドウの右上隅）を押し、約30秒のデータビューに設定してください。30秒のウィンドウ内でデータを確認し、ノイズの多い領域を特定できます。

![こちら](/assets/images/eegplot_norm.png)

### イベント周辺の不良データを除去する

特定のイベント周辺のデータを削除するには、<span style="color: brown">編集 → イベントを使用してデータを選択</span>を使用します。例えば、「TMS_pulse」タイプのイベント周辺のデータを削除できます。

![こちら](/assets/images/rm_event_tms_pulse.png)
