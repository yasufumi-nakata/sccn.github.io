---
layout: default
title: groupSIFT
long_title: groupSIFT
parent: Plugins
render_with_liquid: false
nav_order: 8
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/groupSIFT).

[お問い合わせ このページのトップへ](http://img.youtube.com/vi/jHngHEIsg7Q/0.jpg)](http://www.youtube.com/watch?v=jHngHEIsg7Q)
YouTubeで映画を再生するにはクリックしてください。 本ムービーは、Loo et al. (2019) の*groupSIFT*の最初のアプリケーションを示しています。

# グループシャフトEEGLAB プラグイン

このページは私と協力してグループをテストしたい人のためのSIFTです
ツールボックスと EEGLAB プラグイン。 残念ながら、この時点では多くのユーザーを提供できません。
サポート このページでは、完全な詳細をカバーしていません(を含む)
SIFTパラメータの決定方法 だから、このプラグインは、高度なユーザーのために
Matlab と SIFT で良い経験を持つ人。 ご利用の際は、
ご自身の責任で行ってください。

独自の組み込みシミュレータを使用して基本的なSIFT関数を学習に興味がある場合は、参照してください [サイトマップ](https://sccn.ucsd.edu/wiki/How_to_run_SIFT_simulation)

# 環境方針

-   私はもともとフェドラ22でMatlab R2013a runninigでそれを開発しました
    1600 x 1200の決断の二重モニターが付いている(64bit)。 最近の投稿
    プロジェクト、Matlab 2017b、EEGLAB 14.1.2、およびSIFT 1.52 用に更新しました。
    (カスタマイズされた映画機能と)。 私は完全に調査されていない
    Linux以外の環境に依存します。 Matlabのイメージ
    bwlabel() を使用するには、 Toolbox の処理が必要です。

# 必須の事前処理

-   ICAで処理されるEEGLAB .setファイルが必要です。
    その後の IC の選択: データ内のすべてのICがSIFTに行きます
    前処理。 100 x 100 を作成する100 IC を使用したくない
    x 周波数 x 時間テンソル エンドの n 被写体! また、
    考慮したいデータポンツーパラメータ比。 また、DIPFITは
    お問い合わせ ICLabel() プラグインを使用して、'brain' ラベルで IC を選択
    確率 \> 0.7, 例えば.
-   ほぼ100-120にデータをダウンサンプル 追加の2つを使用してHz
    この方法でオプション: pop_resample(EEG、100、0.8、0.4) 追加の
    任意変数は穏やかなローパス フィルター斜面をで使用することです
    ARモデルの注文を抑制するアンチエイリアシング。 見る [this]
    ページ:()https://sccn.ucsd.edu/wiki/Firfilt_FAQ#Q._For_Granger_Causality_analysis.2C_what_filter_should_be_used.3F_.2804.2F26.2F2018_Updated.29)
    詳しくはこちら
-   **1つの.setファイル、1つの条件として条件を分離して下さい。** すべて
    SIFT関連の付加的な前処理は各々に適用する必要があります
    個別に個別に1つの条件データをセットする。
-   **グループSIFTはEEGLAB STUDY**に依存しています。
-   グループSIFTを使用して、このルールを常にフォローしてください。
    .set ファイルを専用のフォルダーにあらかじめ処理したファイル
    処理されたファイル以外のもの。 例えば、もしあれば
    条件: A, 条件B, A-Bをテストする予定, 作成する
    A、B、A-Bのフォルダを別々に分割します。
-   また、毎回作業フォルダに移動することをお勧めします
    一歩前進。 GUI の groupSIFT インタラクティブファイルローダは、
    拡張フィルタ付きのローカルファイル。
-   ファイル名に '_' を使用しないでください。 この文字は、
    接頭辞の単語を識別するために保存されます。

# グループSIFT GUIメニューの説明

## 1.Run シャフト バッチ

この項目をクリックすると、選択した複数の .set ファイルで SIFT を実行できます。
バッチモード。 繰り返しますが、これはすべてのために適用されることを確認してください
個人、条件分けされた .set ファイル。 2つの条件がある場合、
それぞれの条件ごとにこのプロセスを通過する必要があります。
rPDC と dDTF08 は、これらが正当化できるものだから計算されます
紙の使用。 rPDCは理論的に優れていますが、それは知られています
最高の周波数結果のバグ/problem。 dDTF08は広く使用されています。
rPDC の結果は、時間頻度の領域で広く普及していますが、
dDTFの結果は、タイムドメインのシャープな解像度を持っています。 GUI をしてみましょう
プロセスが進んでいる間、ウィンドウズは滞在します。 途中で閉じる
プロセスをクラッシュします。

### SIFTのヒント(08/15/2020追加)

データポイント・ツー・パラメータを計算するのに使われる式があることがわかりました。
比率が間違っています。 SchlöglとSupp(2006年)によると、
Korzeniewska ら. (2008), 式は、
(num_IC\*model_order)/window_length\*num_trials. この変更はどのように影響するか
以下に示すように、パラメータ、'better' 方法を決定する:
1) より多くの IC は含まれていることができます; 2) より少ない試験の数は容認することができます;
3) より短い滑走窓は使用することができます。 この変更は特に
現在の式がおそらくあるように、連続的なデータ分析に影響を与えます
スライドウィンドウの長さを数分間可能! 実際には、これは
datapoint-to-parameter の比率は私に適用するために限られた要因でした
自信を持ってSIFT。

