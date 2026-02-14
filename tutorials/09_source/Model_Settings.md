---
layout: default
title: a. Head model
nav_title: "a. ヘッドモデル"
long_title: a. Head model settings
parent: 9. Source analysis
grand_parent: Tutorials
---


<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

# 基本に戻る

ソースのローカリゼーションを実行するには、1つのニーズ

1. A ** ヘッド を通る電気か磁場の伝搬方法
     * 異なる導電率を持つ球で作られたシンプルなモデルかもしれません
     * 皮質の表面、頭皮、皮を記述する幾何学的3次元の網から成っているより複雑なモデル、またこれらの表面のインターフェイスの伝導の変化であるかもしれません。
     * Finite Element Model、FEM は、各バクセルの電圧転送を標準装備しています。 より より より より
2. A ** モデル** フィールド ソース ソース ソース ソース ソース
     * シングルダイポールになる場合があります。 
     * 3Dグリッド(例えば、分散のローカリゼーションの文字列カルナモデルなど) [エロレタ](https://doi.org/10.1098/rsta.2011.0081)).
     * 表面に分散するダイポールがあるかもしれません。 例えば、異方性面にあるダイポールを強制する場合があります。
3. EEGまたはMEG ** センサー**とヘッドとソースのモデル

3つすべてを持っていると、ソースのアクティビティを見つけるためのアルゴリズムが必要です。 残念ながら、スキャルプの表面で観察されたアクティビティを生成できる無限のソリューションがありますので、ソースの制約を課す必要があります。 制約は次のようになります。

* 単一のダイポールでスカルプ活動をモデル化させる力。 この方法では、通常、ユニークな最適なソリューションがあります。
* 電源を円滑に、隣接するソースは相関です。
* 最近の投稿 [ビームフォーミング](https://doi.org/10.1109/10.623056).
* 私たちのソースの活動に対する他の制約...

お問い合わせ EE EE EE EE EE EE EE EE EE に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に  この  この  この  この  この  この  この  この  この  この  この  この  この の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の *source x EEGチャンネル*で、** Leadfield行列** このモデルでは、このモデルをモデル化し、 同じ フォー フォー フォー フォー に フォー フォー フォー フォー に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に に

![](https://user-images.githubusercontent.com/1872705/206873268-edbf713f-962d-4e74-a608-e915b3441b84.png)

# ヘッドモデルの選択

ソースローカリゼーション は、 この例では、EEGLABのヘッドモデルを実装しています。 次の記事を読んでください。
<!-- Second, choosing a source model: The source model is the type of source you will use. This may be a single dipole, which position you optimize. This could also be  -->
<!-- a distributed model, with one dipole per brain voxel, such as when using Loreta. The source model is independent of the head model. Third, you will perform inverse source localization and plot the source results. -->

## DIPFITヘッドモデルの設定

このセクションでは、後にチュートリアルデータセットを使用します。 [データエポック抽出](/tutorials/07_Extract_epochs/Extracting_Data_Epochs.html)お問い合わせ メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>EEGLABの「sample_data」フォルダにある「eeglab_data_epochs_ica.set」のチュートリアルファイルです。

DIPFIT は、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT を、DAI が、DAI が、DAI が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT が、DIPFIT を、DIPFIT を、DIPFIT で、DIPFIT で、DIPFIT が、DIPFIT で、DIPFIT を、DIPFIT で、DIPFIT で、DIPF EEGLABでは、DIPFITを主流のローカリゼーションへ導入しました。 合わせ 合わせ 合わせ 合わせ 合わせ

DIPFITのヘッドモデルのシーリングを、EEGLABのメニュー項目とします。 <span style="color: brown"> DIPFIT → ヘッドモデルと設定</span>お問い合わせ 以下のウィンドウが表示されます。

![](../../assets/images/dipfit_settings_besa.png)

上部の編集箱、*モデル(選択するためにかちりと言う音)*は、頭部のタイプを指定します
球面モデル、またはカスタムモデル。 

※4面(皮、頭皮、CSF、皮質)を4面に使用
モデル化 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 詳細 [詳しくはこちら](https://github.com/sccn/sccn.github.io/files/10201215/DIPFIT.vs.BESA.study.using.the.spherical.head.model.pdf).

'template's は、MNI (Montreal Neurological Institute) の正式な脳から抽出されたモデルです。 3 D から (皮、頭皮、皮質) まで構成します。 同心球モデルより現実的、より速い結果を得る。 BEMモデルの認証方法 [詳しくはこちら](https://pubmed.ncbi.nlm.nih.gov/11222970/)お問い合わせ DIPFITでは、このBEM、*ft_read_headmodel('Standard_bem.mat');* と、FieldTripのモデルがあります。 BEMのモデルの作者 [ペーパー](https://pubmed.ncbi.nlm.nih.gov/11222970/) T1級から上級者まで幅広く対応しています。 この度、PerplesMRIの組織の組織の組織の組織の組織の組織の組織の組織の組織の組織の組織の組織の組織の組織の組織の組織の組織化が進んでいます。 このサイトは、SPM, 1999 のクラウドファンディングプラットフォームです。

FieldTrip**のカスタムモデルとMRIファイルにより、FieldTripは、 被写体 MRI から BEM までのモデルを実装しています。 [詳しくはこちら](https://www.fieldtriptoolbox.org/tutorial/headmodel_eeg_bem/)このサイトでは、JavaScriptを有効にしてご覧ください。

この例は、*Boundary 要素モデル*です。 ラジオメニューの最新情報

* お問い合わせ * ヘッドモデル*は、ヘッドモデルのファイル、FieldTrip のドキュメントです。 
* 編集ボックス *Matrix は、モデルでチャンネルを占有する* 現在、ヘッドモデルと並列が更新されます。 ランドマークのマークは、MNI Purple RadioMRIを共同で登録しました。 MNIのデータベース(MNI)、MNIのデータベース(Montreal Neurological Institute(MNI)、MNIのサイトマップ(Montreal Neurological Institute(MNI))、MNIのデータベース(MNI)、MNIのデータベース(MNI)、MNIのデータベース(MNI)、MNIのデータベース(MNI)、MNIのデータベース(MNI)、MNI(MNI)、MNI(MNI)、MNI)、MNI(MNI)、MNI)、MNI(MNI)、MNI)、MNI(MNI)、MNI)、MNI(MNI)、MNI(MNI)、MNI(MNI)、MNI)、MNI(MNI)、MNI(MNI)、MNI(MNI)、MNI(MNI)、MNI)、MNI(MNI)、MNI(MNI)、MNI)、MNI(MNI(MNI)、MNI)、MNI)、MNI(MNI(MNI(MNI)、MNI)、MNI(MNI) Cz (vertex) 電極 自動的に されます されます されます されます の 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が 方が トランス 更新 更新 更新 を を を を を を を を を を を を を を を を を を を を があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります
* 関連する の * * * * * * * * * * * の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の ふりがな [SPMソフト](https://www.fil.ion.ucl.ac.uk/spm/) MNI は、MRI の略で、MRI の正式化を繰り返します。
* エントリ * 関連するチャンネルの場所 * 任意の * は、ヘッドモデルに関連付けられているテンプレートチャンネル位置ファイルの名前が含まれています。 この情報は、データセットのチャンネルの場所ファイルがテンプレートとは異なる可能性があるため、重要です。 もしそうなら、モデルに関連付けられているテンプレートの場所を使用してチャンネルの位置を合わせるには、共同登録変換が必要です。
* ダイジェストは、 ダイジェストが、 ダイジェストの「*...*」 を 編集する を押す から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から 例えば、ダイキャストフィック、ノンスカルプ など。 逆のモデルからPeri-ocular の関数の値を取得するには

## ヘッドモデルと電極の位置の調整

とりあえずは、 従来の 従来の 従来の 従来の 従来の 従来の の の の の の の の の の の の の の の 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 ** ** ** 「 「

<!-- ### The default headmodels

The first default head model for FieldTrip is a spherical head model. This is the  -->

### 適切な * * *

の場所 の場所  モデル に です です です です です です です 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 国際 があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります があります 現在のヘッドモデル設定ウィンドウが開きます。
(メニュー項目を選択) <span style="color: brown">編集 → チャンネルの場所</span>)。 結果のチャンネルエディタウィンドウは以下のとおりです。

![600px\|ボーダー](../../assets/images/Dipfit_pop_chanedit2.png)

BEM DIPFITモデルのMNI座標系ファイル

![](../../assets/images/chanlocs_bem.png)

ウィンドウとチャンネル *Ok* は、モデルを構成します。 <span style="color: brown"> DIPFIT → ヘッドモデルと設定</span> ウィンドウ の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の EEGLAB は、頭のモデルが慣用している間、鼻の方向は現実の軸線と反対側のモデルです。 Talairachの変換行列、9つのフィールド*\[shiftxshiftyshiftz]のスクロールxのスケーリングxのスケーリングxのスケールz\]*の文字列は、

