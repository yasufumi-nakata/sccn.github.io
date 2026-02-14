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

EEGLAB は、EEGLAB で、EEGLAB は、EEGLAB で、EEGLAB で、EEGLAB は、EEGLAB で、EEGLAB は、EEGLAB で、EEGLAB は、EEGLAB で、EEGLAB は、EEGLAB で、EEGLAB は、EEGLAB で、EEGLAB は、EEGLAB で、EEGLAB は、EEGLAB は、S で動作します。 チュートリアルでは、このチュートリアルでは、このチュートリアルでは、

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

お問い合わせ EEGLAB STUDYセット
---------------------------------
チュートリアル EEGLAB について この1つに、14個の動物/非動物が生息しています。

被写体は、含まれているか、または
動物画像を含んでいません。 ボタンプレス対応の件名
動物(go/no-go paradigm)の写真を撮る
ダウンロード可能 [詳しくはこちら](https://sccn.ucsd.edu/eeglab/download/animal_study.zip)
626 Mb.. . . . .
MATLABファイルの処理 
[openneuro.org(オープンネロ)](https://openneuro.org/datasets/ds002680).

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します <span style="color: brown">既存の研究をロードする</span>チュートリアル「animal.study」、*Open*など

STUDY*は、 <span style="color: brown">研究 → 選択/編集研究設計</span> *animals* と *distractors* はコメントを受け付けていません。 

![](/assets/images/studyprecomp2.png)

お問い合わせ
------------------------------

### お問い合わせ

チャンネル対策をプロットする前に、事前にコンプトする必要があります
それらを使って <span style="color: brown">研究 → プレコプトチャネル対策</span> 以下に示すようにメニュー項目。

![](/assets/images/studyprecomp1.png)

このGUIは、顧客のニーズを優先する、顧客のニーズを優先する、顧客のニーズを順守する、顧客のニーズを優先する、

GUIトップパネルでチャンネル変換可能。

-  *チャネルの補間。* 視覚化および計算統計のために非常に推薦されます
います で います EEGLAB は、Channel で、Channel で、EEGLAB で、EEGLAB で、Channel で動作します。
異なるチャネルの場所(例えば、場所が
チャンネルがスキャンされた)、コマンド ラインから各データセットの欠落したチャンネルをインターポレートしなければなりません。 [eeg_interp.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_interp.m)お問い合わせ お問い合わせ

- ※ICAコンポーネントの取り扱いについて 特に チュートリアル では、 チュートリアル で チュートリアル を 翻訳する [アーティファクト除去のための独立したコンポーネント分析](/tutorials/06_RejectArtifacts/RunICA.html)このサイトでは、各データセットをタグ付けして、各データセットをタグ付けします。 [詳しくはこちら](/tutorials/10_Group_analysis/multiple_subject_proccessing_overview.html#perform-batch-processing))。 このオプションを選択することをお勧めします。

- ※ICAコンポーネントクラスターの割込みやオプションなど、 . . . . . . . [クラスタリングチュートリアル](/tutorials/10_Group_analysis/component_clustering_tools.html) 詳細については、.

このページの先頭へ あなたが を を 現在、コンピュッチュにな*ERPs*をお選び下さい。 これにより イベント イベント イベント されます されます されます されます されます されます されます されます されます されます されます されます されます  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  *  * * * * *  * * *  *  *  *  *

*EEGLAB 2019以降では、 EEGLAB 2019 以降、EEGLAB 直接処理し、EEGLAB では では では では では
互換性があり、より柔軟で、データ試行を動的に抽出することができます。

### Plotting 美しい ERPs

チャンネルの対策を事前に入力した後、それらをプロットすることができます。
お問い合わせ <span style="color: brown">研究 → プロットチャネル対策</span> メニュー項目。

![](/assets/images/studyplot5.png)

前のセクションで説明するすべての措置は、計算されると、使用することができます
チャネル のため *Plot ERPs*ボタンを押します。

![](/assets/images/studyplot2.png)

これで、プロットパラメータを見てみましょう。 中央の列で [pop_chanplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanplot.m) GUI 、Proasett の横にある *Params* ボタン ・・・ *Plot ERPs* ボタンの横に*Params* ボタンを閉じます。 次のページ

![](/assets/images/studyplot3.png)

このガイドでは、このガイドでは、ERP はプロット時間範囲で指定し、microvolt の動作をプロットする。 このページの先頭へ

このGUIオプションは、
 - *Time 範囲をプロット* 編集ボックスに
フルエポックよりも短い時間範囲をプロットする。 
- *Plotの要件*
編集ボックスは、固定された下限と上限の設定をプロットすることを可能にします
潜在的な。 
- *表示フィルター*の編集箱は入ることができます
ERPをフィルタリングする
お問い合わせ
このページではjavascriptを使用しています。
トピック

下部*複数のチャンネル選択*セクションでは、次の選択があります。
- 個々のチャネルをプロットする。 デフォルトオプション。
- 平均地理を時間範囲(トップボックスに指定)上に移動します。 このチュートリアルでは後からこのオプションを使用します。
- サブ の の
- ルーズ ルーズ オブ ルーズ ルーズ オブ ルーズ ルーズ ルーズ オブ ルーズ ルーズ オブ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ ルーズ

*Ok*、*Plot ERPs*ボタン ボタン ボタン ボタン ボタン ボタン ERP は、様々な言語の翻訳をしています。

![](/assets/images/studyplot4.png)

### プロット

*Plot ERPs* pushbutton は、Plot ERPs* pushbutton は、Plot ERPs* は、Plot ERPs* は、Plot ERPs* は、Plot ERPs* は、Plot ERPs* は、Plot ERPs* は、Plot ERPs* は、Plot ERPs* は、Plot ERPs* は、Plot は、Plot は、Plot は、Plot は、Plot で、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、
右側の列で、下の図に似ている数字を取得します。

![](/assets/images/studyplot6.png)

単一のデータをプロットする
*Plot ERPs* pushbutton は、Plot ERPs* pushbutton から、対象の *gro* の右列へ向かう。 被験者をレビューする

![](/assets/images/studyplot7.png)

### ユーザ名

最後に、すべてのスカルプチャネルを同時にプロットすることもできます。 お問い合わせ
ボタンを押します。 お問い合わせ
チャンネル.

![](/assets/images/studyplot10.png)

 左列の*Plot ERPs*ボタンは、

![](/assets/images/studyplot19.png)

ERPs は、Windows のプロット エキスパートです。
チャンネル登録 *FP1* は、

![](/assets/images/studyplot20.png)

### Plotting ERPsカルプトポグラフィ

中央の列で、*Params*ボタンを右折します。 * 時間範囲 * 編集ボックスに「300 400」時間。 * パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル パープル

![](/assets/images/studyplot11.png)

*Plot ERPs*ボタンは、Plot ERPs*ボタンから、300〜400ms まで、Plot ERPs*ボタンは、Plot ERPs*ボタンを押します。 つの この つの つの つの つの つの つの つの の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の

![](/assets/images/studyplot12.png)

その他の施策のプロット
-----------

### 他の対策を優先する

ERPは、以下のとおりです。

- *パワースペクトラ*:各条件および電極のためのスペクトル分解を行います。 ここに特定のパラメーターを入力することができます。  [お問い合わせ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) 機能。

- *ERP-image*:事前入力P-images

- *ERPs*/ *ITCs*:イベント参加者の分光処理(ERSP)の構成を構成します。 ERSP/またはITC対策を計算する、時間/頻度を調節する。 関連する 関連する には [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m) テキストボックスのキーワードと引数。 

- 呼び出し時にカスタム対策を計算することもできます。 [pop_precomp.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_precomp.m) ラインからの機能、で説明するように [グループ分析スクリプトチュートリアル](/tutorials/11_Scripting/command_line_study_functions.html).

選択する <span style="color: brown">研究 → プレコンピュート対策</span> メニュー すべての すべての すべての また、*ERSP* パラメータは、以下のとおりです。*nfreqs* は 30 です。*ntimesout* は 60 に、計算を高速化します。

![](/assets/images/studyprecomp3.png)

お問い合わせ スペクトラとERP-image を高速化し、数秒で完了します。 ERSPとITCの計算は2〜5分程度です。 <span style="color: brown">研究 → プロットチャネル対策</span> メニュー項目。 プロットが可能になりました。

![](/assets/images/studyplot1.png) 

スペクトル、ERPimage、ERSP/ITCs のプロットオプションは、 プロットオプションに似たようなオプションがあります。 メニューは ERP のメニューに似ています。 

### プロットスペクトラ

Spectra は ERP を 翻訳する *Plot spectra* ボタンに隣接する *Params* ボタン, 周波数範囲の "1 40" . プレス *Ok*.

![](/assets/images/studyplot30.png) 

チャンネル*FP1* Plot spectra*まで。 [pop_chanplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanplot.m) ログイン 以下のプロットがポップアップします。

![](/assets/images/studyplot31.png)

### Plotting ERPimage(プロット)

*Plot ERPimage* ボタンをクリックして下さい。

![](/assets/images/studyplot32.png) 

特に10列のルールは、 すべての の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 [ドラメ ら (2014)](https://pubmed.ncbi.nlm.nih.gov/25447029/).

### Plotting ERSPs と ITCs

*Plot ITC*ボタンが開きます。 *animal* および *distractor* の 条件 の 相互trial の 条件 は *distractor* の 条件 の の の の の の の の の の の の の の の の の の の の の の の の の の は の の の の の の の の の の の の の の は の の の に の の の の の の の の の の の の の の の の の の の は の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の

![](/assets/images/studyplot34.png) 

*Plot ERSPs* は、Plot ERSPs* で、Plot ERSPs* は、Plot ERSPs* で、Plot ERSPs* は、Plot ERSPs* で、Plot ERSPs* は、Plot で、Plot ERSPs* は、Plot で、Plot ERSPs* は、Plot で、Plot は、Plot で、Plot は、Plot で、Plot は、Plot は、Plot で、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot で、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、Plot は、

![](/assets/images/studyplot33.png) 

ERPやスペクトラム、Scalプトプトポグラフィをプロットする。 *Plot ERSP* ボタンを閉じる *Params* ボタン、周波数範囲の "500 800" と 4。 プレス *Ok*.

![](/assets/images/studyplot35.png) 

*Plot ERSPs*ボタンを押します。 この この この

![](/assets/images/studyplot36.png) 

前入力パラメータの異なるセットを比較する
------

複数の *STUDIES* と、異なる信号の呼び出し。
.. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
1時間/頻度測定を1つの計算し、
他人 のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ STUDY*フォルダとすべてのデータ通信 別のファイル