正しいデータポイントからパラメータ比例比を取得するには
上記の理由は、次の変更を行います
<span style="color:#FF0000"> **est_checkMVARParams() ライン 85** </span>

``` matlab
%winrat = ((M^2)*p)/(wlen*T);
winrat = ((M)*p)/(wlen*T);
```

つまり、この問題を著者と話し合ったとき、彼はまた
修正をすれば、見積りが過度に解約されると私に言いました
使いやすさに。 私は私のからポイントを見てみたい
経験。 何らかの理由で、ほとんどのSIFT検証対策は、常にどちらかです。
余りに lax (安定性テスト) か余りに厳しい(白色度テスト)、
これは一般的に従うことが困難です。 結論として、私はお勧めします
上記の修正では、分析設計の自由度が高まっていますが、
保守的として滞在しようとする(つまり、数を下げるなど)
保守可能!)

**再正規化部分指向の一貫性(rPDC)は常に
ノイズが最も高い周波数に近い**。 オリジナルで確認しました
SIFT、Tim Mullen博士の著者。 常に除外されることをお勧めします
rPDC の最も高い freq 結果。

## 2.Varidate ARモデル

概要のプロットを点検し、outlierの主題を取除くことを考慮して下さい
(水平軸はセットファイルインデックスを表します)。 グループメニューをチェック
データポイント・ツー・パラメータ比の値(一番右側バー)。
ARモデリングステージの妥当性を保証します。 ちなみに定義
datapoint-to-parameter の比率は異なったから計算されます
オリジナルの紙なので、注意してください。 詳しくは、「こちら」をご覧ください。
ページ:()https://sccn.ucsd.edu/wiki/Makoto's_preprocessing_pipeline#SIFT_tips_.2808.2F06.2F2019_updated.29).

## 3。 グループ分析ROIへの変換

FWHMは、ダイポール密度の滑らかな幅を決定します。 通常,
fMRI==8mm、PET=20mm。 また、最低件数の件数を事前に選択します。
このようにして、あなたは大多数の解剖地域に焦点を合わせます
被写体(例えば、80%)は、非ゼロダイポール密度に貢献します。 プレス
'見積り用のコンピュートアバインド'ボタンで結果を確認します。 お問い合わせ
見積もりに満足して、ファイルの接頭辞名を入力してください
(繰り返し、'_' を使用しない) ボタンを押します。
.setファイルとSTART'。

## 4. t スコアと p 値の計算

プロセスから事前に入力された結果を持つフォルダを指定します
上記。 A-B の違いをテストするには、A と B のフォルダーを指定します。
A-B 結果を保存するための新しいフォルダーを指定します。 未修正
p-valueはピクセルクラスターのサイズを後で決定します
時間頻度のプロット。 反復の数が少ないべきではありません
2000年 比例しないテストのために代理の配分が使用されるので
それはよい尾サポートを要求します。 複数の比較修正のために、
弱い家族単位の誤り率の訂正(FWER)は実行するために加えられます
クラスターレベルの補正。 *クラスターの*mass*、内のtスコアの合計
各ピクセル クラスターは、すべてのエッジからプールされ、決定します。
オムニバス補正基準。

## 5。 5。 事前選択されたROIを表示

