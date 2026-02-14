---
layout: default
title: EEGLAB Extensions
nav_title: "EEGLAB エクステンション"
long_title: EEGLAB Extensions
parent: Download EEGLAB
---
EEGLABエクステンションとプラグイン
====
お問い合わせ

EEGLABエクステンションまたはプラグインにより、ユーザーは新しいデータをビルドして公開することができます。
EEGLABのデータ構造を用いた処理および/または可視化機能
そして大会。 プラグイン機能は、簡単に使用してテストすることができます
EEGLABメニューに紹介する新しいメニュー項目を選択します。 EEGLABは、E*plugins*を直接ダウンロードしてインストールすることができます。 <span style="color: brown">ファイル → EEGLAB 拡張機能の管理</span> メニュー
項目。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

異なるEEGLABバージョン用のプラグインのリスト
-----------------------------
プラグインの処理方法は、EEGLABの履歴、リードによって変更されています
より最近のバージョンと異なるシステムでより自動化
プラグインの保存と管理 (プラグイン自体は多くの場合、
異なるプラグイン管理システム間で同じ)。 リスト
以下のプラグインは、利用可能なプラグインのリストと同じです
EEGLAB 対応する EEGLAB バージョンの EEGLAB プラグイン マネジャーを通して。

-   [EEGLAB 2019.1以降のプラグインの現在のリストを参照してください。
    バージョンhttps://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php)
-   [EEGLABのプラグインの一覧を見る]
    2019.0](https://sccn.ucsd.edu/wiki/Plugin_list_all)(このページのプラグインはなし
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

簡単な手順を参照してください。 [どのように貢献するか]
EEGLAB>(/tutorials/contribute/) EEGLAB互換コードを作成する。

次に、EEGLAB ユーザが使えるように、上記のリストに拡張機能を追加できます。
EEGLABから自動的にダウンロードします。 これを行うには、[これを使用する]
フォームhttp://sccn.ucsd.edu/eeglab/plugin_uploader/upload_form.php)。 お問い合わせ
プラグインの新しいバージョンをアップロードしたい、 
[この単純化されたフォーム](http://sccn.ucsd.edu/eeglab/plugin_uploader/version_update.php).

管理者は、これらはメンテナンスページです。
プラグイン
リクエストhttps://sccn.ucsd.edu/eeglab/plugin_uploader/protected/pending_requests.php)
[プラグインの編集]
インフォメーションhttps://sccn.ucsd.edu/eeglab/plugin_uploader/protected/edit_plugin.php).

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

-   **[フリル](https://github.com/widmann/firfilt):** EEGLABのデータに様々なリニアフィルタを適用します。

-   **[CleanRawデータ](https://github.com/sccn/clean_rawdata):** Artifact Subspace Reconstruction を含むさまざまな方法を使用して未加工 EEG データをきれいにして下さい。

-   **[ディップフィット](https://github.com/sccn/dipfit):** 独立したデータコンポーネントのダイポールモデリング
    球面または境界要素ヘッドモデル。 関数を使う
    FIELDTRIPツールボックス

-   **[ICラベル](https://github.com/sccn/IClabel):** EEGLAB用の自動EEG独立したコンポーネント分類プラグイン。

### データ収集

- **[App-MATLABビューア](https://github.com/labstreaminglayer/App-MATLABViewer/)*: EEG LSL を EEGLAB .set ファイルとして記録します。

### データインポート

これらの拡張子は、さまざまな種類のデータをインポートすることができます。 EEGLABはありますが
いくつかのデータフォーマットをインポートするネイティブ機能、以下のプラグイン
その他のフォーマットに対応 多くのデータインポート拡張プラグインがあります。
以下に最も人気のあるもののみが含まれている。

- **[bids-matlab ツール](https://github.com/sccn/bids-matlab-tools)*: bids-matlab-tool リポジトリには、BIDS (Brain Imaging Data Structure) 形式の実験をインポートおよびエクスポートする機能のコレクションが含まれています。

- **[ビオシグ](http://biosig.sourceforge.net/):** さまざまなデータにデータをインポート/エクスポート
    フォーマット。

- **[ファイルIO](https://github.com/fieldtrip/fileio):** 複数のデータフォーマットでデータをインポートできるツールボックス。 EEGLABで冗長機能も含まれていますが、ユニークな機能も含まれています。

- **[ANTeepimport(アンテピムポート)](https://www.ant-neuro.com/support/supporting-documentation-and-downloads)**: ANT EEG社のEEP形式のデータをインポートします。

- **[bva-io(ババオ)](https://github.com/arnodelorme/bva-io)**: インポート/エクスポートファイル from/ から Brain
    ビジョンソフトウェアアナライザースイート。

- **[神経癌](https://github.com/sccn/neuroscanio)**:Neuroscanソフトウェアから/へのインポート/エクスポートファイル。

- **[マフマトロビ](https://github.com/arnodelorme/MFFMATLABIO)**: MFF 形式の EGI 社のインポート/エクスポートファイル。

- **[xdfimportの特長](https://github.com/xdf-modules/xdf-EEGLAB)**: XDF (LSL) 形式でファイルをインポート (EEG ストリームと EEG マーカーストリームのみ).

- **[モビラボラ](https://github.com/sccn/mobilab)*: XDF (LSL) 形式でファイルをインポートし、EEGLAB での共同処理のための異なるサンプリング速度でストリームを溶かします。

### 事前処理

-   **[IIRfiltの](https://github.com/sccn/IIRfilt):** 短い適用
    EEGLABのデータに対する非線形無限衝動応答フィルタ。

- **[ログイン](https://github.com/sccn/REST):** scalp EEGの記録の参照を無限点に標準化する方法。

-   **[アアール](http://kasku.org/aar/):** 自動アーティファクト除去ツールボックスは、電気脳グラム(EEG)における楕円および筋肉のアーティファクトの自動除去のためのいくつかの最新の方法を統合することを目指しています。

-   **[バイセッド](https://github.com/BUCANL/Vised-Marks):** EEGLABのVised Marks拡張機能は、ネイティブ*eegplot*データスクロール図に編集機能を追加します。 具体的には、イベントマーカーの追加/編集、チャネル/コンポーネントのフラグ付け、時間期間のフラグ付け、マーク構造のプロパティを表示することができます。

-   **[get_chanlocs ディレクティブ](https://github.com/sccn/get_chanlocs/wiki):** get_chanlocs EEGLAB プラグインは、3D のスキャンされたヘッドイメージから 3D の電極の位置を見つけます。 これらの画像をオフシェルフ機器で入手する方法に関するチュートリアルが含まれています。

### EEG/fMRIアーティファクト除去

-   **[FMRIBについて](http://www.fmrib.ox.ac.uk/%7Erami/fmribplugin):** EEGLABのデータからfMRI-environmentアーティファクトを削除します。 お問い合わせ
    エクステンションにより、スキャナー関連のアーティファクトの除去が可能
    fMRIスキャン中に収集したEEGデータから。 詳しくはこちら [GitHubリポジトリ](https://github.com/sccn/fmrib).

-   **[ベルゲン](https://www.uib.no/en/rg/fmri/):** fMRI関連の勾配のアーティファクトの除去
    同時 EEG-fMRI データ。 EEGLABが提供するBERGEN拡張機能
    グラデーションアーティファクト補正のための異なる方法を持つGUI。

### ICAベースのアーティファクト拒絶とコンポーネント分類

-   **[マーラ](http:in.de/irene.winkler/artifacts//www.user.tu-berl/):** 人工の独立した自動識別
    コンポーネント。 MARAとは
    6つの抽出によって専門家の評価から学ぶ線形分類器
    空間、スペクトル、およびテンポラルドメインからの機能。
    
-   **[ファスター](https://sourceforge.net/projects/faster/):** 完全に自動化された、監視されていないメソッドを実装
    高密度EEGデータの処理 FASTERは、ICAに基づくデータインポート、エッチング、リレファレンス、グランド平均作成、自動チャンネル、エポック、アーティファクト拒否などの一般的な機能を含みます。

-   **[ADJUSTについて](http://www.unicog.org/pm/pmwiki.php/MEG/RemovingArtifactsWithADJUST):** ステレオタイプのアーティファクト固有の空間と一時的な機能を組み合わせることで、アーティファクト関連インディペンデントコンポーネントを識別する完全自動アルゴリズム。

-   **[サイトマップ](https://github.com/sccn/corrmap):** 共通のEEGのアーティファクトの半自動同一証明
    テンプレートに基づく。 CORRMAP拡張は、セットのセットで構成されています
    MATLABの機能により、識別とクラスタリングが可能
    一般的なEEGアーティファクトを表す独立したコンポーネント。

-   **[CIACについて](http://www.debener.de/CIAC_tutorial/ciacplugin.html):** コクレアインプラントアーティファクト補正は半自動
    電気アーティファクトの修正のためのICAベースのツール
    コクレアーインプラントから発信

-   **[リリカ](https://github.com/sccn/relica)*: RELICAの目標は、データフレームやエポックの多くのランダムなブートストラップ選択を渡る分解データから最も安定的に分離されるICプロセスを特定することです。

-   **[MP_クラスタリング](https://github.com/sccn/mp_clustering)*: EEG対策を計画するための予測分析のためのツールボックス タグ別
    一般的なテンプレートの脳空間にソースの場所, ローカルのテスト
    空間測定の整合性および測定一貫性のある脳を解析
    測定可能なドメインへの領域。

-   **[リーガシー](https://doi.org/10.1016/j.bspc.2011.02.001):** EOGアーティファクトを除去する拡張
    ICAコンポーネントで行われる回帰。 半同時データセット
    いかなるアーティファクト拒絶研究でも使われるかもしれない
    利用できる。 

- **[サスカ](https://github.com/dnacombo/SASICA):** SASICAは、これらのコンポーネントのさまざまな特性に基づいて独立したコンポーネントを拒否/選択するのに役立つEEGLABプラグインです。

- **[オートマチック](https://github.com/methlabUZH/automagic):** Automagic は EEG-datasets の前処理のための MATLAB ベースのツールボックスです。 ビッグ(小型)EEGデータセット用のユーザーフレンドリーな事前処理ソフトウェアを提供する目的で開発されました。

- **[アメリカ](https://github.com/japalmer29/amica):** アダプティブ・ミックスチャー・インディペンデント・コンポーネント・アナリシス(AMICA)は、インプット・データに関する独立したコンポーネント・分析(ICA)を行うバイナリ・プログラムと、複数のICAモデルとの併用が可能です。 また、postAmicaUtilityプラグインのダウンロードを検討してください。 

### 統計と信号処理

-   **[ フィールドトリップライト](https://github.com/fieldtrip/fieldtrip):** フィールド トリップはスタンドアローンのツールボックスですが、ソースローカリゼーション方法と追加の統計方法を提供する EEGLAB 拡張機能として機能することもできます。

-   **[リモ](https://github.com/LIMO-EEG-Toolbox/limo_tools):** MEEGデータ(LIMO MEEG)ツールボックスのLInear MOdellingは、MEEGデータの統計解析に専用のEEGLABプラグインです。

-   **[ERPラボ](http://www.erpinfo.org/erplab/erplab-home/)*: ERPLABの特長
    Toolbox はセットのセットです
    オープンソースとして動作するERPデータを分析するためのMATLABルーチン
    EEGLAB への拡張のセット。

-   **[アイイー・イージー](http://www2.hu-berlin.de/eyelab/)**: EYE-EEG ツールボックス
    統合分析を促進する目的で開発されたEEGLABの拡張
    電気生理学的およびoculomotorデータの。 

-   **[質量_univ](http://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox):** MATLABのMass Univariate ERP ToolboxはMATLABの利用可能なセットです。
    質量を実行するための関数
    イベント関連の脳の潜在能力(ERPs)の分析
    認知症で人気の神経活動の非侵襲的な測定
    神経科学。

-   **[バイオエレクトロマー](http://eeg.sourceforge.net/bioelectromagnetism.html)*: ふりがな
    バイオエレクトロマネシス
    MATLABツールボックスは、平均ERPをプロットするために、この拡張機能でインターフェイスしています。
    彼らのミニマとマキシマ(ピーク検索)を見つけるために。 このツールボックスからいくつかのファイルのみがこの拡張子に含まれています。

### ソースと接続分析

-   **[シャフト](https://sccn.ucsd.edu/wiki/SIFT)*: ソース情報フローツールボックスとEEGLABプラグインは、さまざまな種類の計算を行います
    ソース分解されたEEGデータの多重化効果的な因果モデル。
    イベント関連のインタラクティブな視覚化とアニメーション
    'information Flow' のネットワークは含まれています。

-   **[NFTの特長](https://github.com/sccn/NFT/wiki)**:Neuroelectromagneticのフォワード・ヘッドのモデリングのツールボックスは注文の境界を造ります
    要素方法(BEM)および有限要素モデル(FEM)は頭部を先に進めます
    対象のMRヘッド画像やMNIテンプレートの脳からのモデル
    測定された電極の位置へのモデルゆがみ。

- **[パックツール](https://github.com/sccn/PACTools)**: イベント関連 PACTools は、EEGLAB プラグインで、単一サブジェクトデータの相振れを補正します。 PACを計算するための伝統的な方法に加えて、プラグインには、相互情報フェーズ振幅カップリング方法(MIPAC)の瞬間およびイベント関連の実装が含まれています。

-   **[パクト](https://github.com/sccn/PACT):** PACTは、コンピューティングのクロス周波数のためのEEGLAB拡張です
    段階振幅のカップリング。

- **[エルプソース](https://github.com/sccn/erpsource)*: eLoretaを使用してERPのソースローカリゼーション。

### 高性能コンピューティング

-   **[ログイン](https://github.com/sccn/nsgportal)*: NSG EEGLABポータルから、高性能コンピューティングリソースで、サンディエゴスーパーコンピュータセンターのNSF主催のExpanseスーパーコンピュータに、Neuroscience Gateway Portal(NSG)を自由に利用できるようにEEGLABスクリプトを実行するために、High-Performance Computingに使用することができます。 
