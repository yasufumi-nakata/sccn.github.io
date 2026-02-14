---
layout: default
title: b. STUDY creation
long_title: b. How to create and EEGLAB STUDY
parent: 10. Group analysis
grand_parent: Tutorials 
---

STUDYの作成
====================
お問い合わせ

チュートリアルのこの部分は、EEGLABを作成する方法を示しています
STUDYは簡単なプロットを実行します。 
EEGLAB STUDY(または研究)には、データの記述とリンクが含まれています
多数のepochedか連続的なデータセット、例えば、セットに含まれている
1 つ以上の条件で被験者のグループからのデータセット
同じタスクまたは異なるタスクの実行
セッション。 *STUDY*を使用して、実験的研究の複数の科目、セッション、および/または条件から記録されたデータを管理および処理します。 

以下のチュートリアルセクションに加えて、EEGLAB(Youtubeでホストされている)で処理する複数の被写体で以下の短いビデオを見たい場合があります。

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

### 5-subject実験チュートリアルデータの記述

このチュートリアルでは、 [5-サブジェクトSTUDY](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip) (450Mb)。 これらのデータは、Peter Ullsbergerと5つの被験者から取得されました。
彼らが区別するように求められた監査タスクを実行する
同義語と非同義語の単語のペアの間で (第二の単語
最初の1秒後に提示しました。 

データエポックは2から抽出されました
2 番目の単語が 2 秒の単語のオンセットの後の 2 秒の前の秒。

ICAで各被験者のデータを解読した後、2つのEEGデータセットが
抽出された 1 (Synonyms) は、2 番目の単語が行われた試験を作曲する
最初の1と同義語で、その中の1(非同義語)
2番目の単語は最初の代名詞ではありませんでした。 

したがって、研究には10が含まれています
データセット、各5件ごとに2つの条件データセット。 両方から
各被写体のデータセットは、単一のセッションで記録され、
分解と独立したコンポーネントマップは同じです
それぞれの被験者に対する両方の条件を渡します。

サンプルSTUDYデータをダウンロードした後、フォルダーに解凍します
EEGLAB リリースの 'sample_data' サブフォルダで、
現在使用している) これは、
サブフォルダを作成する *STUDY5subjects*. それから開いた
MATLABセッションと実行 *\>\> eeglab*.

