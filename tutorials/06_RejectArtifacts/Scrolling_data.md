---
layout: default
title: b. Remove bad data
long_title: b. Remove bad data by visual inspection
categories: artifact
parent: 6. Reject artifacts
grand_parent: Tutorials
---
データのスクロールと拒否 
======

ここでは、選択した部分を視覚化し、拒否する方法を学びます
連続EEGチャネルのデータ。

サンプル EEGLAB データセットをロードする
--------------------------
選択する <span style="color: brown">ファイル → 既存のデータセットをロードする</span> メニュー項目。 配布するチュートリアルファイル「eeglab_data.set」を選択します。
EEGLABの「sample_data」フォルダにあるツールボックスです。 それから *Open*を押して下さい。

![画像:Pop_loadset.png](/assets/images/Pop_loadset.png)

データのスクロール
--------------------------
現在のデータセットのチャネルデータをスクロールするには、
<span style="color: brown">Plot → チャンネルデータ(スクロール)</span>お問い合わせ このポップアップ
お問い合わせ [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)
下のスクロールデータ表示ウィンドウ。

このサンプルデータファイルには、EEGデータが含まれていることに注意してください。 お問い合わせ
ダウンロード時間を短縮し、この「pseudo-continuous」EEGデータセットは
人工的には、8秒を別々に構成
データエポック(後日別々)。 これはいくつか説明
突然、一部のデータチャネルで表示されることがあります。


![画像:Scrollchannelactivities1.png](/assets/images/Scrollchannelactivities1.png)


プロットウィンドウの右側には、垂直スケール値(およびその
垂直スケールの「振幅」を示す単位、マイクロボルト)
バー。 この場合、その値は80(マイクロボルト)です。 同じ値が
また、右下の編集ボックスに表示され、そのまま変更できます。
お問い合わせ

電圧スケール
--------------------------
"Scale" の編集テキスト ボックス値を 50 程度に変更します。
*"-"*ボタンを繰り返し、またはテキスト値を編集することにより
キーボードから、*Enter*キーを押してスクロールを更新します
ウィンドウ。


![画像:Scrollchannelactivities2.png](/assets/images/Scrollchannelactivities2.png)


スクロール時間ウィンドウの幅を調整する
--------------------------
表示される時間範囲を調節するため(すなわち、横のスケール)、
選択する [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) メニュー
アイテム <span style="color: brown">設定 → 表示する時間範囲</span>と
目的のウィンドウの長さを「10」秒に以下のように設定します。


![画像:I16change_window_length.png](/assets/images/I16change_window_length.png)




その後、*Ok*を押して、指示された変更が有効になります。


![画像:Scrollchannelactivities3.png](/assets/images/Scrollchannelactivities3.png)



表示するチャネルの数
--------------------------
表示されるチャンネル数を調整するには、
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) メニュー
アイテム <span style="color: brown">設定 → チャンネル数
ディスプレイ</span> そして表示するチャネルの望ましい数を書き入れて下さい
画面(たとえば「16」)


![画像:I16chan_to_display.png](/assets/images/I16chan_to_display.png)


表示されるチャンネルの数を減らすと、スクロールを返す
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) ウィンドウ
プロットの左に垂直チャンネルセットスライダー付き。 使用する
すべてのチャネルを通して表示(口頭)をスクロールして下さい。


![画像:Scrollchannelactivities4.png](/assets/images/Scrollchannelactivities4.png)

データのズーム
--------------------------
データウィンドウの特定の領域でズームするには、
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) メニュー
アイテム <span style="color: brown">設定 → ズームオフ/オン → ズームオン</span>お問い合わせ マウスを使用して、データの領域の周りの矩形をドラッグしてズーム
お問い合わせ 下にスクロールウィンドウが似ています。
マウスの右ボタンをクリックし、もう一度ズームアウトします。 メニュー項目を使用する
<span style="color: brown">設定→ズームオフ/オン→ズームオフ</span> ターンする
ズームオプションをオフにします。


![画像:I16scroll_zoom.png](/assets/images/I16scroll_zoom.png)

データを注入する
--------------------------
ふりがな [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)
ウィンドウはまた(消去)任意部分を拒絶することを可能にします
連続データ。 関数
[eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) できます
両方のメニュー項目から呼び出される <span style="color: brown">ツール → 目でデータをインスペクト/レジェクトする</span> そして、 <span style="color: brown">Plot → チャンネルデータ(スクロール)</span>お問い合わせ 選択したメニュー項目に応じて、警告メッセージが表示されます。 *Continue* をクリックします。 

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

注意: *deselect* には、選択した領域をクリックするだけです。
これは、拒否のためにマークされたデータ部分の再検査を可能にします
2つ以上のパス、例えば、ユーザーがより一貫した開発をした後
拒絶戦略または閾値。 

![](/assets/images/Iii1eegplot2.jpg)

データの一部をマークした後
*REJECT*を押すと、新しいデータセットが作成されます。
削除されたデータを省略しました。 新しいデータセットはマーク付きで作成されます
削除された地域。 

*Ok*をクリックして、マークされたデータで新しいデータセットを作成する
削除された部分。

EEGLABは*EEG.event*構造を調節します
フィールドとインサート *境界* データが拒否されたイベント
データ部分の持続期間を保持する期間フィールドで
拒否。 EEGLABは、実験のバックアップコピーでこれらのイベントをリンクします
*EEG.urevent*構造に含まれているでき事の記録。 リジェクション
境界イベントは、その後のエポック選択が交差しないことを確認します
非連続拒絶境界。 したがって、継続的なデータに対する拒絶
'before' をデータエポックに分ける必要があります。 *boundary*イベント使用メニュー項目でデータをプロットする <span style="color: brown">Plot → チャンネルデータ(スクロール)</span> 以下に示すように新しいデータセットに(厚い赤いでき事の印は境界イベントです)。

![](/assets/images/Iii1eegplot1.jpg)

イラストの目的は、この拒絶反応のみを実行します。
EEGLABを再起動するか、メインウィンドウメニュー項目を選択することで元のデータセットに戻すこともできます。
<span style="color: brown">データセット → データセット 1: 連続EEGデータ</span>.

### データの悪い部分を拒絶するための戦略

データの悪い部分を拒絶する1つの戦略は、*Stack*ボタンを使用してデータをスタックすることです [eegplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m) ウィンドウ(右上隅)と、約30秒のデータを表示(時刻ウィンドウのサイズを変更する前のセクションを参照してください)。 以下に示すように、アーティファクトを簡単に見つけ、削除できます。 30秒のウィンドウを使用して、データのクリーニングを高速化できます。 連続したチュートリアルデータセットは既にきれいであることに注意してください。 以下に選択した領域は、ICAを使用してデータから引き落とされる可能性があるリンクです。そのため、それらはデータに残っている可能性があります(それらは、イラストの目的のために拒否するために選択されます)。

![画像:eegplot_norm.png](/assets/images/eegplot_norm.png)

### イベントを囲むデータの悪い部分を注入する

関心のあるイベントを囲むデータの一部を拒絶したい場合があります。 たとえば、TMS は EEG アンプを飽和させることが多いため、これらのイベントの周りにデータを削除する必要があります。 この場合は、 <span style="color: brown">編集 → イベントを使用してデータを選択</span> メニュー項目。 データに「TMS_pulse」*type*のイベントが含まれていると仮定すると、これらのイベントを取り巻くデータが2秒削除されます。

![画像:rm_event_tms_pulse.png](/assets/images/rm_event_tms_pulse.png)
