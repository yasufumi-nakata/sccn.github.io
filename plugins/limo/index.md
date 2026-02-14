---
layout: default
title: LIMO
nav_title: "リモ"
long_title: LIMO
parent: Plugins
render_with_liquid: false
has_children: true
nav_order: 6
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/LIMO-EEG-Toolbox/limo_meeg).

# MEEGデータのLInear MOdeling

MEEGデータのLInear MOdelling(LIMO MEEG)ツールボックスは、MEEGデータの統計解析に専念するMatlabツールボックスです。 EEGLAB(特にEEGLABのSTUDYはバージョンを開発する)との対面があります。 ただし、データがインポートされると、LIMO MEEG内で実行され、ツールボックスは任意のデータセットのために動作することができます。

このリポジトリは、EEGLAB(EEGLAB)で使用するLIMO MEEG(v2)の安定版です。https://sccn.ucsd.edu/eeglab/) しかし、FieldTripのような他のアプリケーションで使用することができます(http://www.fieldtriptoolbox.org/)またはBrainStorm ()https://neuroimage.usc.edu/brainstorm/) あなたの研究の適用のための。 以前のバージョン(1.5)がここにアーカイブされています: http://datashare.is.ed.ac.uk/handle/10283/2190

## 導入事例

EEGLAB をインストール (一部の関数を呼び出すため) とプラグインディレクトリに LIMO をインストールします。

## ドキュメント
docディレクトリに (少し古い)
もちろんです。 [ウィキ](https://github.com/LIMO-EEG-Toolbox/limo_eeg/wiki)

## LIMOチュートリアルデータセット

ソフトウェアでは、ここで引用してダウンロードできるデータセットをリリースしました。 http://datashare.is.ed.ac.uk/handle/10283/2189

## お問い合わせ

一般的な分析質問のためのeeglabメーリングリストやneurostar(tagging people)などのディスカッションフォーラムを使用するのがベストです。  
また、直接メールを送ったり、 github の問題を上げることもできます。特にバグです。

## 貢献する

どなたでもご参加いただけます! 詳しくはこちら [参加できる方法](https://github.com/LIMO-EEG-Toolbox/limo_eeg/blob/master/contributing.md), , [行動規範](https://github.com/LIMO-EEG-Toolbox/limo_eeg/blob/master/code_of_conduct.md).

寄稿者一覧 [詳しくはこちら](https://github.com/LIMO-EEG-Toolbox/limo_eeg/blob/master/contributors.md)
# **チュートリアル**

異なる機能と使用状況に関する詳細は、 [wikiページはこちら](https://github.com/LIMO-EEG-Toolbox/limo_tools/wiki) これはステップバイステップのチュートリアルです。

_重要なお知らせ _

LIMO プロット機能を使用して表示するたびに、Matlab ワークスペースですべての変数が返されます。 たとえば、すべてのチャンネルと時間(ERP結果)をプロットすると、生の統計マップと重要なマスクが返されます。 タイムコースをプロットすると、その時間経過を自信の間隔で返します。 これらの変数を参照するには、Matlab コマンドラインで "who" を入力できます。

## スタート

チュートリアルは、 [ウェイクマンとヘンソン (2015)](https://www.nature.com/articles/sdata20151) 顔データ。 短い、有名な、非有名でスクランブルされた顔が提示され、すぐに繰り返されます。 被験者は、それらを従事し続けるために、設計に判断タスクの矯正を行う必要があります。 EEGチャンネルを抽出し、前処理しました。 [このチュートリアルのデータをここにダウンロード](https://openneuro.org/datasets/ds002718/versions/1.0.5) BIDS形式

このチュートリアルでは、最新の使い方を想定しています。 [エッグラボ](https://github.com/sccn/eeglab) 使用するバージョン(2020.0以降) [スタディ](https://sccn.ucsd.edu/wiki/Chapter_02:_STUDY_Creation) リンクについて [LIMOツール](https://github.com/LIMO-EEG-Toolbox/limo_tools).


 