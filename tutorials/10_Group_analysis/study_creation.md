---
layout: default
title: b. STUDY creation
nav_title: "b. STUDY制作"
long_title: b. How to create and EEGLAB STUDY
parent: 10. Group analysis
grand_parent: Tutorials 
---

STUDYについて
====================
お問い合わせ

チュートリアルのこの部分は、EEGLABのチュートリアル
STUDY は、 
EEGLAB STUDY(または研究) は、
例えば 例えば 例えば
1 つ以上の条件で被験者のグループからのデータセット
同じタスクまたは異なるタスクの実行
STUDY*の学習、実験的研究の専攻、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究、研究 

チュートリアルでは、EEGLAB(Youtubeでホスト) の処理をしています。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/kofJh7biGsE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

グループレベルの分析の準備
--------------------------

### 5-subject チュートリアル

このチュートリアルでは、 [5-サブジェクトティー](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip) (450Mb) Peter Ullsberger と 5 件のフィードバックを投稿しました。
彼らが区別するように求められた監査タスクを実行する
同義語と非同義語の単語のペアの間で (第二の単語
最初の1秒後に提示しました。 

データエポックは2から抽出されました
2 番目の単語が 2 秒の単語のオンセットの後の 2 秒の前の秒。

ICA では、各実験者解読、EEGデータセットが
1 (Synonyms) は 2 です。
最初の1と同義語で、その中の1(非同義語)
2番目の単語は最初の代名詞ではありませんでした。 

したがって、研究には10が含まれています
データセット、各5件ごとに2つの条件データセット。 両方から
各被写体のデータセットは、単一のセッションで記録され、
分解と独立したコンポーネントマップは同じです
それぞれの被験者に対する両方の条件を渡します。

に に に
EEGLAB リリースの 'sample_data' サブフォルダ
現在使用している) これは、
サブフォルダ *STUDY5subjects*.
MATLAB セッションと実行 *\>\> eeglab*.

