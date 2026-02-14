---
layout: default
title: c. EEG source model
long_title: c. EEG source model
parent: 9. Source analysis
grand_parent: Tutorials
---
EEG または EEGERP を交換する
========================================
お問い合わせ

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

DIPFIT、EEGERPスカルプマップに1つのダイキャストに
--------

EEGLABは、 [DIPFIT プラグイン](https://github.com/sccn/dipfit) フィットする 
申し訳ありません、このコンテンツはただ今 アメリカ英語 のみです。 
どこでも設計されている。 フィッティングのみ
選択したタイムポイントで、タイムウィンドウ全体で実行します。 まずは、
DPFITの設定で、
パーキープ ERP で 100 ms のタイムポイント (例)
チュートリアルデータセット

``` matlab
eeglab; close; % add path
eeglabp = fileparts(which('eeglab.m'));
EEG = pop_loadset(fullfile(eeglabp, 'sample_data', 'eeglab_data_epochs_ica.set'));

% Find the 100-ms latency data frame
latency = 0.100;
pt100 = round((latency-EEG.xmin)*EEG.srate);

% Find the best-fitting dipole for the ERP scalp map at this timepoint
erp = mean(EEG.data(:,:,:), 3);
dipfitdefs;

% Use MNI BEM model
EEG = pop_dipfit_settings( EEG, 'hdmfile',template_models(2).hdmfile,'coordformat',template_models(2).coordformat,...
    'mrifile',template_models(2).mrifile,'chanfile',template_models(2).chanfile,...
    'coord_transform',[0.83215 -15.6287 2.4114 0.081214 0.00093739 -1.5732 1.1742 1.0601 1.1485] ,'chansel',[1:32] );
[ dipole, model, TMPEEG] = dipfit_erpeeg(erp(:,pt100), EEG.chanlocs, 'settings', EEG.dipfit, 'threshold', 100);

% plot the dipole in 3-D
pop_dipplot(TMPEEG, 1, 'normlen', 'on');

% Plot the dipole plus the scalp map
figure; pop_topoplot(TMPEEG,0,1, [ 'ERP 100ms, fit with a single dipole (RV ' num2str(dipole(1).rv*100,2) '%)'], 0, 1);
```

クリック [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=dipfit_erpeegtest.m) 上記のスクリプトをダウンロードします。 スクリプトを実行すると、以下の2つのプロットが作成されます。

![サイトマップ](/assets/images/scalp_topo_dipole.png)

eLoreta ソース ソース
シンプルに書かれている [プラグイン](https://github.com/sccn/erpsource) その目的のために。
このプラグインはミニマルなファッションで設計されており、他のプラグインのテンプレートとして使用できます。
そのグラフィカルな出力は、次のセクションに示すスクリプトと同じです。

DIPFIT/FieldTrip ソース再構築
--------

「DIPFIT」は、現在、DIPFIT、DIPFIT、DIPFIT、DIPFIT、DIPFIT、DIPFIT、DIPFIT、DIPFIT、DIPFIT、DIPFIT、DIPFITなど、様々な分野で活躍しています。
フィールドトリップ: 宇宙飛行士 オオステンド
ソースのイメージング機能を解放することにしました。
ファーストEEGLABでDIPFITでパッケージ化。
彼 をリリース をリリース をリリース
MATLAB は、 DIPFITをリワークし、 FieldTrip アクション
以来、ロバートと同僚が計画し、持っている機能
FieldTripの使い方は?
EEGLABデータへ
データセット。

導入事例:DIPFITの使い方
選択のヘッド モデルが付いている位置(メニュー項目) <span style="color: brown">ツール → ロック
DIPFIT → ヘッドモデルと設定</span>)。 結果DIPFIT
情報は、ソースのローカリゼーションを実行するために使用することができる
フィールドトリップ

### ボリュームでソースの再構築を実行

3D のフィールドライン
グリッド(eLoreta )

``` matlab
%% First load a dataset in EEGLAB.
% Then use EEGLAB menu item <em>Tools > Locate dipoles using DIPFIT > Head model and settings</em>
% to align electrode locations to a head model of choice
% The eeglab/fieldtrip code is shown below:

eeglab                        % start eeglab
eeglabPath = fileparts(which('eeglab'));                 % save its location
bemPath = fullfile(eeglabPath, 'plugins', 'dipfit', 'standard_BEM');    % load the dipfit plugin
EEG = pop_loadset(fullfile(eeglabPath, 'sample_data', 'eeglab_data_epochs_ica.set'));   % load the sample eeglab epoched dataset
EEG = pop_dipfit_settings( EEG, 'hdmfile',fullfile(bemPath, 'standard_vol.mat'), ...
           'coordformat','MNI','mrifile',fullfile(bemPath, 'standard_mri.mat'), ...
           'chanfile',fullfile(bemPath, 'elec', 'standard_1005.elc'), ...
           'coord_transform',[0.83215 -15.6287 2.4114 0.081214 0.00093739 -1.5732 1.1742 1.0601 1.1485] , ...
           'chansel',[1:32] );
```

します します 行
*ft_prepare_leadfield*. ヘッドモデルも非常に注意
与えられたボクセルが脳内外にあるかどうかを評価します。


``` matlab
%% Leadfield Matrix calculation
dataPre = eeglab2fieldtrip(EEG, 'preprocessing', 'dipfit');   % convert the EEG data structure to fieldtrip

cfg = [];
cfg.channel = {'all', '-EOG1'};
cfg.reref = 'yes';
cfg.refchannel = {'all', '-EOG1'};
dataPre = ft_preprocessing(cfg, dataPre);

vol = load('-mat', EEG.dipfit.hdmfile);

cfg            = [];
cfg.elec       = dataPre.elec;
cfg.headmodel  = vol.vol;
cfg.resolution = 10;   % use a 3-D grid with a 1 cm resolution
cfg.unit       = 'mm';
cfg.channel    = { 'all' };
[sourcemodel] = ft_prepare_leadfield(cfg);
```

次に生成されたリードフィールド行列を使用してソースを実行します
再構築。 以下では、シンプルな例をモデル化します。
eLoreta がリリースされました。
コ コ コ の ログイン
(FieldTrip参照)
ページ:()http://www.fieldtriptoolbox.org/tutorial/beamformer) から
このセクションは、より多くの情報に触発されています。

``` matlab
%% Compute an ERP in FieldTrip. Note that the covariance matrix needs to be calculated here for use in source estimation.
cfg                  = [];
cfg.covariance       = 'yes';
cfg.covariancewindow = [EEG.xmin 0]; % calculate the average of the covariance matrices
                                   % for each trial (but using the pre-event baseline  data only)
dataAvg = ft_timelockanalysis(cfg, dataPre);

% source reconstruction
cfg             = [];
cfg.method      = 'eloreta';
cfg.sourcemodel = sourcemodel;
cfg.headmodel   = vol.vol;
source          = ft_sourceanalysis(cfg, dataAvg);  % compute the source model
```

注意:
ソリューションは、低解像度のヘッドボリュームで生成されます。 それはない
このボリュームを高解像度に補うために技術的に可能
MRI in (near) レース - プレーン, プレーン
計算リソース, オフラインながら, それはあまりにも多くのメモリが必要になります
1頭の頭の頭の頭で fMRIテンダー、EEGデータハイテン語、低速のヘッド ストラックスレイシー
行列は既にかなり大きい - 高解像度に変換
容積のマトリックスは非現実的です)。 クリックする必要があります。
異なるボクセルとレイテンシーは、見た目の数字を取得する
お問い合わせ

