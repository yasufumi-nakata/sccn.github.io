---
layout: default
title: Tutorial data
long_title: Tutorial data and publicly available EEG data
parent: Tutorials
---
公共ダウンロードで利用できるEEGデータ
===

ワークショップやチュートリアルで使用されるデータをダウンロード
-------------------------------------

匿名化されたデータをダウンロードして解凍することができます
で使用されて [オンラインワークショップ](/workshops/Online_EEGLAB_Workshop) 下記のEEGLABチュートリアル

- ふりがな [EEGLAB分布](https://sccn.ucsd.edu/eeglab/download.php) EEGLAB チュートリアルのデータセット「eeglab_data.set」と「eeglab_data_epochs_ica.set」が含まれています。 これらのファイルは「sample_data」フォルダにあります。
<blockquote>
<details>
  <summary>サンプル実験の記述</summary>
この実験では、「正方形」と「rt」の2種類のイベントがありました。
「スクエア」イベントは、緑の中に埋め込まれたディスクの出現に対応
被写体のボタンプレスに表示および「rt」の色の正方形。 
<br><br>
ディスクは、画面上の5つの正方形のいずれかで提示することができ、1
水平線に沿って分布する青色と緑の輪郭と他の人
軸線。 ここでは、左のプレゼンテーションのみと見なされます。例1
*position* フィールド(約 5.5 度と 2.7 で) で示されているように 2
水平視野角の度、それぞれ。 
<br><br>
この実験では、
被写体は、コンピュータ画面の選択した場所に非常出席しました
(緑色の四角形) 迅速な親指ボタンプレスのみ対応
この場所でディスクが提示されたとき。 彼らは無視していた
未指定の場所(青い四角)で提示された円。 
<br><br>
お問い合わせ
ダウンロードと処理に必要なデータの量を減らし、このデータセット
ターゲット(すなわち「正方形」)のみを2つに提示する刺激
左ビジュアルフィールドは、単一の被験者のための場所に参加しました。 詳しくはこちら
実験に関する詳細, 参照 <a href="http://sccn.ucsd.edu/science2002.html">この紙</a>.
<br><br>
EEGLABのデータセットでイベントを使用する場合は、2つのイベントが必要です。
フィールド: *type* と *latency* と、追加のユーザー定義の任意の数
情報フィールド。 ここの名がわかることが重要です。
フィールドは、ユーザがデータセットを作成することで定義され、
必要に応じて多くのイベントフィールドを作成、保存、およびロードすることができます。
<br><br>
*type*と*latency*(lowercase)は2つのキーワードであることに注意してください。
EEGLAB とこれらのフィールド *must* を明示的に認識
epochイベント情報をインポートしない限り、ユーザが(注)
フィールド *latency* は定義され、EEGLAB はフィールド *type* を作成します。
各イベントのデフォルト値が1になります。 これらの2つのフィールドがなければ
EEGLABでは、イベントを適切に処理できない
抽出 エポック、プロット反応時間など
</details>
</blockquote>

- [Sternberg タスクと 13 件 (0.9 Gb)](https://sccn.ucsd.edu/eeglab/download/STUDYstern_125hz.zip) EEGLAB STUDYのフォーマットで。 大きいファイルです。 メイク
試行する前に、迅速かつ信頼性の高いインターネット接続を持っていることを確認してください
ダウンロード ZIPファイルに含まれるPDFには、この実験の説明が含まれています。

- [5つの被験者(0.4 Gb)によるセマンティックタスク](https://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip) EEGLAB STUDYのフォーマットで。 オプションのダウンロード
より多くのSTUDYの調査。 このタスクの説明は、 [このセクション](/tutorials/10_Group_analysis/study_creation.html#description-of-the-5-subject-experiment-tutorial-data) チュートリアルの。

- [14件(0.4 Gb)でGo-nogoの分類タスク](https://sccn.ucsd.edu/eeglab/download/animal_study.zip) EEGLAB STUDYのフォーマットで。 タスクの完全な説明, 生データ (4Gb), そして、それを処理するためにいくつかのMATLABファイルはすべてで利用可能である [openneuro.org(オープンネロ)](https://nemar.org/dataexplorer/detail?dataset_id=ds002680) BIDS形式

- [18の被験者と顔の分類タスク](https://nemar.org/dataexplorer/detail?dataset_id=ds002718) BIDS形式

- [目は HBN ds004186 データセットから 32 件 オープン/閉鎖](https://sccn.ucsd.edu/eeglab/download/ds004186subset.zip) BIDS形式(0.5Gb) 完全なデータセットを見る [詳しくはこちら](https://nemar.org/dataexplorer/detail?dataset_id=ds004186)

オンラインで利用可能な他のEEGデータ
-----------
インターネット上で利用できるEEGデータが増えています。 以下のリストは、排気方法ではありませんが、理想的なデータセットを検索して始めることを願っています。

- ツイート [サイトマップ](https://sccn.ucsd.edu/~arno/fam2data/publicly_available_EEG_data.html) オンラインで利用できるEEGデータセットのリストを含む2002年に始まりました。

- ふりがな [NEMARの特長](https://nemar.org/) データベースに含まれるもの BIDS形式の200以上のEEG研究。

- ふりがな [ERPコア](https://erpinfo.org/erp-core) リソースは、最適化されたパラダイム、実験制御スクリプト、例えば40人からのデータで構成される、自由に利用できるオンラインリソースです。

- [ヘッドIT](https://headit.ucsd.edu/) 10件の実験を含むレガシーデータベースです。
