---
layout: default
title: d. BIDS
nav_title: "d. BIDS"
long_title: d. Brain Imaging Data Structure data
parent: 4. Import data
grand_parent: Tutorials
---
BIDSについて
===========================

Brain Imaging Data Structure（BIDS）は、神経画像データを整理・共有するための標準的なデータ形式です。BIDSの[電気生理学](https://github.com/bids-standard/bids-specification/blob/master/src/04-modality-specific-files/03-electroencephalography.md)拡張により、EEGおよび頭蓋内EEG（iEEG）データもサポートされています。EEGLABでは、EEGのBIDS形式を共同で開発しており、[EEG-BIDS](https://github.com/sccn/bids-matlab-tools/wiki) EEGLABプラグインを提供しています。

<details open markdown="block">
  <summary>
    目次
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

BIDSデータセット
----

[openneuro.org](https://openneuro.org) でBIDS形式のEEGデータセットを検索・ダウンロードできます。OpenNeuroには多数のEEGデータセットが公開されています。詳細については[2021年の記事](https://sccn.ucsd.edu/~arno/mypapers/Delorme_BIDS_IEEE_Tools20.pdf)を参照してください。以下に[特定のデータセット](https://openneuro.org/datasets/ds002718)の例を示します。

![](/assets/images/openneuro.png)

OpenNeuroからデータセットをダウンロードするには複数の方法があります。*AWS* CLIは個々のファイルのダウンロードに便利です。*git* や *git-annex* はデータセット全体のクローンに使用できます。*openneuro* CLIツールはOpenNeuroへのデータセットのアップロードとダウンロードに使用できます。OpenNeuroのWebインターフェイスからも直接ダウンロードできます。

BIDSデータセットをEEGLABにインストール
----
EEGLABでは、[bids-matlab-tools](https://github.com/sccn/bids-matlab-tools/wiki) プラグインを使用してBIDSデータをインポートできます。このプラグインはEEGLABプラグインマネージャーの <span style="color: brown">EEGLABの機能拡張</span> メニュー項目からインストールできます。

選択メニュー項目 <span style="color: brown">BIDS ツール → STUDY に BIDS を インストール</span> 次のウィンドウが開きます。

![](/assets/images/pop_importbids2.png)

このウィンドウでは、EEGチャンネル位置やイベント情報のインポートオプションを設定できます。

BIDSでは、イベント情報は専用のファイル（*_events.tsv）に格納されています。BIDSイベントファイルの列名をEEGLABのイベントフィールドにマッピングできます。インポートするイベントフィールドとして *trial_type* 列を選択することを推奨します。

最後に、EEGLAB STUDYが自動的に作成されます。各EEGファイルに対して前処理パイプラインを設定できます。

*Ok* を押すとインポートが実行されます。

BIDS EEGLABに関する研究
----
EEGLAB STUDYを使用してチャネル測定値の前処理計算を行うには、<span style="color: brown">研究 → チャネル測定値の前計算</span> メニュー項目を選択します。以下に示すように、*Power* のチェックボックスをオンにします。

![](/assets/images/bidsprecomp.png)

メニュー項目 <span style="color: brown">研究 → チャネル測定値のプロット</span> を選択し、*Plot spectra* ボタンを押すと、すべての被験者のスペクトルが表示されます。

![](/assets/images/bidsplot.png)

1人の被験者のデータにアーティファクトが含まれていることに注意してください。

[バッチ処理チュートリアル](/tutorials/10_Group_analysis/multiple_subject_proccessing_overview.html#perform-batch-processing) に従ってデータを前処理できます。詳細については [EEGLABグループ解析](/tutorials/10_Group_analysis/) を参照してください。

[BIDSチュートリアル](/tutorials/11_Scripting/Analyzing_EEG_data_in_EEGLAB_The_Wakeman-Henson_dataset.html) でMATLABスクリプトを使用したBIDSデータの解析方法も参照できます。