また、プロットされたボリュームの中断を見ることができます。 お問い合わせ
ダイポールの方向の極性の突然の反転のためです
最寄のボクセル。
空間と時間において、一時的な活動は継続的です。 それでも、
voxel ディレクティブ 3 D ダイキャストのオリエンテーション
隣接するボクセルは、反対の極性を持っているかもしれません(そして、の
コース、反対に署名された時間コースも。 理想的なソリューションは、
スペースと時間の両方で反転を避けるためにまだ発見されていない - 持っている
すべてのダイポールは、ヘッドセンターに敬意を表しています。
関連するソース時間コースをそれに応じて反転 - は
試してみる価値のあるソリューション。 または、ダイポールの方向の異なる軸をプロットすることができます。

``` matlab
%% Plot Loreta solution
cfg = [];
cfg.projectmom = 'yes';
cfg.flipori = 'yes';
sourceProj = ft_sourcedescriptives(cfg, source);

cfg = [];
cfg.parameter = 'mom';
cfg.operation = 'abs';
sourceProj = ft_math(cfg, sourceProj);

cfg              = [];
cfg.method       = 'ortho';
cfg.funparameter = 'mom';
figure; ft_sourceplot(cfg, sourceProj);
```

![ボーダー|500px](/assets/images/Dipfiteloreta3.png)

興味の遅延が選択されたら、それらはにプロジェクトされるかもしれません
高分解能MRIの強み
テンプレートの脳のスライス。

``` matlab
%% project sources on MRI and plot solution
mri = load('-mat', EEG.dipfit.mrifile);
mri = ft_volumereslice([], mri.mri);

cfg              = [];
cfg.downsample   = 2;
cfg.parameter    = 'pow';
source.oridimord = 'pos';
source.momdimord = 'pos';
sourceInt  = ft_sourceinterpolate(cfg, source , mri);

cfg              = [];
cfg.method       = 'slice';
cfg.funparameter = 'pow';
ft_sourceplot(cfg, sourceInt);
```

![ボーダー|500px](/assets/images/Dipfiteloreta4.png)

### 表面にソースを再構築する

あるいは、下のコードはリードフィールド行列を生成します。
 現実 の の して下さい
DIPFIT のヘッドモデル
設定メニュー 異なるメッシュバージョンが異なる
解像度。 詳しくはこちら
[このフィールドトリップ]
チュートリアル:()http://www.fieldtriptoolbox.org/template/sourcemodel/) のための
詳細情報。 以下のコードは実行していると仮定します
上記のコード。

``` matlab
%% Prepare leadfield surface
[ftVer, ftPath] = ft_version;
sourcemodel = ft_read_headshape(fullfile(ftPath, 'template', 'sourcemodel', 'cortex_8196.surf.gii'));

cfg           = [];
cfg.grid      = sourcemodel;    % source points
cfg.headmodel = vol.vol;        % volume conduction model
leadfield = ft_prepare_leadfield(cfg, dataAvg);
```

前の投稿 eLoreta のコメント
最小限のノーム(MNE) MNEとELoretaのソース
各レイテンは、再構築(EEGtimes)を繰り返します。
入力としてシリーズ。

``` matlab
%% Surface source analysis
cfg               = [];
cfg.method        = 'mne';
cfg.grid          = leadfield;
cfg.headmodel     = vol.vol;
cfg.mne.lambda    = 3;
cfg.mne.scalesourcecov = 'yes';
source            = ft_sourceanalysis(cfg, dataAvg);
```

今、私たちはグローバルパワーをプロットします。 同じアプローチで、
MNEのソリューションは、いつまでも、
このページのトップへ
ページ:()http://www.fieldtriptoolbox.org/tutorial/minimumnormestimate/).

``` matlab
%% Surface source plot
cfg = [];
cfg.funparameter = 'pow';
cfg.maskparameter = 'pow';
cfg.method = 'surface';
cfg.latency = 0.4;
cfg.opacitylim = [0 200];
ft_sourceplot(cfg, source);
```

![ボーダー|500px](/assets/images/FieldTrip_surface_solution2.png)

ソースモデルのメッシュのアライメントを視覚的に確認することもできます。
BEM デスクトップモデル
下記の通りです。

``` matlab
hold on; ft_plot_mesh(vol.vol.bnd(3), 'facecolor', 'red', 'facealpha', 0.05, 'edgecolor', 'none');
hold on; ft_plot_mesh(vol.vol.bnd(2), 'facecolor', 'red', 'facealpha', 0.05, 'edgecolor', 'none');
hold on; ft_plot_mesh(vol.vol.bnd(1), 'facecolor', 'red', 'facealpha', 0.05, 'edgecolor', 'none');
```

![ボーダー|500px](/assets/images/FieldTrip_surface_solution_with_bem2.png)

クリック [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab_fieldtrip_script.m) 上記のスクリプトをダウンロードします。

Tripチュートリアル
--------
-   [ソースを作成する方法]
    モデル:()http://www.fieldtriptoolbox.org/tutorial/sourcemodel/)と
    [利用可能なテンプレートソース]
    モデル:()http://www.fieldtriptoolbox.org/template/sourcemodel/) ( 1 つ
    上記で使用しているもの)
-   [ボリューム伝導を定義する方法]
    モデル:()http://www.fieldtriptoolbox.org/workshop/baci2017/forwardproblem/)
-   [ビームフォーマー]
    メソッド:()http://www.fieldtriptoolbox.org/tutorial/beamformer/) -
    'eloreta' によって'dics' は、
-   [最小限の規範]
    見積りhttp://www.fieldtriptoolbox.org/tutorial/minimumnormestimate/)
    MEG は、EEG に適応する
-  [DIPFITのチュートリアル](https://sccn.ucsd.edu/eeglab/dipfittut/dipfit.htmlold)

お問い合わせ Arnaud Delorme は、クライアントの信頼関係を築き上げています。
Robert Oostenveld と Scott Makeig へ続く。
