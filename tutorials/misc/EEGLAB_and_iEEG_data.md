---
layout: default
title: EEGLAB and iEEG data
long_title: EEGLAB and MEG data
parent: Reference Topics
grand_parent: Tutorials
---
EEGLABとiEEG、SEEG、またはECoGデータ
====================

EEGLABは、ネイティブコードによるほとんどのiEEGデータフォーマット(EDF、MEF3、NWB)の読み込みをサポートしています。 
またはプラグイン。 BIDS-Matlab-tools EEGLABプラグイン
また、BIDS-formatted MEGデータのインポートにも対応しています。 EEGLABプラグインマネージャ(メニュー項目)からプラグインをインストールできます <span style="color: brown">ファイル > マネージング EEGLABエクステンション</span>). 
ログイン
## データのインポート

例えば、MEF3 と BIDS-Matlab-tools プラグインをインストールした後、インポートすることができます。 
[ds003708 BIDSデータセット](https://nemar.org/dataexplorer/detail?dataset_id=ds003708&processed=0). 
まず、データをダウンロードします。 第二に、メニュー項目を使用する <span style="color: brown">ファイル > BIDSツール > BIDSフォルダをSTUDYにインポートする</span>. 
すべてのデフォルトを残してOKを押します(イベントタイプの関心の列を選択することもできます)。 代わりに、使用
メニュー項目 <span style="color: brown">ファイル > インポートデータ > EEGLABの機能とプラグインの使用 > インポートMEF3フォルダ</span> インポートする <i>メフッド</i> 
フォルダにある <i>ds003708/sub-01/ses-ieeg01/ieeg/</i> BIDSデータセットのフォルダ。

BIDSにインポートすると、その利点は、データとともに、iEEGの電極の場所や関連イベントへのアクセス権を持つことになります。 BIDSデータセットのユニークな被写体については、生のSEEGデータの下に示します。 <i>ds003708</i>.

![スクリーンショット 2022-09-09 に 3 16 34 午後](https://user-images.githubusercontent.com/1872705/189453192-66169ca9-174b-419c-ba7b-2bada4cbda91.png)

同じデータセットのチャネルの場所は以下に示します。

![スクリーンショット 2022-09-09-09 に 3 16 56 PM](https://user-images.githubusercontent.com/1872705/189453262-e942a285-b19f-455e-aad0-b38bbc62d0dd.png)

iEEGデータを処理するためにEEGLABを使用していない場合でも、iEEGデータをEEGLABにインポートし、EEGLABデータセットに再保存しても、他のソフトウェアで処理するのに便利です。

## スパイク情報のインポート

EEGLABでは、NWB(Neurodata without Border)を使用したイベントとして、スパイクをインポートすることができます。 以下はファイルを使った例を示します。 [サブ-01_ses-20140828T132700_ecephys+image.nwb](https://api.dandiarchive.org/api/assets/94ba06fc-c870-4698-9c31-f403ee733887/download/) お問い合わせ [ダンディセット](https://dandiarchive.org/dandiset/000576/)お問い合わせ ファイルをダウンロードした後、NWB-io EEGLABプラグインをインストールした後(メニュー項目) <span style="color: brown">ファイル > EEGLABエクステンション</span> 次に、NWB-ioプラグインをインストールします。 プラグインをインストールした後、メニュー項目を使用して、EEGLAB の上のファイルをインポートします。 <span style="color: brown">ファイル > インポートデータ > EEGLABの機能とプラグインの使用 > NWBファイルから</span>お問い合わせ チェックボックスをチェックしてスパイクのレイテンシーをインポートしてください。

![Screenshot 2024-04-17 に 10 00 59 午前](https://github.com/sccn/sccn.github.io/assets/1872705/88a21917-0b8e-4f1d-a6fa-cae1297994d2)

ファイルがインポートされたら、メニュー項目を使用する <span style="color: brown">パロット > チャネルデータ(スクロール)</span>

![Screenshot 2024-04-17 に 10 02 28 午前](https://github.com/sccn/sccn.github.io/assets/1872705/d8ddf709-7963-4f05-adef-8bf4049cc484)

データエポックを抽出し、ERPをプロットすることができます。 例えば、ユニット#1のスパイクに基づいてデータを抽出するには、メニュー項目を使用する <span style="color: brown">ツール > エキスのエポック</span> 以下に示すように、最初のユニットに対応するイベントを選択します。

![スクリーンショット 2024-04-17 に 11 45 31](https://github.com/sccn/sccn.github.io/assets/1872705/c9b4082c-33c3-4f75-8d0a-522e852a7009)

メニュー項目を使う <span style="color: brown">Plot > チャンネルERP > 頭皮マップ付き</span> このデータセットで記録された2つのチャンネルのERPをプロットする。

![スクリーンショット 2024-04-17 に 11 48 32](https://github.com/sccn/sccn.github.io/assets/1872705/a863a7d3-cf51-4e38-b615-44ebc575bd50)

## 追加リソース

iEEGデータを処理するためのその他の関連リソース:
- [FieldTrip sEEGチュートリアル](https://www.fieldtriptoolbox.org/tutorial/human_ecog/)
- [マニア](http://www.neurotrack.fr/mia/) ツールボックス。 また、Brainstormプラグインとしてアクセス可能です。
- [ログイン](https://rave.wiki/) ツールボックス(R言語)
