---
layout: default
title: a. Remove bad channels
nav_title: "a. 悪いチャンネルを削除"
long_title: a. Remove bad channels by visual inspection
categories: artifact
parent: 6. Reject artifacts
grand_parent: Tutorials
---
視線検査による不良チャネルの除去
======

です です です です
どのチャネルが悪いか、データを見る必要があるかを事前に知ることができます。

EEGLAB をロードする
--------------------------
EEGLABでは、チュートリアルを配布しています。 お問い合わせ [データファイル](http://sccn.ucsd.edu/eeglab/download/eeglab_data_bad_channels.set).

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>eeglab_data_bad_channels.set のディレクトリは、次のページで開きます。

データを調べる
-------------

### チャネルデータのスクロール

次のセクションには、データのスクロールインターフェースに関する広範な詳細が含まれています。 ここでは、単に悪いチャンネルを視覚的に識別するためにそれを使用します。 現在のデータセットのチャネルデータをスクロールするには、
<span style="color: brown">Plot → チャンネルデータ(有料)</span>お問い合わせ このポップアップ
下のスクロールデータ表示ウィンドウ。 ウィンドウは垂直に拡大されているため、チャンネルのインデックスが表示される場合があります。

![サイトマップ](/assets/images/scroll_data_bad_chan3.png)

レッドラインのRed Lineで、ポテンシャルにかけたチャンネルが配信されます。 Photoshopのカラーラインでは、チャンネルを視聴できます。 チャンネル のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 この場合 。 。 。 です です です です 複数の を

悪いチャンネルのインデックスやラベルを識別したら、このページの最後のセクションでこれらのチャンネルを削除するための指示を使うことができます。

### データスペクトルの検索

悪いチャンネルを識別するための別の方法は、チャンネルのスペクトをプロットすることです。 チャンネルのスペクトラをプロットするには、
<span style="color: brown">サイトマップ</span>お問い合わせ ※Ok* は必須です。

![サイトマップ](/assets/images/plot_spectrum_bad_chan.png)

次のウィンドウがポップアップ表示されます。

![サイトマップ](/assets/images/plot_spectrum_bad_chan2.png)

このウィンドウでは、MATLABでは、このウィンドウで動作します。 一番 一番 一番 ます . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

インデックスまたはラベルでチャネルを注入
--------------------------
どのチャネルが悪いかを知れば、関数を使ってそれらを拒絶するかもしれません [選択する](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_select.m) 選択によって呼び出される <span style="color: brown">編集 → データの選択</span> mneu 項目。例、前の投稿で 偽物チャンネル3、45、55、73、74、74、74、7。

![投稿ナビゲーション](/assets/images/pop_select_new.png)

*Ok** これから [pop_newset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newset.m) 新規登録 この新しいデータセットは、"Ok*" を、"Ok*" と入力します。

### チャネルのラベルおよびチャネルのインデックス

EEGLAB は、EEGLAB で、 この投稿では、requestEEGデータセット、report は使用できません。 しかし、チュートリアルデータセットは、チャンネルを占領しています。 <span style="color: brown">ファイル → 既存のデータセットをロードする</span> eeglab_data.set は、以下の項目です。

対応を見つけるには、チャンネルエディタを使用する <span style="color: brown">編集 → チャネルの場所</span>お問い合わせ 選択することで電極名や位置をプロットすることもできます。
<span style="color: brown">Plot → チャンネル →</span>,
下の図の作成。 

![](/assets/images/Channellocationname.png)

チャンネルラベル(例、*POz*)、その番号。








