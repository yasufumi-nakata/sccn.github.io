---
layout: default
title: std_dipoleDensity
long_title: std_dipoleDensity
parent: Plugins
render_with_liquid: false
nav_order: 23
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/std_dipoleDensity).

![トップイメージ.png](images/topImage.png)

# STUDYダイポール密度EEGLABプラグイン

関数 std_dipplot によって呼び出される DipoleDensity withDensity または
研究の下のEEGLAB gui-\>「密度の小ロットのグループのダイポール」は、あります
研究セット内のダイポールクラスターの可視化ツール。 この機能
選択したクラスターの3つの異なる視覚化を提示します
脳全体の分布をよりよく理解する(クラスター)
すでに計算されている必要があります。 

EEGLABスタディプロットからダイポール密度を直接プロットすることも可能です。 しかし、このプラグインは追加の機能を提供します。 

インターフェイスはここに示されます:

![ディポレデンシティ_ui.png](images/Dipoledensity_ui.png)

"Cluster"/"Group"/"Color"の各行は別のクラスターをプロットできます
左空白は無視されます。 入力は次のように動作します。

|                   |                                                                                                                                                                                                                                                                                                                                                                                              |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| クラスター | クラスターを選択 |
| グループ | クラスターのサブグループを選択し、研究条件に基づいてプロットする |
| カラー | 3Dダイポールプロット(下表の立体画像)対応クラスターを表す色を選択 |
| スライスオリエンテーション | タイルドダイポール密度のプロットにMRIをスライスするオリエンテーションを選択 |
お問い合わせ スムース・カーナ | 各ダイポールをボラーにmmの幅を選択します。 デフォルトは20mmですが、かなり重いです。 10mm は決断およびクラスターの可視性間の素晴らしいトレードオフを提供します。 ここで複数の値を試してみると、非常にお勧めします。 これは、タイルとインタラクティブな画像(下表の最初の2番目の画像)の両方に影響を与えます。 お問い合わせ
| スライスオリエンテーション | タイルドダイポール密度のプロットにMRIをスライスするオリエンテーションを選択 |
お問い合わせ カラーレンジ | チルドダイポール密度プロットで表示する値の範囲を選択します。 値の有用な範囲を選択するには、最初に図を自動範囲でプロットし、カラーバーを見るのに役立ちます。 値がダイポール密度値が正常化されているため、脳の合計のボクセルは1. これは、後ほどのバージョンでもインタラクティブなプロットに影響を与えます。 お問い合わせ
| Plot 1 - Plot 2 | グループがドロップダウンメニューで選択されている場合は、グループ間のダイポール密度の違いを示すタイルの2番目のバージョンが作成されます。 差は、与えられたStresh値を使用して保持されます。 しきい値は未修正p-valuelで行われます。 お問い合わせ
お問い合わせ プロットを保存 | チェックした場合、対話型ダイポール密度の数値を除くすべてのプロットを保存します。 お問い合わせ

以下に示します。

<table>
<tbody>
<tr class="odd">
<td><p>タイルを張られたダイポール密度のプロット: 選択した各クラスターは、クラスター密度を示すMRIスライスのタイル画像を作成します。 オリジナルポップアップインターフェースの「スライスオリエンテーション」を使ってスライスのオリエンテーションを選択します。</p></td>
<td><p><img src="images/Dipoledensity_dipplottile.png"></p></td>
</tr>
<tr class="even">
<td><p>相互ダイポール密度のプロット: この図は、タイルドダイポール密度プロットと同じ情報が含まれています。 インターフェイスにより、スライスの位置をリアルタイムでシフトし、より直感的なダイポール密度位置のegometric理解を可能にします。</p></td>
<td><p><img src="images/Dipoledensity_dipplotinteractive.png" width="150px" height="300px"></p></td>
</tr>
<tr class="odd">
<td><p>3Dディップロット: 選択したクラスターとグループからのすべてのダイポールが3Dで表示されます。 各クラスター/グループは、ユーザーインターフェイスで選択した色によってマークされます。</p></td>
<td><p><img src="images/Dipoledensity_dipplot3d.png"></p></td>
</tr>
</tbody>
</table>

注意: この関数の別の使用は、数を推定することができます
ダイポールをグループ化するためのクラスター。ただし、最初に作成しなければならない
すべてのダイポールを含むクラスター。 最終的には、これは次のように統合されます
このために追加のクラスタリングステップは必要ありませんので、オプション
初期解析。

著者:ルカ・ピオン・トナチーニ、ミヤコシマコト。 SCCN、INC、UCSD。 チルド・ディポール・プロット(mir3dplot)を示す機能はArnaud Delormeによって書かれました。

# バージョン履歴

## バージョン 0.40 更新 (10/31/2018)

[Talairachデーモン](http://www.talairach.org/index.html) (ラncaster et)
al.、1997;Lancaster et al.、2000)は、クリスチャン・コテーズによるサポートされます。
機能、クラスターの遠心分離機の解剖学的な位置を得るために。
クラスターの遠心分離機の標準的な偏差(x、yおよびzを渡る平均)
値)は、融合球の直径を決定するために使用されます。 ふりがな
カーソルの初期位置は、voxel に設定され、最大ダイポール
密度。 確率的ダイポール密度が正しくスケールアップされ、その合計
すべての voxels == 1。

