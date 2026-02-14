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
EEG、スキャンされた電極の位置は、被写体のヘッドジオメトリに関する情報が含まれています
テンプレートヘッドモデルを変形/アダプトするために使われます。 これは、共同登録として正確ではありません
測定された電極の位置を個々の MR の頭部のイメージに-利用できるとき-しかし
テンプレートヘッドモデルにテンプレートの電極位置を合わせるよりも正確です [アカリン・アカー&マディグ2013](https://pubmed.ncbi.nlm.nih.gov/23355112/).
個々のMRヘッドイメージに基づいて、各被写体に電気的フォワードモデルを構築することで、個々の複雑な形状面へのより正確で有意義なソースモデリングが可能になります。 各参加者の相関関係は、頭蓋骨形状(例、測定された電極位置)を知ることで決定できないため、テンプレートフォワードモデルを使用することはできません。

参加者のMRヘッドイメージを持たなくても、スカルプ電極の3D位置を測定
テンプレートヘッドモデルを変形させ、対象ヘッドジオメトリに適応させるため、ソースローカリゼーションの精度が大幅に向上します。
テンプレートの電極の位置(国際10-20システムに基づいても)はメーカー間で大きく異なる場合があります。 
しかし、実際の3D位置をスキャン(頭のランドマークともう1つの関係)は簡単で安価になりました。 
3Dスキャナを含むモダンなスマートフォンをご使用いただけます。
(iPhone 13 Pro、Samsung Galaxy S20 Ultraなど)、または標準的なコンピュータタブレットに比較的安い3Dカメラアタッチメント(Structure.io)。  

3Dカメラで取得した3D電極位置の記録を支援するためのEEGLAB機能を開発しています。 
ふりがな [get_chanlocs プラグイン](https://github.com/sccn/get_chanlocs/wiki)、機能に基づいて
導入事例 [フィールドトリップ](https://www.fieldtriptoolbox.org/tutorial/electrode/)3Dスキャンされたヘッドイメージから3D電極の位置を把握するデータアナリストを支援します。そのため、技術者が磁気または他のスタイラスを使用して、Polhemusシステムで以前必要だったように、1つの電極の位置を1つずつ記録する間、待機期間を通して座る必要性の実験参加者を取り除きます。 

3Dスキャンの後、あなたは使用することができます [get_chanlocs ディレクティブ](https://github.com/sccn/get_chanlocs/wiki) EEGLABプラグインは、スキャンされたヘッドイメージで同じ電極位置(一つずつ)を測定します。 これを数分間必要とし、保存後、モンタージュのテンプレートを再利用することでさらに削減できます。 2023年頃に導入したい機能で、機械ビジョンの仕組みを更に自動化できるはずです。

![スクリーンショット 2022-12-10 12 26 58 PM](https://user-images.githubusercontent.com/1872705/206874056-8a2e646e-aff5-4a8b-b342-292725f6ae88.png)

電極の位置をスキャンし、ソースのローカリゼーションのためにそれらを使用したい場合は、次のことができます [DIPFITの設定](Model_Settings.md) チュートリアル。 各参加者にMRヘッドイメージがある場合には、EEGLABの使い方もできます。 [神経電磁気 フォワードヘッドモデリングツールボックス(NFT)](https://github.com/sccn/NFT) DIPFITにインポートしたり、NFTを使用して、個々の電気ヘッドモデルを作成したり、独立したコンポーネント分析(ICA)によってデータで識別された効果的なEEGソースの同等のダイポールまたは分散コルテ面モデルに収まることができます。 このチュートリアルでは、フィールドトリップ関連のツールを使用して、MRヘッドイメージからヘッドモデルを構築します。

カスタムヘッドモデル
=================
スキャンされた3Dの電極の位置があり、またMRの頭部のイメージを写し出せば、各主題のための注文の電気ヘッド モデルを造ることができます。 このモデルは、脳のボリューム(単一または複数の理論的な「tiny電池の現在のダイポール」によって)のどこに発生する可能性がスカルプへのボリューム伝導によって伝播されるかを規定しています。 多くの場合、研究者は、共有されたMRヘッド画像から被写体の顔をプライバシー目的のために削除します。 電動ヘッドモデリング用の非面MRIを使用するのが望ましいです。 まず、ネジョンがしばしば欠落しているので、MRIの頭蓋骨の点を正確に測定することはできません。 吐き気の位置が入手可能な場合でも、被写体の上部の顔と顔の骨の構造は、正面の頭皮への容積伝導に影響を及ぼすので、頭皮と頭皮の表面を抽出するときにそれを持っていることが重要です。 それにもかかわらず、このチュートリアルでは、このチュートリアルでは、データ作成者によって個別に提供される陰影や他の文書の位置をここに使用します。

このチュートリアルでは、我々は人気を使用することができます [Henson-Wakeman データセット](https://nemar.org/dataexplorer/detail?dataset_id=ds000117)お問い合わせ 最初の被写体から一部のファイルのみが使用可能です。 [詳しくはこちら](https://sccn.ucsd.edu/eeglab/download/ds000117_sub-01.zip)お問い合わせ 以下に示すMRIオーバーレイプロットはFieldTripです。 DIPFITはEEGLABの拡張機能で、FieldTrip機能を利用して、同等のダイポールソースモデルのローカリゼーションを実現します。

## MRIをファイズシャルと関連付ける

メニュー項目を使用してデータをインポートする <span style="color:brown">*ファイル > インポートデータ > File-IO インターフェイスを使用する*</span>*ses-meg*フォルダ内の*sub-01_ses-meg_task-facerecognition_run-01_meg.fif*ファイルを選択します。 *sub-01_ses-meg_coordsystem.json* に保存されます。 EEGLAB は、このファイルを自動検出し、そのファイルを読み込みます。 他のデータフォーマットを使用する場合は、通常は電極の位置と定義されます。 メニュー項目を手動で追加することができます <span style="color:brown">*編集 > チャンネルの場所*</span>.

次に、EEGとMEGの両方のデータが含まれているため、EEGチャネルを選択します。 メニュー項目を使用する <span style="color:brown">編集 > データの選択</span> チャンネルラベルが「EEG」で始まるすべてのチャンネルを選択します。 EOG および ECG チャネルである EEG061 に 367 から 370 (ラベル EEG061 から EEG064) へのチャネルを省略し、EEG 関連の分析に含まれるべきではないことに注意してください。

![スクリーンショット 2022-12-12 に 9 50 23](https://user-images.githubusercontent.com/1872705/207117594-941ad9e9-5599-4208-89a7-48a93e41bcdc.png)

メニュー項目の呼び出し <span style="color:brown">ツール > DIPFITを用いたソースローカリゼーション > MRIからヘッドモデルを作成する</span>お問い合わせ MRヘッドのイメージを選択し、次のGUIが表示されます。

![スクリーンショット 2022-12-11 に 3 35 19 PM](https://user-images.githubusercontent.com/1872705/206955411-513057c1-46e4-4f7c-ab77-c11493feedb0.png)

これは、まず第一弾をポップアップします。 この例では、MR ヘッドイメージと自動整列されます。 しかし、アライメントをチェックするのはいつも良いです。 私たちがそれらが期待する場所(薄い青い線が自分の位置を示す)の下の図を見ることができます。

![スクリーンショット 2022-12-11 に 3 37 03](https://user-images.githubusercontent.com/1872705/206935920-b0f5e662-8571-40af-bba3-709eed80e306.png)

それからMRIは脳、頭蓋骨および頭皮に分けられ、網は抽出されます。 MRIをセグメント化し、メッシュを作成するためにFreesurferを使用する方が良いことに注意することが重要です。それはより正確です(より時間がかかりますプロセス)。 その他の追加の利点は、様々なことです アトラスを定義します。, EEGLAB で使用できます。 [ROIconnectについて](https://github.com/arnodelorme/roiconnect) プラグイン。 ふりがな [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) "bemcp" メソッド、FieldTrip の外部モジュールを使用してメッシュを抽出します。 繰り返しますが、これは最高のソリューションではないかもしれません。FieldTrip のデフォルトは "dipoli" メソッドです。現在、これは Linux と Windows でのみ動作します。 パラメータを変更することで、これらの設定を変更することができます。 [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) コマンドラインから呼び出すときの関数。

![スクリーンショット 2022-12-11 7 39 20 PM](https://user-images.githubusercontent.com/1872705/206955695-e1522efe-793e-4fcc-a3ed-4b8573db67cf.png)

これが完了したら、メニュー項目を呼び出します <span style="color:brown">ツール > DIPFITを用いたソースローカリゼーション > ヘッドモデルと設定</span>お問い合わせ ヘッドモデル、MRI、および関連する座標ランドマークがブランクアウトされていることがわかります。 グラフィックインターフェイスは、FieldTrip形式でカスタムヘッドモデルを編集していることも示しています。

![スクリーンショット 2022-12-11 7 43 48 PM](https://user-images.githubusercontent.com/1872705/206956553-435a3f9f-48db-4bff-b714-4fddc37aa3f6.png)

*Co-register*ボタンを押し、コリベーションウィンドウで、*Align fiducials*を選択し、ウィンドウでOKを押すと、チャンネルのペアを選択できます。 *具体的な図形*は堅い変形を加えます。これは私達がMRIのfiducialsおよびチャネル スペースのfiducialsがあらゆる次元(同じです)に沿って伸びるべきではないので望むものです。 coregistration ウィンドウは、スケーリングとオフセットを変更することで、手動で(右)調整できる非パーフェクトアライメント(左)を表示します。 電極は頭皮の上にあるべきです。 誤差は、関連する不確実性によるものです [フィデューシャルの選択](https://eeglab.org/tutorials/ConceptsGuide/coordinateSystem.html#eeglab-electrode-coordinate-systems). 

![スクリーンショット 2022-12-11 に 11 06 22 PM](https://user-images.githubusercontent.com/1872705/206982193-92e59b82-90b9-43c5-8e7a-d551a90d66d1.png)

'OK'を押して、共同登録グラフィックインターフェイスを閉じ、ダイポール設定グラフィックインターフェイスを閉じるために再び'OK'を押します。 現地化の準備ができました。 [ICAコンポーネントスカルププロジェクションマップ](DIPFIT.md) ・その他 [EEGソースプロジェクションマップ](EEG_sources.md).

## スクリプト

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'source_reconstruction_custom_mri.m'));">MATLABコマンドを表示する</button>

このセクションのスクリプトは、EEGLABプラグインマネージャから次のプラグインをインストールしたと仮定します。 *File-IO*、 *FieldTrip*、 *Picard*、および*bids-matlab-tools*。 最初に、生データと分析MRIの次のファイル名を定義したとします。

```matlab
dataPath = 'xxx/sub-01';
filenameEEG = fullfile( dataPath, 'ses-meg','meg','sub-01_ses-meg_task-facerecognition_run-01_meg.fif');
filenameMRI = fullfile( dataPath, 'ses-mri','anat','sub-01_ses-mri_acq-mprage_T1w.nii.gz');
```

最初のステップはデータをインポートすることです。 以下のスクリプトでは、EEG チャネルを選択することとします。 しかし、チュートリアルスクリプトで示されているだけでなく、MEGチャンネルを選択することができます。 ソースのローカリゼーションは、EEGとMEGの両方のチャネルで動作します。 *coordsystem* JSONファイルに保存され、自動的に検出され、インポートされます。 ただし、別のファイル形式を使用する場合は、データファイルに含まれている場合があります。 

```matlab
EEG = pop_fileio(filenameEEG); % import data
EEG = pop_select(EEG, 'chantype', 'eeg'); % select EEG channels
EEG = pop_select(EEG, 'rmchannel', { 'EEG061' 'EEG062' 'EEG063' 'EEG064' }); % remove EOG and EKG channels
```

それから私達は源のローカリゼーションに使用するかもしれないあるICAの部品を発生させるためにデータを前処理します。 これは、データを再サンプリングし、それをフィルタリングし、それを再参照し、ICAを実行することを含みます。 ここでは、適切なアーティファクト拒絶を行わないことに注意しましょう。 私たちのチュートリアルの目標は、ほぼ同じダイポールソースのローカリゼーションプロセスを実証するために、ICAコンポーネントを迅速に取得することです。この対象のEEGデータは、ICAの分解がコンポーネントのスカルプマップを見つけることを可能にするために十分な低騒音を持っています。これは、本当に単一の同等ダイポール(スカルプの投影が「等価」である指向モデルダイポールが、適切な場所と指向の相関パッチを横断する同期ローカルフィールドアクティビティのことです)。 また、チュートリアルプロセスを高速化するため、PCA を使用するだけで、データランクがチャネルの数よりも少ない場合を除き、使用をお勧めする練習(*EEG.nbchan*) [Artoni ら., 2018](https://pubmed.ncbi.nlm.nih.gov/29526744/).

```matlab
% Preprocess and run ICA (so one may be localized)
EEG = pop_resample(EEG, 100);
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_reref(EEG, []);
% EEG = [IMPORTANT: In actual practice, remove any artifcatual data portions here!]
EEG = pop_runica( EEG , 'picard', 'maxiter', 500, 'pca', 20); % NOTE: In practice, PCA dimension reduction prior to ICA decomposition is NOT recommended
```

最後に、MRI と関連ファイルを MRI 空間のファイザーの座標にインポートします(図を含むファイルは自動的に検出され、インポートされます)。 あるいは、 [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) 提出書類を受領します。 対象の MR ヘッドイメージを持ち、ファイザーを選択していない場合は、FieldTrip 関数 *ft_volumerealign.m* のインタラクティブなメソッドを使用して、ヘッドイメージに相対的な位置の推定値を提供し、その後、それらを入力として提供します [pop_dipfit_headmodel.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_headmodel.m) 機能。

```matlab
EEG = pop_dipfit_headmodel( EEG, filenameMRI, 'plotmesh', 'scalp');
EEG = pop_dipfit_settings( EEG, 'coord_transform', 'alignfiducials');
EEG = pop_multifit(EEG, 1:10,'threshold', 100, 'dipplot','off'); 
pop_dipplot(EEG, [], 'normlen', 'on');
```

最初のコマンドは、MRIからヘッドモデルを作成し、FieldTrip関数を使用してセグメント化します。これはSPM関数を使用します。 2 番目のコマンドは、EEG または MEG 電極をヘッドモデルと MRI と整列します。 これは、MRIとセンサーの両方で定義されるファイザーの整列に基づいています。 上記のアライメントは自動で行われますが、アライメントが正しいことを確認することは常に良い考えです。 *plotalignment*オプションを使用できます。 [pop_dipfit_settings.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipfit_settings.m) アライメントをチェックします。

すべてのヘッドモデルと電極を揃える硬い部分が達成されました。 次に、通常DIPFITでダイポール検索を実行します。 [pop_multifit.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_multifit.m) それらをプロットする [pop_dipplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_dipplot.m)お問い合わせ 以下のプロットは、コンポーネントの同等のダイポールの1つを示しています。

![スクリーンショット 2022-12-12-12 3 17 09 PM](https://user-images.githubusercontent.com/1872705/207180247-82dfc1cc-afd3-4e64-a70a-94ff67d51b49.png)

eLoreta または LCMV Beamforming を実行するためのソースコードモデルを定義することもできます。 [詳しくはこちら](https://eeglab.org/tutorials/09_source/EEG_sources.html)お問い合わせ 以下に生物学的に可塑性ICA成分を示します。

## その他のヘッドモデル

EEGLAB は、FieldTrip をインターフェイスしているため、各 DIPFIT 構造の MR ヘッドイメージ、および MR ヘッドイメージを含むファイルを配置することもできます。 MRI-modified座標フレームに一致するように変更された座標が変換される必要があります。 電極の位置の任意のデータ形式 [読み込み場所 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=readlocs.m) 機能は読みます受諾可能です。 このセクションで使用されるFieldTripチュートリアルは、こちらで利用可能です [エッグ](https://www.fieldtriptoolbox.org/tutorial/headmodel_eeg_bem/)お問い合わせ [メニュー](https://www.fieldtriptoolbox.org/tutorial/headmodel_meg/)お問い合わせ その他 [MEGチュートリアル](https://www.fieldtriptoolbox.org/workshop/practicalmeeg2022/handson_anatomy/) このチュートリアルでは同じデータを使用します。

```matlab
EEG.dipfit.hdmfile = 'headmodel.mat';
EEG.dipfit.mrifile = 'mrifile.mat';
EEG.dipfit.chanfile = 'fiducials.sfp';
EEG.dipfit.coordformat = ''; % may be MNI, this field may be left blank as well
EEG = pop_dipfit_settings(EEG, 'coord_transform', 'alignfiducials'); % align MEEG fiducials with the MRI fiducials. Use EEG = pop_dipfit_settings(EEG) to  perform manual alignment
```

EEGLAB グラフィックユーザーインターフェイス(メニュー)を更新するには、次のコマンドシーケンスを使用します。

```
EEG.saved = 'no';
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG);
eeglab redraw;
```

