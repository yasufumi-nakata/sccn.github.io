---
layout: default
parent: SIFT
grand_parent: Plugins
render_with_liquid: false

title: Function-Reference
nav_title: "機能参照"
long_title: Function-Reference
---
下表は、SIFT関数の部分的な参照です。 このリストですべての機能が文書化されていない。



|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
|--------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| | | 業務内容 | 業務内容 | | 業務内容 | | 業務内容 | | | 業務内容 | | 業務内容 | | | | 業務内容 |
|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
| GUI機能 | ポップアップ | プリプレ データ | データの事前処理のためのGUIを生成 |
| ポップアップ_est_fitMVAR | VAR/AMVARモデルフィッティング用GUIを生成 | | |
| POP_est_selModelOrder | VARモデルオーダーのGUIを生成 | | |
| ポップアップ_est_validateMVAR | VARモデル検証用GUIを生成 | |
| pop_est_mvarConnectivity | コンピューティング・コネクティビティ・施策のGUIを生成 | | |
| pop_vis_TimeFreqGrid | インタラクティブタイム周波数グリッドのGUIを生成 | | |
| ポップス|causalBrainMovie3D | インタラクティブ・キャサール・ブレインムービー3DのGUIを生成 | | |
|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
| 前処理 | 前処理 | 線形分解またはデータの集中 |
| 前の投稿 データ | データのアンサンブルに差異フィルタを適用 | | | |
| 前のページ データ | データ集約やエンサンブル正規化を適用 | |
| 事前申込 データ | データのアンサンブル(他の機能の呼び出し) | | |
| pre_selectComps | データから独立したコンポーネントを選択 | |
|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
| モデリング | est_calcInvCovMat | VAR プロセスのコンピュート・インバース・コワランス・マトリックス |
| est_calcInvCovMatFourier | VAR プロセスの不利な共燃行列の計算周波数ドメイン変換 | |
| est_calcInvCovMatFourierPDC | 上記と同じですが、分析PDCの有意なしきしきい値に使用する特定のバージョン | |
| est_checkMVARConsistency | 適合したVARモデルのパーセントの一貫性をチェック |
| est_checkMVARParams | 指定されたMVARパラメータのセットで サンティチェックを実行します。 関連する場合は、最適なパラメータの推奨事項を返します。 | |
| est_checkMVARStability | 装着したVARモデルの安定性・動作性 |
| est_checkMVARWhiteness | 装着したVARモデルの残留物の白色度チェック |
| est_eigenmode | VAR プロセスの eigenmode を返す | | |
| est_fitMVAR | VAR\[p\]モデルを複数のアルゴリズム(Vieira-Morf、ARFIT、MLSなど)を用いてデータに収まる オプションで、スライディングウィンドウを使用して、セグメンテーションベースの適応型MVAR分析を実行できます。 Alois Schloegl のオープンソース TSA パッケージまたは ARFIT パッケージから変更されたルーチンを呼び出します。 | |
| est_fitMVARKalman | VAR\[p\]モデルをKalman filterで連続データに収まる Alois SchloeglのオープンソースTSAパッケージからコードを適応 | | |
| est_MVARConnectivity | 適合したVARモデルのコンピュートスペクトル密度、コヒーレンス、接続方法 |
| est_mvarResiduals | 装着したVARモデルの残留期間を返却 |
| est_mvtransfer | VARモデル(スペクトル、コヒーレンス、危険性など)の周波数ドメイン量 | |
| est_selModelOrder | モデルオーダーの受注評価・返品条件(AIC、SBC、FPE、HQ) |
|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
| 統計 | 統計情報 | 統計情報 | ブートの重要性 テスト | 接続構造に関するブーツストラップの重要性テストを実施 |
| 統計情報|分析的意義 試験 | 接続構造に関するアシンプトティック解析の重要性 | | |
| stat_phaserand | 相続化アプローチ(Theiler, 1997)で接続しないヌル仮説を満たす分布を戻す | | |
| stat_bootstrap | 分光・コネクティビティ推定子のブーツトラップ分布 | | |
| 統計情報|爬虫類 試験 | 1～2面のパーセンシャルテストを実施し、観察値と、a(null)分布を比較します。 | |
|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
| 視覚化 | vis_TimeFreqGrid | インタラクティブな時間頻度の格子を作成する低レベル機能 |
| vis_TimeFreqCell | タイム周波数グリッドの単一セルの拡張(詳細)バージョンをレンダリングする低レベル機能 | |
| vis_causalBrainMovie3Dの特長 | 因果BrainMovie3Dを発生させる低レベル機能 | |
| VIS_causalProjection | 開発中 – 因果投影画像や動画を生成する低レベルの機能 | |
|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
| シミュレーション | sim_genVARModelFrom Eq | arsim()対応のVAR仕様をテキスト式から生成 |
|                                |                                                                                                                                                                                                                                                                                             |                                                                             |
| ヘルパー | hlp_\* | 多数のヘルパー関数(後述) |

