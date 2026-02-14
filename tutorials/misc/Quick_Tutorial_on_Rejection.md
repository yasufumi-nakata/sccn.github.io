---
layout: default
title: Quick rejection tutorial
long_title: Quick tutorial on rejecting EEG artifacts using ICA
parent: Reference Topics
grand_parent: Tutorials
nav_order: 12
---
カリフォルニア大学卒業
====================
お問い合わせ

EEGLABは、
EEGデータから非現実的なインティファクトの他のタイプ。 EEGLABは、偽りなく、偽りなく、偽りなく偽りを犯します。
コンテンツ EEGLABLabでは、EEGLABに、EEGLABに、EEGLABに、EEGLABに、EEGLABに、EEGLABに、EggLabに、EggLabに、EggLabに、EggLabに、EggLabに、EEGLabに、EggLabに、EggLabに、EggLabに、EggLabに、EggLabに、EggLabに、EggLabに、EggLabに、EegLabに、EggLabに、EggLabに、EggLabに、Eggre、EggLabに、EggLabに、EggLabに、Ja、Ja、Ja、S、Ja、S、S、S、Ja、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、 最近の投稿 チュートリアル

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>


## 1。 MATLABとEEGLABは、注文する。
タイプ \>\> eeglab MATLAB で EEGLAB が リリースされました。 

メニュー項目を選択
<span style="color: brown">ファイル → インポートデータ</span> データファイルをインポートする
さまざまなファイル形式で。 詳細はこちら [インポートデータ](/tutorials/04_Import/Importing_Continuous_and_Epoched_Data) セクション
詳細情報。

メニュー項目を使用してデータをスクロールしてチェックする <span style="color: brown">Plot → チャンネルデータ(有料)</span>.

## 2。 チャンネルの場所ファイルをインポートする

チャンネルの場所ファイルをインポートすることは、視覚化のために不可欠です
データの独立したコンポーネント。 選択する <span style="color: brown">編集 → チャネルの場所</span> メニュー項目。

- ソリューション1 EGLabは、顧客のニーズにお応えします。 *Ok*は、

- ソリューション 2。 チャンネルラベルが存在しない場合は、ボタンを押します *チャンネル編集ウィンドウの右下隅にある場所を読み込みます。
* * *
EEGLABは、EEGLABの略称です。
ファイル拡張子から。 

プレス *Ok*
チャンネル 編集ウィンドウ EEGLAB にインストールします。

チャンネルの場所が正しくインポートされていることを確認するには、
メニュー項目 <span style="color: brown">Plot → チャンネル →</span>

## 3。 アーティファクト・ラデンデータをレジェクト

 良い
. . . .
固定スカルプマップの予測に関連付けられているもの。 

これらは目を含む
動きおよび目の点滅、気道筋肉活動およびライン騒音。 アメリカ
他の種類のアーティファクトを効率的に拒否するためには使用できません。
1種類のスカルプマップのシリーズに関連付けられています。

例えば、
被写体は、数秒間EEGCAPをスクラッチ、
結果はわずかに異なるスカルプマップの長いシリーズになります
チャネルおよびワイヤー動き、等に関連付けられて。 そのため、
"non-stereotyped" または "paroxysmal" は、
ICAのスタッフ

悪いデータを拒否する2つのソリューションがあります。

- 自動化された解決: メニュー項目を選択 <span style="color: brown">ツール → Clean Rawdata と ASR を調べる</span> お問い合わせ チェック * * * * * * * * * * * * * * * * * * * ます * * ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます ます お問い合わせ
新着情報

- 手動解決: 
> - - - 連続的または露出したデータの「ノイズチャネル」を拒否するには、選択します
メニュー項目 <span style="color: brown">データの編集 → 選択</span>. 

> - - - 「連続データ」の騒々しい部分を拒絶するには、メニュー項目を選択します。
<span style="color: brown">ツール → 目でデータを調べる</span>.
 次に、連続したデータのノイズ部分をマークします。
マウスを水平方向にドラッグして、左ボタンで解除
*Reject* は、Windows がリリースされます。
新着情報

## 4。 ICAハンドブック、IDファクチュアルコンポーネント

オプションですが、データを再参照して平均的な参照にしておくことをお勧めしています。 <span style="color: brown">ツール → データを再参照する</span> メニュー項目。

メニュー <span style="color: brown">ICA は、</span> ICAを運営する
デフォルトオプション お問い合わせ

ソリューション

- 自動化された解決: 
> - ラベルコンポーネントを使用して <span style="color: brown">ツール → IClabel → コンポーネントのラベルを構成する</span> メニュー項目。
> - コンポーネントの分類 <span style="color: brown">ツール → IClabel → コンポーネントを識別する</span> メニュー項目。
> - メニュー項目を選択 <span style="color: brown">ツール → コンポーネントを削除</span>
データから選択したコンポーネントを実際に削除します。

- 手動解決:
> - メニュー <span style="color: brown">ICA → コンポーネントをマップで拒否する</span> 実際のコンポーネントを選択する。 [データを見る]
解析(実行)
ICA)](/tutorials/06_RejectArtifacts/RunICA.html)チュートリアル
詳細情報。
> - メニュー項目を選択 <span style="color: brown">ツール → コンポーネントを削除</span>
データから選択したコンポーネントを実際に削除します。

[データ解析(実行)]を参照してください。
ICA)](/tutorials/06_RejectArtifacts/RunICA.html)チュートリアル
詳細な情報と、アーティファクチュアルコンポーネントを選択する方法のヒント。

## 5。 5。 洗浄されたデータのさらなる処理および/またはエクスポート

EEGLAB GUIからデータセットのグループへ [このチュートリアル](/tutorials/10_Group_analysis/multiple_subject_proccessing_overview.html).

現在 現在 その を EEGLAB の処理をさらに進める。 [データをエクスポートする](/tutorials/misc/Exporting_Data.html) あなたの選択のフォーマットに。

