---
layout: default
title: c. Automated rejection
nav_title: "c. 自動拒絶反応"
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

![サイトマップ](/assets/images/Pop_loadset.png)

Clean Rawdata プラグイン
-------------------

<a href="https://github.com/sccn/clean_rawdata">Clean_rawdata(クリーンデータ)</a> EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のデフォルトでは、EEGLAB のプラグインが使用されます。 メニュー項目 <span style="color: brown">ツール</span> サブメニュー項目を押します
<span style="color: brown">クリーンなローデータ と ASR を調べる</span>.

![投稿ナビゲーション](/assets/images/pop_clean_rawdata_new.png)

異なるシーケンシャルプロセスを示すこのメニューにはいくつかのセクションがあります。
- について について について について このオプションは、EEGLABが実行するオプションです。 しかし、そうでなければ、そのオプション。 周波数の指定は、ハイパスの pc の pc の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t の t t の の t の t t t t の の t は の t t の t の の の t t t t の の t t の の t の t t t の t の の t t の t t t t t t t t t は t t t は は は t t t t t t は 

- 2番目のオプションは、悪いチャンネルを削除して取引します。 悪いチャンネルを削除するには3つの方法があります。 フラットチャンネルを削除できます。 標準偏差に基づいて大量のノイズを除去することができ、他のチャネルと相関するチャネルが削除される場合があります。 チャネル相関の拒絶しきい値が0.8に設定されます。 チャンネルの場所(アカウントチャンネルの場所を取る異なるヒューリスティックは、それらを持っている場合に使用されます - そして、我々は強く、自動化されたアーティファクト拒絶前にチャネルの場所をインポートする助言)、チャネルの拒否が異なることに注意してください。

- 3 アーティファクト サブスペースの復元 (ASR) は、 、 、 、 、 、 。 このチュートリアルでは、 <a href="broken link">アレンデックス</a> お問い合わせ  お問い合わせ  お問い合わせ  お問い合わせ  お問い合わせ  お問い合わせ とりあえず、 は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 と は、 は、 と は、 は、 と は、 は、 は、 は、 と と と は、 は、 は、 は、 は、 は、 と は、 は、 は、 は、 は、 は、 は、 と は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 は、 、  校正 差 します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します します  この より より より Riemannian は、実験中に公開されています。 <a href="https://www.frontiersin.org/articles/10.3389/fnhum.2019.00141/full">ニュース</a> お問い合わせ - ASRの著者C.コテーは、今日の対比を争います。

- 今後は、より一層の業務を遂行し、より一層の業務を遂行し、より一層の業務を円滑に進めていきます。 コマンドライン から から を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を

- 最後のオプションは、拒否されたデータを強調した結果をプロットすることができます。

以下に示すようにします。 詳細は、Redmark のアカウントでご確認ください。 古い 古い 古い 古い 古い 古い 古い 古い オーバー オーバー オーバー オーバー オーバー オーバー オーバー  この  この  この  この  この  この  この  この は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は は EEGポストプロセッシングでアネルギュレーション この作品は、

![投稿ナビゲーション](/assets/images/pop_clean_rawdata_new2.png)

他の方法による自動アーティファクト拒絶
-------------------
EEGLABのプラグインとレガシー EEGLAB のメニューは、顧客データと言語を組み合わせて、メニューは異なります。 <span style="color: brown">ファイル → 環境設定</span> チェックボックス *もし、EEGLAB*** を、EEGLAB** に、EEGLAB* を、 EEGLAB は、EEGLAB を、 する を を <span style="color: brown">ツール → 自動チャンネル拒否</span> (ヘルプメッセージを参照してください) [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_rejchan.m) 関数)および <span style="color: brown">ツール → 自動連続拒絶</span> (ヘルプを参照してください) [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_rejcont.m) .),EEGLAB のデフォルトメソッド な な な [このチュートリアルのセクション](/tutorials/misc/Rejecting_Artifacts_Legacy_Menus.html).
