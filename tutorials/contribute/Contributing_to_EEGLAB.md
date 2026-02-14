---
layout: default
title: Modify EEGLAB code
long_title: Modify EEGLAB code
parent: Contribute
grand_parent: Tutorials
nav_order: 3
---
EEGLABコアコードへの貢献
========================
お問い合わせ

メインの EEGLAB リポジトリは新しい関数を追加する場所ではありません。 代わりに、これは EEGLAB エクステンション/プラグインを作成することによって行われます。 ただし、コアコードを変更してバグを修正したり、既存の機能にマイナーな改善を加えることもできます。 

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

EEGLAB開発モデル
-------------------

### EEGLABの歴史

EEGLABソフトウェア設計者のチーフはArnaud DelormeとScott Makeigです。 EEGLAB、ICA/EEG Toolbox(1997-2001)のプレデッサ
Tony Bell、Colin Humphries、SigurdとMakeigによって書かれた機能
Enghoff、Tzyy-Ping Jung、Te-Won Leeなど、最初にリリースされました。
1997年 スコッツ・マディグによる計算神経生物学
サーク・インスティテュート、ラ・ホラーのテルレンス・セジュノスキの研究室。 

EEGLABの統合ツールボックスの最初のバージョンは、
Delorme と Makeig は、多くの貢献を伴います。
Marissa Westerfield、Jörn Anemüller、Luca Finelli、Robert Oostenveld、
Hilit serby, Toby Fernsler, ニマ シャムロ Bigdeley、Jason Palmer、その他多数
その他。 専用のベータテスターには、アンドレアス・ロメイケと彼のチームが含まれます。
EEGLABの試験スイート、その他上級者向けのテストスイートを開発
Stefan Debener と Andreus Widmar. 

EEGLABの開発は、Swartz Center for Computational Neuroscience (SCCN) のインスティテュートで中心になりました。
カリフォルニア大学サンディエゴ校(UCSD)での神経コンピューティング コアEEGLABのメンテナンスと開発は、米国国立神経疾患研究所および脳卒中(NINDS)がサポートしています。 