このプロットは、選択された対立ダイポール密度(すなわち、
太りすぎのグラフエッジ)。 *コネクティビティ・メジャーはこの対面です
rPDCかdDTF*によって重くされるダイポール密度。

## 6.動画の検索結果とエクスポート (08/20/2020 更新)

\*_tStatistics.mat と \*_dipolePairDensity.mat ファイルを指定します。
すべてのパラメータを入力してください。 ここで「クラスターレベルの補正」は決定します
*クラスター*のマスの閾値。 「スロット接続」を押すと
行列'、主要な接続行列のプロットのグラフエッジをクリックします
左。

\-** グラフエッジのMCC** (チェックボックス)--MCCは複数の比較を表します
修正。 チェックするとき、極端な値の分布を代理
(最小値と最大値)10,000値を使用して構築されます
(デフォルト) 提出されたすべてのグラフエッジ全体で min/max 値 (を含む)
重要な結果がないもの)。 その後、p \< 0.05 の場合
(デフォルト)、サーロゲートの2.5-および97.5パーセント値
オムニバス補正を実行できる配布物が入手できます。
同時に任意のグラフエッジの時間頻度値。

チェックを外せば、代理の配分は10,000を使用して造ります
(デフォルト) x \[number_of_edges\] は、すべてのグラフのエッジ全体に値します。
この代理統計分布は、最大/分の値で作られていません
すべてのグラフの端を渡る従って2.5および97.5パーセントの価値はの
剰余金の分配は、グラフ全体で複数の比較に対処できません
端は、しかしそれはまだ単一のグラフの端のためにしません。 したがって、チェックを外す
このオプションは、例えば、注意して使用する必要があります。
仮説主導のROI分析。

\-**GFWER (u=1)**(チェックボックス)--GFWER は *generalized* (弱い) の略します
家族単位の誤差率。 'Weak' はクラスターレベルの補正を使用することを意味します。

