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

このチュートリアルでは、複数の被写体を処理することに重点を置いたEEGLABの高度な要素を紹介します。 これらのトピック
大規模な分析を成功にお勧め
単一サブジェクト解析を超えた実験。 

このチュートリアルを読むことに加えて、EEGLABで複数の被写体処理で以下の短いビデオを見たい場合があります。

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
EEGLABの複数のデータセット処理機能を探索するには、まず複数のデータセットをロードして選択する必要があります。

このチュートリアルでは、 [5-サブジェクト実験](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip) (450Mb)。 詳細はこちら [STUDY作成チュートリアル](/tutorials/10_Group_analysis/study_creation.html) このデータに関する詳細情報 

データアーカイブを解凍した後、EEGLABのすべてのデータセットを1つずつ読み込む <span style="color: brown">ファイル → 既存のデータセットをロードする</span> メニュー項目。 複数のデータセットが同じフォルダにある場合、以下に示すように、EEGLAB で選択してロードされることがあります。

![](/assets/images/multisub1.png)

処理用に複数のデータセットを選択
----

すべての10個のデータセットをインポートした後、 <span style="color: brown">データセット → 複数のデータセットを選択</span> 以下に示すようにメニュー項目。

![](/assets/images/multisub2.png)

次のGUIがポップアップ表示されます。 10個のデータセットを選択し、*Ok*を押します。

![](/assets/images/multisub3.png)

バッチ処理を実行
----
EEGLABは、これらのデータセットが*STUDY*で編成されているか否か、データセットの収集を可能にします。 
複数のデータセットがある場合、メニュー項目が表示されない
複数のデータセットが無効になっています。 すべての利用可能なツールは、同様の方法でデータを処理します。 メニュー選択時、
メニューウィンドウがポップアップ(単一のデータセットウィンドウに識別)
処理パラメータを選択すると、すべてのパラメーターが適用されます。
データセット。 

EEGLABの動作はオプションの設定により異なりますのでご注意ください。
<span style="color: brown">ファイル → 環境設定</span>.

- 1つだけを許可する
メモリに存在するデータセット(参照) [データセット管理](/tutorials/03_Dataset_management/datasets.html) チュートリアルのセクション sfor 詳細情報), 既存の
データセットは、自動的にオーバー書き込みされます*ディスク*(警告ウィンドウが表示されます)。

- しかしながら、すべてのデータセットを同時にメモリに提示できるようにしましょう。 その場合、唯一の
メモリ内のデータセットは上書きされ、ディスクファイルのコピーは上書きされます。
影響を受けない(メニュー項目を選択したらよい)
<span style="color: brown">ファイル → 現在のデータセットを保存します。</span> すべて保存する
現在、選択したデータセット。

選択したデータセットを処理するために利用可能なメニュー項目を選択できるようになりました。 生データセットを処理する標準的なシーケンスは次のことができます。
1. 不要なチャンネルを削除 <span style="color: brown">編集 → データの選択</span> メニュー項目。
1. チャンネルの位置を調べる <span style="color: brown">編集 → チャネルの場所</span> メニュー項目。
1. ハイパスフィルタでデータをフィルタリング <span style="color: brown">ツール → データをフィルタリング → 基本 FIR フィルター</span> メニュー項目。
1. 自動化されたアーティファクト拒否を実行します。 <span style="color: brown">ツール → Clean Rawdata と ASR を使用してデータを抽出する</span> メニュー項目。
1. データを再参照する <span style="color: brown">ツール → データを再参照する</span> メニュー項目。
1. 独立したコンポーネント分析を実行します。 <span style="color: brown">ツール → ICAによるデータの分解</span> メニュー項目。
1. ラベルコンポーネントを使用して <span style="color: brown">ツール → IClabel → ラベルコンポーネントを使用してコンポーネントを分類する</span> メニュー項目。
1. コンポーネントの分類 <span style="color: brown">ツール → IClabel → フラグコンポーネントを使用してコンポーネントをアーティファクトとして分類する</span> メニュー項目。
1. コンポーネントの同等のダイポールを割り当てる <span style="color: brown">ツール → DIPFIT を使用したダイポールの検索 → ヘッドモデルと設定</span> メニュー項目およびそれから <span style="color: brown">ツール → DIPFIT を使用したダイポールの検索 → オートフィット</span> メニュー項目。
1. データを抽出する epochs を使用して <span style="color: brown">ツール → 抽出エポック</span> メニュー項目。

### データセットをフィルタリング

選択したデータセットは既に処理され、追加の処理を必要としません。 それにもかかわらず、我々は単にイラストの目的のためにそれらをフィルタリングします。 選択する <span style="color: brown">ツール → データをフィルタリング → 基本 FIR フィルター</span> メニュー項目。 次のインターフェイスがポップアップ表示されます。 2 番目の編集ボックスに 100 Hz 未満のデータ (これは 200 Hz のサンプリング周波数の半分であり、その後の処理には影響しません) をフィルタリングします。 プレス *Ok*.

![](/assets/images/multisub5.png)

EEGLABは、データセットが自動的にディスク上に上書きされることを確認、警告を求めます。 お問い合わせ

![](/assets/images/multisub4.png)

データセットは1つずつフィルタリングされ、ディスク上に再保存されます。 以前に述べたすべてのメニュー項目は同様に動作します。

### ICAを適用する

複数のデータセットでICAを実行すると、EEGLABのデータセットが2つある場合に便利です。
同じセッションで収集された被験者からの2つの条件
ICAのデータを組み合わせて実行したい。 これを使う
オプション、自分でデータセットを連結する必要はありません。 EEGLAB
これらの2つのデータセットが同じ主題に属し、それらを結合し、ICAを実行し、各被写体のデータセットに分解(same)を保存します。

ICAを実行するためのグラフィックインターフェイスはもう少し精巧です。 選択する
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
[pop_runica.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_runica.m)  ICAの分解を行います。
これらのデータセットからのデータ試用を連結し、その後、添付します
同じICAは、各データセットに重量と球のマトリックスを混合します。
連結用に選択したデータセットに関する情報は、
MATLAB コマンドラインでデコンポジションを開始する前に提供しました。 応募方法 [pop_runica.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_runica.m) お問い合わせ
連結データセット、データセットのエポックの長さは
等しいと仮定される。

ご希望の場合(コンピューターのRAMが十分な場合)、お尋ねください。 
[pop_runica.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_runica.m) 前にすべてのデータセットをロードして連結する
ICAの運営 このアプローチをお勧めしません。
(そして不当に)非常に同じ脳および非脳を仮定します
ソースと非常に同じ
各セッションおよび/または対象に電極の位置が存在します。

複数のサブジェクト選択とEEGLAB研究
---

選択したすべてのデータセットの処理後、メニュー項目を使用できます。
<span style="color:brown">ファイル → 研究の作成 → 読み込まれたすべてのデータセットの使用</span> すべての読み込まれたデータセットを使用して研究を作成する(あなただけの場合)
選択したデータセットを使用するには、他のデータを削除する必要があります
データセットのリストからSTUDYに含まれるデータセット。 詳細はこちら [グループ分析チュートリアル](/tutorials/10_Group_analysis/) 詳しくはこちら

データセットを処理する前に*STUDY*を作成して、バッチ処理に進むこともできます。 *STUDY*が作成されると、全ての*STUDY*データセットが選択され、複数のサブジェクト処理メニュー項目が使用可能になります。 詳細はこちら [STUDY作成チュートリアル](/tutorials/10_Group_analysis/study_creation.html) *STUDY*を作成する方法。

