---
layout: default
title: EEGLAB Extensions
nav_title: "EEGLAB拡張機能"
long_title: EEGLAB Extensions
parent: Download EEGLAB
---
EEGLABエクステンションとプラグイン
====

EEGLABエクステンションまたはプラグインにより、ユーザーは新しいデータをビルドして公開することができます。
EEGLABのデータ構造を用いた処理および/または可視化機能
そして大会。 プラグイン機能は、簡単に使用してテストすることができます
EEGLABメニューに紹介する新しいメニュー項目を選択します。 EEGLABは、E*plugins*を直接ダウンロードしてインストールすることができます。 <span style="color: brown">ファイル → EEGLAB 拡張機能の管理</span> メニュー
項目。

<details open markdown="block">
  <summary>
    目次
  </summary>
- トピックス
</details>

異なるEEGLABバージョン用のプラグインのリスト
-----------------------------
プラグインの処理方法は、EEGLABの履歴、リードによって変更されています
より最近のバージョンと異なるシステムでより自動化
プラグインの保存と管理 (プラグイン自体は多くの場合、
異なるプラグイン管理システム間で同じ)。 リスト
以下のプラグインは、利用可能なプラグインのリストと同じです
EEGLAB 対応する EEGLAB バージョンの EEGLAB プラグイン マネジャーを通して。