STUDY*のチュートリアル [STERNタスクデータ](http://sccn.ucsd.edu/eeglab/download/STUDYstern_125hz.zip) (0.9Gb) および [動物/非動物分類タスクデータ](https://sccn.ucsd.edu/eeglab/download/animal_study.zip) (0.4Gb).

### データ組織

*STUDY* の用語は、
STUDY について
構造および意義。 

チュートリアルデータは既に最適に整理されています。 しかし、作成するとき
STUDY は、実行する
STUDYの特徴。 

1つのディレクトリまたはフォルダーを1つ作成することをお勧めします。
対象の EEG のデータセット (.set") を 設定します。
このフォルダ。 より良いものでも、 [BIDS EEGLABのプラグイン](https://github.com/sccn/bids-matlab-tools/wiki) BIDSを整理する。 STUDY 関数は、
同じ被写体ディレクトリへのファイル。

### EEGLAB環境設定

また、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、EEGLAB では、様々なオプションのメニューから選択できます。 <span style="color: brown">ファイル → 環境設定</span>. 
最初のオプションは、複数のデータセットがメモリに保存されているかどうかを決定します。 グループ分析を実行すると、メモリ内のすべてのデータセットを保持できないため、このオプションを選択します。

![サイトマップ](/assets/images/preferences.png)

使用時間 *STUDY* は、
EEGLAB にロードします。
必要に応じて、メインを通して、個別にアクセスおよび変更
EEGLABの特徴
カスタムデータセット処理スクリプト。 データセットのデータ配列はディスクからいつでも読み込まれます
EEGLABは、EEGLABの言語を翻訳しています。
MATLAB は、MATLAB をロード・アンド・リザーブ(2,300 は全時間記録です。) 

迅速な STUDYの作成
---------------------------------------------
解凍した後 [5-subjectチュートリアルデータ](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip), 選択
 <span style="color: brown">資料ダウンロード → ERPスタディ</span> *STUDY*は必須項目です。 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件 条件

![](/assets/images/simplestudy1.png)

ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名: ユーザ名 ※Ok* は必須です。

![](/assets/images/simplestudy3.png)

次の記事 のための のための のための です 新しい 新しい *STUDY* の写実的なGUI は、 [STUDY文明化チュートリアル](/tutorials/10_Group_analysis/study_data_visualization_tools.html).

![](/assets/images/simplestudy2.png)

*STUDY*は、 STUDY*の作成方法  この より より

新着情報
-----------------
*STUDY*は、
 <span style="color: brown">ファイル → 研究の作成 → データセットの閲覧</span> メニュー項目。

別のオプションは、
エッグラボ 総合研究
お問い合わせ 
<span style="color: brown">ファイル → 研究の作成 → 読み込まれたすべてのデータセットを使用する</span> メニュー項目。 
下記のものと同様の空白インターフェイス
*STUDY* は、
('N400' ),研究の簡単な説明('Auditory ).
同義語Vs。非同義語、N400')。 

ここでは、メモを書いていません。
勉強しますが、自分の研究のためにそうすることをお勧めします。 ふりがな
蓄積されたメモは、研究で常に読み込まれ、後で増加します
再分析・再分析 フィールド *Subject* と *Condition* (above) は、
自動的に。 既にデータセットが含まれているためです。
インフォメーション たとえば、このデータセットをロードする
EEGLABについて <span style="color: brown">編集 → データセット情報</span> メニュー項目は、*subject*、*condition*、*group*、*session*、*run*をこのデータセットに作成します。  また で で で このページではjavascriptを使用しています。 お問い合わせ

*Browse* は、 

インターフェイスウィンドウは次のようになります。

![](/assets/images/studycreate.png)

以下は、*STUDY* の用語 *subject*、*session*、*run*、*condition*、**group* の用語です。

- ウィンドウのウィンドウは、STUDYを呼び出します。
実行名、STUDY . . .
- 次のセクションには、10つのデータセットに関する情報が含まれています。
STUDYの部分。各データセット、サブジェクトコードを指定します。
条件名。 
- これらは、以下のとおりです。 実験のブロック、各ブロックのデータが別々のファイルです。 STUDY* は、STUDY* は、STUDY* は、STUDY* は、STUDY* は、STUDY* は、STUDY* は、STUDY* は、STUDY* は、STUDY* が、STUDY* は、STUDY* が、STUDY* は、STUDY* が、STUDY* は、STUDY* は、STUDY* が、STUDY* は、STUDY* は、STUDY* から始まる。
- *条件* ????????????????? 対象のファイルとEEGLABイベントの試用版を組み合わせる このサイトについて [チュートリアル](/tutorials/10_Group_analysis/working_with_study_designs.html).
- *group* は、STUDY の関連性について
1つのグループのみでした。
- ※r.v.{{{{{{{{{{{{{{{}}}}}}}{{{{{}}}}}}}{{{{{{{{{}}}}}{{{{{{{{{}}}}}}}}}}}}}{{{{{{{{}}}}}}}}}}}{{{{{{{{{{}}}}}}}}}}{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}}}}}}
- *Clear* は、

一般的には、データセットの情報を一貫したものにすることを好む
お問い合わせ をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて をすべて

Ok* は、 [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_study.m) すべてのデータセットをインポートする

EEGLABラボ、*STUDY* も も も も も も も も も も い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い す い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い い
メニュー項目 <span style="color: brown">ファイル → 学習をそのまま保存する</span> 閉鎖の後で [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_study.m) ウィンドウ。

既存の  
-------------------------------

前のセクションまたはロードで作成したスタディセットを使用する
別のスタディセット。 スタディセットをロードするには、 <span style="color: brown">ファイル → 既存の研究をロードする</span> メニュー項目。 ファイルを選択します。
*STUDY5subjects*のフォルダ(N400.study*)。 カートンまたは作成
EEGLAB は、EEGLAB の言語を勉強しています。

![研究窓](/assets/images/guistudy.png)

EEGLAB GUI では、 
- *Epoch's は、
すべてのデータセットのデータエポックが同じ長さを持ち、
制限事項
- *フレームごとのチャネル*は各チャネルの数を示します
データセットの (*異なるデータセットを処理することは可能です)
チャンネル数*
- *チャネルの場所*はかどうかを示します
すべてのデータセットでチャンネルの場所が公開されます。 
- *Clusters* は、クラスターのクラスターです。
STUDYのクラスターは、
スタディ 翻訳は、すべての選択されたコンポーネントから構成されます。
データセット。
- *Status* は、
STUDYが準備完了です
プリクラスタ 

STUDYにデータセットをリストに、
<span style="color: brown">学習 → 学習情報編集</span> メニュー項目。 前のセクションで説明したインターフェイスがポップアップ表示されます。

### STUDYデータセット
個々のデータセットを選択する
<span style="color: brown">データセット</span> メニュー項目は個人を編集することを可能にします
*STUDY*データセット 

ただし、新しいデータセットを作成するか、
データセット削除と、メモリから*STUDY*も削除されます。
に に に では よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう よう

### STUDYデザイン

その他 [チュートリアルのセクション](/tutorials/10_Group_analysis/working_with_study_designs.html) *STUDY*の詳細は、こちらでご確認ください。

STUDYデザインを編集する
2位STUDYメニュー <span style="color: brown">研究 → 選択/編集研究設計</span>.

![サイトマップ](/assets/images/Studydesignmenu.jpg)

以下のインターフェイスをポップアップします。

![サイトマップ](/assets/images/studydesign1.png)

トップパネルには、デザインのリスト(この場合、単一デザイン)、下部パネルには、特定の設計で使用される変数が含まれています。

*Rename* ボタンを *Synonym と non-synonym*  次の  次の  次の  次の  次の

![サイトマップ](/assets/images/studydesign2.png)

とりあえず、 *condition*の変数が選択されます。 また、2つの条件は*non-synonyms*と*synonyms*です。

![サイトマップ](/assets/images/studydesign3.png)

### お問い合わせ

このチュートリアル *STUDY* は、ERP を得意としています。 <span style="color: brown">資料ダウンロード → ERPスタディ</span> メニュー STUDY*の構成は、STUDY*の構成から構成されます。 [グループ分析の可視化チュートリアル](/tutorials/10_Group_analysis/study_data_visualization_tools.html).

不当な場合、選択して下さい <span style="color: brown">研究 → プレコプトチャネル対策</span> メニューの項目は、*ERPs*チェックボックス、*Ok* です。 <span style="color: brown">研究 → プロットチャネル対策</span> メニュー項目は、*Plot ERPs* pushbutton , リストの ERP をプロットする. 各条件 条件 条件 条件 条件

![](/assets/images/simplestudyplot.png)