* 連載中の数字*\[shiftxshiftyshiftz\]*は、x、y、z軸方向変換()です。 お問い合わせ
* 次の3つの数字 *\[pitch Roll yaw\]* は、ラジアンの別の文字列を移動します。 *Yaw* は、Z軸方向の方向の方向の方向の方向の方向を表しています。 *Pitch* および *Roll* は、X および y の軸の回転です。 0 に等しい場合、回転は制御されます。
* 最後の 3 文字 *\[scalex scaley scalez\]* x, y, z 軸線のスリングは、 お問い合わせ

この場合は、電極座標とヘッドモデルの座標系の間の90度回転のみのアライメントが必要です。 共同登録・整列が不要の場合、*コアグなし*チェックボックスを選択することもできます。

![](../../assets/images/dipfit_settings_bem.png)

*詳細は、こちらをご確認ください。

### *template* は、

国際10-20システム*not* - 特許出願中 ヘッド を に に に に に に に に に に に に に に する に に に する に に する する に する する する する に に に する に に する する する に に に に に に に に に に に に に に に に に に 代わりに して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して して

繰り返します。 <span style="color: brown"> DIPFIT → ヘッドモデルと設定</span> メニュー DIPFIT画面設定の*Co-register* ウィンドウが開きます。 *resize* 値が 1.5 に値するので、すべての軸が並んでいるように見えます。

