---
layout: default
title: c. Spectra
nav_title: "c. スペックトラ"
long_title: c. Spectra
longtitle:
parent: 8. Plot data
grand_parent: Tutorials
---
チャンネルのスペクトラとマップのプロット
=====================
以下の 以下の 以下の で で で で で で で で で で で この投稿をお気に入りにする Welch メソッドは、次のコマンドで、このコマンドは、次のコマンドを実行します。

<a href="https://www.youtube.com/playlist?list=PLXc9qfVbMMN2TAoLHVW5NvNmJtwiHurzw"><img align="center" width="400" src= "/assets/images/yt_spectopo2.png"></a>

EEGLAB をロードする
-----------------

選択する <span style="color: brown">ファイル</span> メニュー項目および出版物
<span style="color: brown">既存のデータセットをロードする</span> サブメニュー EEGLABの「sample_data」フォルダに「eeglab_data.set」があります。

![サイトマップ](/assets/images/Pop_loadset.png)

プロット チャネルのスペクトルおよび地図
-----------------

チャンネルのスペクトルと関連するトポグラフィマップをプロットするには、
<span style="color: brown">サイトマップ</span>お問い合わせ これはポップアップ表示されます [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m) ウィンドウ(下)。 
デフォルト設定は、

![](/assets/images/spectopo1gui.png)

関数は戻るべきです [お問い合わせ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) プロット(下)。
だけ50% を を を
上記)は、各呼び出しに若干異なる結果です。 (当然、
編集ボックスに100%を入れた場合はこれが発生しません。

![](/assets/images/spectopo1plot.png)

各色のトレースは、1つのデータの活動のスペクトルを表します
チャンネル. 左端のスカルプマップは、電力のスカルプ分布を示しています
線 線 線 線 Hzで。
他のスカルプマップ Hz の出力
22の Hz。

ふりがな [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m) ウィンドウメニュー (above)
ふりがな
*Percent data...* 値計算を高速化(by)
0 に近い番号を入力するか、より明確な措置を返す
(100に近い番号を入力してください)

MATLABの強み
Welch のウィンドウサイズ128 のオーバーラップなし
窓)。 これらのパラメータを変更することができます。 メニュー項目を選択 <span style="color: brown">サイトマップ</span> と *Spectral と scalp のオプション* 編集ボックス, 入る
" *'winsize', 256, 'overlap', 128*". 

![](/assets/images/spectopo2gui.png)

これはより高い頻度のより滑らかなスペクトルで起因します
以下に示すように決断。

![](/assets/images/spectopo2plot.png)


関数は [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo) そして、 [お問い合わせ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) また、epochedデータで。

別のメニュー項目, <span style="color: brown">Plot → チャネル</span>, 選択したチャンネルのスカルプ位置をプロット, その
活動の目的、およびその活動の
シングルエポック。

*注記:MATLABの処理ツールボックスは、機能の動作MATLABパスにインストールします。 EEGLABは、EEGLABの電子処理ツールボックスを配布しています。 

※注: 分光中の電極の位置をプロットすることも可能です。
'electrodes', 'on' に 一番速い テキスト ボックスに 'electrodes', 'on' に 'on' ' を 'electrodes'
(*Scalpのマップオプション*) [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m)
ウィンドウ。

