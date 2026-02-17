---
layout: default
parent: NFT
grand_parent: Plugins
render_with_liquid: false

title: Chapter-05-NFT-Commands-and-Functions
nav_title: "第5章-NFT-Commands-and-Functions"
long_title: Chapter-05-NFT-Commands-and-Functions
---
このセクションでは、MATLAB コマンドとデータ構造をまとめました。
NFTツールボックスを使用したヘッドモデリングの各ステージ。 関数
参照はAppendix Bで見つけることができます

機能 ネーミングとスタイル
-------------------------

ツールボックス関数は、すべての小文字、単語を区切って名前を付けています。
アンダースコア。 GUI 関数名は、大文字で始まります。 ユーザ
インターフェイス機能はすべてモジュールの名前から始まります。
bem_, mesh_, segm_, warping_ はユーティリティ関数がプレフィックスする時に
util は、例えば BEM ユーティリティ関数は utilbem_ から始まる。 すべて
関数は使用法、入力および出力を記述する助けのセクションを持っています、
help2html() の規約と互換性があります。 ライセンスも含む
ブロック。

ユーザインタフェース関数(bem_など)では、入力引数は
使用前に検証します。 主に使われているユーティリティ関数
内部で最小限の検証を行います。

区分機能
----------------------

セグメンテーションの主なユーザーインターフェイスは、
[区分()](NFT-Appendix-B.html#Segmentation "wikilink") コマンド
セグメント化用のGUIを開きます。

BEM のマトリックスの生成機能のほとんどは開始できます
GUIインターフェイスから、各操作も実行できます。
matlabの機能。 MRイメージをロードした後、次の関数が
それぞれ:
[segm_aniso_filtering() ディレクティブ](NFT-Appendix-B.html#segm_aniso_filtering "wikilink"),
[segm_scalp() は](NFT-Appendix-B.html#segm_scalp "wikilink"),
[segm_brain() は、](NFT-Appendix-B.html#segm_brain "wikilink"),
[segm_outer_skull() は、](NFT-Appendix-B.html#segm_outer_skull "wikilink"),
[segm_inner_skull() は、](NFT-Appendix-B.html#segm_inner_skull "wikilink"),
[segm_final_skull() の](NFT-Appendix-B.html#segm_final_skull "wikilink").

メッシュ生成機能
-------------------------

メッシュ生成のメインユーザーインターフェイスが始まります
[メッシュ_ジェネレーション()](NFT-Appendix-B.html#Mesh_generation "wikilink") コマンド
メッシュ生成用のGUIを開きます。 関数は読みます
スカルプ、スカル、CSF、脳のメッシュのセグメンテーションと生成 お問い合わせ
ユーザーは、メッシュをローカルに精製したい、
[メッシュ_local_refinement()](NFT-Appendix-B.html#mesh_local_refinement "wikilink")
関数は呼ばれます。 生成されたメッシュのトポロジーは、
[メッシュ_final_correction()](NFT-Appendix-B.html#mesh_final_correction "wikilink"),
そして最後に、総ヘッドメッシュはAで説明した形式で書かれています
関数を使う
[メッシュ_read_write()](NFT-Appendix-B.html#mesh_read_write "wikilink").

共同登録機能
-------------------------

電極の位置の調整のための主要なユーザー インターフェイス
MR画像は、Coregistration() コマンドで起動します。
GUIを共同登録する。

ワーピング機能
-----------------

テンプレートヘッドモデルのワーピングの主なユーザーインターフェイスは
使用開始
[ワーピング_メッシュ()](NFT-Appendix-B.html#Warping_mesh "wikilink") コマンド
機能に警告するためのGUIを開きます。 電極をロードした後
MNIメッシュをロードします。 使用方法
[warping_main_function() の使い方](NFT-Appendix-B.html#warping_main_function "wikilink")
警告パラメータと警告メッシュを計算します。

フォワードモデル生成機能
----------------------------------

前方モデル生成のメインユーザーインターフェイスが開始
使用方法
[Forward_Problem_ソリューション()](NFT-Appendix-B.html#Forward_Problem_Solution "wikilink")
コマンド。 ほとんどのBEMのマトリックスの生成機能性はある場合もあります
GUIインターフェースから始まり、各操作も行います。
matlabの機能を使って。

BEMモジュールで使用される機能は、BEMを作成するために使用されます
構造体, ソルバーを実行してモデルのマトリックスを生成します, そして、
単一か複数のダイポールのための解決。

フォワードソリューションの状態は構造物に保存されず、
ツールボックスでは、グローバル変数が使用されます。 コンテンツから
構造の引数は関数呼び出し、ほとんどのインターフェイスの間に変わるかもしれません
関数は変更が保存できるように構造を返す
(MATLABにはアウト引数はありません)。

### メッシュ機能

メッシュファイルのセットをロードできます。
[bem_load_mesh()](NFT-Appendix-B.html#bem_load_mesh "wikilink") 関数
メッシュ構造を返す。

### モデル機能

メッシュ、導電性、ソルバーを組み合わせたモデル構造
IPAパラメータは、IPAパラメータを用いて取得します。
[bem_create_model() は、](NFT-Appendix-B.html#bem_create_model "wikilink")
機能。 モデル構造が得られると、呼び出すことができます。
ソルバーを使用して
[bem_generate_eeg_matrices()](NFT-Appendix-B.html#bem_generate_eeg_matrices "wikilink")
BEM のマトリックスを発生させる機能。 個々のマトリックスをロードできます
モデル構造に
[bem_load_model_matrix()](NFT-Appendix-B.html#bem_load_model_matrix "wikilink")
機能。

### セッション機能

セッション構造は、前方問題の解決に使用されます。
センサーセット 構造は、
[bem_create_session() は](NFT-Appendix-B.html#bem_create_session "wikilink")
モデルやセンサーのリストから。 センサーの一覧を生成できます
ノードの一覧から
[bem_smatrix_from_nodes()](NFT-Appendix-B.html#bem_smatrix_from_nodes "wikilink")
機能。

セッションで指定されたセンサーの転送行列は、
生成された使用
[bem_generate_eeg_transfer_matrix()](NFT-Appendix-B.html#bem_generate_eeg_transfer_matrix "wikilink")
転送行列を計算して保存する関数。 計算された
転送行列はセッション構造に読み込むことができます
[bem_load_transfer_matrix()](NFT-Appendix-B.html#bem_load_transfer_matrix "wikilink")
機能。

フォワードソリューションの取得には2つの機能があります。 ふりがな
[bem_solve_dipoles_eeg()](NFT-Appendix-B.html#bem_solve_dipoles_eeg "wikilink")
関数は、アクティベーションによるセンサーのポテンシャルを計算します
ダイポールの数。 ふりがな
[bem_solve_lfm_eeg()](NFT-Appendix-B.html#bem_solve_lfm_eeg "wikilink")
関数は、それが返すので、リードフィールドマトリックスを生成するのに適しています
単一のダイポールの解決のマトリックス。

### ユーティリティ機能

ユーティリティ関数は内部で使われます。
上記。

外部のユーザ設定は、外部のユーザ設定で返すことができます。
[NFT_get_config()](NFT-Appendix-B.html#NFT_get_config "wikilink") 機能。
このm-fileは手動で編集して、ランタイムオプションを指定できます。
ツールボックス。 ユーザーインターフェイス機能は取得するためにこの機能を呼び出す
必要に応じて設定変数。

ふりがな
[utilbem_compute_cond() ディレクティブ](NFT-Appendix-B.html#utilbem_compute_cond "wikilink")
そして、
[utilbem_compute_indices()](NFT-Appendix-B.html#utilbem_compute_indices "wikilink")
メッシュの導電率とインデックス情報を算出します。
これらの関数は、
[bem_create_model() は、](NFT-Appendix-B.html#bem_create_model "wikilink") そして、
結果はモデル構造に格納されます。

コンピューティングソースには2つのユーティリティ機能があります(右側)
ベクター。
[utilbem_multilayer_rhs()](NFT-Appendix-B.html#utilbem_multilayer_rhs "wikilink")
IPAに使用され、
[utilbem_pot_unbound() は、](NFT-Appendix-B.html#utilbem_pot_unbound "wikilink")
IPAを使わずに使用しています。