---
layout: default
title: b. Remove bad data
nav_title: "b. 悪いデータを削除する"
long_title: b. Remove bad data by visual inspection
categories: artifact
parent: 6. Reject artifacts
grand_parent: Tutorials
---
データのスクロールと拒否 
======

ここでは、選択した部分を視覚化し、拒否する方法を学びます
お問い合わせ

EEGLAB をロードする
--------------------------
選択する <span style="color: brown">ファイル → 既存のデータセットをロードする</span> メニュー項目。
EEGLABの「sample_data」フォルダにあるツールボックスです。

![サイトマップ](/assets/images/Pop_loadset.png)

データのスクロール
--------------------------
現在のデータセットのチャネルデータをスクロールするには、
<span style="color: brown">Plot → チャンネルデータ(有料)</span>お問い合わせ このポップアップ
お問い合わせ [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)
下のスクロールデータ表示ウィンドウ。

このサイトは、EEGデータが公開されています。
この「pseudo-continuous」は、
人工的には、8秒を別々に構成
データエポック(後日別々)。 これはいくつか説明
突然、一部のデータチャネルで表示されることがあります。


![サイトマップ](/assets/images/Scrollchannelactivities1.png)


プロットウィンドウの右側には、垂直スケール値(およびその
垂直スケールの「振幅」を示す単位、マイクロボルト)
バー。 この場合、その値は80(マイクロボルト)です。 同じ値が
また、右下の編集ボックスに表示され、そのまま変更できます。
お問い合わせ

電圧スケール
--------------------------
"Scale" の 編集 テキスト を 50 回 します。
*"-"*ボタンを繰り返し、またはテキスト値を編集することにより
キーボードから、*Enter* のキーを押します
ウィンドウ。


![サイトマップ](/assets/images/Scrollchannelactivities2.png)


スクロール時間ウィンドウの幅を調整する
--------------------------
表示される時間範囲を調節するため(すなわち、横のスケール)、
選択する [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) メニュー
アイテム <span style="color: brown">設定 → 表示する時間範囲</span>と
目的のウィンドウの長さを「10」秒に以下のように設定します。


![© 2018 I16change_window_length.png 禁無断転載](/assets/images/I16change_window_length.png)




※Ok*は、別途変更となります。


![サイトマップ](/assets/images/Scrollchannelactivities3.png)



表示するチャネルの数
--------------------------
表示されるチャンネル数を調整するには、
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) メニュー
アイテム <span style="color: brown">設定 → チャンネル数
ディスプレイ</span> そして表示するチャネルの望ましい数を書き入れて下さい
画面(たとえば「16」)


![i16chan_to_display.png はコメントを受け付けていません。](/assets/images/I16chan_to_display.png)


表示されるチャンネルの数を減らすと、スクロールを返す
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) ウィンドウ
プロットの左に垂直チャンネルセットスライダー付き。 使用する
すべてのチャネルを通して表示(口頭)をスクロールして下さい。


![サイトマップ](/assets/images/Scrollchannelactivities4.png)

データのズーム
--------------------------
データウィンドウの特定の領域でズームするには、
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) メニュー
アイテム <span style="color: brown">設定 → ズームオフ/オン → ズームオン</span>お問い合わせ マウスを使用して、データの領域の周りの矩形をドラッグしてズーム
お問い合わせ 下にスクロールウィンドウが似ています。
マウスの右ボタンをクリックし、もう一度ズームアウトします。 メニュー項目を使用する
<span style="color: brown">設定→ズームオフ/オン→ズームオフ</span> ターンする
ズームオプションをオフにします。


![投稿ナビゲーション](/assets/images/I16scroll_zoom.png)

データを注入する
--------------------------
ふりがな [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)
ウィンドウはまた(消去)任意部分を拒絶することを可能にします
連続データ。 関数
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) できます
両方のメニュー項目から呼び出される <span style="color: brown">ツール → 目でデータをインスペクト/レジェクトする</span> そして、 <span style="color: brown">Plot → チャンネルデータ(有料)</span>お問い合わせ *続きを読む 

選択したデータを消去するには、最初にデータをドラッグします
マウス(左マウスボタンを押したまま)を水平方向に
拒絶のためにマークする興味の時領域。 好きならマーク
この方法で拒絶する複数の領域。

![](/assets/images/I16reject_scroll.png)

注意: ズームは、データの部分を選択するために無効でなければなりません。

注意: プロットウィンドウから拡張するデータの部分を選択するには、
マウスを新しい領域にドラッグして、先に接続するだけです。
マークされた地域。 例えば、次のプロットウィンドウで、
既に選択された時間間隔2.1秒から3.4秒がありました(として)
上記の)マウスを 6.9 秒から 4.7 にドラッグします。

注意: *de* , ローカル選択 です。
これは、拒否のためにマークされたデータ部分の再検査を可能にします
2つ以上のパス、例えば、ユーザーがより一貫した開発をした後
拒絶戦略または閾値。 

![](/assets/images/Iii1eegplot2.jpg)

データの一部をマークした後
*REJECT*と、新規データセットの作成
削除されたデータを省略しました。 新しいデータセットはマーク付きで作成されます
削除された地域。 

*Ok* で、マークされたデータを新しいデータセットに
削除された部分。

EEGLAB は、EEGLAB は、EEGLAB が、EEGLAB は、
フィールドとインサート *境界* データが拒否されたイベント
データ部分の持続期間を保持する期間フィールドで
免責事項 EEGLABは、実験の練習場でイベントをリンクします。
*EEG.urevent*の構造に出席します。
境界イベントは、その後のエポック選択が交差しないことを確認します
非連続拒絶境界。 したがって、継続的なデータに対する拒絶
'before' に 'before' を 'before' に 'before' に 'before' を 'before' に 'before' に 'before' を ' に 'before' に ' に 'before' を ' に 'before' に ' を に 'before' <span style="color: brown">Plot → チャンネルデータ(有料)</span> 以下に示すように新しいデータセットに(厚い赤いでき事の印は境界イベントです)。

![](/assets/images/Iii1eegplot1.jpg)

イラストの目的は、この拒絶反応のみを実行します。
EEGLAB は、Windowsメニューの項目を翻訳しました。
<span style="color: brown">データセット→データセット1:</span>.

### データの悪い部分を拒絶するための戦略

Stack*ボタンボタンボタンボタンボタンボタンを押します [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) ウィンドウ(右上隅)と、約30秒のデータビュー(ウィンドウを眺める)。 ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? 30秒のウィンドウで、 連続 連続 連続 以下は、各地域に問い合わせておきます。

![サイトマップ](/assets/images/eegplot_norm.png)

### イベントを囲むデータの悪い部分を注入する

関心 は は 参加申し込みフォーム <span style="color: brown">編集 → イベントを使用してデータを選択</span> 「TMS_pulse」*type* の項目は、イベントの構成要素の削除です。

![サイトマップ](/assets/images/rm_event_tms_pulse.png)
