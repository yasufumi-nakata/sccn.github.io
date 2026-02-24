---
layout: default
title: EEG-BIDS
nav_title: "EEG-BIDSについて"
long_title: EEG-BIDS
parent: Plugins
render_with_liquid: false
has_children: true
nav_order: 26
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/EEG-BIDS).

![EEG-BIDSについて](https://github.com/sccn/EEG-BIDS/assets/1872705/47675a55-6573-47d7-abec-48e364d5ad8a)

# EEG-BIDSについて

EEG-BIDS(旧**BIDS-MATLAB-tools**)リポジトリには、BIDS形式の実験をインポートおよびエクスポートする機能のコレクションが含まれています。 コードは、使用するコードを [エッグラボ](http://eeglab.org) プラグインは、EEGLABの独自に使用することもできます。 サポートされていないBIDSバイナリ形式からのデータフォーマットの変換は、EEGLABがインストールされている必要があります(サポートされている形式は、EEGLAB .setファイル、EDFファイル、BDFファイル、およびBrain Vision Exchange Formatファイルです)。

# ドキュメント

参照して下さい [wikiドキュメント](https://github.com/sccn/EEG-BIDS/wiki) EEGLABのウェブサイトにある場合、またはこのプラグインのサブメニュー。

# EEG-BIDSと他のBIDSソフトウェア

[BIDS-MATLABの特長](https://bids-matlab.readthedocs.io/en/latest/) BIDSデータをインポートするプロジェクトです。 BIDS-MATLABは、BIDSディレクトリアーキテクチャをMATLAB構造にマップしますが、EEG-BIDSなどのデータをインポートまたは変換しません。 理論的に、EEG-BIDSはBIDS-MATLABを使用して、BIDSディレクトリアーキテクチャをMATLABに取得し、EEGLAB STUDYに変換することができます。 しかし、2021年に、BIDS-MATLABは、関連するすべてのEEG、MEG、およびiEEGファイルをインポートできませんでした。 

[EEG2BIDSについて](https://github.com/aces/EEG2BIDS) BIDS 形式の EDF ファイルの集合をフォーマットした Python ベースの実行可能です。 EEG2BIDSは、メタデータ用にJSONファイルを作成するためにユーザーが必要です。 JSONファイルがあらかじめ用意されているラボプロトコルの一部としてデータをアーカイブするツールで、技術者がデータを整理するのに適しています。 EEG-BIDSのエクスポート機能は、研究者がデータを管理し、元のデータフォーマットに関する分析に適しています。

[エズビット](https://brainlife.io/ezbids/) MRIおよびfMRIデータ用のデータエクスポートツールです。 EEGデータを当社の知識にエクスポートすることはできません。

[データ2bids.m](https://www.fieldtriptoolbox.org/example/bids/) BIDSデータをエクスポートするためのFieldTrip関数です。 これは、EEGと多分fMRIを含みます. この関数はコマンドラインからのみ使用できます。

[EEG-BIDSについて](https://github.com/sccn/EEG-BIDS) (このプログラム)は、グラフィックインターフェイスと/またはコマンドライン(OpenNeuro上のBIDSデータセットの半分以上がEEG-BIDSを使用してエクスポートされたり、EEG-BIDSで2200以上のインストールが含まれている最も一般的なツールです)。 コンパイルされたスタンドアローンバージョンもすぐにリリースされます。

# EEG-BIDSエクスポート機能

EEGLABが読み取れる全てのファイルです。 

* EEGエクスポート: ✔ (.set、.edf、.bdf、または.vhmkファイルとして)
* iEEGエクスポート: ✔(.set、.edf、または.nwb)
* 目追跡の輸出:✔ (ベータ)
* HEDの輸出: ✔
* BEHエクスポート: ✔
* MRIエクスポート: ✔ (変換なし)
* fMRIエクスポート: ✔
* モーションキャップのエクスポート: ✔ (更新)
* EMGエクスポート: ✔ (更新)
* MEGエクスポート: ✔ (更新)

# EEG-BIDS EEGLABのインポート機能

EEG-BIDSでは、BIDSデータをEEGLABにインポートすることができます。 インポートできる情報の種類です。

* EEGのインポート: ✔ (すべてのフォーマット)
* iEEGのインポート: ✔ (すべてのフォーマット)
* MEG のインポート: ✔ (.ds と .fif ファイルがサポートされ、今後より多くのフォーマット)
* 目追跡の輸入: ✖ (upcoming)
* HEDの輸入: ✔
* BEHの輸入: ✔
* MRIの輸入:n/a
* fMRI の輸入: n/a
* モーションキャップのインポート: ✔ (ベータ)
* EMGのインポート: ✔ (更新)

# クローニング

サブモジュールでクローンを作成する

```
git clone --recurse-submodules https://github.com/sccn/EEG-BIDS
```

# EEGLABの利用

EEGLABプラグインフォルダにコードを配置するだけで、EEGLABは自動的に検出されます。 ドキュメントを見る [https://github.com/sccn/EEG-BIDS/wiki](https://github.com/sccn/EEG-BIDS/wiki).

# zip コマンドでプラグインを解放

```
zip -r EEG-BIDS8.0.zip EEG-BIDS/* -x /EEG-BIDS/testing/additionaltests/* /EEG-BIDS/testing/ds004117/* /EEG-BIDS/testing/hbn_eye_tracking_data/* /EEG-BIDS/testing/data/*
```

# バージョン履歴

v1.0 - 初期バージョン

v2.0 - 外部チャネルの場所のサポートを追加し、マイナーなバグを修正

v3.0 - 複数の実行のためのより良いエクスポートと複数の実行でBIDSフォルダをインポートすることができます

v3.1 - 件名番号を含む複数の問題をエクスポート時に修正

v3.2 - EEGLABでメニューの競合を入札バリデータで修正;チャンネルタイプをチェック; EEGイベントフィールドを選択するためのオプションを追加します。マイナーなバグ

v3.3 - Windowsの問題を修正し、GUIで動作します

v3.4 - メモリ内のデータセットを保存して問題を解決します。 参加者IDを匿名化したり、IDを匿名化したりすることはできません。 チャネルの位置を調べる問題を修正しました。

v3.5 - グラフィックインターフェイスでイベントタイプを選択すると問題を修正します。 BIDS情報のGUI編集のためのさまざまな修正

v4.0 - GUIと多くのマイナーなエクスポートの問題を修正

v4.1 - JSON で問題を解決する

v5.0 - すべてのOpenNeuro EEGデータセットをインポートするための主要な修正

v5.1 - データセットメタデータの品質を計算することができます

v5.2 - 履歴で問題を解決する

v5.3 - 刺激をエクスポートする機能を追加します。

v5.3.1 - tInfo のドキュメントを更新します。 HardwareFilters; eInfo に入力されていないバグのデフォルトフィールドを修正

v5.4 - BIDSデータをSTUDYにインポートする際にBIDS情報を読み込むことで問題を修正

v6.0 - HED の新しい例と修正

v6.1 - イベントなしでデータを許可します。 Fix HEDインポート/エクスポート。 履歴を修正。

v7.0 - 異なる関数にコードを分割します。 行動データのサポート 各種バグ修正

v7.2 - 不足しているファイルで問題を修正します。

v7.3 - さまざまなマイナーフィックス(文字列としてEEG参照)。存在しない場合、期間を追加します。データセットを保存します。

v7.4 - HEDとBIDSのバージョンの問題を修正します。 順序で主題を輸出して下さい。 未使用の列を参加者に削除します。 tsv ファイル

v7.5 - 特定の実行をロードするためのコルドシステムファイルのサポートを追加し、モーションファイルのサポート

v7.6 - 非EEGLABのフォーマットに輸出を追加し、輸出を再ファクタリング

v7.7 - MEGとMEFファイルをインポートする修正。 実行のよりよい処理。 BIDSでツールバージョンを追跡します。

v8.0 - 変更されたファイル、タスク情報用の別々のファイル、BIDS統計出力を追加し、EGI&BVAファイルをよりよく処理し、チャンネルタイプとユニット、目の追跡と行動サポートを追加

v9.0 - BIDSキーレベルの継承原則に準拠するためにjsonインポートを更新します。 iEEGおよびMEGの輸出を支えて下さい。 複数のタスクをエクスポートするサポート チャネルの場所をエクスポートする問題を修正しました。 BIDS輸出ウィザード。
