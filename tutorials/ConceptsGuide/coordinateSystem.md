---
layout: default
title: Coordinate systems
nav_title: "座標系システム"
long_title: Coordinate systems
parent: Concepts guide
grand_parent: Tutorials
nav_order: 5
---
# EEGLAB電極系

EEGLABは、鼻が+X方向、頭頂部が+Z方向を向き、原点が左前耳点（LPA）と右前耳点（RPA）の間に位置する座標系を使用しています。BIDSとの互換性のため、EEGLABの座標系はCTF MEG座標系と同等であり、LPAとRPAの基準点を基準としています。

異なる座標系における原点と軸の定義方法の詳細については、この[FAQ](https://www.fieldtriptoolbox.org/faq/how_are_the_different_head_and_mri_coordinate_systems_defined/#details-of-the-mni-coordinate-system)を参照してください。

デフォルトでは、チャンネル位置ファイルをインポートする際、EEGLABはテンプレート位置とのマッチングを試みます。非標準の座標系からチャンネル位置をインポートした場合は、チャンネルエディタの *Rotate Axis* ボタン（<span style="color: brown">編集 → チャネルの場所</span>）を使用して調整してください。[get_chanlocs プラグイン](https://github.com/sccn/get_chanlocs/wiki)は電極のデジタル化に、[MRIの共登録](../09_source/Custom_head_model.html)にも使用できます。

## EEGLAB テンプレート

EEGLABは、2D表現にBESA電極モンタージュを使用し、ソースローカリゼーションにはMNI BEMモデルを使用します。いずれもヒトの頭部形状に適合した球体に基づいています。球は、鼻根点（nasion）、LPA、RPAの基準座標を用いて頭部の中心に配置されます。

![2022-12-13 に 12 44 11](https://user-images.githubusercontent.com/1872705/207268589-53f5e8f4-9138-4273-ade5-c8d8ee8729f9.png)

10-20 チャンネルモンタージュの球面と参考フレームです。 BEMからオンラインチャネルへ

### 2Dバイパス

2Dスカルプマップは、球面をCzが真上に来るように上方にシフトし前方に傾けた投影です（[Chatrian et al., 1988](https://pubmed.ncbi.nlm.nih.gov/3250964/)）。

![2022年12月6日午後5時](https://user-images.githubusercontent.com/1872705/207267890-43c43a92-53c8-483a-95f1-8c9483d57310.png)

### 2Dから3Dへの変換

ソースローカリゼーションのために、EEGLABの *Look up locs* 機能を使用してチャンネル位置を球面座標からBEM座標に変換できます。

関連するレイアウトにおいて、ヘッドの中心と半径はチャンネル編集ウィンドウの *Head Center* オプションで調整でき、球面座標からBEM座標への変換に使用されます。

![2022-12-13 に 2 00 53 PM](https://user-images.githubusercontent.com/1872705/207454927-54e15856-bead-4ff3-948d-639240449b15.png)

デフォルトでは、ヘッドの外側にある電極は2Dプロットに表示されません。EEGLAB 2023.0以降では、これらの電極も2Dプロットに表示されるようになりました。ヘッドの表示範囲は以下のように調整できます。

```matlab
EEG.saved = 'no';
EEG.chaninfo.topoplot = { 'headrad' 0.68 };
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG); % save data in ALLEEG
```

あなたは実際に何かを追加することができます [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m))オプション(例、'electrodes'、'on' は、すべてプロットで実行)。 デフォルト値は、0(左)、0(左)、0(右)のヘッド半径です。

![2022-12-13 に 3 09 37](https://user-images.githubusercontent.com/1872705/207464956-99339d9d-e163-443d-8720-5f3add67a6c1.png)

### EEGLABについて

EEGLABはさまざまな商用電極モンタージュをサポートしています。EGIは10-20システムのバリエーションを使用しています。FieldTripツールボックスの[電極ファイル](https://www.fieldtriptoolbox.org/template/electrode/)も参照してください。

![スクリーンショット 2022-12-13 に 12 07 31 午前](https://user-images.githubusercontent.com/1872705/207260856-073113fb-cf7f-488a-8a5c-d118fccec67b.png)

## 独自のモンタージュの作成と最適化

自分のモンタージュを作りたいと思うこともあります。 たとえば、特定の場所にいくつかの電極を追加したい場合があり、キャップメーカーはこれらの変化に対応します。 電極をできるだけ低く追加するなど、ヘッドカバレッジを最大限に活用したい(これを参照してください) [プロジェクト](https://github.com/arnodelorme/optimize_montage)例) 頭上領域の密なカバレッジの代わりに、最大ヘッドカバレッジをお勧めします。 ボリューム伝導のため、ボトム電極は多くの深さ情報をキャプチャし、ソースのローカリゼーションに役立ちます。

## その他の2次元レイアウト

EEGLABでは他の2D表現も使用できます。

EEGLABは、*eeglab_data.set* のモンタージュを *eeglab_montage11_layout.loc* に変換できます。メニューの<span style="color:brown">*編集 > チャンネルの場所*</span>から *Look up locs* ボタンを使用してください。EEGLABはFieldTripの[レイアウト](https://www.fieldtriptoolbox.org/template/layout/)ファイルもインポートでき、2D電極位置に対応しています。

![2022-12-13 に 3 16 02 PM](https://user-images.githubusercontent.com/1872705/207465671-1327aaf3-be3f-4185-81a2-6cbdef29bfe0.png)

## 基準点（Fiducials）

左前耳点（LPA）と右前耳点（RPA）は、耳の解剖学的ランドマーク（前耳介点）です。表面の解剖学的位置は個人間で異なる場合があります（[(参考)](https://doi.org/10.1109/NER.2019.8717065)）。

EEGLABでは、'LPA' と 'RPA' が標準の基準点ラベルとして使用されます。[詳しくはこちら](https://www.fieldtriptoolbox.org/faq/how_are_the_lpa_and_rpa_points_defined/)を参照してください。

耳の解剖学的ランドマーク、EEG、MEGデータ(AnatomicalLandmarkCoordinateSystemDescriptionfields) *_coordsystem.json にインストールします。 [BIDS仕様](https://bids-specification.readthedocs.io/en/stable/04-modality-specific-files/03-electroencephalography.html#coordinate-system-json-_coordsystemjson))。 それは同じです [CTF座標系](https://www.fieldtriptoolbox.org/faq/how_are_the_different_head_and_mri_coordinate_systems_defined/#details-of-the-ctf-coordinate-system) MEGデータセットについて
- 単位はミリメートルにあります
- 'LPA' と 'RPA' は左右の前耳介点を示します
- X軸のポイントは、ナシオン
- 直角は「LPA」 X軸へ向かう
- Z軸は、オルトゴナルから XYの制限点

以下の図は、頭部モデル上の基準点の位置を示しています。

![ライン 2022-12-13 12 29 36 AM](https://user-images.githubusercontent.com/1872705/207265225-94db3e70-3dab-48db-950d-230d9cc9b93b.png)

基準点（fiducials）は、EEG電極モンタージュをMRIの頭部モデルに共登録するために重要です。基準点の位置によって、電極モンタージュが頭部に正しく位置合わせされるかが決まります。前耳介点の具体的な定義は、結果に大きな影響を与えません。

## ヘリックス・トラガス・ジャンクションを使って

ヘリックス・トラガス・ジャンクション（耳珠と耳輪の交点）は、解剖学的に再現性の高いランドマークであり、MRIの解剖学的ヘッドモデルと3D EEG電極位置の共登録に使用されます。電極位置のデジタル化には、[<i>get_chanlocs プラグイン</i>](https://github.com/sccn/get_chanlocs/wiki)（ソースローカリゼーション用3Dヘッドモデル対応のEEGLABプラグイン）を使用できます。

![こちら](/assets/images/helixTragus.PNG)
