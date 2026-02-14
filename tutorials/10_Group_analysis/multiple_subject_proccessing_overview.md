---
layout: default
title: a. Batch processing
long_title: a. Batch processing for groups of subjects
parent: 10. Group analysis
grand_parent: Tutorials 
---
被写体のデータの一括処理
====
お問い合わせ

このチュートリアルでは、複数の被写体を想像してみてください。
大規模な分析を成功にお勧め
単一サブジェクト解析を超えた実験。 

このチュートリアルでは、EEGLAB の複数の被写体処理をしています。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/-jL3PuHD3aY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

複数のデータセットをロードする
----
EEGLABの様々なデータセットをロードして選択してください。

このチュートリアルでは、 [5-サブジェクト実験](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip) (450Mb) [STUDY作成チュートリアル](/tutorials/10_Group_analysis/study_creation.html) このデータに関する詳細情報 

このページではjavascriptを使用しています。 <span style="color: brown">ファイル → 既存のデータセットをロードする</span> メニュー項目. 複数のデータセットは, 以下は, EEGLAB お問い合わせ

![](/assets/images/multisub1.png)

処理用に複数のデータセットを選択
----

すべての10個のデータセットをインポートした後、 <span style="color: brown">データセット → 複数のデータセットを選択</span> 以下に示すようにメニュー項目。

![](/assets/images/multisub2.png)

次のページ Ok*は、

![](/assets/images/multisub3.png)

バッチ処理を実行
----
EEGLAB は、STUDY* の略称で、データセットの構成要素です。 
複数のデータセットがある場合、メニュー項目が表示されない
複数のデータセットが無効になっています。 すべての利用可能なツールは、同様の方法でデータを処理します。 メニュー選択時、
メニューウィンドウがポップアップ(単一のデータセットウィンドウに識別)
処理パラメータを選択すると、すべてのパラメーターが適用されます。
データセット。 

EEGLABの動作オプションは、
<span style="color: brown">ファイル → 環境設定</span>.

- 1つだけを許可する
メモリに存在するデータセット(参照) [データセット管理](/tutorials/03_Dataset_management/datasets.html) チュートリアルの投稿
データセットは、自動的にオーバー書き込みされます*ディスク*(警告ウィンドウが表示されます)。

- しかしながら、すべてのデータセットを同時にメモリに提示できるようにしましょう。 その場合、唯一の
メモリ内のデータセットは上書きされ、ディスクファイルのコピーは上書きされます。
影響を受けない(メニュー項目を選択したらよい)
<span style="color: brown">ファイル → 現在のデータセットを保存します。</span> すべて保存する
現在、選択したデータセット。

選択したデータセットを処理するために利用可能なメニュー項目を選択できるようになりました。 生データセットを処理する標準的なシーケンスは次のことができます。
1. 不要なチャンネルを削除 <span style="color: brown">編集 → データの選択</span> メニュー項目。
1. チャンネルの位置を調べる <span style="color: brown">編集 → チャネルの場所</span> メニュー項目。
1. ハイパスフィルタでデータをフィルタリング <span style="color: brown">基本のFIRをクリアする</span> メニュー項目。
1. 自動化されたアーティファクト拒否を実行します。 <span style="color: brown">ツール → Clean Rawdata と ASR を調べる</span> メニュー項目。
1. データを再参照する <span style="color: brown">ツール → データを再参照する</span> メニュー項目。
1. 独立したコンポーネント分析を実行します。 <span style="color: brown">ICA は、</span> メニュー項目。
1. ラベルコンポーネントを使用して <span style="color: brown">ツール → IClabel → コンポーネントのラベルを構成する</span> メニュー項目。
1. コンポーネントの分類 <span style="color: brown">ツール → IClabel → コンポーネントを識別する</span> メニュー項目。
1. コンポーネントの同等のダイポールを割り当てる <span style="color: brown">DIPFIT ダイキャストの検索 → ヘッドモデルと設定</span> メニュー項目およびそれから <span style="color: brown">ツール → DIPFIT イヤホンの検索 → オートフィット</span> メニュー項目。
1. データを する する する <span style="color: brown">ツール → 抽出エポック</span> メニュー項目。

### データセットをフィルタリング

選択したデータセットは既に処理され、追加の処理を必要としません。 それにもかかわらず、我々は単にイラストの目的のためにそれらをフィルタリングします。 選択する <span style="color: brown">基本のFIRをクリアする</span> メニュー 次の記事 2 . . . 100 Hz の Hz の サンプリング 周波数 の Hz の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s s の s s の s s の s s の s s の s s s s s s の s s s s s s s の s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s

![](/assets/images/multisub5.png)

EEGLAB は、データセットがすぐに使えるようにしています。

![](/assets/images/multisub4.png)

データセットは1つずつフィルタリングされ、ディスク上に再保存されます。 以前に述べたすべてのメニュー項目は同様に動作します。

### ICAは、

複数のデータセットで、EEGLABのデータセットが2つあります。
同じセッションで収集された被験者からの2つの条件
ICAの実行
様々なオプションを組み合わせて、 エッグラボ
つの つの つの つの つの つの つの つの に に に に に に に に に に に に に に に に に に に に に に に に に に します に に に に に 。 に に 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 に

. 選択する
メニュー項目 <span style="color: brown">ツール \"> ICAの実行</span>お問い合わせ 以下について
ウィンドウが表示されます。


![](/assets/images/pop_runica_multiple.png)

デフォルトでは、 
[pop_runica.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_runica.m)
 同じデータセットを連結します。
テーマとセッション。 たとえば、複数のデータセットがイベントの異なるクラスにタイムロックされ、複数の実験を構成できます。
被写体ごとの条件、同じセッションで収集されるすべてのもの
電極モンタージュ。 
デフォルトでは(チェックボックスを最低限にしておく)、 
[pop_runica.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_runica.m)  ICAの解任者。
これらのデータセットからのデータ試用を連結し、その後、添付します
それぞれのデータセットは、
連結用に選択したデータセットに関する情報は、
マトラボ 参加方法 [pop_runica.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_runica.m) お問い合わせ
連結データセット、データセットのエポックの長さは
等しいと仮定される。

ご希望の場合(笑) 
[pop_runica.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_runica.m) 前にすべてのデータセットをロードして連結する
ICAの運営について
(そして不当に)非常に同じ脳および非脳を仮定します
ソースと非常に同じ
各セッションおよび/または対象に電極の位置が存在します。

サブジェクトの選択とEEGLAB研究
---

選択したすべてのデータセットの処理後、メニュー項目を使用できます。
<span style="color:brown">ファイル → 研究の作成 → 読み込まれたすべてのデータセットの使用</span> すべての読み込まれたデータセットを使用して研究を作成する(あなただけの場合)
選択したデータセットを使用するには、他のデータを削除する必要があります
STUDY多重データセット [グループ分析チュートリアル](/tutorials/10_Group_analysis/) 詳しくはこちら

STUDY*データセットが選択され、複数のサブジェクト処理メニューが利用できます。 [STUDY作成チュートリアル](/tutorials/10_Group_analysis/study_creation.html) *STUDY*の手順