あなたがここにするトレードは、あなたがより多くの検出力を得るということです
最大1(hence u=1)の偽陽性を受け入れるという事実のコスト
結果(あなたの場合、ピクセルの1つのクラスター)あなたの結果に提示します。
これは珍しいと怖い聞こえるかもしれませんが、あなたはすでにいることを覚えています
通常、偽陽性の結果の5%を受け入れる
1.より大きい 作品の使い方は以下の通りです。 GFWERはピックアップしません
パーマテーションの試験の各反復からの最大/分統計, しかし、
※2～最大/分*(最大/分横の1つのみ) お問い合わせ
既知数のコストで統計的な感度を得るためのアプローチ
偽の肯定的な結果(ここでは、u=1 i.e.、あなたの1 *クラスター*のマス
データは偽陽性の結果であることが知られています。 これなら不思議かもしれません
意味のあること。 つまり、代理の配布物だから
統計は、尾にアウターを持っている傾向があります。 左端を取除くこと
tails から一番の値は、ほとんどの場合、非常に簡単にできます。
極端な値の統計。 効果的な方法を見つけることができる
貿易は、それがとにかく完全に計算されるので、あることができます。 ちなみに、これは
オプションは、'MCC for graph Edge' オプションがチェックされる場合にのみ使用可能です。

以下では、同じデータから3つの統計結果が表示されます。 から
左、グラフエッジMCC、GFWERでグラフエッジMCC、グラフエッジ
MCCオフ。 重要なエッジの数の変更に注意して下さい。 データ
ロオ ら (2019)

![Mccon_currentデフォルト2.png](images/Mccon_currentdefault2.png)
![マコン_gfwer2.png](images/Mccon_gfwer2.png)
![Nomcc_previousdefault2.png ディレクティブ](images/Nomcc_previousdefault2.png)

# グループレベルのコネクティビティムービーを生成する方法

-   ボタン「映画用のデータを保存」は右下にあります
    視覚化GUIのコーナー。
-   すべてのパラメータは、**映画の検索結果とエクスポート*で決定 * 必須
    映画データに効果を発揮します。
-   解析に使用する .set ファイルのいずれかを指定します。 コピー
    指定された .set ファイルが 'donor' として機能し、
    EEG.CAT.Conn.RPDC/dDTF08 は、グループ単位の値に置換されます。
    しきい値の後で。
-   EEGLABメインウィンドウから、ツール -\> SIFT -\> 可視化 -\>
    BrainMovie3D. 私はこのために私のカスタマイズされた映画機能を使用します。 お問い合わせ
    プロパティを開く 複数の使用のために知られている格子インターフェイス、
    依存関係。 ご使用前にMatlabパスを設定するためには注意が必要です
    この機能。 -allプロパティGrid' を使用して、
    右は、そうでなければ動作しません。
-   "FrequenciesToCollapse" は、私の場合のように調整する必要があります
    2:50の代わりに2:49.9を設定して作業する必要があります。
-   ベースラインをサブトラクトしないでください。 グループSIFTによるケアを受けています。
    それ以外の場合、ゼロ値(統計結果によって隠されるなど)は、
    非ゼロス。
-   「FooterPanelDisplaySpec」、グラフメトリック これはあなたに封筒が表示されます
    時間系列
-   "InitialView" \[50 36\] はデフォルト値です。 軸スライスの場合 \[0
    90\]; sagittalスライスの場合、\[90 0\]; 冠状スライスの場合は\[0 0\]。
-   「テーマ」「ダークドリーム」(オプション)
-   "ImageOutputDirectory", "prompt" (入力する必要があります) ちなみに、
    「すべての画像フレームを保存」は現在機能しませんが、それでも
    写真と映画のために2回「プロンプト」を入力する必要があります。 パスの1つ
    ファイル名の他。
-   "MovieOutputFinename", "prompt" (入力する必要があります)

# グループレベルのコネクティビティムービーを生成する方法 (12/23/2019 更新)

'pop_viewResultsAndExportForMovie' GUI では、'Output' があります。
右下にある個々のデータボタン。 クリックすると、
uigetdir() GUI がポップアップし、'_allSubjStack.mat' ファイルを選択するように要求します。
このファイルを選択すると、シンギングによるブロブ平均が生成されます。
個々の被験者に対して、相関性を発揮できる値
分析。 出力は、Maatlab の 'base' のワークスペースの 'dataSheet' として保存されます。
csvファイルとしてエクスポートできます。 A-Bの場合、
A と B を別々に実行します。(A と B は同じグラフエッジを持っています)。

# サブトラクションの場合には、個々の被写体データを出力する方法(02/26/2020更新)

現在、GUIでは対応しておりません。 しかし、かなり簡単なコマンドで
ライン操作は、TWO条件が付随するかどうかを確認できます。

1.  ワークスペースを空にします。
2.  条件AのためのXXXX_allSubjStack.matをロードして下さい。
3.  "allConnectivityStack" を他のものに名前を変更します(ここでは、'tmp1')
4.  ログイン YYY_allSubjStack.mat 条件Bの場合、AとBが
    内流条件(つまり、同じICA結果)は、
    'allConnectivityStack' 以外の同じデータ。
5.  "allConnectivityStack" を他のものに名前を変更します(ここでは、'tmp2')
6.  AllConnectivityStack=tmp1-tmp2を実行します。
7.  ワークスペース内のすべてを新しい名前で保存
    ZZZZ_allサブjStack.mat.
8.  GUI 操作中に ZZZZ_allSubjStack.mat をフィードします。

同じメソッドは、内部サブジェクト間のサブトラクションを取るために使用できます。
条件。 例えば、2つのネガティブなネガティブなデータを誤った場合
主題のグループ、各グループのためのDeviant-Standardをサブトラクトしたい
上記の方法を使用して、グループレベルの分析を実行します。
この場合、個々のデータリストを取得する必要があります。
グループ別

# レイアウトの問題(06/21/2018更新)

不明な理由で、GUIレイアウトは環境で崩壊することができます。
お問い合わせ 自分の環境で問題を再現することはできません。
これらの手順に従ってユーザー自身を修正したいです。

1.  Matlabコマンドラインで「ガイド」を入力します。
2.  トップタブ '既存の GUI と 'Browse' ボタンを開き、指定します。
    グループSIFT eeglabプラグインのフォルダにある質問のGUI。
3.  「開く」ボタンでGUIを操作できます。
4.  手動でレイアウトを修正し、保存します。 でも、その1つを聞いた
    窓は別の窓で隠されていました... どうしても見ていない
    あなたが探している、忘れてはいけません 背景を確認する
    表面上のもの。

# 最新のワークショップ資料へのリンク

[EEGLABワークショップ2017]
東京(東京)https://sccn.ucsd.edu/mediawiki/images/7/7c/GroupSIFT.pdf) [リンク]
映画に
例)(https://sccn.ucsd.edu/mediawiki/images/6/6e/GroupSIFT_sagital.zip)

# カスタム分析ラベルについて

groupSIFT は自動化された解剖学で定義される解剖学的ラベルを使用します
ラベル作成ソリューション (Tzourio-Mazoyar et al., 2002). しかし、代わりに
元の88地域、16地域にまとめて76地域に縮小
小さな地域に埋め込まれ、バサル地域を傘に ROI 'Upper
Basal'と「Lower Basal」。 お問い合わせ
pop_groupSIFT_convertToGroupAnatomicalRois.m ライン 307-402、そこにあります
以下の説明。

``` matlab
% These regions are to be included
%     'Precentral_L'
%     'Precentral_R'
%     'Frontal_Sup_L'
%     'Frontal_Sup_R'
%     'Frontal_Sup_Orb_L'
%     'Frontal_Sup_Orb_R'
%     'Frontal_Mid_L'
%     'Frontal_Mid_R'
%     'Frontal_Mid_Orb_L'
%     'Frontal_Mid_Orb_R'
%     'Frontal_Inf_Oper_L'
%     'Frontal_Inf_Oper_R'
%     'Frontal_Inf_Tri_L'
%     'Frontal_Inf_Tri_R'
%     'Frontal_Inf_Orb_L'
%     'Frontal_Inf_Orb_R'
%     'Rolandic_Oper_L'
%     'Rolandic_Oper_R'
%     'Supp_Motor_Area_L'
%     'Supp_Motor_Area_R'
%     'Frontal_Sup_Medial_L'
%     'Frontal_Sup_Medial_R'
%     'Frontal_Med_Orb_L'
%     'Frontal_Med_Orb_R'
%     'Rectus_L'
%     'Rectus_R'
%     'Insula_L'
%     'Insula_R'
%     'Cingulum_Ant_L'
%     'Cingulum_Ant_R'
%     'Cingulum_Mid_L'
%     'Cingulum_Mid_R'
%     'Cingulum_Post_L'
%     'Cingulum_Post_R'
%     'Calcarine_L'
%     'Calcarine_R'
%     'Cuneus_L'
%     'Cuneus_R'
%     'Lingual_L'
%     'Lingual_R'
%     'Occipital_Sup_L'
%     'Occipital_Sup_R'
%     'Occipital_Mid_L'
%     'Occipital_Mid_R'
%     'Occipital_Inf_L'
%     'Occipital_Inf_R'
%     'Fusiform_L'
%     'Fusiform_R'
%     'Postcentral_L'
%     'Postcentral_R'
%     'Parietal_Sup_L'
%     'Parietal_Sup_R'
%     'Parietal_Inf_L'
%     'Parietal_Inf_R'
%     'SupraMarginal_L'
%     'SupraMarginal_R'
%     'Angular_L'
%     'Angular_R'
%     'Precuneus_L'
%     'Precuneus_R'
%     'Paracentral_Lobule_L'
%     'Paracentral_Lobule_R'
%     'Temporal_Sup_L'
%     'Temporal_Sup_R'
%     'Temporal_Pole_Sup_L'
%     'Temporal_Pole_Sup_R'
%     'Temporal_Mid_L'
%     'Temporal_Mid_R'
%     'Temporal_Pole_Mid_L'
%     'Temporal_Pole_Mid_R'
%     'Temporal_Inf_L'
%     'Temporal_Inf_R'
%
% These regions are to be combined
%     'Hippocampus_L'
%     'Hippocampus_R'
%     'ParaHippocampal_L'
%     'ParaHippocampal_R'
%     'Amygdala_L'
%     'Amygdala_R'
%                --> Lower Basal
%
%     'Olfactory_L'
%     'Olfactory_R'
%     'Caudate_L'
%     'Caudate_R'
%     'Putamen_L'
%     'Putamen_R'
%     'Pallidum_L'
%     'Pallidum_R'
%     'Thalamus_L'
%     'Thalamus_R'
%               --> Upper Basal
%
% One can visualize these regions by running visualizeAnatomicalRoiWithNHimasBlobs.m contained by the groupSIFT folder.
```

私は傘のROIを作成した理由は、これらの肢体と
バサル地域(ベントリルを含む)は、発電機とは違っています
重要な条件の欠如による頭皮測定可能なEEGの、すなわち
並列に並ぶピラミッド細胞の大きい区域。 しかし、
ダイポールフィッティングの誤差、約20%のフィッティングダイポールがこれらに入る
生理学的に無効なディープ・レクション(詳細については、こちらを参照してください)
ページ:()https://sccn.ucsd.edu/wiki/Makoto%27s_preprocessing_pipeline#Physiologically_invalid_deep_dipoles.3F_.28Special_contents_for_130.2C000_hit.2C_07.2F02.2F2020_Update.29)).
ラベル「thalamus」が完全に不適切と判断した場合
推定 EEG ソースを参照するには、特定の EEG ソースを提供する必要があります。
今だけ誤解しているラベル? 代わりに、私たちが使うことを提案する
傘の言葉 'Upper Basal' と 'Lower Basal' ちょうど深さを示すために
です。 ダイポールフィッティングの深さ情報は、関連する可能性があります
実際のダイポールシートのエリア情報なので、最小限に
'upper' と 'lower' の区別が役立ちます。

# 出版作品

専用のテクニカルペーパーは用意しておりません。 しかし、カップル
グループSIFTを用いた臨床研究は既に公開されています。 ログイン
et al. (2019) は、メソッドの比較的詳細な説明を持っています
補足(一部更新が必要)。

[ロオ ら. (2019) キュードアイブリンク中の神経活性化とコネクティビティは、慢性的なティック障害にあります。 *NeuroImage: 臨床* 24:101956](https://www.sciencedirect.com/science/article/pii/S2213158219303067?via%3Dihub)

[越山 ら。 (2020) 異常な効果的な接続は、schizophreniaの聴覚不均衡障害を根絶する。 *生物学的精神医学CNNI* 5:1028-1039.](https://www.sciencedirect.com/science/article/abs/pii/S245190222030135X)

[越山 ら. (2020) シュイソフレンア患者における状態のコネクティビティ異常の神経生理学的特性評価. *フロント精神医学* 11:608154.](https://www.frontiersin.org/articles/10.3389/fpsyt.2020.608154/full)

[Koshiyama ら. (2020) 講堂ベースの認知トレーニングは、SchizophreniaのCortical Networksの短期および長期の可塑性を駆動. *Schizophrenia Bulletin Open*1:sgaa065.](https://academic.oup.com/schizbullopen/article/1/1/sgaa065/5998109)

[ミヤコシら (2021) AudioMaze: 人間の空間ナビゲーションのEEGとモーションキャプチャの研究は、拡張現実を踏襲しました。 ※NeuroscienceI*の欧州ジャーナルは、印刷先のオンライン版です。](https://onlinelibrary.wiley.com/doi/10.1111/ejn.15131)

[Jurgiel ら. (2021) 小児の病変の抑制制御: aberrant fronto parietal ネットワーク活動と接続. *ブレインコミュニケーション* 3:fcab067.](https://academic.oup.com/braincomms/article/3/2/fcab067/6219298)

[Jurgiel ら. (2023) 注意-Deficit/Hyperactive Disorder および脳接続上の Tic Disorder の添加剤および相互効果. *生物学的精神医学:認知神経科学と神経刺激* 8:1094-1102.](https://www.sciencedirect.com/science/article/pii/S245190222200249X)

[Tseng ら. (2024) 神経ネットワークの動体と脳の発振は、インターネットの中毒における有能な阻害制御を根本的に. *神経系・リハビリテーション工学に関するIEEE取引* 32:946-955.](https://ieeexplore.ieee.org/abstract/document/10431676)

# ダウンロード
GroupSIFT は EEGLAB プラグインマネージャーにはありません。 zipファイルのダウンロードでGroupSIFTをインストールできます。 [GitHubリポジトリ](https://github.com/sccn/groupSIFT), 'Code' (緑のボタン) -> 'ZIP' をダウンロード (ボタンのメニュー項目). ファイルを解凍し、EEGLABプラグインフォルダに結果フォルダを配置します。 現在のバージョンは0.51です。

# サポート
グループSIFTは、NINDS 80160と97484がサポートした慢性疾患(PI Sandra Loo)の研究のためのプロジェクトのために開発されました。
