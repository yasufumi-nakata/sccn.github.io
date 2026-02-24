---
layout: default
title: Hard/software requirements
nav_title: "堅い/ソフトウェア条件"
long_title: EEGLAB hardware and software recommendations
parent: Download EEGLAB
---
EEGLABハードウェアおよびソフトウェア要件
====

EEGLABで作業するための望ましいハードウェア構成
---------------------------------------------------------

EEGLABおよびEEGLABのハードウェアおよびソフトウェア要件の概要
関連するツール。 ハードウェア要件は、サイズによって異なります
処理したいデータセット。 ハードウェアの2つのレベルを概説しました
それぞれ基本的な、高度の処理のために必要とされて。 それはまたあります
強力なプラットフォーム(一部)でデータを処理できるが、試してみる
それらを使用するために、あなたは避けようとするあなたの時間の多くを費やす終わるかもしれません
「メモリのアウト」エラー。 EEGLABはWindows、Linux、またはMac OS Xで動作します。 いいえ
オペレーティング システムよりよいです。

**最小加工要件(および/または非常に望ましい機能)* * 必須
コア EEGLAB を使用して 1 件あたりの 32 EEG チャネルまでの処理
関数だけ:

-   8GbのRAM(ランダムアクセスメモリ)
-   利用可能なハードドライブスペースの少なくとも200 Gb(SSD可能であれば)
-   MATLABの最新バージョン - 追加のMATLABツールボックスはありません
    必須(ただし下記参照)

**正常な処理の条件(および/または非常に望ましい特徴)* * 必須
64 以上の EEG チャネルおよび/または最新の使用のために
EEGLABツールボックス:

-   クワッドプロセッサコア(4以上が望ましい) 
-   16 Gb以上のRAM(ランダムアクセスメモリ)
-   SSDの少なくとも1 Tb(SSDは、アップの要因によって読み取り/書き込みをスピードアップします
    5xに)または混合されたシステム(SSD 128Gbおよび大きいハードドライブ)
-   MATLABおよびMATLAB信号処理、統計、最適化の最新バージョン
    ツールボックス, いくつかの高度な EEGLAB プラグインで使用される関数.

インフォメーション
-----

-   EEGLABは無料ですが、MATLABソフトウェア環境はそのまま
    のは、The Mathworksの商用製品です。 多くの場合、あなたの学校は、アクセスを交渉している可能性があります()[詳しくはこちら](https://www.mathworks.com/academia/tah-support-program/eligibility.html))。 EEGLABは、無料のオクターブ環境(コマンドラインのみ)でも機能し、MATLABライセンスを必要としないEEGLABのコンパイル版をダウンロードすることもできます。 
    
-   Ubuntuのlinuxユーザーの場合: 多くの場合、グラフィックの問題がある場合
    MATLABは、UbuntuでOpenGLグラフィックを使用しています。 それらを避けるために、
    各MATLABセッションの開始

    ``` matlab
    >> set(0,'DefaultFigureRenderer','painters');
    ```

-   GPU ユーザーの場合: EEGLAB の機能は現在 GPU の機能 (グラフィック処理ユニット) を使用しません。
    最高の性能/費用の比率。 しかし、最初の試みをしました。
    GPUで動作する関数をポートする - クリック
    [詳しくはこちら](/others/EEGLAB_and_high_performance_computing.html#running-eeglab-on-gpus-graphic-processing-units) 詳細については、.