他のEEGLAB *STUDY*チュートリアルでは、我々はまた、使用します [STERNタスクデータ](http://sccn.ucsd.edu/eeglab/download/STUDYstern_125hz.zip) (0.9Gb) および [動物/非動物分類タスクデータ](https://sccn.ucsd.edu/eeglab/download/animal_study.zip) (0.4Gb).

### データ組織

*STUDY* という用語は、データセットであることを示しています。
単一の実験的なSTUDYから発信し、比較可能でなければなりません
構造および意義。 

チュートリアルデータは既に最適に整理されています。 しかし、作成するとき
新しいSTUDYは、実行前にデータを整理することが望ましい
STUDYの機能。 

1つのディレクトリまたはフォルダーを1つ作成することをお勧めします。
対象の EEG のデータセット (.set") ファイルを格納します。
このフォルダ。 より良いものでも、 [BIDS EEGLABプラグイン](https://github.com/sccn/bids-matlab-tools/wiki) データを整理し、BIDSに準拠させる。 STUDY 関数は自動的に測定を追加します。
同じ被写体ディレクトリへのファイル。

### EEGLABメモリ設定

また、デフォルトの EEGLAB メモリオプションを変更することをお勧めします。 コールメニュー項目 <span style="color: brown">ファイル → 環境設定</span>. 
最初のオプションは、複数のデータセットがメモリに保存されているかどうかを決定します。 グループ分析を実行すると、メモリ内のすべてのデータセットを保持できないため、このオプションを選択します。

![画像:preferences.png](/assets/images/preferences.png)

使用時 *STUDY* データセットは
部分的にまたは完全に EEGLAB にロード。 このようにして、
必要に応じて、メインを通して、個別にアクセスおよび変更
EEGLAB のグラフィック インターフェイスか EEGLAB の機能を使用して内の
カスタムデータセット処理スクリプト。 データセットのデータ配列はディスクからいつでも読み込まれます
EEGLABはデータへのアクセスを要求しますが、メモリを乱すことなく。 お問い合わせ
MATLABは、大量のデータセット構造をロードおよび保持することを可能にします(2,300は全時間記録です)。 

迅速なSTUDY作成
---------------------------------------------
解凍した後 [5-subjectチュートリアルデータ](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip), 選択
 <span style="color: brown">ファイル → 研究の作成 → シンプルなERP STUDY</span> *STUDY*を作成するメニュー項目。 下のインターフェイスは現れます。 条件の数と被験者数の5つを2つ入力し、*Ok*を押します。

![](/assets/images/simplestudy1.png)

次に、以下のインターフェイスに次の情報を入力します。 データファイルの2列、条件の1つ *synonym* (files *synX-s253-clean.set)と条件の1つ *non-synonym* (files *synXX-s254-clean.set*)と1列あたりの1列。 参照(「...」)ボタンを使用してファイルを選択します。 *STUDY* "N400" の名前をつけ、 *Ok* を押して下さい。

![](/assets/images/simplestudy3.png)

次のインターフェイスがポップアップ表示されます。 1つは、すべての電極のための条件を渡る壮大な平均ERPです。 トレースをクリックすると、新しい数字がポップアップ表示されます。 他のインターフェイスは*STUDY*の写実的なGUIです。 このインターフェイスは細部で記述されます [STUDY視覚化チュートリアル](/tutorials/10_Group_analysis/study_data_visualization_tools.html).

![](/assets/images/simplestudy2.png)

*STUDY*を作成するのは簡単です。 このチュートリアルページの残りの部分では、*STUDY*作成の代替方法について説明します。 この他の方法は、より関与していますが、追加のパラメータを設定することができます。

新しいSTUDYを作る
-----------------
*STUDY*を作成するには、
 <span style="color: brown">ファイル → 研究の作成 → データセットの閲覧</span> メニュー項目。

別のオプションは、
EEGLAB 研究に含めるすべてのデータセットと選択
お問い合わせ 
<span style="color: brown">ファイル → 研究の作成 → 読み込まれたすべてのデータセットを使用する</span> メニュー項目。 
下記のものと同様の空白インターフェイス
が表示されます。 *STUDY*の名前を入力してください。
('N400')、および研究の短い説明('Auditory タスク:
同義語Vs。非同義語、N400')。 

ここでは、メモを書いていません。
勉強しますが、自分の研究のためにそうすることをお勧めします。 ふりがな
蓄積されたメモは、研究で常に読み込まれ、後で増加します
分析・再分析 フィールド *Subject* と *Condition* (above) が埋め込まれていることに注意してください。
自動的に。 既にデータセットが含まれているためです。
インフォメーション たとえば、このデータセットをロードする
EEGLABを選ぶことによって <span style="color: brown">編集 → データセット情報</span> メニュー項目は、*subject*、*condition*、*group*、*session*、および*run*をこのデータセットのために編集できます。 また、この情報を研究自体で編集することもできます。 データセット情報と学習データセット情報は、最大限の柔軟性を確保するために異なっているかもしれませんが、チェックボックス *更新データセット情報...* をチェックして一貫性を保つことをお勧めします。

最初の空白の場所にある *Browse* ボタンをクリックし、データセット名を選択します。 他のデータセットも同様です。 

インターフェイスウィンドウは次のようになります。

![](/assets/images/studycreate.png)

以下は、*STUDY* の用語 *subject*、*session*、*run*、*condition*、および*group* の意味を詳しく説明します。

- ウィンドウの上部には、STUDYに関する情報が含まれています。
実行名、STUDY の拡張タスク名、およびいくつかのノート。
- 次のセクションには、10つのデータセットに関する情報が含まれています。
STUDYの部分。 各データセットでは、サブジェクトコードを指定しています。
条件名。 
- 各ファイルでは、セッションを割り当て、番号を実行できます。 実験中のブロックが存在し、各ブロックのデータが別々のファイルに保存されます。 セッションは、データが異なる日に収集されるか、EEGキャップを除去することを含む休憩がある場合に使用されます。 この *STUDY* が 1 つのセッションと 1 件ずつ実行されるので、セッションを離れ、空に走ることを選択しました。
- *condition* 列には、各ファイルに関連する条件が含まれています。 ここに2つのファイルがあります。 ただし、対象のファイルとEEGLABイベントの試用型を使用して条件を定義することも可能です。 このトピックの詳細については、こちらをご覧ください [STUDYの設計チュートリアル](/tutorials/10_Group_analysis/working_with_study_designs.html).
- *group* カラムは、グループが属する項目を示します。 このSTUDYの関連性はあります
1つのグループのみでした。
- ※r.v.*(残留分散でICAコンポーネントを選択)と、ICAコンポーネントのクラスタリングを実行すると、*Comp...*ボタンが後に戻ってきます。
- *Clear*ボタンを押すと、指定した行の情報が消去されます。

一般的には、データセットの情報を一貫したものにすることを好む
*STUDY*情報 -- したがって、最初のチェックボックスをチェックします。 2番目のチェックボックスでは、現在のクラスター情報をすべて削除し、ICAコンポーネントのクラスタリングを実行したときに説明されます。

研究にデータセットを追加した後、*Ok*を押してください。 [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_study.m) すべてのデータセットをインポートするGUI

EEGLABを選択することで、*STUDY*も保存しておくことを強くお勧めします
メニュー項目 <span style="color: brown">ファイル → 学習をそのまま保存する</span> 閉鎖の後で [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_study.m) ウィンドウ。

既存のSTUDYを読み込む
-------------------------------

前のセクションまたはロードで作成したスタディセットを使用する
別のスタディセット。 スタディセットをロードするには、 <span style="color: brown">ファイル → 既存の研究をロードする</span> メニュー項目。 ファイルを選択します。
*STUDY5subjects*のフォルダ内のN400.study*。 ローディングまたは作成の後で
研究では、メインの EEGLAB インターフェイスはこのようになります。

![研究窓](/assets/images/guistudy.png)

EEGLAB GUI では、 
- *Epochの一貫性*はかどうかを示します
すべてのデータセットのデータエポックが同じ長さを持ち、
制限事項
- *フレームごとのチャネル*は各チャネルの数を示します
データセットの (*異なるデータセットを処理することは可能です)
チャンネル数*
- *チャネルの場所*はかどうかを示します
すべてのデータセットでチャンネルの場所が公開されます。 
- *Clusters* は、関連するコンポーネントクラスターの数を示します。
このSTUDYを使って。 関連する少なくとも1つのクラスターが常にあります
スタディ これらは、すべての選択済みICAコンポーネントからすべて含まれています
データセット。
- *Status* は現在のステータスを示します。
スチュディ。 上記の場合、この行はSTUDYが準備完了していることを示しています
プリクラスタ 

STUDYにデータセットをリストするには、
<span style="color: brown">学習 → 学習情報編集</span> メニュー項目。 前のセクションで説明したインターフェイスがポップアップ表示されます。

### STUDYデータセットの編集
個々のデータセットを選択する
<span style="color: brown">データセット</span> メニュー項目は個人を編集することを可能にします
*STUDY*のデータセット 

ただし、新しいデータセットを作成するか、
データセットを削除すると、メモリから*STUDY*も削除されます。
メモリに読み込まれたデータセット(EEGLAB では削除される前に *STUDY* を保存するよう求められます) と一致しなければなりません。

### STUDYデザインのレビュー

その他 [チュートリアルのセクション](/tutorials/10_Group_analysis/working_with_study_designs.html) *STUDY*のデザインを詳細に記述しますが、異なるチュートリアルデータセットを使用します。 私達の設計は2つの条件だけと、ここに簡単です。

STUDY デザインを編集するには、
2番目のSTUDYメニュー項目 <span style="color: brown">研究 → 選択/編集研究設計(s)</span>.

![画像:Studydesignmenu.jpg](/assets/images/Studydesignmenu.jpg)

以下のインターフェイスをポップアップします。

![画像:Studydesign.jpg](/assets/images/studydesign1.png)

トップパネルには、デザインのリスト(この場合、単一デザイン)、下部パネルには、特定の設計で使用される変数が含まれています。

*Rename* ボタンを *Synonym と non-synonym* に押すことで、デフォルトのデザインの名前を変更してみましょう。 次のGUIがポップアップ表示されます。 プレス *Ok*.

![画像:Studydesign.jpg](/assets/images/studydesign2.png)

下のパネルで、*Edit* ボタンをクリックします。 次のGUIがポップアップ表示されます。 *condition*の独立した変数が選択されていることを見ることができます。 また、2つの条件が*non-synonyms*と*synonyms*であることを確認することができます。

![画像:Studydesign.jpg](/assets/images/studydesign3.png)

### あなたのSTUDYを作成した後に何をするか

このチュートリアルでは、単純な *STUDY* を作成して、壮大な平均 ERP をプロットする方法を既に見てきました。 <span style="color: brown">ファイル → 研究の作成 → シンプルなERP STUDY</span> メニュー項目。 この手順は、*STUDY*の作成から構成される標準の*STUDY*パイプラインをバイパスし、データを事前処理し、それをプロットします。 [グループ分析の可視化チュートリアル](/tutorials/10_Group_analysis/study_data_visualization_tools.html).

不当な場合、選択して下さい <span style="color: brown">研究 → プレコプトチャネル対策</span> メニュー項目は、*ERPs*チェックボックスをクリックし、*Ok*を押します。 それから選択して下さい <span style="color: brown">研究 → プロットチャネル対策</span> メニュー項目は、*Plot ERPs* pushbutton を押して、リストの最初のチャネルのERPをプロットします。 各条件のグランド平均ERPを示す次のプロットがポップアップ表示されます。

![](/assets/images/simplestudyplot.png)






