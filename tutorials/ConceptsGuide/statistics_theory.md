---
layout: default
title: Statistics
nav_title: "統計"
long_title: Statistics
parent: Concepts guide
grand_parent: Tutorials
---

EEGLABの統計
==============================

グループ、セッション、条件間の違いを観察するには、統計計算が不可欠です。
EEGLAB では、ユーザが他の言語でも利用することができます。
パラメトリックまたは非パラメトリックの統計を計算し、推定する
条件および/またはグループを渡るこれらの相違の信頼性。
この背景セクションでは、EEG研究で使用される統計手法の理論的基礎を説明します。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN3M_CGqAOEIIOKhjTPS9T2n" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></center>


<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>


異なる種類の固有の統計
------------------------------

データの統計を行う最良の方法は?
連続した数値データですか、それとも分類/離散データですか?
CochranのQテスト済み。
EEGデータと関連情報

### パラメトリック統計

dataがGaussianの場合、t-test(ペアリング)
あなたが2つの条件以上の場合、または
 あなたの  あなたの  あなたの
ANOVAは、
ANCOVA について
Gaussian は、パラオテストをします。しかし、その力は、
他の試験と比較して削減します。

一部のデータでは、正規分布に近づけるために
ログトランスフォーム

### 非パラメトリック統計

すべてのパラメトリックテストで同等の非パラメトリックテストが存在します。
これらのテストは、ガウスの確率分布を仮定します
署名 test テスト テスト Wilcoxonテスト;
unpaired t-test -\> Mann Whitney Uテスト; ANOVA -\> クルカル・ワリス
フライドマンは、EEGデータにおいて、以下のとおりです。

### 非Gaussian の言語テスト

EEGデータは必ずしもGaussian分布に従いません。
Surrogate は、Surrogate の値をシャッッッピーで構成します。
条件間で、利息の対策を講じる
このサイトについて
相違の配分を得、元のかどうかを見ることができます
この投稿をお気に入りにする
条件、元の違いの仮説
違いは尾にならない。 もしあれば、評価できます。
H0 は、その点を明らかにする。
Permutationテストは置換なしでデータをシャッフルし、
ブートストラップは置換ありで描画を行います。理論的には、
描画が互いに独立しているため、ブートストラップの方が有効です。
しかし実際には、2つのテスト間の違いはわずかです。
このようなアプローチの欠点は、計算に時間がかかることができることです。

データのクリーナー、統計が容易になります。 しかし、きれいなデータを取得する
自らの努力です。 アウトリアが存在する場合、テストを監視します。
最も堅牢です。 しかしながら、これらでも、代理テストが失敗する可能性がある
条件。 ソリューションは、それぞれの値の分布をトリムすることです。
テストの反復。

データ探索のためのパラメトリックテストを使用することをお勧めします
彼らは高速に計算するので. ただし、出版物については、代理テストの使用をお勧めします。

EEGLAB の解析
-----------------------------------------
EEGLAB は、パラパラダイテスト(ペアリングテスト)を 実行します。
ERPs、スペクトラ、ERSPs、ICCs は、不断のテスト、ANOVA です。 

詳しくはこちら
ソースレベルの解析では、代わりにソース推定値が使用されます。
これは、関心のあるデータが
頭皮ではなく、脳自体で。 * 必須

EEGLABでは、代理テストを使用して、条件間の差が統計的に有意かどうかを検定します。
各被験者に対して、各試験で受験者を受験する 

参加条件: 参加条件
unpaired t-test 濡. 用語集
EEGLABは、T-testのT-testのT-testのT-testのT-testである。
p-values はすべての周波数で計算されます。 ERSP と ITC の場合
time/frequency は、毎回 p-values が計算されます。
ポイント。

EEGLAB関数は、非パラレルを計算する。nullの
仮説は、条件間に違いがないということです。この
場合、条件の ERwhile は、
「代理」分布を構築するために、条件間のデータが
ランダムにシャッフルされている。 例は以下のとおりです。

15の件数と2つの条件を考えると、使用してみましょう
<span style="color: red"> a1, a2, a3, ... a15</span>, スカルプ
各被験者のスカルプチャンネルマップを
最初の条件、および <span style="color: green">b1、b2、b3、b15</span>,
 2つの条件のERP値。 

 条件が異なるので、
>
<span style="color: blue">d</span> = mean(
(<span style= "color: red">a1の</span>-<span style="color: green">b1の</span>) +
(<span style= "color: red">a2の</span>-<span style="color: green">b2</span>) + ... +
(<span style= "color: red">a15の</span>-<span style="color: green">b15の</span>) ).

今度は、2つの条件間のこれらの値を繰り返しシャッフルすれば
(大幅な違いがない場合のヌル仮説の下)
それらの間で)、そしてそれからシャッフルされた値の平均、
>
<span style="color: blue">d1の</span> = 平均()
(<span style="color: green">b1の</span>-<span style = "color: red">a1の</span>) +
(<span style = "color: red">a2の</span>-<span style="color: green">b2</span>) + ... +
(<span style="color: green">b15の</span>-<span style = "color: red">a15の</span>) ).
>
<span style="color: blue">d2の</span> = 平均()
(<span style="color: red">a1の</span>-<span style="color: green">b1の</span>) +
(<span style="color: green">b2</span>-<span style="color: red">a2の</span>) + ... +
(<span style="color: red">a15の</span>-<span style="color: green">b15の</span>) ).
>
<span style="color: blue">d3</span> = 平均()
(<span style="color: green">b1の</span>-<span style="color: red">a1の</span>) +
(<span style="color: green">b2</span>-<span style="color: red">a2の</span>) + ... +
(<span style="color: red">a15の</span>-<span style="color: green">b15の</span>) ).
...

