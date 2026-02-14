---
layout: default
title: NFT
nav_title: "NFTの特長"
long_title: NFT
parent: Plugins
render_with_liquid: false
has_children: true
nav_order: 18
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/NFT).

# マトラボツールボックスとNeuroelectromagneticフォワードヘッドモデリング用のEEGLABプラグイン

![スクリーンショット 2024-07-25 に 13 28 55](https://github.com/user-attachments/assets/8871c122-dba0-4e1d-a976-7a4a8f6f7c6b)

# NFTとは?

ネウロエレクトロ磁気 フォワードモデリングツールボックス(NFT)はMATLABツールボックスです
利用可能なデータから現実的なヘッドモデルを生成するための(MRIおよび/または)
電極の場所)および解決のための計算の数値解決のため
電磁波イメージングのフォワードの問題(Zeynep Akalin)
Acar&S. Makeig、2010年。 NFTには、スカルプ、スカルプ、スカルプ、
cerebrospinal 流体 (CSF) および T1 級磁気からの脳組織
共鳴(MR)画像。 境界要素法(BEM)は、
前方問題の数値ソリューション。 抽出した後
セグメント化された組織のボリューム、表面 BEM メッシュが生成される場合があります。 いつか
MRイメージは使用できません。テンプレートヘッドモデルは警告される場合があります。
3D測定された電極の位置に、個別化したBEMの頭部を得るために
モデル。 Toolbox関数は、グラフィックユーザーから呼び出すことができます。
インターフェイス(gui) EEGLAB (sccn.ucsd.edu/eeglab)と互換性がある、またはから
MATLABコマンドライン 機能ヘルプメッセージとユーザーチュートリアルは、
含まれる。 ツールボックスは、非商用使用とオープンのために自由にご利用いただけます
GNUパブリックライセンスに基づくソース開発

# なぜNFT?

NFT はオープンソースライセンスで公開され、研究者が許可する
利益のために仕事に貢献し、改善するために
神経科学コミュニティ。 高度なヘッドモデリングと
問題解決方法および導入を容易に進めて下さい
ツールボックスを使うと、NFT は EEGLAB を補完します。
積極的な開発。 組み合わせて、NFT と EEGLAB は、自由に利用できる EEG を形成します
(そして将来的に、MEG) の源のイメージ投射の解決。

ツールボックスは、現実的なヘッドモデリングの主要な側面を実装し、
利用できる主題情報からの進む問題の解決:

1.  T1級の区分 MRイメージ: 優先方法
    リアルなヘッドモデルを生成し、3D全ヘッドを使用する
    被写体のヘッドの構造 MR イメージ。 ツールボックスは生成できます
    頭皮、頭皮、CSF、脳組織のセグメンテーション
    T1級画像。

2.  高品質 BEMの網: BEMソリューションの精度は、
    モデル組織の根底メッシュの品質
    導電変化の境界。 数値的な不安定性を避けるため、
    メッシュは自己断裁なしで局所的に正しい必要があります。 お問い合わせ
    高品質の要素を使用して表面を表現する必要がありますが、
    要素数をできるだけ小さく保ちます。 NFTはできます
    ヘッドから高品質のリニア表面BEMメッシュを作成する
    セグメント化。

3.  テンプレートヘッドモデルをワーピング: 全ヘッド構造のMRイメージの場合
    被写体が利用できず、半現実的なヘッド モデルは
    標準的なテンプレートBEMメッシュをデジタル化に警告することによって生成される
    電極座標(その逆に)。

4.  BEMの網が付いている電極の位置の登録: デジタル化
    電極の位置と BEM メッシュを計算するために整列する必要があります。
    正確な前方問題の解決およびリード フィールドのマトリックス。

5.  正確な高性能の進む問題の解決: NFT は、
    高性能 オープンソース METU-FP による BEM 実装
    バイオ電磁分野計算ツールキット。

# 必要なリソース

Matlab 7.0 以降は、任意のオペレーティングシステム (Linux、Windows) の下で動作します。
大量のRAMが便利です - 少なくとも2 GB(4-8 GB推奨)
現実的なヘッド モデルの前進問題の解決。 Matlabイメージ
処理ツールボックスもお勧めです。

次の3rdパーティプログラムの事前コンパイルされたバイナリが配布されます
NFT ツールボックス内でユーザの説得力があります。 バイナリはコンパイルされます
32ビットと64ビットLinuxディストリビューション

これらのプログラムはすべて、オープンソースライセンスを持ち、完全なソースコードを提供します。
各プログラムのホームページをご覧ください。
ソースコードとライセンス情報。

ASC: アダプティブ・スケルトン・クライミング
ホームページ: [http://www.cse.cuhk.edu.hk/~ttwong/papers/asc/asc.html](http://www.cse.cuhk.edu.hk/~ttwong/papers/asc/asc.html)

QSLIM:Quadricベースの表面の簡素化
ホームページ: [http://mgarland.org/software/qslim.html](http://mgarland.org/software/qslim.html)

BEM_MATRIX: METU-FPツールキット
ホームページ: [http://www.eee.metu.edu.tr/metu-fp/](http://www.eee.metu.edu.tr/metu-fp/)

PROCMESH:網の訂正および処理。 サイトマップ ソースコードについては、NFT開発者にお問い合わせください。

マットラボとITK
ホームページ: [http://www.sfu.ca/~vwchu/matitk.html](http://www.sfu.ca/~vwchu/matitk.html)

Note: MATITK 共有ライブラリは 'mfiles' ディレクトリにインストールされます。

# ダウンロード

NFTをダウンロードするには、EEGLABプラグインマネージャを使用します。

# NFT ユーザーマニュアル
詳細については、チュートリアルセクションを参照してください。 [NFTユーザーマニュアルをPDFブックとしてダウンロードするにはここをクリック](https://github.com/user-attachments/files/16383465/NFT_Tutorial.pdf)

作成と文書による:Zeynep Akalin Acar、zeynep@sccn.ucsd.edu

サポート: Yayha Shirazi、syshirazi@ucsd.eduからの限定サポートは利用できます

# NFTの特長 参照のペーパー

Zeynep Akalin Acar&Scott Makeig, [Neuroelectromagnetic] - ゼインプ・アカリン・アカル&スコット・メディグ フォワードヘッド
モデリングツールボックスhttp://sccn.ucsd.edu/%7Escott/pdf/Zeynep_NFT_Toolbox10.pdf).
<em>神経科学研究</em>, 2010

