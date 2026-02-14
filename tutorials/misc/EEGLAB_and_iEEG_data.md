---
layout: default
title: EEGLAB and iEEG data
long_title: EEGLAB and MEG data
parent: Reference Topics
grand_parent: Tutorials
---
EEGLABとiEEG、GSEE、またはECoGデータ
====================

EEGLAB は、EEGLAB のソースコードを、EEGLAB は、EEGLAB のコードを、EEGLAB のコードを、EEGLAB のコードで作成しています。 
もしくは、 BIDS-Matlab-tools EEGLAB プラグイン
また、BIDSフォーマット EEGLABは、EEGLAB(メニュー項目)から、 <span style="color: brown">ファイル > EEGLABエクスカ</span>). 
ログイン
## データのインポート

例えば、MEF3 と BIDS-Matlab-tools は、 
[ds003708 BIDSデータセット](https://nemar.org/dataexplorer/detail?dataset_id=ds003708&processed=0). 
まず、データをダウンロードします。 第二に、メニュー項目を使用する <span style="color: brown">ファイル > BIDSツール > BIDSをフォルダにSTUDYにインポート</span>. 
デフォルト デフォルト デフォルト デフォルト デフォルト お問い合わせ
メニュー項目 <span style="color: brown">EEGLABの機能とプラグイン ドキュメント</span> インポートする <i>メフッド</i> 
フォルダにある <i>ds003708/sub-01/ses-ieeg01/ieeg/</i> BIDSデータセット

BIDSに問い合わせると、その利点は、iEEGの電極や関連イベントの解決に役立ちます。 BIDSデータセットの被写体、生のSEEGデータが示されます。 <i>ds003708</i>.

![スクリーンショット 2022-09-09 に 3 16 34 午後](https://user-images.githubusercontent.com/1872705/189453192-66169ca9-174b-419c-ba7b-2bada4cbda91.png)

同じデータセットのチャネルの場所は以下に示します。

![Publish Date:2017-05-01TSFM:MS皮鞋 X 千代洋服,紳裝入門提案](https://user-images.githubusercontent.com/1872705/189453262-e942a285-b19f-455e-aad0-b38bbc62d0dd.png)

iEEGLABは、EEGLABが、EEEGLABに、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、再構築、

## スパイク情報のインポート

EEGLAB,NWB(Neurodata without Border) は、以下のとおりです。 [サブ-01_ses-20140828T132700_ecephys+image.nwb](https://api.dandiarchive.org/api/assets/94ba06fc-c870-4698-9c31-f403ee733887/download/) お問い合わせ [ダンディセット](https://dandiarchive.org/dandiset/000576/)EEGLAB プラグイン(メニュー項目) <span style="color: brown">EEGLABエクスカ</span> NWB-io は、 よくある質問 お問い合わせ <span style="color: brown">EEGLABの機能とプラグイン NWBファイル</span>お問い合わせ チェックボックスをチェックしてスパイクのレイテンシーをインポートしてください。

![Screenshot 2024-04-17 に 10 00 59 午前](https://github.com/sccn/sccn.github.io/assets/1872705/88a21917-0b8e-4f1d-a6fa-cae1297994d2)

ファイルがインポートされたら、メニュー項目を使用する <span style="color: brown">パロット > チャネルデータ(スクロール)</span>

![Screenshot 2024-04-17 に 10 02 28 午前](https://github.com/sccn/sccn.github.io/assets/1872705/d8ddf709-7963-4f05-adef-8bf4049cc484)

このページではjavascriptを使用しています。 メニュー項目の検索 <span style="color: brown">ツール > エキスのエポック</span> 以下に示すように、最初のユニットに対応するイベントを選択します。

![スクリーンショット 2024-04-17 に 11 45 31](https://github.com/sccn/sccn.github.io/assets/1872705/c9b4082c-33c3-4f75-8d0a-522e852a7009)

メニュー項目を使う <span style="color: brown">Plot > チャンネルERP > 頭皮マップ付き</span> このデータセットでは、ERP のチャンネルを、

![スクリーンショット 2024-04-17 に 11 48 32](https://github.com/sccn/sccn.github.io/assets/1872705/a863a7d3-cf51-4e38-b615-44ebc575bd50)

## 追加リソース

iEEGについて
- [FieldTrip sEEGチュートリアル](https://www.fieldtriptoolbox.org/tutorial/human_ecog/)
- [マニア](http://www.neurotrack.fr/mia/) また、Brainstormのプラグインは、
- [ログイン](https://rave.wiki/) ツールボックス(R言語)
