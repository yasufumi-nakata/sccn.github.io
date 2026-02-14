---
layout: default
title: c. Spectra
long_title: c. Spectra
longtitle:
parent: 8. Plot data
grand_parent: Tutorials
---
チャンネルのスペクトラとマップのプロット
=====================
以下のチュートリアルセクションを読む以外にも、以下のEEGLAB(Youtubeでホストされている)で計算スペクトルの短いビデオを見たいかもしれません。 特に、このセクションで使用される Welch メソッドを記述するビデオ 1 と 2 を、このセクションで使用される EEGLAB 関数を記述するビデオ 5 をお勧めします。

<a href="https://www.youtube.com/playlist?list=PLXc9qfVbMMN2TAoLHVW5NvNmJtwiHurzw"><img align="center" width="400" src= "/assets/images/yt_spectopo2.png"></a>

サンプル EEGLAB データセットをロードする
-----------------

選択する <span style="color: brown">ファイル</span> メニュー項目および出版物
<span style="color: brown">既存のデータセットをロードする</span> サブメニュー項目。 EEGLABの「sample_data」フォルダにある「eeglab_data.set」を選択します。 それから *Open*を押して下さい。

![画像:Pop_loadset.png](/assets/images/Pop_loadset.png)

プロット チャネルのスペクトルおよび地図
-----------------

チャンネルのスペクトルと関連するトポグラフィマップをプロットするには、
<span style="color: brown">Plot → チャネルのスペクトラおよび地図</span>お問い合わせ これはポップアップ表示されます [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m) ウィンドウ(下)。 
デフォルト設定を残して、*Ok*を押します。

![](/assets/images/spectopo1gui.png)

関数は戻るべきです [スペックトップm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) プロット(下)。
データの50%だけをサンプル化したので(*Percent data...*編集)
上記)は、各呼び出しに若干異なる結果です。 (当然、
編集ボックスに100%を入れた場合はこれが発生しません。

![](/assets/images/spectopo1plot.png)

各色のトレースは、1つのデータの活動のスペクトルを表します
チャンネル. 左端のスカルプマップは、電力のスカルプ分布を示しています
これらのデータは正面の中間線に集中する6つのHzで。
他のスカルプマップは、10 Hzで電力の分布を示し、
22のHz。

ふりがな [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m) ウィンドウメニュー (above) を使用すると、ユーザーは
データ内の特定の時間ウィンドウで spectra を計算し、プロットします。 ふりがな
*Percent data...* 値を使用して計算を高速化できます(by)
0 に近い番号を入力するか、より明確な措置を返す
(100に近い番号を入力してください)

MATLABのコマンドラインでは、スペクトルを計算するためのパラメータ
Welchメソッドが露出します(ウィンドウサイズ128サンプルのオーバーラップなし)
窓)。 これらのパラメータを変更することができます。 メニュー項目を選択 <span style="color: brown">Plot → チャネルのスペクトラおよび地図</span> と *Spectral と scalp マップオプション* 編集ボックス, 入る
" *'winsize', 256, 'overlap', 128*". 

![](/assets/images/spectopo2gui.png)

これはより高い頻度のより滑らかなスペクトルで起因します
以下に示すように決断。

![](/assets/images/spectopo2plot.png)


関数は [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo) そして、 [スペックトップm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) また、epochedデータで動作します。

別のメニュー項目, <span style="color: brown">Plot → チャネル特性</span>, 選択したチャンネルのスカルプ位置をプロット, その
活動のスペクトル、およびその活動のERPイメージのプロット
シングルエポック。

*注記:MATLAB信号処理ツールボックスは、これらの機能を使用するMATLABパスにする必要があります。 EEGLABには、シグナル処理ツールボックスが存在しない場合の代替機能がありますが、その機能は限られています。 

※注: 分光中の電極の位置をプロットすることも可能です。
'' 'electrodes', 'on' '' を一番低いテキストボックスに入力することでグラフ
(*Scalpのマップオプション*) のインタラクティブ [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m)
ウィンドウ。

