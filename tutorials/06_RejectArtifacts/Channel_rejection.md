---
layout: default
title: a. Remove bad channels
nav_title: "a. 不良チャネルの除去"
long_title: a. Remove bad channels by visual inspection
categories: artifact
parent: 6. Reject artifacts
grand_parent: Tutorials
---
目視確認による不良チャネルの除去
======

不良チャンネルを特定するには、どのチャネルに問題があるかを事前に知っているか、データを視覚的に確認する必要があります。

EEGLAB をロードする
--------------------------
このチュートリアルでは、専用の[データファイル](http://sccn.ucsd.edu/eeglab/download/eeglab_data_bad_channels.set)を使用します。

メニュー項目<span style="color: brown">ファイル</span>からサブメニュー項目<span style="color: brown">既存のデータセットをロードする</span>を選択し、eeglab_data_bad_channels.setファイルを保存したディレクトリを開いてください。

データを調べる
-------------

### チャネルデータのスクロール

次のセクションには、データのスクロールインターフェースに関する広範な詳細が含まれています。 ここでは、単に悪いチャンネルを視覚的に識別するためにそれを使用します。 現在のデータセットのチャネルデータをスクロールするには、
<span style="color: brown">Plot → チャンネルデータ（スクロール）</span>を選択してください。
下のスクロールデータ表示ウィンドウが開きます。ウィンドウを垂直に拡大すると、すべてのチャンネルのインデックスが表示されます。

![こちら](/assets/images/scroll_data_bad_chan3.png)

ノイズの多いチャンネルやフラットなチャンネルを視覚的に識別できます。不良チャンネルは通常、他のチャンネルと比べて異常に大きな振幅やフラットな信号を示します。この場合、複数の不良チャンネルが確認できます。

悪いチャンネルのインデックスやラベルを識別したら、このページの最後のセクションでこれらのチャンネルを削除するための指示を使うことができます。

### データスペクトルの確認

悪いチャンネルを識別するための別の方法は、チャンネルのスペクトルをプロットすることです。 チャンネルのスペクトラをプロットするには、
<span style="color: brown">Plot → チャンネルスペクトラとマップ</span>を選択してください。*Ok*を押します。

![こちら](/assets/images/plot_spectrum_bad_chan.png)

次のウィンドウがポップアップ表示されます。

![こちら](/assets/images/plot_spectrum_bad_chan2.png)

このウィンドウでは、各チャンネルのスペクトルが表示されます。異常なスペクトル特性を持つチャンネルをクリックすると、そのチャンネルのインデックスがMATLABコマンドウィンドウに表示されます。

インデックスまたはラベルによるチャネルの除去
--------------------------
不良チャネルを特定したら、[pop_select.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_select.m)関数を使って除去できます。<span style="color: brown">編集 → データの選択</span>メニュー項目から呼び出します。例えば、前のセクションで特定した不良チャンネル（3、45、55、73、74など）を除去できます。

![](/assets/images/pop_select_new.png)

*Ok*を押すと、[pop_newset.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newset.m)が呼び出され、新しいデータセットの保存ダイアログが表示されます。新しいデータセットの名前を入力して*Ok*を押してください。

### チャネルのラベルおよびチャネルのインデックス

EEGLABでは、チャンネルをインデックスまたはラベルで指定できます。すべてのEEGデータセットにチャンネルラベルがあるわけではありませんが、チュートリアルデータセットにはチャンネルラベルが含まれています。<span style="color: brown">ファイル → 既存のデータセットをロードする</span>でeeglab_data.setをロードしてください。

チャンネルインデックスとラベルの対応を確認するには、<span style="color: brown">編集 → チャネルの場所</span>でチャンネルエディタを使用してください。また、電極名と位置をプロットするには
<span style="color: brown">Plot → チャンネルの位置 → 名前で</span>を選択して、以下の図を作成できます。

![](/assets/images/Channellocationname.png)

チャンネルラベル（例：*POz*）をクリックすると、そのチャンネル番号が表示されます。








