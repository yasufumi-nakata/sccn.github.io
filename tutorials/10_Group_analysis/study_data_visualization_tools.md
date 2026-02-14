---
layout: default
title: d. STUDY visualization
long_title: d. STUDY visualization and plots
parent: 10. Group analysis
grand_parent: Tutorials 
---

チャネルデータの事前入力と可視化
========================
お問い合わせ

EEGLABは、壮大なERP、スペクトル、ERP画像、ERSP/ITCをプロットすることができます。 チュートリアルのこのセクションでは、プリコンプト対策、それらをプロットする方法、およびプロットパラメータを変更する方法について説明します。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

サンプルを荷を積んで下さい EEGLAB STUDYセット
---------------------------------
各チュートリアルでは、異なるデータで EEGLAB の機能について説明します。 この1つでは、14個の動物/非動物分類タスクを使用します。

被写体は、含まれているか、または
動物画像を含んでいません。 ボタンプレス対応の件名
動物(go/no-go paradigm)を含む画像が提示されるたびに。 これらのデータ
ダウンロード可能 [詳しくはこちら](https://sccn.ucsd.edu/eeglab/download/animal_study.zip)
(626 Mb)。 タスクの完全な説明、生データ(4Gb)、および
処理するMATLABファイルはすべて利用可能です 
[openneuro.org(オープンネロ)](https://openneuro.org/datasets/ds002680).

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します <span style="color: brown">既存の研究をロードする</span>お問い合わせ チュートリアルファイル「animal.study」を選択し、*Open*を押します。

データをロードした後、*STUDY*の設計を見直し、使用して下さい <span style="color: brown">研究 → 選択/編集研究設計</span> メニュー項目。 *animals* を含む画像と *distractors* を含む画像を比較するデフォルト設計です。 ニュース *Ok* はウィンドウを閉じます。 

![](/assets/images/studyprecomp2.png)

ERPの事前入力とプロット
------------------------------

### ERPの事前入力

チャンネル対策をプロットする前に、事前にコンプトする必要があります
それらを使って <span style="color: brown">研究 → プレコプトチャネル対策</span> 以下に示すようにメニュー項目。

![](/assets/images/studyprecomp1.png)

このGUIは、2つの部分に分けられ、トップ部分は、事前コンパイル措置の前にデータを適用する変換を規定し、2番目の部分は、どの対策を優先するのかを指定します。

GUIトップパネルでチャンネル変換を指定できます。

-  *チャネルの補間。* 視覚化および計算統計のために非常に推薦されます
データ チャネルで、最初に不足しているチャネルを補います。 EEGLABの自動補間は、チャンネルラベルに基づいて行われます。 データセットがある場合
異なるチャネルの場所(例えば、場所が
チャンネルがスキャンされた)、コマンド ラインから各データセットの欠落したチャンネルをインターポレートしなければなりません。 [eeg_interp.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_interp.m)お問い合わせ お問い合わせ

- ※ICAコンポーネントの受託 これは、使用上のチュートリアルセクションで説明するように拒否のためにタグ付けされたコンポーネントを削除することによって行うことができます [アーティファクト除去のための独立したコンポーネント分析](/tutorials/06_RejectArtifacts/RunICA.html)お問い合わせ これは、各データセットにコンポーネントをタグ付けする必要があります(また、説明するようにIClabelプラグインを使用して*STUDY*レベルでコンポーネントをタグ付けすることもできます) [詳しくはこちら](/tutorials/10_Group_analysis/multiple_subject_proccessing_overview.html#perform-batch-processing))。 このオプションを選択することをお勧めします。

- ※ICAコンポーネントクラスターの割込み または上記のオプションを使用するには、 ICA コンポーネント クラスター を選択して、第 3 チェックボックスを使用してデータをサブトラクトします。 参照して下さい [クラスタリングチュートリアル](/tutorials/10_Group_analysis/component_clustering_tools.html) 詳細については、.

ボトムパネルは、プレコンピューティングに対する対策のリストが含まれています。 箱を刻んで、あなたが興味を持っている測定のための変数を完了して下さい。 現在、コンピュートに高速な*ERPs*を選択しましょう。 これにより、各条件と電極に対するイベント関連の潜在的な手段が計算されます。 使用するベースライン(空白のまま)を指定できます。 それから *Ok*を押して下さい。

**EEGLAB 2019以降バージョンの変更 **: EEGLAB 2019 以降では、EEGLAB はシングルトライアルを直接処理し、EEGLAB の以前のバージョンでは、各設計の対応策を再コンパイルする必要はありません。 新しい *design* スキームは後方
互換性があり、より柔軟で、データ試行を動的に抽出することができます。

### Plotting 壮大な平均 ERPs

チャンネルの対策を事前に入力した後、それらをプロットすることができます。
お問い合わせ <span style="color: brown">研究 → プロットチャネル対策</span> メニュー項目。

![](/assets/images/studyplot5.png)

前のセクションで説明するすべての措置は、計算されると、使用することができます
チャネルデータの視覚化のため。 *Plot ERPs*ボタンを押します。

![](/assets/images/studyplot2.png)

これで、プロットパラメータを見てみましょう。 中央の列で [pop_chanplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanplot.m) GUI では、プロットしたい測定の横にある *Params* ボタンを使用してプロットパラメータを変更できます。 *Plot ERPs*ボタンの横にある*Params*ボタンを押して下さい。 次のGUIがポップアップ表示されます。

![](/assets/images/studyplot3.png)

このGUIには複数のセクションがあり、ERPをプロットするための時間範囲を指定し、microvoltの制限をプロットすることができます。 上記と同じパネルに2つの条件をオーバーレイするために、チェックボックスを選択してください。

このGUIにはオプションがあります。 それらは自己説明的であるべきです:
 - *Time 範囲をプロット* 編集ボックスにすることができます
フルエポックよりも短い時間範囲をプロットする。 
- *Plotの制限*
編集ボックスは、固定された下限と上限の設定をプロットすることを可能にします
潜在的な。 
- *表示フィルター*の編集箱は入ることができます
ERPをフィルタリングする頻度(例えば20のHzのために)。 お問い合わせ
ERPの表示にのみ適用され、計算に影響を与えません
統計情報 このオプションは、noisy ERPs を単一にプロットするときに便利です
トピック

下部*複数のチャンネル選択*セクションでは、次の選択があります。
- 個々のチャネルをプロットする。 デフォルトオプション。
- 平均地理を時間範囲(トップボックスに指定)上に移動します。 このチュートリアルでは後からこのオプションを使用します。
- チャネルのサブセットで平均化されたERP測定をプロットする。
- 選択したチャンネルのルート平均平方(RMS)を計算します。これはグローバルフィールドパワー(GFP)の計算と同等です。

*Ok*を押して、再度*Plot ERPs*ボタンを押します。 これで、2つの条件のERPが一緒にプロットされ、それらとの違いを簡単に見つけることができます。

![](/assets/images/studyplot4.png)

### 単一の主題ERPをプロットする

*Plot ERPs* pushbuttonを押すと、すべての被験者のERPをプロットできます。
右側の列で、下の図に似ている数字を取得します。

![](/assets/images/studyplot6.png)

単一のデータをプロットする
対象となる場合は、*Plot ERPs* pushbutton を、対象の *gro* の右列に押します。 下記のようなプロットが現れます。 これは、個々の被験者のERPをレビューするのに便利です。

![](/assets/images/studyplot7.png)

### すべてのチャネルERPをプロットする

最後に、すべてのスカルプチャネルを同時にプロットすることもできます。 お問い合わせ
これにより、プッシュボタン *Sel をクリックします。all* すべてのデータを選択
チャンネル.

![](/assets/images/studyplot10.png)

 その後、左列の*Plot ERPs*ボタンを押します。

![](/assets/images/studyplot19.png)

個人クリック ERPs は選択したウィンドウのプロットを行います。
チャンネル ERP ポップアップ. たとえば、チャンネル *FP1* をクリックします。

![](/assets/images/studyplot20.png)

### Plotting ERPスカルプトポグラフィ

中央の列で、*Params*ボタンをもう一度押します。 *Time 範囲* 編集ボックスに「300 400」時間範囲を入力します。 一番下のセクションで、*Plot 平均地理を時間範囲* で選択します。 それから *Ok*を押して下さい。

![](/assets/images/studyplot11.png)

*Plot ERPs*ボタンをもう一度押して、300〜400msの間で平均ERPのスカルプトポグラフィをプロットします。 私たちは、この違いを評価するために統計を実行する必要があるが、パリト地方の2つの条件間の潜在的な違いを見ることができます。

![](/assets/images/studyplot12.png)

その他の施策のプロット
-----------

### 他の対策を優先する

ERPに加えて、以下は、計算できる措置の完全なリストです。

- *パワースペクトラ*:各条件および電極のためのスペクトル分解を行います。 ここに特定のパラメーターを入力することができます。  [スペックトップm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) 機能。

- *ERP-image*:事前入力ERP-images

- *ERPs*/ *ITCs*:イベント関連の分光力変化(ERSP)の形で計算イベント関連の分光処理を可能にし、各条件に対してイベント関連相関関係相関(ITC)を構成します。 ERSPおよび/またはITC対策を計算するには、いくつかの時間/頻度パラメータが必要です。 これらの値を選択するには、関連する値を入力してください [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m) テキストボックスのキーワードと引数。 

- 呼び出し時にカスタム対策を計算することもできます。 [pop_precomp.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_precomp.m) ラインからの機能、で説明するように [グループ分析スクリプトチュートリアル](/tutorials/11_Scripting/command_line_study_functions.html).

選択する <span style="color: brown">研究 → プレコンピュート対策</span> メニュー項目。 箱を刻み、すべての措置のための変数を完了して下さい。 また、*ERSP* パラメータは、以下に示すように、*nfreqs* を 30 および *ntimesout* に 60 に変更し、計算を高速化します。 プレス *Ok*.

![](/assets/images/studyprecomp3.png)

一般的には、可能な限り全ての措置を選択することをお勧めします。 スペクトラとERP-imageを高速化し、数秒しかかかりません。 ERSPとITCの計算は2〜5分かかります。 それから再度、選択して下さい <span style="color: brown">研究 → プロットチャネル対策</span> メニュー項目。 プロットが可能になりました。

![](/assets/images/studyplot1.png) 

spectra、ERPimage、ERSP/ITCs のプロットオプションは、以前見たERP プロットオプションに似ていることに注意してください。 spectra の場合、メニューは ERP のメニューに似ています。トップ ボックスがプロットする周波数範囲を指定できるようにする違いがあります。 ERSPs / ITCの場合、時間と周波数範囲とパワーとICT制限を指定できます。 

### プロットスペクトラ

Spectra は ERP と同じ方法でプロットされます。 *Plot spectra* ボタンに隣接する *Params* ボタンをクリックし、周波数範囲の "1 40" を入力します。 プレス *Ok*.

![](/assets/images/studyplot30.png) 

最初のチャンネル*FP1*を選択し、左列の*Plot spectra*を押します。 [pop_chanplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanplot.m) ログイン 以下のプロットがポップアップします。

![](/assets/images/studyplot31.png)

### Plotting ERPイメージ

*Plot ERPimage*ボタンを押します。

![](/assets/images/studyplot32.png) 

ERPイメージは、事前の計算時に設定されたパラメータでプロットされます。 特に10列のご使用を想定しています。 固定行数を設定すると、すべての被験者と条件の同じサイズの行数を取得し、記載されているように標準統計を実行できます。 [ドラメ ら (2014)](https://pubmed.ncbi.nlm.nih.gov/25447029/).

### Plotting ERSPs と ITCs

*Plot ITC*ボタンを押します。 *animal* および *distractor* 条件の相互trial一貫性を示します。 ITC 値が *distractor* 条件の振幅が低下しているようですが、その観察を確認するために統計を実行する必要があります。

![](/assets/images/studyplot34.png) 

チャンネル *Oz* を選択し、 *Plot ERSPs* ボタンを押します。 以下のプロットがポップアップします。 低い周波数(7Hz以下)で電力の増加と10Hzの電力の減少を示しています。

![](/assets/images/studyplot33.png) 

ERPやスペクトラに関しては、特定の時間と周波数範囲でスカルプトポグラフィをプロットすることができます。 *Plot ERSP* ボタンに隣接する *Params* ボタンを選択し、周波数範囲の「500 800」と 4 を入力します。 プレス *Ok*.

![](/assets/images/studyplot35.png) 

*Plot ERSPs*ボタンを押します。 以下のスカルプトポグラフィが表示されます。 *animal*の条件より*distractor*でスペクトル力が低いようです。 再び、この観察を確認するために統計を実行する必要があります。

![](/assets/images/studyplot36.png) 

前入力パラメータの異なるセットを比較する
------

複数の *STUDIES* を使うと、異なる信号処理をテストするのに便利です。
オプション。 例えば、同じ *STUDIES* を 2 個作成できます。
1 つは FFT を使用して 1 つの時間/頻度測定を 1 つの計算し、使用します
他人の波紋。 ただし、被写体データに関連した事前入力されたデータファイルのみが1セットになる場合があります。 前入力パラメータの異なるセットでサイドを比較したい場合は、*STUDY*フォルダと関連するすべてのデータファイルを複製する必要があります。 別のファイル名を使用して2番目のSTUDYを保存しても十分ではありません。
