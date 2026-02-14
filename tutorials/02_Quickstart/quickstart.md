---
layout: default
title: 2. Quickstart
long_title: 2. Quickstart
categories: tutorial
parent: Tutorials
nav_order: 2
---
クイックスタートガイド
================

このページでは、EEGデータセットをインポートして可視化することができます。 早速始めよう。

サンプル EEGLAB データセットをロードする
---------------------------

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>.

チュートリアルの残りの部分では、コンベンションを使用します。
<span style="color: brown">Menu_item → サブメニュー</span> メニュー
選択(例:サブメニュー項目を選択) <span style="color: brown">ログイン
既存のデータセット</span> トップレベルの下
<span style="color: brown">ファイル</span> サブメニュー

Unixでは、次のウィンドウがポップアップ表示されます(このアスペクト比)
ウィンドウは、WindowsとMacOSで異なる場合があります。

![画像:Pop_loadset.png](/assets/images/Pop_loadset.png)

データからEEGLABのデータセットを作成する方法を学ぶには、
[データのインポートとデータ
イベント](/tutorials/04_Import/Importing_Continuous_and_Epoched_Data.html)

配布されているチュートリアルファイル「eeglab_data.set」を選択します。
EEGLABの「sample_data」フォルダにあるツールボックス。 それから *Open*を押して下さい。

EEGLAB がデータセットをロードした後、メイン EEGLAB ウィンドウが表示されます。
関連情報 -- チャンネル数、サンプリングレート、
など。

![](/assets/images/Eeglab_window_continuous_data.jpg)

イベントの値を探索する
----------------------

チュートリアルデータセットでは、EEG.event構造フィールド*type*、
*position* および *latency* は 154 イベントごとに指定されます。
データセットにマークされています。

メニュー <span style="color: brown">編集 → イベント値</span> コールアップ
これらの値を読み、編集できるウィンドウ:


![画像:Figure ポップアップ editeventvals3.png](/assets/images/Figure_pop_editeventvals3.png)



*\を押すと各イベントをスクロール<* and *\>*\<\<* を使用して 10 のステップでボタン、または
と *\>\>*。


サンプルを制作した実験を簡潔に説明します
データセットは、残りの部分で実証する分析のステップを動機付けます
チュートリアル。

このデータセットについて
------------------

ここでは、テキストフィールドを編集し、表示する方法を説明します。
現在のデータセットは、そのデータセットの一部として保存されます。

選択する <span style="color: brown">編集 → このデータセットについて</span>お問い合わせ ツイート
テキスト編集ウィンドウがポップアップし、ユーザーが編集できるようにします
現在のデータセットの説明。 サンプルデータの入力
タスクの次の記述。 *SAVE*を押してください。


![画像:I15about_this_dataset.png](/assets/images/I15about_this_dataset.png)

データをスクロールする
--------------------------

ここでは、選択した部分を視覚化し、拒否する方法を学びます
連続EEGチャネルのデータ。

現在のデータセットのチャネルデータをスクロールするには、
<span style="color: brown">Plot → チャンネルデータ(スクロール)</span>お問い合わせ このポップアップ
お問い合わせ [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)
下のスクロールデータ表示ウィンドウ。

![画像:Scrollchannelactivities1.png](/assets/images/Scrollchannelactivities1.png)
