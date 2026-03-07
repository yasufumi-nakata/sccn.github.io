---
layout: default
title: a. Filtering
nav_title: "a. フィルタリング"
long_title: a. Filtering
categories: preproc
parent: 5. Preprocess data
grand_parent: Tutorials
---
# はじめに
カットオフ周波数、パスバンド、ストップバンド、トランジションバンドの意味のグラフィカルな説明の下。
![こちら](https://user-images.githubusercontent.com/10362238/118734865-23797e00-b7f4-11eb-9eec-f52ffcba0585.png)

デフォルトでは、ウィンドウ同期、フィルタのカットオフ周波数はローパスとハイパスで20〜40%のトランジションバンドを使用します（カットオフ<2Hzのローパス、1〜5Hzのハイパス）。

データのフィルタリング
=======
線形傾向を取除くために、それは頻繁に高パス フィルターに望ましいです
1Hz では、複数の言語の言語を学習できます。
2020](https://onlinelibrary.wiley.com/doi/full/10.1111/ejn.14992)。 高周波数ノイズをフィルタリングするローパスも時々必要です。

EEGLAB をロードする
-------------------

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>eeglab_data.set の使い方
EEGLABの「sample_data」のフォルダにあるツールボックス。 *Open*ファイルの開き。

![こちら](/assets/images/Pop_loadset.png)

リニアトレンドの除去
-------------------

エポック化は推奨されます。エポック化されたデータでは、フィルタリングを連続データに適用することで、エポック境界でのアーティファクト導入を最小限に抑えられます。

選択する <span style="color: brown">ツール → フィルタデータ → 基本FIRフィルタ（レガシー）</span>、*Lower edge*の周波数に**1** (Hz)を入力します。

EEGLABのレガシーは、EEGLABのレガシーのおすすめです。[Widmann & Schröger(ウィドマン&シュロガー)](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3391960/)).

![](/assets/images/Pop_eegfiltnew_1hz.jpg)

ウィンドウがポップアップして、名前を尋ねます
新しいデータセット。 データセット名を変更し、上書きする
*Overwriteparent*チェックボックスに、
*Ok*ボタン

ハイ・アンド・ローパスのショートカット
選択されたローパスとハイパスのパーツは、同じスロープを持っています。 頻繁に、ローパスの斜面はそれ故に必要以上に切ります。 この問題を避けるため、
最初にローパスフィルタを適用し、その後、第二にお勧めします
コール、ハイパスフィルタ(またはその逆)。
 
データをフィルタリングした後、
フィルターが選択によって加えられたことを点検して下さい 
<span style="color: brown">こちら</span> メニュー項目をプロットする
データスペクトル。 フィルタアウト周波数領域に気づくかもしれません
'ripples'（リップル）がアーティファクトとして現れることがあります。 

主要なアーティファクト(視覚的な検査による)を含むデータ部分を除去することに注意してください。データの大きなスパイクなど、フィルタリングが「スプレッド」できるので、フィルタリングが好ましいことができます。 メジャーなアーティファクトを削除すると、「境界」イベントが削除されたデータを置き換えます。 フィルタリングは、境界を越えてではなく、連続したデータセグメントにのみ適用されます。

# 接続解析のためのフィルタリング

時系列解析、接続解析（例：SIFT EEGLAB）などでは、Piecewise detrendingが推奨されます。

因果分析（1つのプロセスが別のプロセスを引き起こす場合の評価）には、メニュー項目 <span style="color: brown">基本FIR(レガシー)</span> で*causal filter*オプションを有効にしてください。デフォルトではEEGLABのフィルタは非因果的（双方向）ですが、因果性が重要な場合はこの設定が必要です。 

# 信号処理ツールボックスなしでフィルタリング

MATLABの場合
EEGLAB のレガシーは、MATLABルーチンで動作します。
*filtfilt.m*。 先着順に進んでいる。
導入事例 

マトラボ シグナル処理ツール、EEGLAB レガシーは、
逆のFourierの変換方法。 <span style="color: brown">基本FIR(レガシー)</span> メニュー項目は FIR の filtering* の代りにチェック ボックスです。 *FFT の線形を点検する。

# 非線形無限衝動の応答フィルターおよび他のフィルター

無限のアクション(IIR)
EEGLABは、 [エントリー](https://github.com/sccn/iirfilt) プラグインをインストールします。
メニュー項目からアクセス <span style="color: brown">ツール → フィルタデータ → 基本FIRフィルタ（レガシー）</span>。この機能は同じを使用します
上記のFIRフィルタオプションと同様に使用できます。IIRフィルタは周波数によって位相が異なりますが、MATLABの*filtfilt.m*機能により補償されます。無限インパルス応答(IIR)フィルタは再帰的な動作をします。

MATLABでのEEGデータのフィルタリングについての詳細は、[Q/Aフィルタリングページ](/others/Firfilt_FAQ.html)を参照してください。定義やコンセプトの紹介については [Widmann ら., 2015](https://home.uni-leipzig.de/biocog/eprints/widmann_a2015jneuroscimeth250_34.pdf) を確認してください。

# ラインノイズ除去のためのフィルタリングの代替

バンドストップフィルタでラインノイズを除去することもできますが、[クリーンライン](https://github.com/sccn/cleanline) EEGLABプラグインは、様々なテーパリングとトンプソンF統計を組み合わせたより効率的なソリューションを提供します。CleanLineは [EEG-Clean-Tools](https://github.com/VisLab/EEG-Clean-Tools) にも含まれています。以下の比較図に示すように、このメソッドが適切に動作する場合、結果は顕著です。

![こちら](/assets/images/cleanline.png)
