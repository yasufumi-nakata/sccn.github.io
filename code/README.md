# 変換スクリプトとリソースを参照

テーマを活かした [ドキュメント](https://pmarsceill.github.io/just-the-docs/) Github wiki について 最も実用的な参照はあります [ナビゲーション構造ページ](https://pmarsceill.github.io/just-the-docs/docs/navigation-structure/) 左側のメニューを整理し、ページを作成したり、コンテンツの特定のテーブルを作成したりする方法を詳しく説明します。

*just-the-docs* は Jekyll のテーマです。一部の Jekyll のドキュメントは wiki の構成とカスタム機能に関連しています。 
* ページのグループ化とURLの生成方法を見るには、以下を参照してください。 https://jekyllrb.com/docs/pages/
* 前記変数は、ページのメタデータを提供する方法です。 ここまでは、ページのナビゲーション構造を制御する変数を心配するだけです(上のナビゲーション構造リンクを参照してください)。 Just-the-docs はこれらの変数を使用し、ナビゲーション機能を自動的に生成します。 カスタム機能では、プログラム的にそれらにアクセスすることで、フロント・ダイ・変数を活用することができます。 [*page* オブジェクト](https://jekyllrb.com/docs/variables/#page-variables). 
* Jekyllページとのコーディングは、液体、その言語を使用してプログラム的に、動的に静的ページにコンテンツを追加します。 ページの HTML で Liquid を混合できるという意味で PHP に似ていますが、PHP よりも強力で、Jekyll エコシステムのみで動作します。 液体の [ドキュメント](https://shopify.github.io/liquid/basics/introduction/) 参考文献です。 WebやJekyllの公式のドキュメントページで提供されているサンプルを特定の問題に見ていきます。
* いくつかの知識 [ディレクトリ構造](https://jekyllrb.com/docs/structure/) そして、 [テーマ](https://jekyllrb.com/docs/themes/) サイトのカスタム機能を記述するときに役立ちます, 時々、私たちは、単にドキュメントのテーマのデフォルトの動作を上書きする必要があります.
