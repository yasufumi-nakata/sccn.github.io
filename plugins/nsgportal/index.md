---
layout: default
title: NSGportal
long_title: NSGportal
parent: Plugins
render_with_liquid: false
has_children: true
nav_order: 25
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/nsgportal).

# NSGとnsgportalのEEGLAB
EEGLABのオープンポータルを高性能化 コンピューティング: 2018年後半に、ESGLABスクリプトは、Neuroscience Gateway PortalをNSFスポンサーに無料で利用できる高性能コンピューティングリソースで実行できるようになりました。 [コメットスーパーコンピュータ](https://ucsdnews.ucsd.edu/pressrelease/sdsc_to_double_comet_supercomputers_graphic_processor_count/) お問い合わせ [サンディエゴスーパーコンピュータセンター](https://sdsc.edu/)お問い合わせ Neuroscience Gatewayのホームページは、以下のとおりです。 NSGアカウントは無料で、米国のユーザーに限定されませんが、ポータルは非商用の目的のためにのみ使用することができる(参照) [NSG利用規約](http://www.nsgportal.org/policy.html)).

![スクリーンショット 2024-07-11 に 14 45 33](https://github.com/user-attachments/assets/ddccba01-f5f4-4337-ae08-2fd4cf96f916)

全て(個人を除く)のスーパーコンピューターと同様に、Matlabのインタラクティブなスタイルではなく、通常はバッチモードでジョブを実行します。 しかし、コメットには、すべてのMatlab関数とEEGLAB関数と多くのプラグイン拡張機能がインストールされています。 NSGポータルから送信されたジョブが実行されると、NSGからメールを受信して結果をダウンロードします。 これは、Open EEGLABポータルの最良の使用が、複雑な集中的なプロセスや/または、大規模なEEG研究の並列、自動処理のためのものです。 最初のカテゴリでは、我々は今、彗星に最も計算的に集中的なEEGLAB関数をインストールしています: AMICA、RELICA、時間/周波数分析、NFTを介してモデリングするSCALE最適化された個々の被写体ヘッドなど。 インストールした機能を利用することで、より詳細な情報が得られます。

Open EEGLABポータルの詳細な概要を読むには、 [会議用紙はIEEE/EMBS神経工学会議に提出しました](https://sccn.ucsd.edu/~scott/pdf/Delorme_Open_EEGLAB_Portal_NER18.pdf) サンフランシスコ(2019年3月)以降 [ネロイメージ](https://www.sciencedirect.com/science/article/pii/S1053811920302652) 記事。

このリポジトリには、REST API: nsgportal を通じて NSG ポータルを横断する EEGLAB プラグインのコードが含まれています。 プラグインのコア機能は、Arnaud Delormeによって最初に作成され、さらに、Ramon Martinez-Cancino、Dung Troung、Scott Makeig(EEGLAB Team)がSDSCのNSGチームから大幅に貢献しました。

# バージョン
v1.0 - Neuroimage 2020の記事に使用されるバージョン

v2.0 - 2020年11月NSGオンラインチュートリアルに使用されるバージョン(堅牢性とコマンドラインコールの増加)

v2.1 - Expanse で EEGLAB を使う。 仕事の投稿をブロックしない

**NSGPORTALの探索 メニュー [詳しくはこちら](https://github.com/sccn/nsgportal/wiki)**