Talairachのデーモンを使用して、私は除外する除外基準を用意しました
デフォルトで含まれている非EEG遺伝子領域。 レベル3の場合
出力は、次のリストが適用されます。 Level5の出力は、
ブロドマンエリアが使われています。 これらの2つのレベルのみが使用されます。 完全なリスト
Talairachのデーモンの出力は見つけることができます
[詳しくはこちら](http://www.talairach.org/labels.html)お問い合わせ 能力について
Level3(名)とLevel5(Brodmann)は、
別に計算されるので、EACHの確率の合計は1です。 お問い合わせ
Level3 と Level5 を一緒に追加すると、それぞれが重なり、
要約は2になります。

```
`      % Exclusion list--'x' means to exclude.`
`        Angular Gyrus`
`        Anterior Cingulate`
`      x Caudate`
`      x Cerebellar Lingual`
`      x Cerebellar Tonsil`
`        Cingulate Gyrus`
`      x Claustrum`
`      x Culmen`
`      x Culmen of Vermis`
`        Cuneus`
`      x Declive`
`      x Declive of Vermis`
`      x Extra-Nuclear`
`      x Fastigium`
`      x Fourth Ventricle`
`        Fusiform Gyrus`
`        Inferior Frontal Gyrus`
`        Inferior Occipital Gyrus`
`        Inferior Parietal Lobule`
`      x Inferior Semi-Lunar Lobule`
`        Inferior Temporal Gyrus`
`        Insula`
`      x Lateral Ventricle`
`      x Lentiform Nucleus`
`        Lingual Gyrus`
`        Medial Frontal Gyrus`
`        Middle Frontal Gyrus`
`        Middle Occipital Gyrus`
`        Middle Temporal Gyrus`
`      x Nodule`
`        Orbital Gyrus`
`        Paracentral Lobule`
`      x Parahippocampal Gyrus`
`        Postcentral Gyrus`
`        Posterior Cingulate`
`        Precentral Gyrus`
`        Precuneus`
`      x Pyramis`
`      x Pyramis of Vermis`
`        Rectal Gyrus`
`      x Subcallosal Gyrus`
`      x Sub-Gyral`
`        Superior Frontal Gyrus`
`        Superior Occipital Gyrus`
`        Superior Parietal Lobule`
`        Superior Temporal Gyrus`
`        Supramarginal Gyrus`
`      x Thalamus`
`      x Third Ventricle`
`        Transverse Temporal Gyrus`
`      x Tuber`
`      x Tuber of Vermis`
`      x Uncus`
`      x Uvula`
`      x Uvula of Vermis`
```

![バージョン0_40.png](images/Version0_40.png)

これは、確率的ラベルが生成される方法です。

1.  IC クラスターごとの1ポイント(ピークダイポールのポイント)
    MNI座標の内側の領域で確率が示されます。
2.  あなたは長さを持っている半径で球にポイントを拡大します
    ダイポールの位置の標準的な偏差(x、y、z-then)
    3つのSD値の平均値
3.  拡張された 'sphere' には、複数の空間グリッドポイントが含まれています。
    それぞれに解剖ラベルがあります。 今、現在のことを言う
    球は30の空間の格子ポイントを含んでいます。 10/30ポイントが付与される場合
    'medial PFC' で、10/30 = 33% の解剖ラベルは
    'medial PFC' に関連付けられている。 7/30 ポイントが付与される場合
    'medial OFC', その後 7/30 = 23.3% 解剖ラベルは
    "medial OFC' に関連付けられている。 このようにして、すべてのものをリストアップします
    独自の解剖ラベルは、いくつのポイントが関連付けられているかをカウントします
    と、最後に比率を総数に対して計算します。
    ポイントが含まれています。

## 更新(2017年05月26日)

デュアルダイポールを計算する使用とバグ(現在、サイドを選択)
実際のx座標値を取得する)固定します。

## 更新(2017年05月22日)

クラスターの遠心分離機は両側のダイポールの1つだけを使用して計算されます
一方のダイポールのセントイドが存在する。

## 更新(2017年3月16日)

(対称)2つのダイポールが両側に収まるとき(Cataerina'sを使用して)
FitTwoDipoles プラグイン、例えば)、平均、標準偏差、および
ダイポールクラスターの標準的なエラーは、上のものだけを使用して計算されます
クラスターの遠心分離機の同じ側面。 視覚化は2つの棒を使用します。

## 更新(2017年03月06日)

対話型ブラウザでクロスヘアがサポートされています。 また、入力用
Gaussian カーネルのサイズは Gaussian の sigma から変更されました。
完全な幅の半分maximum (FWHM)へのより標準的なです
神経刺激。 FWHM = シグマ\*2.355.

![クロスヘア2.png](images/Crosshair2.png)

## 更新(2016年09月13日)

今、それはクラスターの遠心分離機の標準の偏差および間違いをとして戻します
以下。
*Cluster: 3*
*MNIのCentroid:\[-29-69 8\]*
*標準偏差:\[ 8 15 16 \] * 必須
*標準誤差 : \[ 2 4 5 \] * 必須