EEGLABコアコードは、直接第三者によって変更することはできません。 代わりに、
ユーザーの投稿 [プルリクエスト](/tutorials/contribute/Contributing_to_EEGLAB.html#forking-the-eeglab-repository)お問い合わせ EEGLABコア開発者は、
コードを見直し、リポジトリに追加します。

サードパーティの開発者にとって、ユーザーとのコラボレーションを歓迎します。
オープンソースの開発者がEEGLABの機能および/または拡張し、改善します
独立して EEGLAB プラグイン/拡張アプリケーションを作成およびリリース
そして環境。 プラグインを書いているなら、
研究室では、本ページに記載されているように、他の人が使用するためにそれらを解放することを検討してください。

EEGLABは、オープンソース開発を積極的に行っています。 ユーザーと共に
開発者は、オーバーサブジェクトを含む機能を拡張しています。
一般的なリニアモデル統計。 ユーザーの機能と機能
提案を歓迎し、EEGLABの相互接続を奨励し、計画します
その他のMATLAB対応ツールボックス

### オープンソースモデル

EEGLABはオープンソースソフトウェア環境であり、無料でご利用いただけます。
任意のユーザに請求します。

しかし、EEGLABでは、商用購入やインストールが必要です。
[MATLABソフトウェア環境](http://www.mathworks.com/store/)お問い合わせ マトラボ
バージョン2008b以降が必要です。 最新の使い方をおすすめします。
MATLAB. MATLABとEEGLABは、Linux/Unix、Mac OS X、または
ウィンドウズ。 MATLABを購入すると、MATLABの学生が高価にすることができます
バージョンは通常$ 50 US付近で価格です。

アドオンMATLABツールボックスの依存関係をすべて削除しようとしました。
したがって、EEGLABコア分布を実行するには、追加のツールボックスは必要ありません。 しかし、いくつかの高度なプラグインツールボックスは、
特定の MATLAB ツールボックスから関数を使用する: ドキュメントを参照してください。
詳しくはこちら

すべての EEGLAB 処理機能 (グラフィックインターフェイスではありません) も無料で実行できます
[Octave 環境](http://www.gnu.org/software/octave/download.html)お問い合わせ EEGLABは、MATLABを必要としないコンパイルされたプログラムとして存在します。

### ライセンスとクレジット

EEGLAB は [BSD] で配布されます。
    ライセンスhttps://opensource.org/licenses/BSD-2-Clause)。 その他
    EEGLABに追加する機能が利用可能になりました
    このライセンスに基づく商用および非商用利用

コントリビューターは GitHub で認識され、メインソースコードにコミットしたコミットを記録しています。 

*extension* または *plugin* オプションを記述する
以下のセクションで。 EEGLABの拡張機能により、著者が柔軟に対応
EEGLABメニューに新しい機能を組み込む
拡張子をダウンロード. 著者はまた、書き込み機能にすべての商用権利を保持します。

### 行動規範

コミュニティを重視する行動規範を追究し、
[Ubuntu ] が最初に説明したコラボレーション、尊敬、責任
コミュニティhttps://ubuntu.com/community/code-of-conduct).

### GITによるコードの貢献

EEGLABのコアコードにコードを付与し、コードをフォークして作成する
下の要求として引き。 Githubアカウントが必要です
これらの操作を実行するが、特別な許可を必要としません
私たちから。

EEGLABリポジトリのフォーク
---

メインの EEGLAB リポジトリは新しい関数を追加する場所ではありません。 お問い合わせ
新しい機能を追加したい、EEGLAB を書く
[プラグイン](/tutorials/contribute/Contributing_to_EEGLAB.html) 代わりに。

### EEGLABリポジトリをフォークする理由
このページでは、GitHub、Git、バージョン管理に少し精通していると仮定しています。

ソフトウェアリポジトリをフォーク(コピー)することで、リポジトリのコピーを作成
あなたに属します。 これにより実験が可能
既存のコードに影響を与えない。 完了したら
変更は、それらを(それらをプッシュ)メインに転送することができます
*pullリクエスト*を使用してリポジトリ(*)
*pushリクエスト* と呼びますが、ソフトウェアコミュニティは
メインリポジトリの観点から名前を付けます。
<em>プルリング</em> あなたの変更に)。 このページが紹介されました
EEGLABリポジトリをフォークする基本 Githubはプロシージャを非常にさせます
シンプル。

### EEGLABリポジトリのフォーク

Github から EEGLAB リポジトリをフォークするには、次の 2 つの単純な
ステップ:

1.  Github で [EEGLAB] に行く
    リポジトリ(Repository)https://github.com/sccn/eeglab)
2.  ウィンドウの右上隅にある「*Fork*」をクリック(図を参照)
    お問い合わせ

![センター\|thumb\|700px](/assets/images/Fork_link.jpg)

これらの2つのステップを実行したら、あなたは成功したでしょう
EEGLABリポジトリの独自のコピーを作成しました。 新しいリポジトリが見える
あなたがフォークしたEEGLABリポジトリのように正確に、フォークされたコピー
ユーザー名アカウントの下にあります。

![センター\|thumb\|700px](/assets/images/Fork_username.jpg)

### あなたのフォークされたコピーで作業

Githubでフォークを作成したら、設定する必要があります
*git* はコンピュータで EEGLAB のコードコピーで作業を開始できます。 それから
コンピュータにフォークされたリポジトリをクローンする必要があります。

-   Githubでフォークされたリポジトリページに移動します。 これは、
    上記の図で説明したページと同じです。
-   画面の右側にあるボタン*クローンまたは
    ダウンロード* をクリックしてクリックします。

![センター\|thumb\|700px](/assets/images/Clone_link.jpg)

-   クローン HTTPS セクションでリンクをコピーします。

![センター\|thumb\|400px](/assets/images/Clone_https_link.jpg)

-   コンピュータの端末を開き、*git clone* を入力し、貼り付けます。
    前のステップでコピーしたリンクを実行します。

`$git clone `[`https://github.com/yourgitusername/eeglab.git`](https://github.com/yourgitusername/eeglab.git)

これらの手順に従って、EEGLABコードの変更を開始することができます。

### プルリクエストの発行

コードの変更に満足したら、GitHubにコミットしてください。 それから、Githubに戻る
*pullリクエスト*を発行します。 変更が評価され、承認されると
EEGLABのチームによって、EEGLABのマスターコードに統合されます。

![センター\|thumb\|700px](/assets/images/Pullrequest1.png)

EEGLABリポジトリにマージするためにフォークされたブランチを選択できる画面が表示されます。 Note: 常にマージする
EEGLABの「デベロプ」ブランチに。

![センター\|thumb\|700px](/assets/images/Pullrequest2.png)

### プルリクエストの検討

事前承認のため:
-   新しい機能を追加した場合は、両方の機能が動作することを確認してください。
    グラフィックインターフェイスとMATLABコマンドラインから。 お問い合わせ
    シンプルなテストスクリプトでこれを実証します。
-   修正された関数でテストケースを実行します。 可能であれば、テストケースを [EEGLABテストケースリポジトリ](https://github.com/sccn/eeglab-testcases).
-   あまりにも多くの文書を追加することはできません。 ドキュメントを必ず確認
    あなたの変更は明確にそして徹底的に!
-   単一機能変更のための問題の引き。
-   多数の化粧品の変更(刻み等)を作ることを避けて下さい。 変更が多すぎると、レビューに時間がかかることがあります。
