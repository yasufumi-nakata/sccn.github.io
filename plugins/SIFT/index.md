---
layout: default
title: SIFT
long_title: SIFT
parent: Plugins
render_with_liquid: false
has_children: true
nav_order: 7
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/SIFT).

![263416749-1abc1d2d-36bb-4cfb9328-b57a96044f55](https://github.com/user-attachments/assets/b45a5caa-6b39-4291-b137-125132e5ade0)

## ソース情報フローツールボックス

開発:ティム・ムレン2009-
維持: ティム・ムレンとアルナード・デローム

SIFTは、EEGLAB対応のツールボックスです。
ソース間の多variateの因性および情報の流れ
電気生理学的(EEG/ECoG/MEG)活動。 スイートから構成される
統合されたグラフィカルユーザーインターフェイスを備えたコマンドライン機能
複数の機能への容易なアクセス。 現在6つのモジュールがあります:データ
前処理、モデルフィッティング、コネクティビティ推定、統計
解析、可視化、グループ解析、神経データシミュレーション

現在の実装方法は次のとおりです。

-   プリプロセスルーチン
-   時給(適応型)多品種オートレガシーモデリング
    -   グランガー因果
    -   ダイレクト転送機能(DTF、dDTF)
    -   部分的な指示された一貫性(PDC、GPDC、PDCF、RPDC)
    -   複数の部分的な一貫性
    -   イベント関連の分裂(ERSP)
    -   その他多くの対策
-   Bootstrap/resamplingおよび分析統計
    -   イベント関連(ベースラインからの差)
    -   間条件(条件A =条件Bのためのテスト)
-   インタラクティブな情報可視化のためのプログラム
    時間および頻度を渡る流れの動的(任意3Dと)
    MRI-coregistered source-spaceの可視化

## アクノレッジメント

- Arnaud Delorme は、SIFT フレームワークの開発と EEGLAB への統合に尽力し、初期の BrainMovie3D コードに貢献しました。
- クリスチャン・コテは、機能I/Oと自動GUI生成のためのarg()フレームワークに貢献しました
- Wes Thompsonはベイジアンスムースとマルチサブジェクト解析のための統計と方法に相談しました
- Alejandro Ojedaは高速リッジ回帰のためのルーチンに貢献しました

SIFT では、以下のオープンソースパッケージ(またはインスパイアされた)からルーチンを利用しています。

- [アフィット](https://github.com/tapios/arfit) (シュナイダーら)
- [TSA/バイオシグ](http://octave.sourceforge.net/tsa/) (Schlögl ら)
- [ログイン](https://chronux.org) (Mitra ら)
- [ダル/SCSA](https://ttic.uchicago.edu/~ryotat/softwares/dal/) (富岡 / ハウフェ ら)
- [BCILAB株式会社](http://sccn.ucsd.edu/wiki/BCILAB) (コテら)


## ドキュメント

詳細はこちら [SIFT ウィキ](http://sccn.ucsd.edu/wiki/SIFT) またはEEGLABのウェブサイトでこのページを閲覧している場合は、サブメニューを使用します。

## インフォメーション

このツールボックスがあなたの研究に有用であるならば、PLEASEは、SIFTを使用するあらゆる出版物および/またはプレゼンテーションで次の引用を含みます。

1. ムレン、T.R.(2014)。 ダイナミックな脳:人間の電気生理学的記録(第3639187号)からのニューラル・ダイナミクスと相互作用のモデル化。 カリフォルニア大学(カリフォルニア大学)、ProQuest Dissertations&I. (1619637939)
2. Delorme、A.、Mullen、T.、Kothe C.、Akalin Acar、Z.、Bigdely Shamlo、N.、Vankov、A.、Makeig、S.(2011) "EEGLAB、SIFT、NFT、BCILAB、ERICA: 高度なEEG/MEG処理のための新しいツール。 計算インテリジェンスと神経科学 vol.2011、記事ID130714、12ページ。

## ライセンス

SIFT は GPL-2 の下でライセンスされ、 LICENSE を参照してください。 ログイン
あなたが読み、同意する権利の条項と合意した権利の任意の使用:

## 追加ノート

SIFTは研究目的だけのために設計され、配られます。 SIFTは医療目的で使用しないでください。 著者は、この方法での使用について一切の責任を負いません。

## バージョン

v1.6 - BrainMovieプラグインとの競合を修正します。 マイナーなGUIの問題を修正しました。
