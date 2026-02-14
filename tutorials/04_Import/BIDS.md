---
layout: default
title: d. BIDS
long_title: d. Brain Imaging Data Structure data
parent: 4. Import data
grand_parent: Tutorials
---
BIDSデータのインポート
===========================
お問い合わせ
脳イメージングデータ構造(BIDS)のデータ規格は、神経イメージングデータセットの整理、記述、およびアノテーションのためのコミュニティ規格です。 マグネロエンセファログラフィ(MEG)のデータ拡張が開発され、2019年には、 [電気生理学](https://github.com/bids-standard/bids-specification/blob/master/src/04-modality-specific-files/03-electroencephalography.md) EEGおよび慣性EEG(iEEG)データの拡張子 EEGLAB では、EEG データを BIDS 形式にインポートしてエクスポートすることができます。 [EEG-BIDSについて](https://github.com/sccn/bids-matlab-tools/wiki) EEGLABプラグイン

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

BIDSデータセットのダウンロード
----

お問い合わせ [openneuro.org(オープンネロ)](https://openneuro.org)「EEG」という用語を検索します。 OpenNeuro は EEG のデータセットをすべて表示します。 これらのデータセットの品質が変化する可能性があります。 [2021 記事](https://sccn.ucsd.edu/~arno/mypapers/Delorme_BIDS_IEEE_Tools20.pdf)お問い合わせ お問い合わせ [特定のデータセット](https://openneuro.org/datasets/ds002718)以下に示すように。

![](/assets/images/openneuro.png)

ダウンロードするには、コンピュータに空のフォルダを作成し、ダウンロードボタンを押して、このフォルダを選択します。 Webダウンロードインターフェイスは、時々失敗することに注意してください(接続の速度によって異なります)。

代替は、コマンドラインプログラム*openneuro*、*aws*、または*datalad*を使用する方法です。 様々な成功度で3つを使用しました。 ※Aws*は1つのインストールのみが必要なため、若干簡単です。 *datalad* は *git* や *git-annex* などの他のモジュールをインストールする必要があります。 *openneuro* コマンドは、OpenNeuro にデータセットをアップロードするだけでなく、OpenNeuro にデータセットをアップロードできる唯一のコマンドです。(OpenNeuro の Web インターフェイスを使用してデータセットを、ほぼ常に体系的に失敗させる)使用することをお勧めします。

BIDSデータセットをEEGLAB研究にインポート
----
EEGLABを起動し、インストールします。 [bids-matlab-io - アダルトアフィリエイトプログラム モデル募集 モデルログイン](https://github.com/sccn/bids-matlab-tools/wiki) EEGLAB プラグインマネージャーから EEGLAB プラグインを使用する <span style="color: brown">ファイル → EEGLAB 拡張機能の管理</span> メニュー項目。

選択メニュー項目 <span style="color: brown">ファイル → BIDS ツール → STUDY に BIDS フォルダーをインポート</span> 作成したBIDSフォルダを選択します。 次のウィンドウがポップアップ表示されます。

![](/assets/images/pop_importbids2.png)

未加工 EEG のデータファイルは頻繁にチャネルのラベルを定義します。 ただし、BIDSは、専用のイベントファイルでチャネルラベルとチャネルの場所を定義します。 2番目のチェックボックスを押すと、BIDSチャンネル定義ファイルに含まれるチャンネルラベルと位置情報を使用する場合があります。

生 EEG のデータファイルには、多くの場合、イベントがあります。 ただし、BIDSはイベント専用ファイルでイベントを定義しています。 BIDSイベントファイルには、生EEGデータファイルよりも多くの情報が含まれています。 この場合、BIDSイベントファイルに含まれているイベント情報を含む未加工EEGデータイベントを上書きすることを選択できます。 BIDSイベントが選択されると、BIDSイベント欄が「値」か「trial_type」になる場合があります。 インポートする列を選択するには、BIDSイベントファイルの1つを見ることをお勧めします。 この場合、*trial_type* を選択します。

最後に、EEGLAB STUDY を格納するための出力フォルダを選択できます。 フォルダが選択されていない場合、EEGLABは、BIDSフォルダ構造で意味するSTUDYファイル "in place"を格納します - 追加のEEGLABファイルのためにBIDSフォルダになり、非BIDS準拠になり、BIDS検証に失敗するようになります。

*Ok*を押してください。

BIDS EEGLABに関する研究
----
このEEGLAB STUDYは機能的であることを示すために、プリプロセッシングなしでこれを行うことができるため、単にスペクトルをプロットします。 選択する <span style="color: brown">研究 → プレコプトチャネル対策</span> メニュー項目は、以下に示すように、*Power スペクトラム*チェックボックスをチェックし、*Ok*を押します。

![](/assets/images/bidsprecomp.png)

メニュー項目を使用する <span style="color: brown">研究 → プロットチャネル対策</span> 右側の列で、*Plot spectra* ボタンを押します。 以下のプロットがポップアップし、すべての対象のスペクトルを表示します。

![](/assets/images/bidsplot.png)

ほとんどの被験者に対して、アルファピークを10Hz程度で確認することができます。(1人の被験者であり、そのデータにおけるアーティファクトの存在によります)。 

あなたはフォローすることができます [バッチ処理チュートリアル](/tutorials/10_Group_analysis/multiple_subject_proccessing_overview.html#perform-batch-processing) EEGLAB GUI から全てのデータセットを同時に処理し、標準を実行します。 [EEGLABグループ分析](/tutorials/10_Group_analysis/).

見てみることもできます。 [BIDSスクリプト処理チュートリアル](/tutorials/11_Scripting/Analyzing_EEG_data_in_EEGLAB_The_Wakeman-Henson_dataset.html)MATLABコマンドラインから同じデータセットを処理する。