シャッフルされたすべてのERP値の差分から
<i>d</i> のnull仮説分布を構築します（スムース化した
ヒストグラムを作成します。元の値 <i>d</i> が
この代理価値配分の非常に尾で、それから
仮説 (null 仮説) は
同様に拒絶され、観察された状態の相違はかもしれない
統計的に有効または有意であると言われています。




![こちら](/assets/images/Statistics.gif)



上記の代理値分布が任意の形状を取ることができることに注意してください。
ガウスは必要ありません。 練習では意味を計算しません
条件 ERP は、その t 値 (定義された言葉) です。
正方形の差と乗算の標準的な偏差
観察回数のルートが少ない)。 結果は等しいです
意味の違いを使用する。 利点は私達がより多くのを持っているときです
コンピューティングにおいて、
t-test または ANOVA の 量分布 は、
すべての被験者を横断する距離測定を得ることができる「トリック」
パラメトリックt-test
またはアノバモデルは、ガウス値分布を根本的に想定しています。

複数の比較修正
----------------------------------

多数の統計的推論を行う場合、
複数の比較を修正する必要があります。 例えば、
p\<0.05、定義的値、推論値の5%
重要な値は偽陽性になります。 短いビデオを見ることをお勧めします [YouTubeの比較](https://youtu.be/DQQAkID0vNQ).

複数の比較を修正するためのいくつかの方法があります。

-   <b>ボンフェロニ</b>: : : 最も保守的な方法、ボンフェロニ
    メソッドは、比較数でp-valueを分割します。
    例えば、100 の ERSP の ERSP の ERSP の ERSP の ERSP の ERSP の ERSP の ERSP の ERSP の ERSP の ERSP の 値 を 計算する
    200点の周波数、推論回数は20,000点です。
    p\<0.05 では、複数の言語で、
    0.05/20000 = 0.0000025のしきい値が適用されます。 この方法
    としてかなり保守的です, 基本的に, それは仮定します (誤って) その
    すべての時間/頻度は独立しています。

-   <b>ホルムの方法</b>: : : : Holm's method, ホルム・フェボロニ
    メソッドは必須です。
    ソート  p  p
    複数の比較のためにしきい値、値が偽り値が
    0.05/20000 の Bonferroni の 統計的 しきい値 へ続く
    第2位は統計的閾値と比較して
    0.05/(20000-1)、等。 最小限のp値、
    0.05/(20000-19999)=0.05の誤ったしきい値。

<!-- -->

-   <b>偽の発見 レート:</b> 偽物法の規定
    偽発見率（FDR）は、多重比較における第一種の過誤率を制御するための方法です。FDRはBonferroni補正やHolm-Bonferroni法よりも検出力が高い傾向があります。

EEGLABでは、メソッドの解析をしています。
FieldTrip と LIMO -- は、最大、クラスター、および TFCE メソッドです。
    非パラメトリック(データベースの統計を代理)。

-   <b>最高の方法:</b> 各反復で
    時間の頻度の代理分布を計算する
    分解(例えば)、すべての全体で最大の統計
    時間頻度ポイントを計算します。 代理配分はあります
    これらのコンパイル <i>マックス</i> 統計情報 元の統計
    (例:t-scores) は、すべての周波数点で比較します。
    このユニークな代理販売に対して(各々の代わりに)
    その対応する代理と比較して時間頻度ポイント
    他の方法のように分布。

-   <b>クラスタメソッド:</b> クラスターメソッドも利用できます
    統計情報(未修正)

-   <b>Threshold's は、次のようにします。</b> TFCE メソッドは、EEGLAB LIMO でのみ有効です。 

EEGLABのこだわり 
----------------------------------

複雑な設計では、設計行列をこのように構築することも可能です。
特許出願中
パラメータに合った一般的なリニアモデル。 ふりがな [LIMOシリーズ](https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN2Vrzte9ul3nrrG8AgB5OkU) EEGLABとEEGLABは、EEGLABとEEEGLABを融合し、 [LIMOツールボックス](https://limo-eeg-toolbox.github.io/limo_meeg/)このサイトでは、JavaScriptを有効にしてご覧ください。

追加のヒントとリソース
---------------------

<b>しない:</b> p-hacking は、すべてのクライアントが、
1つのテストが期待するテストとデータ変換
重要な(そしてそれは通常!)。 明らかにこのタイプの練習
捨てるべきです。 練習では、いくつか調べてみたい
複数の比較を修正するための推論テストとメソッド
記事のすべての結果を報告します。

詳細については、関連する統計書を参照することをお勧めします。
[詳しくはこちら](http://sccn.ucsd.edu/~arno/mypapers/statistics.pdf)このサイトについて Ran Wilcoxの教科書を書く [堅牢な推定と仮説のテスト入門](https://www.sciencedirect.com/book/9780123869838/introduction-to-robust-estimation-and-hypothesis-testing).

