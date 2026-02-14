---
layout: default
parent: NSGportal
grand_parent: Plugins
render_with_liquid: false

title: Setting-up-the-plug-in
long_title: Setting-up-the-plug-in
---
# プラグインの設定

## プラグインのインストール

一般的に、EEGLABのすべてのプラグインは、*nsgportal*を含んでおり、2つの異なる方法でインストールすることができます。 *nsgportal*を取付けるため:

1. EEGLAB プラグインマネージャから: EEGLAB を起動し、**File -> EEGLAB拡張機能**の管理 プラグインマネージャー GUI がポップアップします。 このGUIから、メインウィンドウからプラグイン*nsgportal*を選択し、[インストール/アップデート]ボタンをクリックしてプラグインをインストールします。
2. ウェブから: プラグイン* nsgportal*のコンテンツでzipファイルをダウンロードする [GitHubで](https://github.com/sccn/nsgportal) ページ(GithubでZipをダウンロード)またはEEGLAB wikiページからプラグインを選択 [詳しくはこちら](https://sccn.ucsd.edu/wiki/Plugin_list_all)お問い合わせ フォルダ*./eeglab/plugins*でzipファイルを解凍し、EEGLABを再起動します。

## NSG認証情報の設定
メニュー項目の使用**ツール>NSGツール> NSGポータルの認証と設定** NSGユーザー名とユーザパスワードを入力するだけです(このページの上の説明を参照してください)。 入力**NSGキー**と**NSGウル**は変更する必要はありません。 エントリー**出力フォルダ**は、NSGデータがダウンロードされるフォルダです。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-Nsgcredentials.png?raw=true" alt="drawing" width="500"/>
</center>