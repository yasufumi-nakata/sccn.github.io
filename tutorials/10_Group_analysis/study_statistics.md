---
layout: default
title: e. STUDY statistics
long_title: e. STUDY statistics
parent: 10. Group analysis
grand_parent: Tutorials 
has_toc: true
---

統計と可視化オプション
============================================
お問い合わせ

EGのコアは、
科学研究 EEGLAB のドキュメントの解析 [統計理論](/tutorials/ConceptsGuide/statistics_theory.html) チュートリアルのセクションまたは以下の短いビデオのシリーズを見てください。 右上のアイコンをクリックして、プレイリスト内の動画のリストにアクセスします。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN3M_CGqAOEIIOKhjTPS9T2n" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></center>

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

科学研究
--------------
エッグラボ ユーザが利用するのは、
パラメトリックまたは非パラメトリックの統計を計算し、推定する
*STUDY*は、以下のとおりです。
すべての対策を適用し、両方のスカルプチャネルで有効であるが
そして独立した部品(または他の)の源の活動のクラスター。

### 交通アクセス

このチュートリアルでは、 [スタンスチュディ](http://sccn.ucsd.edu/eeglab/download/STUDYstern_125hz.zip) (0.9 Gb)。 パソコン 特別情報 [STUDY デザイン](/tutorials/10_Group_analysis/working_with_study_designs.html) このデータセットの詳細については、チュートリアルのセクション。

メニュー項目を使用する <span style="color: brown">ファイル → 既存の研究をロードする</span> *stern_3designs.study*ファイル。 STUDY*は、 <span style="color: brown">研究 → 選択/編集研究設計</span> メニュー項目。 詳細はこちら [チュートリアル](/tutorials/10_Group_analysis/working_with_study_designs.html) これらのデザインを作成する方法の詳細。

チャンネル対策をプロットする前に、事前にコンプトする必要があります
それらを使って <span style="color: brown">研究 → プレコプトチャネル対策</span> 以下に示すようにメニュー項目。
- チェックボックス * 個々のデータセットの ICA の id ファクチュ コンポーネント へ 削除 * 必須
- *ERPs*チェックボックス
- ベースラインを以下に示すように-200〜0に変更
- プレス *Ok* 

![](/assets/images/studystats1.png)

### ERPのプロットの1方向ANOVA

メニュー項目を選択 <span style="color: brown">研究 → プロットチャネル対策</span>左列のチャンネル *Oz* は

![画像が見つかりません](/assets/images/studystats03.png)

*Params*ボタン、200 msから600 msまでの範囲内で、ERP からプロトット時間の範囲を制限します。

![画像が見つかりません](/assets/images/studystats04.png)

チャンネルの2つのリストの中央に、クリック
このページではjavascriptを使用しています。 
- *1st 変数の* は、
本研究では、この研究の変数が選択的である、*Compute 2nd 変数の統計*が使用されます。 
- *Parametrics* のデータベース *permutation を 使ってください。
統計は、データを探索するのに適しているかもしれません。
permutation ディレクトリ 
- ラジオリスト False Discovery Rate(FDR) メソッド、 複数の ソース 。 
- p 値のしきいの*0.05*
- プレス *Ok*.

![画像が見つかりません](/assets/images/studystats05.png)

お問い合わせ  以下の ポップアップ * * * * * * * * * * * * * * * * * * * * * * の の の の の の の の の の 。 。 。 の 。 。 。 。 の 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 の 。 。 。 。 ERPのプロットバックにブラックバーに約450msの写真を撮る ベースライン、100ms の pc の pc の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s s の s s の s s s の s s の s s s s s s の s s s s s s の s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s

![画像が見つかりません](/assets/images/studystats06.png)

*STATS*ボタンを右折してください。
- チェックボックス *FieldTrip のステータス 
- *montecarlo/permutation* は、
- *クラスターは必須です。 FieldTrip では、クラスタのパラメータをデフォルト値として指定します。 
- 統計閾値の*0.05*を使用してください。 
- プレス *Ok*.

![画像が見つかりません](/assets/images/studystats07.png)

ERPs*ボタンを押しながら、左の列に*Plot ERPs*ボタンを押します。 地域別の方法として、FDRの分野を詳しく説明しています。

![画像が見つかりません](/assets/images/studystats08.png)

### ERPのスカルプトポグラフィの1方向ANOVA

*Params*ボタンを押下し、150〜300msの範囲。 *Plot は、Plot の time* で永続化したトポグラフィです。 *Ok* 詳しくはこちら

![画像が見つかりません](/assets/images/studystats10.png)

*STATS*は、FDRで定義する際の解析を行ないます。

![画像が見つかりません](/assets/images/studystats11.png)

左の*Sel all.*ボタン、すべてのチャンネル。 ERPs*ボタンを押します。 このサイトについて ms の sカルプトプトポグラフィ に表示し、 p 値のマップ(右)。 違いは、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、 、

![画像が見つかりません](/assets/images/studystats12.png)

### 2アノバウェイ

※STUDY*のプロノートは、以下のとおりです。 [STUDY デザイン](/tutorials/10_Group_analysis/working_with_study_designs.html) チュートリアルでは、この設計は、どのようにしておけば良いですか?

![画像が見つかりません](/assets/images/studystats15.png)

*Params*は、図200ミリ秒から600ミリ秒のプロタイム範囲で指定します。 オブジェクトの*Plot にチェックボックスをオンにします。 *Plot は、Plot で選択してください*。 プレス *Ok*.

![画像が見つかりません](/assets/images/studystats16.png)

*Plot ERPs*ボタンを押します。

![画像が見つかりません](/assets/images/studystats17.png)

150ms〜300msの範囲で、スカルプトポグラフィの統計研究を行います。 *Params* ボタン、150 msから300 ms まで対応可能 *Plot に 選択してください。* Plot にチェックボックスを外すか、またはチェックボックスを外すか( ) にチェックボックスを外すか( )

![画像が見つかりません](/assets/images/studystats18.png)

*STATS*は、以下のとおりです。 複数の比較をするには、 複数の比較を .

![画像が見つかりません](/assets/images/studystats19.png)

*Plot ERPs*ボタンが開きます。 *ignore*と*memorize*の5つの項目をそれぞれ2 x 5に並べ替えます。 *ignore*と*memorize*の5つの項目をそれぞれ表示します。 マウスのスカルプトポグラフィは、条件(*ignore*と*memorize*)を合わせます。 右 特別スカルプトポグラフィ, メモリ ライセンス 値マップ . 右下隅にあるスカルプトポグラフィは、条件をクリアして、ANOVAの相互の用語はpの点で示します。 実際のところ、メモリの通信速度は、以下のとおりです。 各々の変数の関数が計算されます。 ロード変数の統計は、7つの異なる言語で実行できます。

![画像が見つかりません](/assets/images/studystats20.png)

*STATS*ボタンは選択し、複数の比較チェックボックス(未表示)の*FDR*で選択してください。 *Plot ERPs*ボタンは、以下のとおりです。

![画像が見つかりません](/assets/images/studystats22.png)

複数の比較をするには、ANOVAs の 2 方向の ANOVAs が あります。 *FieldTrip* 統計 *Montecarlo/permutation* . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

![画像が見つかりません](/assets/images/studystats23.png)

*Plot ERPs*ボタンを押します。

![画像が見つかりません](/assets/images/studystats24.png)

統計情報* このページではjavascriptを使用しています。

![画像が見つかりません](/assets/images/studystats25.png)

ERPs*Plot ERPs* は、 過去に 観測 は、 処理 は 0、1、2 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 は、 処理 処理 は、 処理 処理 と 処理 処理 処理 処理 は、 処理 処理 処理 処理 処理 が、 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 は、 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 処理 

![画像が見つかりません](/assets/images/studystats26.png)

最優先事項 不利な条件は、より良く、クラスターが自信を持って行動する、という点でもあります。 P-values から p-values へアクセス [グループ分析スクリプトチュートリアル](/tutorials/11_Scripting/command_line_study_functions.html).

一般的には、非曖昧な結果を報告することに重点を置いています(複数比較修正後、0.005未満の重要度)。

および、ITC、およびERSPの関連法
-------------------------------

P/ITCのソリューション
ERPss は、以下の手順で説明しています。 お問い合わせ
詳細は、関連する機能ヘルプメッセージを参照することができます。 

ICAコンポーネントクラスタ
----
統計比較のための同じ方法は、データチャネルとコンポーネントクラスターのグループに適用されます。 

プロット インターフェイス、チャネルとコンポーネントのクラスター、およびローカル 左 左 左 左 の の を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を では、クラスターのクラスターは、クラスターのクラスターをプロットし、クラスターのクラスターは、

LIMOは、
----
ふりがな [LIMOツールボックス](https://limo-eeg-toolbox.github.io/limo_meeg/) 任意の数の分類と連続変数の一般的な線形モデリングアプローチを使用することを可能にします。 詳細については、を参照してください。 [LIMOのプラグイン](https://github.com/LIMO-EEG-Toolbox/limo_meeg/wiki) そして、 [LIMOチュートリアルビデオシリーズ](https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN2Vrzte9ul3nrrG8AgB5OkU).

単一サブジェクト統計
----
*STUDY*は、対象者のみが対象となります。 以下は、ERP が指定するにあたり、ERP が指定するかどうか、*ERP-image*、*ERP*、*ERSP*、*ITC* などの設定を行ないます。

チュートリアルのこのセクションでは、我々は使用します [5-サブジェクト実験](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip) (450Mb) 5つの被験者実験の1つを伴います。 [STUDY作成チュートリアル](/tutorials/10_Group_analysis/study_creation.html) このデータに関する詳細情報 

EEGLAB は、EEGLAB をクラウドファンディングで管理します。 <span style="color: brown">ファイル → 既存のデータセットをロードする</span> メニュー項目. 複数のデータセットは, 以下に示すように, EEGLABは, 読み込む.

![](/assets/images/multisub1.png)

次に、 <span style="color: brown">ファイル → 研究の作成 → 読み込まれたすべてのデータセットを使用する</span> メニュー項目。

![](/assets/images/singlestat1.png)

選択する <span style="color: brown">研究 → プレコプトチャネル対策</span> メニュー *ERPs*チェックボックス、200 msをベースライン0 msに入力してください。

![](/assets/images/singlestat2.png)

次に、選択します <span style="color: brown">研究 → プロットチャネル対策</span> メニュー

![](/assets/images/singlestat3.png)

*Plot ERPs* ボタンの横に*Params* ボタンを押します。 範囲の -200 ms に 1000 の ms に ms があります。 *Plot は *Ok* を押します。

![](/assets/images/singlestat4.png)

*STATS*は、以下のとおりです。 FDR修正* . 以下にインストールします。,p-値のしきい値* 0.01*. .

![](/assets/images/singlestat5.png)

*Plot ERPs* は、 条件を満たす ERP は、黒い の 表 の 地域 の 表 です。 Stimuliは、約400msの皮下条件とERPが混在しています。

![](/assets/images/singlestat6.png)

ません ません すべての 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 以上 

プロフィール 仮説は、この作品の試行錯誤です。 複数の被験者との関連性について、nullは被験者に被験者を被ったと関連しています。

ふりがな [LIMOプラグイン](https://github.com/LIMO-EEG-Toolbox/limo_meeg/wiki) その他、EEGLAB で で
