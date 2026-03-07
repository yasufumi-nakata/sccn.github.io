---
layout: default
title: c. Automated rejection
nav_title: "c. 自動アーティファクト除去"
long_title: c. Automated artifact rejection
parent: 6. Reject artifacts
grand_parent: Tutorials
---
自動アーティファクト拒絶
=====

EEGLAB をロードする
-------------------

メニュー項目<span style="color: brown">ファイル</span>からサブメニュー項目<span style="color: brown">既存のデータセットをロードする</span>を選択してください。EEGLABの「sample_data」フォルダにある「eeglab_data.set」ファイルを選択します。

![こちら](/assets/images/Pop_loadset.png)

Clean Rawdata プラグイン
-------------------

<a href="https://github.com/sccn/clean_rawdata">Clean_rawdata</a>はEEGLABにデフォルトでインストールされているプラグインです。メニュー項目<span style="color: brown">ツール</span>のサブメニュー項目
<span style="color: brown">Clean Rawdata と ASR によるデータ除去</span>を選択してください。

![](/assets/images/pop_clean_rawdata_new.png)

異なるシーケンシャルプロセスを示すこのメニューにはいくつかのセクションがあります。
- 1番目のオプションは、EEGLABが実行するハイパスフィルタの周波数指定です。 

- 2番目のオプションは、不良チャンネルの検出と除去を扱います。不良チャンネルを除去するには3つの方法があります。フラットチャンネルを除去できます。標準偏差に基づいてノイズの多いチャンネルを除去でき、他のチャネルとの相関が低いチャネルを除去できます。チャネル相関の拒絶しきい値はデフォルトで0.8に設定されています。チャンネルの位置情報がある場合は、それを考慮した異なるヒューリスティックが使用されます（自動アーティファクト拒絶の前にチャネル位置をインポートすることを強く推奨します）。チャネル位置の有無によりチャネル拒否の結果が異なることに注意してください。

- 3番目のセクションはアーティファクトサブスペース再構成（ASR）で、キャリブレーションデータに基づいてデータを補正します。詳しくは<a href="https://www.frontiersin.org/articles/10.3389/fnhum.2019.00141/full">ASRに関する解説記事</a>を参照してください。Riemannian幾何学を用いた手法も<a href="https://www.frontiersin.org/articles/10.3389/fnhum.2019.00141/full">発表されています</a>。なお、ASRの著者であるC. Kotheは、この論文の一部の比較結果に異議を唱えています。

- 4番目のオプションは、コマンドラインから実行することもできます。

- 最後のオプションは、拒否されたデータを強調した結果をプロットすることができます。

以下に示すように、赤色のオーバーレイは除去されたデータ部分を示しています。このプロットはEEG前処理におけるアーティファクト除去の結果を表示します。

![](/assets/images/pop_clean_rawdata_new2.png)

他の方法による自動アーティファクト拒絶
-------------------
EEGLABのプラグインとレガシーメニューでは、異なるアーティファクト除去手法を提供しています。<span style="color: brown">ファイル → 環境設定</span>でレガシーメニューを有効にすると、<span style="color: brown">ツール → 自動チャンネル拒否</span>（[pop_rejchan.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_rejchan.m)関数のヘルプを参照）および<span style="color: brown">ツール → 自動連続拒絶</span>（[pop_rejcont.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_rejcont.m)関数のヘルプを参照）が利用できます。EEGLABのデフォルトの手法については[このチュートリアルのセクション](/tutorials/misc/Rejecting_Artifacts_Legacy_Menus.html)を参照してください。
