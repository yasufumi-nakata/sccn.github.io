# EEGLAB Wiki 日本語版

EEGLAB Wikiの日本語翻訳サイトです。本家 [sccn/sccn.github.io](https://github.com/sccn/sccn.github.io) のコンテンツを日本語化しています。

ライブページ: [https://www.yasufumi.net/sccn.github.io](https://www.yasufumi.net/sccn.github.io)

本家（英語版）: [https://eeglab.org](https://eeglab.org)

## メンテナーノート

* ワークショップとチュートリアルページのコンテンツは、それぞれ [workshops](https://github.com/yasufumi-nakata/sccn.github.io/tree/main/workshops) と [tutorials](https://github.com/yasufumi-nakata/sccn.github.io/tree/main/tutorials) フォルダに格納されています。ページの編集には [GitHub Markdown](https://guides.github.com/features/mastering-markdown) を使用してください。
* 画像は [assets/images](https://github.com/yasufumi-nakata/sccn.github.io/tree/main/assets/images) に格納されています。ページ内で画像をリンクするには `/assets/images/<画像ファイル名>` のパスを使用してください。
* PDFおよびZIPファイルは `https://sccn.ucsd.edu/githubwiki/files/<ファイル名>` に格納されています。
* 通常、コミットをプッシュしてからサイトに反映されるまで数分かかります。

## 翻訳に関するガイドライン

* **固有名詞は英語のまま**: EEGLAB、MATLAB、ICA、ERP、BIDS、STUDY、DIPFIT、FieldTrip、Octave、ICLabel、SIFT、LIMO、AMICA 等のツール名・技術名は翻訳しない
* **人名は英語のまま**: Arnaud Delorme、Scott Makeig、Makoto Miyakoshi 等の研究者名は翻訳しない
* **学術雑誌名は英語のまま**: Nature Physics、NeuroImage、J Neurosci Methods 等
* **技術用語は適切な日本語を使用**:
  - artifact → アーティファクト（「工芸品」「遺物」ではない）
  - reject (artifacts) → 除去（「拒絶」「注入」ではない）
  - reject (hypothesis) → 棄却
  - re-referencing → 再参照（「再会議」ではない）
  - dipole → ダイポール（「ダイキャスト」ではない）
  - function → 関数（「ディレクティブ」ではない）
  - edit box → 編集ボックス（「編集箱」ではない）
  - Table of contents → 目次（「コンテンツの表」ではない）

## ローカルでサイトを実行する

* Jekyllをインストールします: https://jekyllrb.com/docs/installation/ （[macOSの場合はこちら](https://jekyllrb.com/docs/installation/macos/)）
* リポジトリをクローンします:
  ```
  git clone https://github.com/yasufumi-nakata/sccn.github.io.git
  cd sccn.github.io
  ```
* テーマと依存関係をインストールします:
  ```
  bundle install
  ```
* WebRickを追加します:
  ```
  bundle add webrick
  ```
* サイトを起動します:
  ```
  bundle exec jekyll serve
  ```
  サイトは http://localhost:4000/ で閲覧できます。
