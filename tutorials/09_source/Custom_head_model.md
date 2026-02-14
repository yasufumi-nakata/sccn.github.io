---
layout: default
title: d. Custom head model
long_title: d. Using a custom head model
parent: 9. Source analysis
grand_parent: Tutorials
---
スキャンされた電極の位置の使用
===========================
カスタムヘッドモデルの使用は、ソースのローカリゼーションを向上させることができます。 お問い合わせ
EEG, 被写体ヘッドジオメトリ
テンプレートヘッドモデルを変形/アダプトするために使われます。 これは、共同登録として正確ではありません
を を MR は、
テンプレートヘッドモデルにテンプレートの電極位置を合わせるよりも正確です [アカリン・アカー&マディグ2013](https://pubmed.ncbi.nlm.nih.gov/23355112/).
個々の への より より より より より より より より より より より より より より より より より より  各  各  各  各  各  各 の の を知る を知る を知る を知る を知る を知る を知る を知る を知る 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。

参加者の MR の頭文字は、Scal の 3 です。 プロフィール
テンプレートヘッドモデルを変形させ、対象ヘッドジオメトリに適応させるため、ソースローカリゼーションの精度が大幅に向上します。
テンプレートの電極の位置(国際10-20システムに基づいても)はメーカー間で大きく異なる場合があります。 
しかしながら、中世のランドマークともう1つの関連性は、現在ある。 
3Dssキャナ
(iPhone 13 Pro、Samsung Galaxy S20 Ultraetc)、 または デスクトップ3Dカメラ(Structure.io)。  

3Dカメラでは、Droy のDroy の機能を実装しています。 
ふりがな [get_chanlocs プラグイン](https://github.com/sccn/get_chanlocs/wiki)、機能に基づいて
導入事例 [フィールドトリップ](https://www.fieldtriptoolbox.org/tutorial/electrode/)3Dは、この3Dは、3Dは、より一層のパフォーマンスを発揮します。 

3Dプリント [get_chanlocs ディレクティブ](https://github.com/sccn/get_chanlocs/wiki) EEGLABは、EEGLABのWebサイトをリニューアルしました。

![2018年12月12日](https://user-images.githubusercontent.com/1872705/206874056-8a2e646e-aff5-4a8b-b342-292725f6ae88.png)

電極の位置をスキャンし、ソースのローカリゼーションのためにそれらを使用したい場合は、次のことができます [DIPFITの設定](Model_Settings.md) 参加者全員がMRヘッドの使い方を教えて下さい。 [神経電磁気フォワードヘッドフォーツールボックス(NFT)](https://github.com/sccn/NFT) DIPFITは、DIPFITから、DIPFITへ、DIPFITから、DIPFITへ、DIPFITから、DIPFITへ、DIPFITへ、DIPFITから、DIPFITへ、DIPFITへ、DIPFITから、DIPFITへ、DIPFITへ、DIPFITへ、DIPFITへ移行しました。 このチュートリアルでは、このチュートリアルでは、Mr head のヘッド イメージを実装しています。

カスタムヘッドモデル
=================
 この 各 各 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の への の の への の の の への の の の の の の の の の への の の の の の の への 投稿ナビゲーション 非 非 です  まず の の の の 吐 吐 吐 吐 への への への への への は は は は は は は は は するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき するとき このチュートリアルでは、このチュートリアルでは、このチュートリアルでは、

このチュートリアルでは、我々は人気を使用することができます [Henson-Wakeman データセット](https://nemar.org/dataexplorer/detail?dataset_id=ds000117)お問い合わせ 最初の被写体から一部のファイルのみが使用可能です。 [詳しくはこちら](https://sccn.ucsd.edu/eeglab/download/ds000117_sub-01.zip)DIPFIT は、EeGLAB の拡張機能で、FieldT の機能が搭載されています。

## MRI は、MRI と シリアス

メニュー項目を使用してデータをインポートする <span style="color:brown">* ファイルの読み込み ファイルIO インターフェイス * 必須</span>*sub-01_ses-meg_task-facerecognition_run-01_meg.fif* は必須項目です。 は は ます ます ます 通常の は、 メニュー <span style="color:brown">*編集 > チャンネルの場所*</span>.

 メニュー EE EE EE EE EE EE  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー  メニュー を選択します を選択します を選択します を選択します を選択します  メニュー を選択します を選択します  メニュー  メニュー を選択します 。 を選択します を選択します  メニュー を選択します を選択します 。 。 。 。 。 。 を選択します 。 。 を選択します を選択します を選択します を選択します  メニュー を選択します <span style="color:brown">編集 > データの選択</span> EEG061 に 367 から 370 ( ラベル EEG061 から EEG064) への を を 特許取得

![スクリーンショット 2022-12-12 に 9 50 23](https://user-images.githubusercontent.com/1872705/207117594-941ad9e9-5599-4208-89a7-48a93e41bcdc.png)

メニュー項目の呼び出し <span style="color:brown">DIPFIT ソースローカリゼーション > MRIモデル</span>このページではjavascriptを使用しています。

![2022-12-11 に 3 35 19 PM](https://user-images.githubusercontent.com/1872705/206955411-513057c1-46e4-4f7c-ab77-c11493feedb0.png)

この例では、MR の頭のイメージと自動整列が挙げられます。しかしながら、アパルタライの他の部分についても詳しく説明します。

![スクリーンショット 2022-12-11 に 3 37 03](https://user-images.githubusercontent.com/1872705/206935920-b0f5e662-8571-40af-bba3-709eed80e306.png)

MRIは、脳、脳頭脳、脳幹細胞、脳神経細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳細胞、脳 EEGLAB では、MRI は、より迅速な対応をしております。 [ROIconnectについて](https://github.com/arnodelorme/roiconnect) プラグイン。 ふりがな [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) "bemcp" メソッド、 FieldTrip のモジュールをエクスポートします。 .FieldTrip のデフォルトは "dipoli" メソッドです。 Linux と Windows は、Windows で動作します。 [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) コマンドラインから呼び出すときの関数。

![2022年12月11日 7時39分](https://user-images.githubusercontent.com/1872705/206955695-e1522efe-793e-4fcc-a3ed-4b8573db67cf.png)

これが完了したら、メニュー項目を呼び出します <span style="color:brown">DIPFIT ソースローカリゼーション > ヘッドモデルと設定</span>このページではjavascriptを使用しています。

![2022年12月11日 7 43 48](https://user-images.githubusercontent.com/1872705/206956553-435a3f9f-48db-4bff-b714-4fddc37aa3f6.png)

*Co-register*ボタン、コリベーションウィンドウで、*Align fiducials*、WindowsでOKを押して、チャンネルの音声を再生します。 ます ます ます ます の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の ウィンドウ の の の の の の の の の の の の の の の の の の の の 左 左 は は は は は は は は は は は は は は は は は は は は 差 差 差 は は は は 差 差 差 差 [フィデューシャルの選択](https://eeglab.org/tutorials/ConceptsGuide/coordinateSystem.html#eeglab-electrode-coordinate-systems). 

![2022-12-11 に 11 06 22 PM](https://user-images.githubusercontent.com/1872705/206982193-92e59b82-90b9-43c5-8e7a-d551a90d66d1.png)

現地化準備が進んでいます。 [ICAコンポーネントスカルプジェクションマップ](DIPFIT.md) ・その他 [ソース](EEG_sources.md).

## スクリプト

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'source_reconstruction_custom_mri.m'));">MATLABコマンド</button>

この投稿は、EeGLAB が作成する際のコメントです。 *File-IO*、*FieldTrip*、*Picard*、*bids-matlab-tools*。、生データおよび分析MRIの次の利益のために。

```matlab
dataPath = 'xxx/sub-01';
filenameEEG = fullfile( dataPath, 'ses-meg','meg','sub-01_ses-meg_task-facerecognition_run-01_meg.fif');
filenameMRI = fullfile( dataPath, 'ses-mri','anat','sub-01_ses-mri_acq-mprage_T1w.nii.gz');
```

は、 お問い合わせ お問い合わせ しかしながら、チュートリアルでは、MEGのチャンネルを視聴しています。 Coordsystem* JSON ファイルの読み込み、エラーが発生します。 別の は は は 

```matlab
EEG = pop_fileio(filenameEEG); % import data
EEG = pop_select(EEG, 'chantype', 'eeg'); % select EEG channels
EEG = pop_select(EEG, 'rmchannel', { 'EEG061' 'EEG062' 'EEG063' 'EEG064' }); % remove EOG and EKG channels
```

それから の を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を 再会、再会、再会、再会等、 行 を を 目標 の の の の の 「 「 「 「 「 「 の の の の の の の の の 「 「 「 「 同 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 「 の 「 「 「 「 「 「 「 「 「 「 「 「 の の 「 の の の の の の の の の の の の の 「 の の 「 の の の の の の の の 「 「 の の の 「 「 の の の の 「 の の の 「 の の 「 の の の 「 「 の の の の の の の 「 「 「 「 また、チュートリアルを高速化、PCA を使用する を を を を を を を を を [Artoni ら., 2018](https://pubmed.ncbi.nlm.nih.gov/29526744/).

```matlab
% Preprocess and run ICA (so one may be localized)
EEG = pop_resample(EEG, 100);
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_reref(EEG, []);
% EEG = [IMPORTANT: In actual practice, remove any artifcatual data portions here!]
EEG = pop_runica( EEG , 'picard', 'maxiter', 500, 'pca', 20); % NOTE: In practice, PCA dimension reduction prior to ICA decomposition is NOT recommended
```

最後に、MRI と MRI と MRI の MRI の Object の Object の Object の Object の Object の Object の Object の Object の Object の Object の Object の Object の Object の Object が 自動的に 検出され、 コマンド が 生成されます。 [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) 対象となるのは MR の MR の MR の 主 は、 FieldTrip 関数 *ft_volumerealign.m* ???????????????????????????????????????????????????????????????? [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) 機能。

```matlab
EEG = pop_dipfit_headmodel( EEG, filenameMRI, 'plotmesh', 'scalp');
EEG = pop_dipfit_settings( EEG, 'coord_transform', 'alignfiducials');
EEG = pop_multifit(EEG, 1:10,'threshold', 100, 'dipplot','off'); 
pop_dipplot(EEG, [], 'normlen', 'on');
```

MRIからヘッドモデル、FieldTrip関数を生成します。 MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、MRI、M、MRI、MRI、C、MRI、MRI、MRI、C、MRI、MRI、MRI、C、MRI、MRI、C、MRI、C、MRI、MRI、C、MRI、MRI、MRI、MRI、MRI、C、C、C、C、MRI、MRI、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、S、 *plotalignment*オプションは、自動で動作します。 [pop_dipfit_settings.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_settings.m) アライメントをチェックします。

ダイキャスト ダイキャスト ダイキャスト [pop_multifit.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_multifit.m) それらをプロットする [pop_dipplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipplot.m)お問い合わせ 以下のプロットは、コンポーネントの同等のダイポールの1つを示しています。

![2018年12月12日](https://user-images.githubusercontent.com/1872705/207180247-82dfc1cc-afd3-4e64-a70a-94ff67d51b49.png)

eLoreta または LCMV のビームフォーミングは、モデルを生成します。 [詳しくはこちら](https://eeglab.org/tutorials/09_source/EEG_sources.html)このサイトは、以下のとおりです。

## その他のヘッドモデル

EEGLAB は、FieldTrip を、各 DIPFIT 構造の MR の頭文字、 MR ヘッドホーン MRI-modified の枠組みが変更されました。 [住 所 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=readlocs.m) この投稿をお気に入りにする 7月 2019 [エッグ](https://www.fieldtriptoolbox.org/tutorial/headmodel_eeg_bem/)お問い合わせ [メニュー](https://www.fieldtriptoolbox.org/tutorial/headmodel_meg/)お問い合わせ その他 [MEGチュートリアル](https://www.fieldtriptoolbox.org/workshop/practicalmeeg2022/handson_anatomy/) このチュートリアルでは同じデータを使用します。

```matlab
EEG.dipfit.hdmfile = 'headmodel.mat';
EEG.dipfit.mrifile = 'mrifile.mat';
EEG.dipfit.chanfile = 'fiducials.sfp';
EEG.dipfit.coordformat = ''; % may be MNI, this field may be left blank as well
EEG = pop_dipfit_settings(EEG, 'coord_transform', 'alignfiducials'); % align MEEG fiducials with the MRI fiducials. Use EEG = pop_dipfit_settings(EEG) to  perform manual alignment
```

EEGLABのメニュー更新履歴

```
EEG.saved = 'no';
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG);
eeglab redraw;
```

