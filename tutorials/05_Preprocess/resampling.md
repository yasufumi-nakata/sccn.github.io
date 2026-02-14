---
layout: default
title: c. Resampling
long_title: c. Resampling
categories: preproc
parent: 5. Preprocess data
grand_parent: Tutorials
---
データサンプリングレートの変更
======

サンプル EEGLAB データセットをロードする
---------------------------------

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>お問い合わせ 配布するチュートリアルファイル「eeglab_data.set」を選択します。
EEGLABの「sample_data」フォルダにあるツールボックスです。 それから *Open*を押して下さい。

![画像:Pop_loadset.png](/assets/images/Pop_loadset.png)

サンプリングレートを変更する
---------------------------------

最も一般的な用途 <span style="color: brown">ツール → サンプリングの変更
レート</span> メモリとディスクを保存するためのサンプリング速度を減らすことです
ストレージ。 ツイート [pop_resample.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_resample.m) ウィンドウがポップアップし、新しいことを尋ねます
サンプリングレート。 関数は MATLAB *resample.m* (信号の)を使用します
処理ツールボックス---このツールボックスを持っていない場合、それは使用します
遅いMATLAB機能*griddata*)。

![画像:pop_resample.png](/assets/images/pop_resample.png)

既に許容サンプリングレートであるため、チュートリアルデータを処理するためのサンプリングレートを変更する必要はありません。

再サンプリングする前に、リサンプリング頻度の半分にローパスフィルタ(128Hzで再サンプリングしても64Hz)がデータに適用され、エイリアシング効果を回避します。
