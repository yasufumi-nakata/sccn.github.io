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

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>EEGLAB の「sample_data」フォルダに、Eeglab_data.set というファイルがあります。

![こちら](/assets/images/Pop_loadset.png)

Clean Rawdata プラグイン
-------------------

<a href="https://github.com/sccn/clean_rawdata">Clean_rawdata(クリーンデータ)</a> EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のプラグインが使用されます。 メニュー項目 <span style="color: brown">ツール</span> サブメニュー項目を押します
<span style="color: brown">クリーンなローデータ と ASR を調べる</span>.

![投稿ナビゲーション](/assets/images/pop_clean_rawdata_new.png)

異なるシーケンシャルプロセスを示すこのメニューにはいくつかのセクションがあります。
- 1番目のオプションは、EEGLABが実行するハイパスフィルタの周波数指定です。 

- 2番目のオプションは、悪いチャンネルを削除して取引します。 悪いチャンネルを削除するには3つの方法があります。 フラットチャンネルを削除できます。 標準偏差に基づいて大量のノイズを除去することができ、他のチャネルと相関するチャネルが削除される場合があります。 チャネル相関の拒絶しきい値が0.8に設定されます。 チャンネルの場所(アカウントチャンネルの場所を取る異なるヒューリスティックは、それらを持っている場合に使用されます - そして、我々は強く、自動化されたアーティファクト拒絶前にチャネルの場所をインポートする助言)、チャネルの拒否が異なることに注意してください。

- 3 アーティファクト サブスペースの復元 (ASR) は、 データの校正差を補正します。このチュートリアルでは、 <a href="https://www.frontiersin.org/articles/10.3389/fnhum.2019.00141/full">ASRに関する解説記事</a> を参照してください。Riemannian 幾何学を用いた手法で、実験中に公開されています。 <a href="https://www.frontiersin.org/articles/10.3389/fnhum.2019.00141/full">ニュース</a> お問い合わせ - ASRの著者C.コテーは、今日の対比を争います。

- 4番目のオプションは、コマンドラインから実行することもできます。

- 最後のオプションは、拒否されたデータを強調した結果をプロットすることができます。

以下に示すようにします。詳細は、Redmark のアカウントでご確認ください。このオーバーレイは、EEGポストプロセッシングでアーティファクト除去の結果を表示します。

![投稿ナビゲーション](/assets/images/pop_clean_rawdata_new2.png)

他の方法による自動アーティファクト拒絶
-------------------
EEGLABのプラグインとレガシー EEGLAB のメニューは、顧客データと言語を組み合わせて、メニューは異なります。 <span style="color: brown">ファイル → 環境設定</span> チェックボックス *もし、EEGLAB*** を、EEGLAB** に、EEGLAB* を、 EEGLAB は、EEGLAB を、 する を を <span style="color: brown">ツール → 自動チャンネル拒否</span> (ヘルプメッセージを参照してください) [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_rejchan.m) 関数)および <span style="color: brown">ツール → 自動連続拒絶</span> (ヘルプを参照してください) [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_rejcont.m) .),EEGLAB のデフォルトメソッド な な な [このチュートリアルのセクション](/tutorials/misc/Rejecting_Artifacts_Legacy_Menus.html).
