---
layout: default
title: d. STUDY visualization
nav_title: "d. STUDYの可視化"
long_title: d. STUDYの可視化とプロット
parent: 10. Group analysis
grand_parent: Tutorials
---

チャネルデータの事前計算と可視化
========================
{: .no_toc }

EEGLABでは、総平均ERP、スペクトル、ERP-image、ERSP/ITCをプロットできます。このチュートリアルでは、測定値を事前計算する方法、プロットする方法、プロットパラメータを変更する方法を説明します。

<details open markdown="block">
  <summary>
    目次
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

サンプルEEGLAB STUDYセットの読み込み
---------------------------------

各チュートリアルでは、異なるデータを使ってEEGLABの機能を説明します。このページでは、14名の被験者による動物/非動物の分類課題を使用します。

被験者には、動物を含む画像または動物を含まない画像が提示されました。提示された画像に動物が含まれている場合、被験者はボタンを押して反応しました(go/no-go課題)。このデータは[こちら](https://sccn.ucsd.edu/eeglab/download/animal_study.zip)からダウンロードできます(626 Mb)。課題の完全な説明、未処理データ(4 Gb)、および処理用のMATLABファイルは[openneuro.org](https://openneuro.org/datasets/ds002680)で公開されています。

<span style="color: brown">File</span>メニューから<span style="color: brown">Load existing study</span>を選択します。チュートリアルファイル「animal.study」を選択し、*Open*を押します。

データを読み込んだ後、*STUDY*デザインを確認するには、<span style="color: brown">Study → Select/Edit study design</span>メニュー項目を使います。デフォルトデザインは、*animals*条件と*distractors*条件を比較するものです。*Ok*を押してウィンドウを閉じます。

![](/assets/images/studyprecomp2.png)

ERPの事前計算とプロット
------------------------------

### ERPの事前計算

チャネル測定値をプロットする前に、下図のように<span style="color: brown">Study → Precompute channel measures</span>メニュー項目を使って測定値を事前計算する必要があります。

![](/assets/images/studyprecomp1.png)

このGUIは2つの部分に分かれています。上部では測定値を事前計算する前にデータへ適用する変換を指定し、下部では事前計算する測定値を指定します。

GUI上部パネルでは、チャネルに対する変換を指定できます。

- *Channel interpolation.* チャネルデータを可視化したり統計計算に使ったりする場合、欠損チャネルを先に補間することを強く推奨します。EEGLABの自動補間はチャネルラベルに基づきます。データセット間でチャネル位置が異なる場合(たとえばチャネル位置をスキャンして取得した場合)は、[eeg_interp.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_interp.m)を使って、各データセットの欠損チャネルをコマンドラインから補間する必要があります。このオプションを選択してください。

- *Subtracting artifactual ICA components.* アーティファクト成分の除去は、[アーティファクト除去のための独立成分分析](/tutorials/06_RejectArtifacts/RunICA.html)で説明しているように、除去対象としてタグ付けされた成分を差し引くことで行えます。このためには、各データセットで成分をタグ付けしておく必要があります。IClabelプラグインを使えば、[こちら](/tutorials/10_Group_analysis/multiple_subject_proccessing_overview.html#perform-batch-processing)で説明しているように、*STUDY*レベルで成分をタグ付けすることもできます。このオプションの選択を推奨します。

- *Subtracting ICA component clusters.* 上記の方法の代わりに、3番目のチェックボックスを使って、データから差し引くICA成分クラスターを選択できます。詳細は[クラスタリングチュートリアル](/tutorials/10_Group_analysis/component_clustering_tools.html)を参照してください。

下部パネルには、事前計算できる測定値のリストがあります。関心のある測定値にチェックを入れ、必要なパラメータを入力します。ここでは計算が速いので、まず*ERPs*を選択します。これにより、各条件および各電極の平均イベント関連電位が計算されます。使用するベースラインを指定できます(空欄のままで構いません)。最後に*Ok*を押します。

**EEGLAB 2019以降の変更点**: EEGLAB 2019以降では、EEGLABが単一試行を直接処理するため、以前のバージョンのようにデザインごとに測定値を再計算する必要はありません。新しい*design*方式は後方互換性があり、より柔軟で、試行ごとのデータ測定値を動的に抽出できます。

### 総平均ERPのプロット

チャネル測定値を事前計算したら、<span style="color: brown">Study → Plot channel measures</span>メニュー項目を使ってプロットできます。

![](/assets/images/studyplot5.png)

前のセクションで説明したすべての測定値は、計算済みであればチャネルデータの可視化に使えます。*Plot ERPs*ボタンを押します。

![](/assets/images/studyplot2.png)

次に、プロットパラメータを確認します。[pop_chanplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanplot.m) GUIの中央列では、プロットしたい測定値の横にある*Params*ボタンでプロットパラメータを変更できます。*Plot ERPs*ボタンの横にある*Params*ボタンを押すと、次のGUIが表示されます。

![](/assets/images/studyplot3.png)

このGUIには複数のセクションがあり、ERPをプロットする時間範囲や、マイクロボルト単位のプロット範囲を指定できます。上図のように、2つの条件を同じパネルに重ねて表示するチェックボックスを選択してください。

このGUIには他にもオプションがあります。内容はほぼ直感的です。

- *Time range to plot*入力欄では、エポック全体より短い時間範囲だけをプロットできます。
- *Plot limits*入力欄では、プロットする電位の下限と上限を固定できます。
- *Display filter*入力欄では、ERP表示に適用する周波数(例: 20 Hz)を入力できます。このフィルタはERPの表示だけに適用され、統計計算には影響しません。単一被験者のノイズが多いERPを表示するときに便利です。

下部の*Multiple channels selection*セクションでは、次の選択肢があります。

- 個別チャネルをプロットする。これがデフォルトです。
- 時間範囲(上部の入力欄で指定)にわたる平均トポグラフィをプロットする。このチュートリアルの後半で使います。
- 選択したチャネルの一部について平均したERP測定値をプロットする。
- 選択したチャネルの二乗平均平方根(RMS)を計算する。これはGlobal Field Power (GFP)の計算と等価です。

*Ok*を押し、もう一度*Plot ERPs*ボタンを押します。これで2条件のERPが同じ図に重ねて表示され、条件間の違いを見つけやすくなります。

![](/assets/images/studyplot4.png)

### 単一被験者ERPのプロット

右列の*Plot ERPs*ボタンを押すと、すべての被験者のERPをプロットでき、下図のような図が得られます。

![](/assets/images/studyplot6.png)

単一被験者のデータをプロットするには、被験者*gro*に対応する右列の*Plot ERPs*ボタンを押します。下図のようなプロットが表示されます。個々の被験者のERPを確認するのに便利です。

![](/assets/images/studyplot7.png)

### 全チャネルERPのプロット

すべての頭皮チャネルを同時にプロットすることもできます。これを行うには、*Sel. all*ボタンをクリックして、すべてのデータチャネルを選択します。

![](/assets/images/studyplot10.png)

続いて、左列の*Plot ERPs*ボタンをもう一度押します。

![](/assets/images/studyplot19.png)

個々のERPをクリックすると、選択したチャネルのERPをプロットするウィンドウが表示されます。たとえば、チャネル*FP1*をクリックします。

![](/assets/images/studyplot20.png)

### ERP頭皮トポグラフィのプロット

中央列で、もう一度*Params*ボタンを押します。*Time range*入力欄に「300 400」と入力します。下部セクションで*Plot average topography over time range*を選択し、*Ok*を押します。

![](/assets/images/studyplot11.png)

もう一度*Plot ERPs*ボタンを押すと、300から400 msの平均ERPに対する頭皮トポグラフィが表示されます。頭頂-中心部領域に2条件間の電位差が見えますが、この差が有意かどうかを判断するには統計解析が必要です。

![](/assets/images/studyplot12.png)

その他の測定値のプロット
-----------

### その他の測定値の事前計算

ERPに加えて、次の測定値を計算できます。

- *Power spectra*: 各条件および各電極についてスペクトル分解を行います。[spectopo.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m)関数に渡す固有のパラメータをここで入力できます。

- *ERP-image*: ERP-imageを事前計算します。

- *ERPs* / *ITCs*: 各条件について、イベント関連スペクトルパワー変化(ERSP)とイベント関連位相一貫性(ITC)を計算できます。ERSPやITCの計算には複数の時間/周波数パラメータが必要です。これらの値を選ぶには、[newtimef.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m)の関連するキーワードと引数をテキストボックスに入力します。

- [グループ解析スクリプトチュートリアル](/tutorials/11_Scripting/command_line_study_functions.html)で説明しているように、コマンドラインから[pop_precomp.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_precomp.m)関数を呼び出すことで、カスタム測定値を計算することもできます。

<span style="color: brown">Study → Precompute measures</span>メニュー項目を選択します。すべての測定値にチェックを入れ、パラメータを入力します。また、計算を高速化するため、下図のように*ERSP*パラメータの*nfreqs*を30に、*ntimesout*を60に変更します。*Ok*を押します。

![](/assets/images/studyprecomp3.png)

可能な場合は、一般にすべての測定値を選択することを推奨します。スペクトルとERP-imageの計算は高速で、数秒で終わるはずです。ERSPとITCの計算には2から5分程度かかります。続いて、再度<span style="color: brown">Study → Plot channel measures</span>メニュー項目を選択します。すべての測定値がプロット可能になっています。

![](/assets/images/studyplot1.png)

スペクトル、ERP-image、ERSP/ITCのプロットオプションは、前に見たERPのプロットオプションと似ています。スペクトルでは、メニューはERPのメニューと似ていますが、上部の入力欄でプロットする周波数範囲を指定できる点が異なります。ERSP/ITCでは、時間範囲と周波数範囲に加えて、パワーおよびITCの範囲も指定できます。

### スペクトルのプロット

スペクトルはERPと同じ方法でプロットします。まず、*Plot spectra*ボタンの横にある*Params*ボタンをクリックし、周波数範囲として「1 40」を入力します。*Ok*を押します。

![](/assets/images/studyplot30.png)

[pop_chanplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanplot.m) GUIの左列で最初のチャネル*FP1*を選択し、*Plot spectra*を押します。次のプロットが表示されます。

![](/assets/images/studyplot31.png)

### ERP画像のプロット

*Plot ERPimage*ボタンを押します。

![](/assets/images/studyplot32.png)

ERP画像は、測定値の事前計算時に設定したパラメータでプロットされます。ここでは特に10行を使用する設定にしました。行数を固定すると、すべての被験者と条件で同じサイズの行列を得られるため、[Delorme et al. (2014)](https://pubmed.ncbi.nlm.nih.gov/25447029/)で説明されているような標準的な統計解析を行えます。

### ERSPとITCのプロット

*Plot ITC*ボタンを押します。これにより、*animal*条件と*distractor*条件の試行間コヒーレンスが表示されます。*distractor*条件のITC値は低振幅に見えますが、この観察を確認するには統計解析が必要です。

![](/assets/images/studyplot34.png)

チャネル*Oz*を選択し、*Plot ERSPs*ボタンを押します。次のプロットが表示されます。7 Hz未満の低周波数でパワーが増加し、約10 Hzでパワーが減少していることがわかります。

![](/assets/images/studyplot33.png)

ERPやスペクトルと同様に、特定の時間範囲および周波数範囲で頭皮トポグラフィをプロットできます。*Plot ERSP*ボタンの横にある*Params*ボタンを選択し、時間範囲に「500 800」、周波数範囲に「4」を入力します。*Ok*を押します。

![](/assets/images/studyplot35.png)

次に*Plot ERSPs*ボタンを押します。次の頭皮トポグラフィが表示されます。*distractor*条件では、*animal*条件よりスペクトルパワーが低いように見えます。この観察を確認するにも、統計解析が必要です。

![](/assets/images/studyplot36.png)

異なる事前計算パラメータセットの比較
------

複数の*STUDY*を使うと、異なる信号処理オプションを試す場合にも便利です。たとえば、同一の*STUDY*を2つ作成し、一方ではFFTを使って時間/周波数測定値を計算し、もう一方ではウェーブレットを使って計算できます。ただし、被験者データに関連付けられる事前計算済みデータファイルのセットは1つだけです。異なる事前計算パラメータセットを横に並べて比較したい場合は、*STUDY*フォルダと関連するすべてのデータファイルを複製してください。別名で2つ目のSTUDYを保存するだけでは不十分です。
