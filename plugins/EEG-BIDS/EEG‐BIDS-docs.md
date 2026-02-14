---
layout: default
parent: EEG-BIDS
grand_parent: Plugins
render_with_liquid: false

title: EEG‐BIDS-docs
long_title: EEG‐BIDS-docs
---
# ドキュメントとチュートリアルビデオ

<img width="1680" alt="BIDS_doc1play" src="https://github.com/sccn/bids-matlab-tools/assets/1872705/643cc06a-90b5-4697-b1f8-7769dc937bfb">

[ビデオへのリンク](https://www.youtube.com/watch?v=EClpeP7WREw)

# BIDSからEEGLABへのデータのインポート

EEGLAB では、BIDS データセットを EEGLAB にインポートするための EEGLAB のメニューが完全に機能します。 スクリーンキャプチャは以下のとおりです。

![pop_importbids.m インターフェイス](pop_importbids.png)

生 EEG のデータファイルには、多くの場合、イベントがあります。 ただし、BIDSはイベント専用ファイルでイベントを定義しています。 BIDSイベントファイルには、生EEGデータファイルよりも多くの情報が含まれています。 この場合、BIDSイベントファイルに含まれているイベント情報を含む未加工EEGデータイベントを上書きすることを選択できます。

同様に、未加工 EEG のデータファイルは頻繁にチャネルのラベルを定義します。 ただし、BIDSは、専用のイベントファイルでチャネルラベルとチャネルの場所を定義します。 2番目のチェックボックスを押すと、BIDSチャンネル定義ファイルに含まれるチャンネルラベルと位置情報を使用する場合があります。

最後に、EEGLAB STUDY を格納するための出力フォルダを選択できます。 フォルダが選択されていない場合、EEGLABは、BIDSフォルダ構造で意味するSTUDYファイル "in place"を格納します - 追加のEEGLABファイルのためにBIDSフォルダになり、非BIDS準拠になり、BIDS検証に失敗するようになります。

# グラフィックインターフェイスからBIDSにデータセットをエクスポート

bids-matlab-tools プラグインをインストールした後、BIDS メニューは、以下に示すように EEGLAB ファイルメニュー項目に表示されます。

![](eeglab_menu_bids.png)

ひとつひとつずつメニューを通します。 タスクメニューを最初に。 これは、タスクとアンプ情報に関するすべての情報を入力する場所です。

![](bids_task.png)

タスク情報を入力すると、参加者メニューを選択できます。 被写体として多くの行があります。 年齢、性別、グループなど、各科目に年齢、性別、グループなどを指定することができます。 session_id カラムのみが必須で、他のカラムはオプションです。

![](participant.png)

カスタムカラムを定義することも可能です。 これを行うには、 "import column(s)" ボタンを押します。 そのため、テキストまたはExcelファイルを選択するように求められます。 最初の行は列名を含む必要があります。 ファイルを選択すると、次のインターフェイスがポップアップ表示されます。

![](import_column.png)

参加者 ID が含まれている列を示す必要があります。 また、年齢、性別などの事前定義されたBIDS参加者情報用の列を選択することもできます。 最後に、BIDS参加者ファイルに追加された列を選択し、この場合「エシニティ」と「インカム」を選択します。

最後に、イベントに関する情報を記入します。 GUI は、対応する EEGLAB イベントフィールドをデータに関連付けることができる、デフォルトの BIDS イベントフィールドを表示します。 *onset*、*value*、*sample* はデフォルトで対応する EEGLAB フィールドにマッピングされます。 *duration* と *HED* は、対応する EEGLAB フィールド (*duration* と *usertags* それぞれ) が存在する場合に自動的にマッピングされます。 「BIDSフィールドを追加」ボタンでカスタムフィールドを追加できます。 「BIDSフィールドを削除」ボタンでフィールドを削除することもできます。 EEGLABイベントフィールドにマッピングされていないBIDSフィールドは、後でエクスポートするために保存されませんのでご注意ください。
![](pop_eventinfo.png)

# コマンドラインからBIDSにデータセットをエクスポートする

データセットをBIDSにエクスポートすることで、コマンドラインから簡単に行えます。 文書化された例のスクリプト [bids_export_example.m](https://github.com/sccn/bids-matlab-tools/blob/master/bids_export_example.m) そして、 [bids_export_example2.m](https://github.com/sccn/bids-matlab-tools/blob/master/bids_export_example2.m) (詳細はこちら) これらのスクリプトを自分の目的に合わせて変更することができます。 機能のヘルプメッセージ [入札_export.m](https://github.com/sccn/bids-matlab-tools/blob/master/bids_export.m) また、BIDS形式のデータをエクスポートする方法に関する情報が含まれています。 

輸出のためのノート:
* 1つのBIDSコンテナに複数のタスクが含まれる場合があります。 この場合、メインタスクの名前は「混在タスク」と異なるタスクのための複数のEEGデータセットが単一の件名/例/フォルダに含まれていることができます。
* チャンネル電極は、テンプレートの電極位置であればデフォルトでエクスポートしないでください。 これは、BIDSが生データについているからです。 テンプレート(平均)に基づく電極の位置は含まれていません。

# EEGとアイトラッキングアライメント

テストフォルダでは、**test_smi.m** 関数を使用して、EEG と eye-tracking 同期を調べます。 下のプロットは、元の目追跡データ(黒の垂直トレースとしてプロットされたイベントと並行して)と、ジョイントEEGと目追跡データ(比較のために目追跡データのみが表示される)を示しています。 異なるサンプリング速度にもかかわらず、アライメントは完璧に近いです。 

![スクリーンショット 2023-12-12 に 5 37 25](https://github.com/sccn/bids-matlab-tools/assets/1872705/f2d9f851-b6d9-4e7c-9360-1d7e6880e6b3)

機能を見る [bids_export_example5_eye.m](https://github.com/sccn/bids-matlab-tools/blob/master/bids_export_eye_tracking_example5.m) EEGとアイトラッキングデータをエクスポートする方法