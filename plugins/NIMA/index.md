---
layout: default
title: NIMA
long_title: NIMA
parent: Plugins
render_with_liquid: false
nav_order: 16
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/NIMA).

![P159_separatealpha.png はコメントを受け付けていません。](images/P159_separatealpha.png)

NIMA EEGLABプラグイン
-------------------------------------------------------------

NIMAは、測定投影分析からニマの画像の略です。 測定値
投影ツールボックス(MPT)は公開方法(Bigdely-Shamlo et al.,
2013年) ウィキページで見る
リンクについてhttps://sccn.ucsd.edu/wiki/MPT)。 MPTの素晴らしい視覚化
関数は、スタンドアローンダイポールに除去され、再ラップされます
MPTに依存しない視覚化装置。 GUIとしてメニュー項目
STUDYタブの下に表示されます。 主な機能、nimasImagesfromMpA() は
スタンドアローンコマンドライン機能としても使用されます。

オプションの入力でできること (12/07/2018 更新)
-------------------------------------------------------------

-   それぞれに色とアルファ値の指定
    blob/voxel クラスター。
-   MRIイメージとblob/voxel-clusterの予測を指定する
    ショー。

GUI、Blobs、Voxels
----------------------
下記のスクリーンショットでGUIイメージを見ることができます。 この映像作品
に 3-D Gaussian-blurred ダイポールの場所, 呼ばれる (確率的) *dipole
空間を決定するために2つのパラメータを必要とする密度*、
スプレッド、すなわち全幅半径(FWHM)mmと数
sigma は Gaussian (任意入力として指定できます、
デフォルト 3 シグマ; シグマ == FWHM/2.355)。 また、ご利用者様へお申し出ください。
対称のvoxelのサイズを決定することによって空間の決断を、
2mmから8mmまで対応可能。 決勝
視覚化はblobかvoxelsを使用して作ることができます、そして
透明度はアルファ(見えない固体として0-1)として指定できます。 お問い合わせ
任意入力、色の割り当ての順序そしてRGBの小冊子
選択したクラスターは 'blobColor', \[1 0 0; 0 1
0; 0 0 1 \] 指定された3つのクラスターのR、G、Bを与える
この順序で。 下のスクリーンショットでは、スキャルプトポグラフィ、ブロブを比較します
クラスター 5, 6, 16 の画像、および voxel イメージ。 私の同僚は私に言った
voxel イメージは、Minecraft の彼を思い出させます。

![ニマフィグレ01.png](images/Nimafigure01.png)

std_dipoleDensity() との比較
-----------------------------------

std_dipoleDensity() は、現在最大 5 つのクラスターをプロットできます。
1つのヘッド スペース。 この機能と比較すると、NIMAの画像はエンボディできます
透明性とより微調整された空間解像度。

![Dipfitcomparison.png - 株式会社ドリテック](images/Dipfitcomparison.png)

ブロブ画像のVoxelサイズ比較
-------------------------------------

FWHM = 8 mm, ガウスをトランクするためにシグマの数 = 3. 左上から
右、Voxel サイズ = 2 mm、3 mm、4 mm。 左下から右下まで、5mm、6mm
mm、および7 mm。

![Blob_from2to7mm.pngの特長](images/Blob_from2to7mm.png)

Voxel画像のVoxelサイズ比較
--------------------------------------

FWHM = 8 mm, ガウスをトランクするためにシグマの数 = 3. 左上から
右、Voxel サイズ = 2 mm、3 mm、4 mm。 左下から右下まで、5mm、6mm
mm、および7 mm。

![Voxels_from2to7mmの.png](images/Voxels_from2to7mm.png)

フリガナ サイズ比較
--------------------

ガウシアンをトランクするためにシグマの数 = 3. 左上から右上まで、FWHM =
8 mm、12 mm、16 mm。 左下から右下まで、20mm、24mm、28mm。

![Voxels_fwhm8to28mm.pngの特長](images/Voxels_fwhm8to28mm.png)

アルファ比較
----------------

FWHM = 8 mm, ガウスをトランクするシグマの数 = 3. トップ行, voxel
プロット。 ボトムライン、ブロブプロット。 左から右へ、アルファ=0.1、0.3、0.5、
0.7, 0.9.

![アルファコンパリソン.png](images/Alphacomparison.png)
