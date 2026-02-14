---
layout: default
title: FirFilt
long_title: FirFilt
parent: Plugins
render_with_liquid: false
nav_order: 24
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/firfilt).

FIRFILT EEGLABプラグイン
-------------
FIRfilt EEGLAB プラグインは EEGLAB 環境で使用されるツールです。 FIRfilt は Finite Impulse 応答 (FIR) フィルターを使用して EEG データをろ過するためにとりわけ設計されています。 ここでは、FIRfilt プラグインの主な機能と機能は次のとおりです。

* フリル フィルター: FIRfilt は EEG のデータに FIR フィルターを加えるための簡単なインターフェイスを提供します。 FIRフィルタは、安定性とリニアフェーズ特性により一般的に使用されます。
* フィルター タイプ: ユーザーは、ローパス、ハイパス、バンドパス、バンドストップフィルタなど、さまざまな種類のFIRフィルタを作成できます。 この柔軟性により、ユーザーは特定の周波数帯域の利益を分離することができます。
* 設計方法: FIRfilt は、window メソッド、少なくとも squares メソッド、および equiripple メソッドなどの FIR フィルターを設計するためのいくつかの方法を提供しています。 各方法に特定のろ過条件によって自身の利点があります。
* グラフィック インターフェイス: プラグインは EEGLAB GUI と統合し、データ処理タスクのグラフィカルなユーザーインターフェイスを好むユーザーのためにアクセス可能にします。
* コマンドラインサポート: より高度なユーザーの場合、FIRfilt はコマンドライン操作もサポートし、スクリプトベースの自動化とより大きなデータ処理パイプラインへの統合を可能にします。
 
お問い合わせ [サイトマップ](https://eeglab.org/others/Firfilt_FAQ.html) または [ペーパー](https://home.uni-leipzig.de/biocog/eprints/widmann_a2015jneuroscimeth250_34.pdf) 追加のドキュメント。

参考文献
-------------
お問い合わせ

> Widmann, A., Schröger, E., & Maess, B. (2015). 電気生理学的データのためのデジタルフィルタ設計 - 実用的なアプローチ。 神経科学法ジャーナル, 250, 34-46.

EEGLAB の firfilt プラグインの機能を manuscript で使用している場合。

バージョン履歴
---------------
v2.8 - pop_eegfiltnew() に usefftfilt オプションを追加しました。

v2.7 - より良い境界イベントを処理する

v2.7.1 - 境界イベントのより良い取り扱い
