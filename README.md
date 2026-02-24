# ログイン
EEGLAB wikiのWebコンテンツをホストする。
ライブページ: https://sccn.github.io

## メンテナーのノート
* ワークショップとチュートリアルページの内容は、保存されます [ワークショップ](https://github.com/sccn/sccn.github.io/tree/master/workshops) そして、 [チュートリアル](https://github.com/sccn/sccn.github.io/tree/master/tutorials) それぞれフォルダ。 使用条件 [Githubのマークダウン](https://guides.github.com/features/mastering-markdown) 編集とスタイルページのコンテンツ。
* 画像は保存されます [アセット・イメージ](https://github.com/sccn/sccn.github.io/tree/master/assets/images)お問い合わせ アップロードした画像をページ内でリンクするには、パス "/assets/images/<image_filename>"
* PDFファイルとzipファイルが保存されます https://sccn.ucsd.edu/githubwiki/files/<file_name>お問い合わせ これらのファイルは@dungscout96で手動でアップロードされます。 将来的には、ユーザがファイルをスズンサーバー自身にアップロードする仕組みを作成します。
* ワークショップページでは、壊れた画像やファイルリンクがある場合は、ファイルの命名が間違っている可能性は非常に高いです。 何らかの理由で、Mediawiki からエクスポートする際にファイル名を weirdly に大文字化しました。 ファイルがアセット/画像に存在するか、または https://sccn.ucsd.edu/githubwiki/files ファイルをアップロードする前にファイル名を最初に修正します。
* 通常、プッシュされたコミットがライブに行くのに数分かかります。 Jekyll をセットアップし、ノートパソコンのローカルで素早く変更をロードしたい場合は、以下の手順を参照してください。

### ノートパソコンに現地でサイトを運営する
* 指示に従ってJekyllを取付けて下さい: https://jekyllrb.com/docs/installation/. (参照) [詳しくはこちら](https://jekyllrb.com/docs/installation/macos/) macの場合
* リポジトリをクローンする: ``gitクローン https://github.com/sccn/sccn.github.io.git; cdのsccn.github.io``
* ログイン ``バンドルインストール`` テーマとその依存関係をダウンロードする
* ログイン ``バンドルは webrick を追加``
* ログイン ``バンドexec jekyllのサーブ`` そして、サイトは生きるべきです http://localhost:4000/
