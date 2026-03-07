---
layout: default
title: d. Custom head model
nav_title: "d. カスタムヘッドモデル"
long_title: d. Using a custom head model
parent: 9. Source analysis
grand_parent: Tutorials
---
スキャンされた電極位置の使用
===========================
カスタムヘッドモデルを使用することで、ソースローカリゼーションの精度を向上させることができます。
スキャンされた3D電極位置がある場合、被験者のヘッドジオメトリに合わせてテンプレートヘッドモデルを変形・適応させることができます。これは、テンプレートヘッドモデルにテンプレートの電極位置を合わせるよりも正確です（[Akalin Acar & Makeig, 2013](https://pubmed.ncbi.nlm.nih.gov/23355112/)）。
被験者個人のMRヘッド画像がある場合は、個別の電気的ヘッドモデルを構築でき、個人の皮質表面に対するより正確なソースモデリングが可能になります（テンプレートモデルだけでは不可能）。

被験者のMRヘッド画像とスキャンされた3D電極位置の両方がある場合、テンプレートヘッドモデルを被験者のヘッドジオメトリに合わせて変形・適応させることで、ソースローカリゼーションの精度が大幅に向上します。
テンプレートの電極位置（国際10-20システムに基づくもの）はメーカー間で大きく異なる場合があります。
しかし、解剖学的ランドマーク（鼻根点など）からの電極位置のスキャンは、最近の3Dスキャナー（iPhone 13 Pro、Samsung Galaxy S20 Ultraなど）やデスクトップ3Dカメラ（Structure.io）によって簡単かつ安価に行えるようになりました。

3Dスキャンされた電極位置を取得するには、[get_chanlocs プラグイン](https://github.com/sccn/get_chanlocs/wiki)を使用できます。このプラグインは[FieldTrip](https://www.fieldtriptoolbox.org/tutorial/electrode/)の機能に基づいています。

[get_chanlocs プラグインのドキュメント](https://github.com/sccn/get_chanlocs/wiki)でEEGLABでの使用方法を参照してください。

![3D電極位置スキャン](https://user-images.githubusercontent.com/1872705/206874056-8a2e646e-aff5-4a8b-b342-292725f6ae88.png)

電極位置をスキャンし、ソースローカリゼーションに使用する場合は、[DIPFITの設定](Model_Settings.html)を参照してください。被験者個別のMRヘッド画像がある場合は、[Neuroelectromagnetic Forward Head Modeling Toolbox（NFT）](https://github.com/sccn/NFT)を使用してDIPFITやコルティカルサーフェスソースモデルの当てはめに利用する個別ヘッドモデルを作成できます。このチュートリアルでは、MRヘッド画像を使用したカスタムヘッドモデルの作成方法を説明します。

カスタムヘッドモデル
=================

このチュートリアルでは、[Henson-Wakemanデータセット](https://nemar.org/dataexplorer/detail?dataset_id=ds000117)を使用します。最初の被験者のファイルのみを[こちらからダウンロード](https://sccn.ucsd.edu/eeglab/download/ds000117_sub-01.zip)できます。DIPFITはEEGLABの拡張機能で、FieldTripの機能を利用しています。

## MRIデータのインポートとチャネル選択

メニュー項目 <span style="color:brown">*File > Import data > Using File-IO interface*</span> を使用してデータをインポートします。ファイル *sub-01_ses-meg_task-facerecognition_run-01_meg.fif* を選択してください。インポート後、メニュー <span style="color:brown">*Edit > Channel locations*</span> でチャネル位置を確認できます。

次に、メニュー <span style="color:brown">*Edit > Select data*</span> を使用して、EEGチャネルのみを選択し、EOGおよびEKGチャネル（EEG061からEEG064）を除外します。

![チャネル選択画面](https://user-images.githubusercontent.com/1872705/207117594-941ad9e9-5599-4208-89a7-48a93e41bcdc.png)

メニュー項目 <span style="color:brown">*Tools > DIPFIT source localization > Construct head model from MRI*</span> を呼び出します。

![MRIヘッドモデル設定](https://user-images.githubusercontent.com/1872705/206955411-513057c1-46e4-4f7c-ab77-c11493feedb0.png)

この例では、MRヘッド画像を使用して自動的にアラインメントが行われます。

![自動アラインメント結果](https://user-images.githubusercontent.com/1872705/206935920-b0f5e662-8571-40af-bba3-709eed80e306.png)

MRIからBEM（境界要素法）ヘッドモデルが自動的に生成されます。EEGLABでは、[ROIconnect](https://github.com/arnodelorme/roiconnect)プラグインで使用されるMRIベースのヘッドモデルも生成できます。[pop_dipfit_headmodel.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m)関数は "bemcp" メソッドを使用し、FieldTripの機能を呼び出します。FieldTripのデフォルトは "dipoli" メソッドですが、LinuxとWindowsでのみ動作します。コマンドラインから呼び出す場合は[pop_dipfit_headmodel.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m)を参照してください。

![ヘッドモデル生成結果](https://user-images.githubusercontent.com/1872705/206955695-e1522efe-793e-4fcc-a3ed-4b8573db67cf.png)

完了後、メニュー項目 <span style="color:brown">*Tools > DIPFIT source localization > Head model and settings*</span> を呼び出します。

![DIPFIT設定画面](https://user-images.githubusercontent.com/1872705/206956553-435a3f9f-48db-4bff-b714-4fddc37aa3f6.png)

*Co-register*ボタンを押し、コレジストレーションウィンドウで*Align fiducials*を選択してOKを押します。チャネル位置とヘッドモデルのアラインメントが表示されます。ウィンドウの左側に残差が表示されます。フィデューシャルの選択については[こちら](https://eeglab.org/tutorials/ConceptsGuide/coordinateSystem.html#eeglab-electrode-coordinate-systems)を参照してください。

![コレジストレーション結果](https://user-images.githubusercontent.com/1872705/206982193-92e59b82-90b9-43c5-8e7a-d551a90d66d1.png)

これでソースローカリゼーションの準備が整いました。[ICAコンポーネントのスカルプ投影マップ](DIPFIT.html)やその他の[ソースモデル](EEG_sources.html)を参照してください。

## スクリプト

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'source_reconstruction_custom_mri.m'));">MATLABコマンドを表示</button>

このスクリプトを実行するには、EEGLABに*File-IO*、*FieldTrip*、*Picard*、*bids-matlab-tools*プラグインがインストールされている必要があります。生データおよびMRIファイルのパスを設定してください。

```matlab
dataPath = 'xxx/sub-01';
filenameEEG = fullfile( dataPath, 'ses-meg','meg','sub-01_ses-meg_task-facerecognition_run-01_meg.fif');
filenameMRI = fullfile( dataPath, 'ses-mri','anat','sub-01_ses-mri_acq-mprage_T1w.nii.gz');
```

以下のコードでデータをインポートし、EEGチャネルのみを選択します。MEGチャネルは除外しますが、チュートリアルではEEGチャネルのみを使用します。

```matlab
EEG = pop_fileio(filenameEEG); % import data
EEG = pop_select(EEG, 'chantype', 'eeg'); % select EEG channels
EEG = pop_select(EEG, 'rmchannel', { 'EEG061' 'EEG062' 'EEG063' 'EEG064' }); % remove EOG and EKG channels
```

次に、前処理とICA分解を実行します。チュートリアルを高速化するため、PCAによる次元削減を使用していますが、実際の解析ではPCA次元削減はICA分解前には推奨されません（[Artoni et al., 2018](https://pubmed.ncbi.nlm.nih.gov/29526744/)）。

```matlab
% Preprocess and run ICA (so one may be localized)
EEG = pop_resample(EEG, 100);
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_reref(EEG, []);
% EEG = [IMPORTANT: In actual practice, remove any artifcatual data portions here!]
EEG = pop_runica( EEG , 'picard', 'maxiter', 500, 'pca', 20); % NOTE: In practice, PCA dimension reduction prior to ICA decomposition is NOT recommended
```

最後に、MRIからヘッドモデルを構築し、電極位置とのアラインメントを行います。[pop_dipfit_headmodel.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m)関数は、被験者のMR画像を読み込み、FieldTrip関数*ft_volumerealign.m*を使用してフィデューシャルを自動検出し、BEMヘッドモデルを生成します。詳細は[pop_dipfit_headmodel.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m)関数を参照してください。

```matlab
EEG = pop_dipfit_headmodel( EEG, filenameMRI, 'plotmesh', 'scalp');
EEG = pop_dipfit_settings( EEG, 'coord_transform', 'alignfiducials');
EEG = pop_multifit(EEG, 1:10,'threshold', 100, 'dipplot','off'); 
pop_dipplot(EEG, [], 'normlen', 'on');
```

MRIからヘッドモデルを生成する際、FieldTrip関数がMRI上のフィデューシャルポイントを自動検出します。*plotalignment*オプションを使用すると、[pop_dipfit_settings.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_settings.m)でアラインメントを確認できます。

ダイポールフィッティングには[pop_multifit.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_multifit.m)を使用し、プロットには[pop_dipplot.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipplot.m)を使用します。以下のプロットは、コンポーネントの等価ダイポールの一つを示しています。

![ダイポールフィッティング結果](https://user-images.githubusercontent.com/1872705/207180247-82dfc1cc-afd3-4e64-a70a-94ff67d51b49.png)

eLoretaまたはLCMVビームフォーミングによる分散ソースモデルの生成については、[EEGソースモデル](https://eeglab.org/tutorials/09_source/EEG_sources.html)を参照してください。

## その他のヘッドモデル

EEGLABは、FieldTripを通じて様々なヘッドモデルをサポートしています。DIPFIT構造体にカスタムヘッドモデルファイルとMRIファイルを設定することで、独自のヘッドモデルを使用できます。チャネルファイルには[readlocs.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=readlocs.m)関数がサポートする形式を使用してください。FieldTripの[EEGヘッドモデルチュートリアル](https://www.fieldtriptoolbox.org/tutorial/headmodel_eeg_bem/)、[MEGヘッドモデルチュートリアル](https://www.fieldtriptoolbox.org/tutorial/headmodel_meg/)、および[MEG実践チュートリアル](https://www.fieldtriptoolbox.org/workshop/practicalmeeg2022/handson_anatomy/)（このチュートリアルと同じデータを使用）も参考にしてください。

```matlab
EEG.dipfit.hdmfile = 'headmodel.mat';
EEG.dipfit.mrifile = 'mrifile.mat';
EEG.dipfit.chanfile = 'fiducials.sfp';
EEG.dipfit.coordformat = ''; % may be MNI, this field may be left blank as well
EEG = pop_dipfit_settings(EEG, 'coord_transform', 'alignfiducials'); % align MEEG fiducials with the MRI fiducials. Use EEG = pop_dipfit_settings(EEG) to  perform manual alignment
```

設定後、EEGLABメニューを更新します。

```
EEG.saved = 'no';
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG);
eeglab redraw;
```