![](../../assets/images/coregister_new1.png)

ヘッド に に 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 表面 として として として として として として として として として として として として として として として

*Warp*ボタン、照明器具、照明器具、照明器具等

チャンネル対応ウィンドウがポップアップ表示されます。

![Pop_chancoresp.gif はコメントを受け付けていません。](../../assets/images/Pop_chancoresp.gif)

http://www.halleline.com/ 他の 他の 他の © 2019 www.securehotelsreservations.com 著作権所有

*Ok*と、ヘッドモデルの現在のところ、CentreMonsterのMonasterは、CentreMonsterのWindows(以下、参照)、Centre of the One、Centre of the One、Centre of the One、Centre of the One、Centre of the One、Centre of the One、Centre of One、Centre of the One、Centre of the One、Centre of the One、Centre of the One、Centre of the One、Centre of the One、Centre of One、Centre of One、Centre、Centre of One、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、Centre、C

<u>手動微調整:</u> 手動で * * ピッチ ya ya ] 結果 結果 結果 結果 の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の

![サイトマップ](../../assets/images/coregister_new2.png)

このページではjavascriptを使用しています。 このコンテンツには、Adobe Flash Player およびAdobe Flash Player の最新バージョンが必要です。 DPFIT設定ウィンドウで*Ok*、チュートリアルでは次の記事を読んでください。

<u>財務情報:</u> 正規品は、正規品の正規品と正規品の通販サイトです。 正規品は、正規品の通販サイトです。 ファイアーズルズールラベル
密接な正確な場所(これを参照してください) [スライド](https://sccn.ucsd.edu/eeglab/download/Fiducials.pdf). *EEG.chanlocs* は、通常のチャンネル構造の外部リンクです。

な な な な な な な な な な の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の *Align fiducials*のボタンをこの専門家。

### *digitized*の調整

個別化された電極の位置は、ソースのローカリゼーション精度を大幅に向上させます [40%以上](https://doi.org/10.3389/fnins.2019.01159)とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき とき 3Dデジタル化方法 [ポリヘムス](https://polhemus.com/scanning-digitizing/digitizing-products/) そして、 [ゼブリス](https://www.zebris.de/en/) 電極の3Dを表図に示します。 スマートフォンの顔のロックカメラ3Dスキャナは、Dssキャナの顔を、Dsキャナの顔に、Dsキャナの顔を、Dsキャナの顔を、Dsキャナの顔を、Dsキャナの顔に、Dsキャナの顔を、Dsキャナの顔に、Dsキャナの顔を合わせます。 対象は5分から5分程度です。EEGLABのルールは、 [get_chanlocs ディレクティブ](https://github.com/sccn/get_chanlocs/wiki)お問い合わせ スキャン のための の の の の の の の の の の の の の の の の の の を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を スマートフォン3Dssキャナ [get_chanlocs ディレクティブ](https://github.com/sccn/get_chanlocs/wiki) ツイート

各個々の電極の場所は、多くの場合、保存されます `.sfp` EEGLAB をもっと読む `pop_chanedit` 機能、選択 によって GUI から <span style="color: brown">編集 → チャンネルの場所</span> *Read Location*ボタンを押します。 [手動調整プロセス](#manual-co-registration-of-the-template-channel-locations) は、**Align fiducials**オプションのみ**で実行します。 主 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の場所 の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の

## ヘッドモデルとカスタムMRI

次にダイポールソースをプロットするとき [チュートリアルのセクション](/tutorials/09_source/DIPFIT.html)ヘッドモデルヘッド面とMRIは、 

![サイトマップ](../../assets/images/head_mesh.png)

チュートリアルデータとBEMモデル MRIの参加者は、MRIとMRIを組み合わせて、MRIとMRIを組み合わせて、MRIとMRIを組み合わせて、MRIとMRIを融合しました。 

参加者のMRIから抽出物3次元メッシュを計算し、詳細を説明します。 [FieldTripチュートリアル](http://www.fieldtriptoolbox.org/workshop/baci2017/forwardproblem/)お問い合わせ デスクトップモデルのカスタムモデルを実装する MeGカスタムヘッドモデルも、チュートリアルの次のコメントを受け付けています。