-   [EEGLAB 2019.1以降のプラグインの現在のリスト](https://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php)を参照してください。
-   [EEGLABのプラグインの一覧(2019.0)](https://sccn.ucsd.edu/wiki/Plugin_list_all)(このページのプラグインはなし
    更新しました)
-   詳細はこちら [インポート](https://sccn.ucsd.edu/wiki/Plugin_list_import) そして、 [データ処理](https://sccn.ucsd.edu/wiki/Plugin_list_process) EEGLABの拡張
    13.xおよび14.x (プラグインおよびページは更新しません)

プラグインをインストールまたは更新するには
------------------------------

プラグインは、EEGLABプラグインマネージャを使用してインストールすることができます, メニューを使用して
アイテム <span style="color: brown">ファイル → EEGLAB 拡張機能の管理</span>.

もはやお勧めしませんが、プラグインはまだインストールできます
手動で。 プラグイン用のzipファイルをダウンロードした後、
EEGLAB "plugins" でプラグインファイルをダウンロード
サブディレクトリ。 プラグインの古いバージョンを削除します。
ディレクトリに存在する。 EEGLABを再起動します。 起動中、
EEGLAB は、MATLAB コマンドラインで以下を印刷する必要があります。

``` matlab
> eeglab: adding plugin "eegplugin_myplugin" % (see >> help eegplugin_myplugin)
```

プラグインは、通常、1つ以上の新しいアイテムを追加して、
EEGLABメニュー(*Import data* または *Tools* 見出し以下)

プラグインをアンインストールするには
----------------------

プラグインは EEGLAB 拡張機能から簡単に削除できます。
マネージャー。 あるいは、フォルダーを移動したり削除したりすることもできます。
EEGLAB プラグインのフォルダーと EEGLAB を再起動します。

新しいプラグインを作成する
--------------------------------------

簡単な手順を参照してください。 [EEGLABへの貢献](/tutorials/contribute/) EEGLAB互換コードを作成する。

次に、EEGLAB ユーザが使えるように、上記のリストに拡張機能を追加できます。
EEGLABから自動的にダウンロードします。 これを行うには、[このフォーム](http://sccn.ucsd.edu/eeglab/plugin_uploader/upload_form.php)を使用する。
プラグインの新しいバージョンをアップロードしたい、
[この単純化されたフォーム](http://sccn.ucsd.edu/eeglab/plugin_uploader/version_update.php).

管理者は、これらはメンテナンスページです。
[プラグインリクエスト](https://sccn.ucsd.edu/eeglab/plugin_uploader/protected/pending_requests.php)
[プラグインの編集情報](https://sccn.ucsd.edu/eeglab/plugin_uploader/protected/edit_plugin.php).

プラグイン/拡張子の古いバージョンにアクセスするには
------------------------------------------------------

必要に応じて、プラグインの古いバージョンが直接使用可能です
ダウンロード
[http://sccn.ucsd.edu/eeglab/plugins/](http://sccn.ucsd.edu/eeglab/plugins/).
EEGLAB拡張マネージャでインストールできません。 シンプル
zip ファイルをダウンロードして、*eeglab/plugins/* フォルダに解凍します。
(プラグインの他のバージョンを削除してください)
インストール済み)

人気の EEGLAB プラグイン
---------

EEGLABで利用可能な一般的なプラグインは以下の通りです。 EEG研究者が利用できる方法が評価されていないため、EEG研究者は徹底的に推奨しています。
実験に適用するあらゆる方法の基礎を研究し、考慮して下さい
データ。 EEGLABで利用可能な120プラグインが現在あるため、下記のリストは完了していません。 プラグインが500ダウンロードに達した場合、下記のリストに表示されない場合は、お知らせください。

### EEGLAB デフォルトプラグイン

これらのプラグインは EEGLAB コードとともに配布されます。

-   **[FIRfilt](https://github.com/widmann/firfilt):** EEGLABのデータに様々な線形フィルタを適用します。

-   **[Clean_rawdata](https://github.com/sccn/clean_rawdata):** Artifact Subspace Reconstruction を含むさまざまな方法を使用して未加工 EEG データをクリーニングします。

-   **[DIPFIT](https://github.com/sccn/dipfit):** 独立成分のダイポールモデリング
    球面または境界要素ヘッドモデル。 関数を使う
    FIELDTRIPツールボックス

-   **[ICLabel](https://github.com/sccn/IClabel):** EEGLAB用の自動EEG独立したコンポーネント分類プラグイン。

### データ収集

- **[App-MATLABビューア](https://github.com/labstreaminglayer/App-MATLABViewer/)*: EEG LSL を EEGLAB .set ファイルとして記録します。

### データインポート

これらの拡張子は、さまざまな種類のデータをインポートすることができます。 EEGLABはありますが
いくつかのデータフォーマットをインポートするネイティブ機能、以下のプラグイン
その他のフォーマットに対応 多くのデータインポート拡張プラグインがあります。
以下に最も人気のあるもののみが含まれている。

- **[bids-matlab ツール](https://github.com/sccn/bids-matlab-tools)*: bids-matlab-tool リポジトリには、BIDS (Brain Imaging Data Structure) 形式の実験をインポートおよびエクスポートする機能のコレクションが含まれています。

- **[Biosig](http://biosig.sourceforge.net/):** さまざまなデータフォーマットをインポート/エクスポートします。

- **[File-IO](https://github.com/fieldtrip/fileio):** 複数のデータフォーマットをインポートできるツールボックスです。EEGLABと重複する機能もありますが、独自機能も含まれています。

- **[ANTeepimport](https://www.ant-neuro.com/support/supporting-documentation-and-downloads)**: ANT EEG社のEEP形式のデータをインポートします。

- **[bva-io](https://github.com/arnodelorme/bva-io)**: Brain Vision Analyzer形式のファイルをインポート/エクスポートします。

- **[Neuroscan-io](https://github.com/sccn/neuroscanio)**:Neuroscanソフトウェアから/へのインポート/エクスポートファイル。

- **[MFFMATLABIO](https://github.com/arnodelorme/MFFMATLABIO)**: EGI社のMFF形式ファイルをインポート/エクスポートします。

- **[xdfimport](https://github.com/xdf-modules/xdf-EEGLAB)**: XDF (LSL) 形式のファイルをインポートします（EEGストリームとEEGマーカーストリームのみ）。

- **[Mobilab](https://github.com/sccn/mobilab)*: XDF (LSL) 形式のファイルをインポートし、異なるサンプリングレートのストリームをEEGLABで共同処理できるように統合します。

### 事前処理

-   **[IIRfilt](https://github.com/sccn/IIRfilt):** 短い適用
    EEGLABのデータに対する非線形無限衝動応答フィルタ。

- **[REST](https://github.com/sccn/REST):** scalp EEGの記録の参照を無限点に標準化する方法。

-   **[AAR](http://kasku.org/aar/):** 自動アーティファクト除去ツールボックスは、EEGにおける眼球および筋肉アーティファクトの自動除去のための最新手法を統合することを目指しています。

-   **[Vised Marks](https://github.com/BUCANL/Vised-Marks):** EEGLABのVised Marks拡張機能は、標準の*eegplot*データスクロール図に編集機能を追加します。具体的には、イベントマーカーの追加/編集、チャネル/コンポーネントのフラグ付け、時間区間のフラグ付け、マーク構造のプロパティ表示ができます。

-   **[get_chanlocs 関数](https://github.com/sccn/get_chanlocs/wiki):** get_chanlocs EEGLAB プラグインは、3D のスキャンされたヘッドイメージから 3D の電極の位置を見つけます。 これらの画像をオフシェルフ機器で入手する方法に関するチュートリアルが含まれています。

### EEG/fMRIアーティファクト除去

-   **[FMRIB](http://www.fmrib.ox.ac.uk/%7Erami/fmribplugin):** EEGLABのデータからfMRI環境由来のアーティファクトを削除します。
    エクステンションにより、スキャナー関連のアーティファクトの除去が可能
    fMRIスキャン中に収集したEEGデータから。 詳しくはこちら [GitHubリポジトリ](https://github.com/sccn/fmrib).

-   **[ベルゲン](https://www.uib.no/en/rg/fmri/):** fMRI関連の勾配のアーティファクトの除去
    同時 EEG-fMRI データ。 EEGLABが提供するBERGEN拡張機能
    グラデーションアーティファクト補正のための異なる方法を持つGUI。

### ICAベースのアーティファクト除去とコンポーネント分類

-   **[MARA](http:in.de/irene.winkler/artifacts//www.user.tu-berl/):** 人工の独立した自動識別
    コンポーネント。 MARAとは
    6つの抽出によって専門家の評価から学ぶ線形分類器
    空間、スペクトル、およびテンポラルドメインからの機能。

-   **[FASTER](https://sourceforge.net/projects/faster/):** 完全自動の教師なしメソッドを実装
    高密度EEGデータの処理 FASTERは、ICAに基づくデータインポート、エッチング、リレファレンス、グランド平均作成、自動チャンネル、エポック、アーティファクト拒否などの一般的な機能を含みます。

-   **[ADJUST](http://www.unicog.org/pm/pmwiki.php/MEG/RemovingArtifactsWithADJUST):** ステレオタイプ化されたアーティファクト固有の空間・時間特徴を組み合わせて、アーティファクト関連の独立成分を識別する完全自動アルゴリズムです。

-   **[CORRMAP](https://github.com/sccn/corrmap):** 共通するEEGアーティファクトの半自動同定
    テンプレートに基づく。 CORRMAP拡張は、セットのセットで構成されています
    MATLABの機能により、識別とクラスタリングが可能
    一般的なEEGアーティファクトを表す独立したコンポーネント。

-   **[CIAC](http://www.debener.de/CIAC_tutorial/ciacplugin.html):** 人工内耳アーティファクト補正は半自動
    電気アーティファクトの修正のためのICAベースのツール
    コクレアーインプラントから発信

-   **[RELICA](https://github.com/sccn/relica)*: RELICAの目標は、データフレームやエポックの多くのランダムなブートストラップ選択を渡る分解データから最も安定的に分離されるICプロセスを特定することです。

-   **[MP_クラスタリング](https://github.com/sccn/mp_clustering)*: EEG対策を計画するための予測分析のためのツールボックス タグ別
    一般的なテンプレートの脳空間にソースの場所, ローカルのテスト
    空間測定の整合性および測定一貫性のある脳を解析
    測定可能なドメインへの領域。

-   **[リーガシー](https://doi.org/10.1016/j.bspc.2011.02.001):** EOGアーティファクトを除去する拡張
    ICAコンポーネントで行われる回帰。 半同時データセット
    いかなるアーティファクト除去研究でも使われるかもしれない
    利用できる。

- **[SASICA](https://github.com/dnacombo/SASICA):** SASICAは、これらのコンポーネントのさまざまな特性に基づいて独立したコンポーネントを拒否/選択するのに役立つEEGLABプラグインです。

- **[オートマチック](https://github.com/methlabUZH/automagic):** Automagic は EEG-datasets の前処理のための MATLAB ベースのツールボックスです。 ビッグ(小型)EEGデータセット用のユーザーフレンドリーな事前処理ソフトウェアを提供する目的で開発されました。

- **[AMICA](https://github.com/japalmer29/amica):** Adaptive Mixture Independent Component Analysis (AMICA) は、入力データに独立成分分析(ICA)を行い、複数のICAモデルも扱えるバイナリプログラムです。postAmicaUtilityプラグインのダウンロードも検討してください。

### 統計と信号処理

-   **[FieldTrip lite](https://github.com/fieldtrip/fieldtrip):** フィールド トリップはスタンドアローンのツールボックスですが、ソースローカリゼーション方法と追加の統計方法を提供する EEGLAB 拡張機能として機能することもできます。

-   **[LIMO](https://github.com/LIMO-EEG-Toolbox/limo_tools):** Linear Modelling of MEEG data (LIMO MEEG) ツールボックスは、MEEGデータの統計解析に特化したEEGLABプラグインです。

-   **[ERPLAB](http://www.erpinfo.org/erplab/erplab-home/)*: ERPLAB Toolboxは、ERPデータ解析用のMATLABルーチン群で、EEGLAB拡張機能としてオープンソースで提供されています。

-   **[EYE-EEG](http://www2.hu-berlin.de/eyelab/)**: EYE-EEG ツールボックス
    統合分析を促進する目的で開発されたEEGLABの拡張
    電気生理学的およびoculomotorデータの。

-   **[Mass_univ](http://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox):** Mass Univariate ERP Toolboxは、ERPのmass-univariate解析を行うためのMATLAB関数群です。

-   **[Bioelectromagnetism](http://eeg.sourceforge.net/bioelectromagnetism.html)*:    バイオエレクトロマネシス
    MATLABツールボックスは、平均ERPをプロットするために、この拡張機能でインターフェイスしています。
    彼らの最小値と最大値(ピーク検索)を見つけるために。 このツールボックスからいくつかのファイルのみがこの拡張子に含まれています。

### ソースと接続分析

-   **[SIFT](https://sccn.ucsd.edu/wiki/SIFT)*: ソース情報フローツールボックスとEEGLABプラグインは、さまざまな種類の計算を行います
    ソース分解されたEEGデータの多重化効果的な因果モデル。
    イベント関連のインタラクティブな視覚化とアニメーション
    'information Flow' のネットワークは含まれています。

-   **[NFT](https://github.com/sccn/NFT/wiki)**:Neuroelectromagnetic Forward Head Modeling Toolbox は、境界
    要素法(BEM)および有限要素法(FEM)によるヘッドモデルを作成します
    被験者のMRヘッド画像やMNIテンプレートの脳からのモデル
    測定された電極の位置へのモデルゆがみ。

- **[PACTools](https://github.com/sccn/PACTools)**: イベント関連 PACTools は、EEGLAB プラグインで、単一被験者データの相振れを補正します。 PACを計算するための伝統的な方法に加えて、プラグインには、相互情報フェーズ振幅カップリング方法(MIPAC)の瞬間およびイベント関連の実装が含まれています。

-   **[PACT](https://github.com/sccn/PACT):** PACTは、クロス周波数の位相振幅カップリングを計算するためのEEGLAB拡張機能です。

- **[エルプソース](https://github.com/sccn/erpsource)*: eLoretaを使用してERPのソースローカリゼーション。

### 高性能コンピューティング

-   **[nsgportal](https://github.com/sccn/nsgportal)**: NSG EEGLABポータルから、高性能コンピューティングリソースで、サンディエゴスーパーコンピュータセンターのNSF主催のExpanseスーパーコンピュータに、Neuroscience Gateway Portal(NSG)を自由に利用できるようにEEGLABスクリプトを実行するために、High-Performance Computingに使用することができます。
