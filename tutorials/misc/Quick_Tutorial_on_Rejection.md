---
layout: default
title: Quick rejection tutorial
nav_title: "ICAアーティファクト除去クイックガイド"
long_title: Quick tutorial on rejecting EEG artifacts using ICA
parent: Reference Topics
grand_parent: Tutorials
nav_order: 12
---
ICAを用いたEEGアーティファクト除去クイックチュートリアル
====================================================

EEGLABは、EEGデータからアーティファクトを除去するための様々なツールを提供しています。EEGLABは独立成分分析（ICA）を用いて、眼球運動、瞬き、筋電図活動、その他のタイプの非脳由来アーティファクトを分離し、除去することができます。このチュートリアルでは、EEGLABを使用してEEGデータからアーティファクトを除去する基本的な手順を説明します。

<details open markdown="block">
  <summary>
    目次
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>


## 1. MATLABとEEGLABの起動
MATLABコマンドウィンドウで \>\> eeglab と入力し、EEGLABを起動します。

メニュー項目を選択
<span style="color: brown">ファイル → インポートデータ</span> データファイルをインポートする
さまざまなファイル形式でデータファイルをインポートできます。詳細は[データのインポート](/tutorials/04_Import/Importing_Continuous_and_Epoched_Data)セクションを参照してください。

メニュー項目 <span style="color: brown">Plot → チャンネルデータ（スクロール）</span> を使用してデータをスクロールして確認します。

## 2. チャンネル位置ファイルのインポート

チャンネル位置ファイルのインポートは、データや独立成分の可視化に不可欠です。メニュー項目 <span style="color: brown">編集 → チャネル位置</span> を選択します。

- ソリューション1：EEGLABがチャンネルラベルを自動的に認識した場合、チャンネル位置が自動的に検索されます。*Ok*を押します。

- ソリューション2：チャンネルラベルが認識されない場合は、チャンネル編集ウィンドウの右下にある*Look up locs*ボタンを押します。EEGLABはファイル拡張子からチャンネル位置ファイルのフォーマットを自動的に検出します。

チャンネル編集ウィンドウで*Ok*を押します。

チャンネル位置が正しくインポートされたことを確認するには、メニュー項目 <span style="color: brown">Plot → チャンネル位置のプロット</span> を選択します。

## 3. アーティファクトを含むデータの除去

ICAは、固定的な頭皮マップに関連付けられたステレオタイプのアーティファクトの除去に適しています。これには眼球運動、瞬き、筋電図活動、ライン・ノイズなどが含まれます。一方、単一の頭皮マップパターンに関連付けられていないアーティファクトの除去には効率的に使用できません。

例えば、被験者が数秒間EEGキャップをかいた場合、チャネルやワイヤーの動きに関連するわずかに異なる頭皮マップの長いシリーズが生じます。そのため、このような「非定型的（non-stereotyped）」または「突発的（paroxysmal）」なアーティファクトは、ICAでは効果的に分離できません。

悪いデータを除去するには2つの方法があります。

- 自動的な方法：メニュー項目 <span style="color: brown">ツール → Clean Rawdata と ASR</span> を選択し、適切なチェックボックスを有効にします。

- 手動的な方法：
> - ノイズの多いチャンネルを連続データまたはエポックデータから除去するには、メニュー項目 <span style="color: brown">編集 → データの選択</span> を選択します。

> - 連続データのノイズの多い部分を除去するには、メニュー項目 <span style="color: brown">ツール → 目視でデータを検査する</span> を選択します。次に、連続データのノイズ部分をマウスで水平方向にドラッグしてマークし、*Reject*ボタンを押して除去します。

## 4. ICAの実行とアーティファクトコンポーネントの特定

オプションですが、データを平均参照に再参照しておくことをお勧めします。メニュー項目 <span style="color: brown">ツール → データの再参照</span> を使用します。

メニュー項目 <span style="color: brown">ツール → ICAの実行</span> を選択してICAを実行します。デフォルトオプションを使用してください。

ソリューション

- 自動的な方法：
> - メニュー項目 <span style="color: brown">ツール → ICLabel → コンポーネントのラベル付け</span> を使用してコンポーネントにラベルを付けます。
> - メニュー項目 <span style="color: brown">ツール → ICLabel → コンポーネントの分類</span> を使用してコンポーネントを分類します。
> - メニュー項目を選択 <span style="color: brown">ツール → コンポーネントを削除</span>
データから選択したコンポーネントを実際に削除します。

- 手動的な方法：
> - メニュー項目 <span style="color: brown">ツール → コンポーネントをマップで選択</span> を選択してアーティファクトコンポーネントを特定します。詳細は[データ解析（ICAの実行）](/tutorials/06_RejectArtifacts/RunICA.html)チュートリアルを参照してください。
> - メニュー項目を選択 <span style="color: brown">ツール → コンポーネントを削除</span>
データから選択したコンポーネントを実際に削除します。

アーティファクトコンポーネントの選択方法に関する詳細なヒントについては、[データ解析（ICAの実行）](/tutorials/06_RejectArtifacts/RunICA.html)チュートリアルを参照してください。

## 5. クリーニングされたデータのさらなる処理とエクスポート

複数の被験者データセットをEEGLAB GUIからグループ分析するには、[このチュートリアル](/tutorials/10_Group_analysis/multiple_subject_proccessing_overview.html)を参照してください。

EEGLABでさらにデータ処理を行うか、[データをエクスポート](/tutorials/misc/Exporting_Data.html)してお好みのフォーマットで保存できます。

