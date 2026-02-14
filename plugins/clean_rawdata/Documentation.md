---
layout: default
parent: Clean_rawdata
grand_parent: Plugins
render_with_liquid: false

title: Documentation
nav_title: "ドキュメント"
long_title: Documentation
---
歴史背景
---------------------

ASRはもともと[Christian]によって開発されました
コテ)(https://intheon.io/team/#christian-kothe)、今Intheon CTO。 お問い合わせ
の一部だった [BCILAB株式会社](https://sccn.ucsd.edu/wiki/BCILAB) オンライン
データのクリーニング。 有名なデモを見る
[詳しくはこちら](https://www.youtube.com/watch?v=qYC_3SUxE-M)お問い合わせ 春の春に
2013年、クリスチャンにオフライン版を作るよう依頼しました。 応答で、彼は
ASRのカスタムバージョンをオフラインで使用しました。 私はそれを包みました
お問い合わせ
[clean_rawdata() ディレクティブ](https://sccn.ucsd.edu/mediawiki/index.php?title=Plugin_list_all&action=submit)
EEGLABプラグイン 以下は「宮越ら」のサプリメントから引用されています。
(2020)](https://academic.oup.com/cercorcomms/article/1/1/tgaa046/5881803?login=true).

> ・・・ 歴史的事実は、アーティファクトサブスペースのオフラインバージョンであるということです
> clean_rawdata() プラグインで実装されたreconstruction(ASR)
> 複数の研究(Mullen et al. 2015; Chang et al)によって検証されるようになりました。
> 2018年、Gabard-Durnam et al。2018年、Blum et al。2019年;
> Plechawska-Wojcik et al. 2019は、このために特別に開発されました
> BCILAB(コテとコテ)の主任開発者によるプロジェクト
> 2013年12月12日 オリジナルのソリューションは、*Christian-Nima Combo*と呼ばれていました。
> 開発者の後、しかし形式的にclean_rawdata()に変わります
> 2013年6月26日 EEGLABのプラグインとして実装する
> Makeig 2004.)

組織する方法
-------------------

コア関数*clean_artifacts()*は5つのサブ機能から成ります、
最も上流の前処理のための多目的なパイプラインを形成する。

1.  clean_flatlines()-これは、デッドフラットを持っているチャネルを削除することです
    特定の長さより長いライン。
2.  clean_drifts()-これはIIRフィルタです。 移行を入力する必要があります
    帯域幅(わからない場合は、こちらを参照してください)
    ページ:()https://sccn.ucsd.edu/wiki/Firfilt_FAQ#Q._What_are_passband.2C_stopband.2C_transition_band_width.2C_cutoff_frequency.2C_passband_ripple.2Fringing.2C_and_stopband_ripple.2Fattenuation.3F)).
3.  clean_channels()/clean_channels_nolocs()- これは、いわゆる拒否する
    'badチャンネル'. チャネル位置データが利用可能な場合、計算
    各チャネルの相関関係は、各チャネルが各チャネルの RANSAC 再構築に相関する
    ウィンドウ(2014年春に特別にモードが追加されました) お問い合わせ
    チャンネルの場所は利用できません。各チャンネルのチャンネルを計算します。
    他人に相関する。
4.  **clean_asr()**-これは本当の魔法です。 関連する文書
    このページでは、細心の注意を払っております。 ナッツシェルでは、
    PCA-decomposeに滑走窓(デフォルト0.5秒、オーバーラップ50%)を使用します
    「悪い」PCを識別するためのすべてのチャネル(比較で定義)
    頻度高められたRMSのデータ自身の最もきれいな部品に対して
    拒否し、残りのPCの活動を再構築する
    コンポーネント。
5.  clean_windows()-これは最終的なウィンドウの拒否を実行します。 お問い合わせ
    スライドウィンドウ (デフォルト 1.0 s. オーバーラップ 66%) 与えられたものよりも多くを見つける
    ASR以降でも不良チャネルの割合は、ウィンドウが拒否されます。
    この機能を無効にすることで、データの長さをそのまま保存することができます。
    加工前後と同一の場合、必要であれば。

ダウンロード
--------

ASR は EEGLAB プラグイン clean_rawdata() で実装されています。
EEGLABプラグインマネージャー(EEGLABメインGUIからダウンロードしてインストールします)
あるいは、手動でダウンロードできます。
ページ:()http://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php),
それを解凍し、eeglab/plugins の下のフォルダーを見つけます。

### ダウンロード ver 1.10 (旧)

clean_rawdata() は、Makoto Miyakoshi (me) によってメンテナンスされなくなりました。 しかし、
新しいバージョンが問題を再導入したという報告がありました
結果の再現性。 アルゴリズムの動作は同一である
Riemanian ジオメトリのサポートなどのオプションを除く。 ケース
結果の再現性(I do)を保証する必要があり、アップロード
最終バージョンはこちら 以下に示すように 'availableRAM_GB' オプションを使用します。
[clean_rawdata1.10の特長](files/Mmiyakoshi-clean-rawdata.zip)

参考文献
------------

-   [Plechawska-Wojcik M, Kaczorowska M, Zapala D. (2019)]. 工芸品
    EEG信号補正用のサブスペース再構築(ASR)。 ツイート
    情報システムアーキテクチャの比較研究と
    技術。 第39回国際会議の進行について
    情報システムアーキテクチャと技術 – ISAT 2018: パートII
    (インテリジェントシステムとコンピューティングの強み)
    853:125-135.](https://www.researchgate.net/publication/327272493_The_Artifact_Subspace_Reconstruction_ASR_for_EEG_Signal_Correction_A_Comparative_Study)
    「*論文は、比較研究の結果を示す
    アーティファクトサブスペース再構築(ASR)方式と2つの人気
    EEGアーティファクトの正しい方法:独立したコンポーネント
    解析(ICA)と主要コンポーネント解析(PCA)*」 しかし、私は
    ASR を ICA のプリプロセッシングとして使用すべきである
    代替。

<!-- -->

-   [Blum S, Jacobsen NSJ, Bleichner MG, Debener S. (2019年)] エリマニアン
    EEGアーティファクトのためのアーティファクトサブスペース再構築の修正
    取扱業務 フロントフムNeurosci。
    13:141.](https://www.frontiersin.org/articles/10.3389/fnhum.2019.00141/full)
    ※「ASR」と比較して、rASRアルゴリズムは全力で良好に実行
    3つの対策 rASRがオフラインで適していると結論
    マルチチャネルEEGデータのオンライン修正
    実験室および分野の条件。 * 必須

<!-- -->

-   [Chang C-Y, Hsu S-H, Pion-Tonachini L, Jung T-P. (2019年)]. 評価評価
    自動アーティファクトのためのアーティファクトサブスペースの復元
    マルチチャネルのコンポーネント除去 エッグ レコーディング IEEEトランス
    Biomed Eng. 2019年4月1日
    7月22日(日)https://ieeexplore.ieee.org/abstract/document/8768041)
    お問い合わせ 結論: 空中の結果は最適の ASR を示す
    パラメータは、非脳を除去する間20〜30の間のバランス
    脳活動のシグナルと保持*

<!-- -->

-   [Chang C-Y, Hsu S-H, Pion-Tonachini L, Jung T-P. (2018年)]. 評価評価
    自動EEGアーティファクトのためのアーティファクトサブスペース再構築
    除去。 Conf Proc IEEE Eng Med Biol Soc. (コンプロック IEEE Eng Med Biol Soc)
    2018](https://www.researchgate.net/publication/325921646_Evaluation_of_Artifact_Subspace_Reconstruction_for_Automatic_EEG_Artifact_Removal)
    ASRのパラメータを評価する最初の論文です。 非常に
    価値ある。

<!-- -->

-   [Gabard-Durnam LJ、Mendez Leal AS、Wilkinson CL、Levin AR(2018)]
    ハーバード自動処理パイプラインを電気脳構造化
    (HAPPE): 開発のための標準化された処理ソフトウェアおよび
    高品位データ。 神経科学のフロンティア、
    12:97](https://www.frontiersin.org/articles/10.3389/fnins.2018.00097/full)
    *ASRは、より分散でアーティファクト「バースト」を補うために使用されます
    自動的に検出されると異なる5つの標準的な偏差
    クリーンなデータ, 前の作業のように、臨床人口を賭けます (グルメット)
    (2014年) データセグメントのポストインターポレーションが削除されました
    0.05(攻撃的セグメント)のタイムウィンドウ拒否設定
    拒否)。 データは、ICAおよびMAAコンポーネントに提出されました。
    拒絶(HAPPEのように)。 HAPPE は ASR よりも EEG のデータを保持しました。
    あらゆる対策に取り組みます。 ASRは簡単に設計されていましたが、
    特にクリーンなデータの「バースト」、高度のため
    開発データにおけるアーティファクト汚染、ASR
    アプローチはファイルごとのEEGデータの平均35.7%を補いました。
    禁止されている高い補間率を構成する可能性があります... ASRについて
    すべての対策でHAPPEよりも成功しないアプローチ
    開発休止状態 EEG ファイルのコンテキストで。* お問い合わせ
    お問い合わせ 以下にコメントを投稿します。

<!-- -->

-   [Mullen TR, Kothe CA, Chi YM, Ojeda A, Kerth T, Makeig S, Jung TP,
    Cauwenberghs G. (2015年)。 リアルタイムの神経質化と認知
    ウェアラブルドライEEGによるモニタリング。IEEEトランスバイオメディカルエント2015
    11月;62(11):2553-67. 土井: 10.1109/TBME.2015.2481482. Epub 2015
    9月23日(日)https://www.ncbi.nlm.nih.gov/pubmed/26415149) 注意:
    この論文は、ASRのすべてのステップを記述しません。 詳しくはこちら
    詳細については、以下の補足材料。

<!-- -->

-   脳コンピュータ向けプラットフォーム「BCILAB」
    インターフェイス開発。 Jニューラルエン
    10:056014.](https://pubmed.ncbi.nlm.nih.gov/23985960/) "*bad"
    「シグナル処理アルゴリズム-アーティファクト」に基づくサブスペース除去*
    拒絶反応」

### ASRは信号とノイズを完全に削除しますか? (2020年01月07日)

定性的に言えば、はい、それは方法ができない意味にある
信号を完全に分離します。 したがって、私は英語として意味しません
言うと、ASRの「お風呂で赤ちゃんを眠る。」 現実について
信号よりもはるかに多くのノイズが拒否される(それ以外のものは何か
ポイント?) しかし、定量的な証拠でそれを実証するには、
よく設計されたシミュレーション研究。 私はそれを試みました, できる報告書
[宮古志]の補足資料の第5部にございます。
と。
(2020)](https://academic.oup.com/cercorcomms/article/1/1/tgaa046/5881803?login=true).
そこで定義した条件下で、ASR+ICAのアプローチ
SNRの利益の7-13 dBの利点を与えます。 お問い合わせ
記事をご覧ください。

HAPPE論文へのコメント、および重要なパラメータの選択方法
----------------------------------------------------------------------

1円 使用されるSDのしきい値があまりにも攻撃的だった: [Chang ら.
(2018)](https://www.researchgate.net/publication/325921646_Evaluation_of_Artifact_Subspace_Reconstruction_for_Automatic_EEG_Artifact_Removal),
SD = 5 が使用されていれば、データポイントの 90% は変更されます
この紙によると、元の分散の80%が失われます。
これを行う必要はありません。 同じ紙は、しきい値SD =
10-100 が推奨されます。 重要な注意:SDの定義はここにあります

1.  データの最もクリーンな部分を選ぶ
2.  プロファイルを持つカスタム周波数均等化フィルタを適用します。
    EEGパワースペクトル密度(PSD)の逆に'exaggerate お問い合わせ
    非脳のような力
3.  データのRMSを計算する
4.  z-score データ

ついに得たzスコアの分布がとてもタイトなので、
つまり、Noisyと比較して、データの最もクリーンな部分があまりにもきれいであることを意味します
同じデータの部分では、幾分変わったカットオフ値を使用する必要があります。
SD=10か20。 一度は、キリスト教のこの問題について議論しました。 彼
SD=10 や
20は異常に高く、現在の不適切な使用を示す
メトリック。 確かに、当社の未公開のクリーニング方法比較のデータ
Nima Bigdely-Shamlo (開発しました)
映写:()https://github.com/bigdelys/measure_projection),
[プレス](https://www.frontiersin.org/articles/10.3389/fninf.2015.00016/full),
等)、SD==20のASRは他の20方法の中で最もよく記録しました。 お問い合わせ
SD==10 から 20 への開始は推奨されます。

2円 Too積極的な窓の拒絶: 彼らはまた、ウィンドウの拒否を使用しました
非常に積極的な0.05、。

3円 結局のところ、私たちの断層--ASRは何年もの間そこにありました
よく説明されている(まだない) \>30 メインとオプションがあります
パラメータを探索する)、パラメータを最適化する方法を言及しない
空中テストに基づく。 重要なパラメータの悪い選択
HAPPE紙に展示されているのは残念だが理解できない。 お問い合わせ
Chiyuanの紙から学ぶ[Chang et al]
(2018)](https://www.researchgate.net/publication/325921646_Evaluation_of_Artifact_Subspace_Reconstruction_for_Automatic_EEG_Artifact_Removal),
HAPPE ペーパーの直後に ASR および
関連機能 合理的に.

補足材料
-----------------------

[クリスチャン・コテーによるパワーポイントスライド](files/ASR.pdf):
クリスチャン自身による原則の素晴らしい説明です。

[最も詳細な説明]
ASR:(ファイル/AsrDescription.pdf): 私はおそらく最も **
ASR**の詳細な説明(ただし、すべての詳細なしで)
私の同僚、チアンチャンとショーンHsuの素晴らしい助け。 これは、
Loo et al のサプリメントの. (2019).

[ダミーのためのASR](files/AsrForDummies_ver21_web.pdf): I
また、ASRの原則について説明するプレゼンテーション資料を作成しました。
アナログ。

[私のEEGLABワークショップ]
スライド:](ファイル/プリプロセッシングPipelineAndUtilityTools.pdf)
JAISTの第25回EEGLABワークショップで配布したファイルです。
東京サテライト、東京https://eeglab.org/workshops/EEGLAB_2017_Japan.html).

ASRをICAのプリプロセスとして使用するための理論的正当化
--------------------------------------------------------------

覚えておくべき重要なことは、

-   ASR ==非静止方式(スライドウィンドウPCA)
-   ICA ==固定方式(つまり1つの空間フィルタのみが使用されます)
    録画中)、データ文具(例えば、グリッチなし)
    または破裂)は必須の仮定です。

つまり、

-   ASR ==時折大きい振幅の騒音/アーティファクトを取除くでよい
-   ICA ==一定の固定ソースを分解して良い
    ノイズ/アーティファクト/シグナル

このようにして、両方のメソッドは互いに補完されます。 PCAとは
EEGを説明するのは簡単です。 しかし、現在の目標がそうであるならば
ICA の仕事をするために 'occasional の大きい振幅の騒音/アーティファクト' を識別して下さい
簡単に(データ文具を増やす)、それは十分です。

バージョン 1.00 更新情報 (更新 03/27/2019)
------------------------------------------------

上記のように、EEGLABとしてclean_rawdata() が使用可能になりました。
2013年以来のプラグイン。 2019年春にメジャーアップデートを行いました。
重要な確認は、この更新がコアを変更しなかったことです
アルゴリズムなので、計算の結果は\*same\となります。 * 必須
同じパラメータを与えられた--しかし、私はあなたに正確についてのより多くの細部を与えます
出力の再現性。 このアップデートで行われた変更は、
二つ折り:

### 'availableRAM_GB' は最終出力の長さを固定するオプションです。

同じパラメータを使用しても、最終的な結果が使用されることに気づいた
clean_rawdata() から変動します。 ASRが実行されると、
利用可能な量に応じてチャンクの数を決定します
hlp_memfree() によって得られる RAM は、
getFreePhysicalMemorySize() は、プライベートフォルダの下にあります。 利用できるので
RAMの量は、瞬時に文字通り計算されます。
この関数が呼び出されるたびに、異なる値を返します。 お問い合わせ
異なるチャンク以来、最終データの長さを変動させる原因
異なる ASR 結果、異なる最終的なウィンドウの拒絶反応の結果
結果。 ここでは、修正するかどうかを決定するために下記の簡単なテストを作った
利用可能なRAMの量は、出力データの長さを修正します。

``` matlab
EEG = pop_loadset('filename','asrTestData.set','filepath','/data/projects/makoto/asrTest/'); % 123 ch, 2583s , 250 Hz sampling rate.

% High-pass filter the data.
EEG = pop_firws(EEG, 'fcutoff', 0.5, 'ftype', 'highpass', 'wtype', 'blackman', 'forder', 2750, 'minphase', 0);

% Trim outliers.
EEG = trimOutlier(EEG, -Inf, 1000, 1000, 100); % % 123 ch, 2581s , 250 Hz sampling rate.

resultTable = zeros(110, 6); % Conventional_dataLength, availableRam, processTime, Updated_dataLength, availableRam, processTime
for trialIdx = 1:110

    % ASR with no RAM option.
    currentRam = java.lang.management.ManagementFactory.getOperatingSystemMXBean().getFreePhysicalMemorySize()/(2^30);
    tStart = tic;
    EEG2 = clean_rawdata(EEG, -1, -1, -1, -1, 20, 0.25);
    currentProcessTime = toc(tStart);
    resultTable(trialIdx, 1:3) = [EEG2.pnts, currentRam, currentProcessTime];

    % ASR with 8GB RAM option.
    currentRam = java.lang.management.ManagementFactory.getOperatingSystemMXBean().getFreePhysicalMemorySize()/(2^30);
    tStart = tic;
    EEG2 = clean_rawdata(EEG, -1, -1, -1, -1, 20, 0.25, 'availableRAM_GB', 8);
    currentProcessTime = toc(tStart);
    resultTable(trialIdx, 4:6) = [EEG2.pnts, currentRam, currentProcessTime];
end
```

![800ピクセル](AsrRamFix.png)

示すように、RAMサイズを修正すると、出力データの長さが固定されます。
現在、結果の再現性を保証する唯一の方法です。 お問い合わせ
このオプションは、常に使用されます。

### *clean_artifacts()* へのオプションの入力はすべてサポートされています。

メインの EEGLAB 開発者 Arnaud Delorme によるリクエスト ワンポイント
例外は2つの関数に渡される'availableRAM_GB'です
2つの層で、*asr_calibrate()*および*asr_process()*は、
*clean_asr()*。 全31個のオプションの入力リストを以下に示します。 お問い合わせ
各オプションの入力の詳細は各ヘルプセクションを参照してください。
指定された関数。

``` matlab
% Decode all the inputs.
hlp_varargin2struct(varargin,...
    ...
    ... % This section contains 6 basic parameters that corresponds to GUI inputs. The assumption is that users determine these values.
    {'chancorr_crit','ChannelCorrelationCriterion','ChannelCriterion'}, 0.8, ...
    {'line_crit','LineNoiseCriterion'}, 4, ...
    {'burst_crit','BurstCriterion'}, 5, ...
    {'window_crit','WindowCriterion'}, 0.25, ...
    {'highpass_band','Highpass'}, [0.25 0.75], ...
    {'channel_crit_maxbad_time','ChannelCriterionMaxBadTime'}, 0.5, ...
    ...
    ... % This section contains optional inputs for clean_artifacts() (i.e., for the 6 subfunctions). The assumptiion is that the default values are usually used.
    {'burst_crit_refmaxbadchns','BurstCriterionRefMaxBadChns'}, 0.075, ...
    {'burst_crit_reftolerances','BurstCriterionRefTolerances'}, [-3.5 5.5], ...
    {'window_crit_tolerances','WindowCriterionTolerances'},[-3.5 7], ...
    {'flatline_crit','FlatlineCriterion'}, 5,...
    {'nolocs_channel_crit','NoLocsChannelCriterion'}, 0.45, ...
    {'nolocs_channel_crit_excluded','NoLocsChannelCriterionExcluded'}, 0.1, ...
    ...
    ... % This section contains optional inputs for clean_flatlines().
    {'max_allowed_jitter', 'MaxAllowedJitter'}, [], ...
    ...
    ... % This section contains optional inputs for clean_drifts().
    {'attenuation', 'Attenuation'}, [], ...
    ...
    ... % This section contains optional inputs for clean_channels().
    {'clchan_window_len', 'CleanChannelsWindowLength'}, [], ...
    {'num_samples', 'NumSamples'}, [], ...
    {'subset_size', 'SubsetSize'}, [], ...
    ...
    ... % This section contains optional inputs for clean_channels_nolocs().
    {'linenoise_aware', 'LineNoiseAware'}, [], ...
    ...
    ... % This section contains optional inputs for clean_asr().
    {'asr_windowlen','ASR_WindowLength'}, [],...
    {'asr_stepsize','ASR_StepSize'}, [],...
    {'maxdims','MaxDimensions'}, [],...
    {'ref_wndlen','ReferenceWindowLength'}, [], ...
    {'usegpu','UseGPU'}, [],...
    {'availableRAM_GB'}, [],...
    ...
    ... % This section contains optional inputs for clean_windows().
    {'clwin_window_len', 'CleanWindowsWindowLength'}, [], ...
    {'window_overlap', 'WindowOverlap'}, [], ...
    {'max_dropout_fraction', 'MaxDropoutFraction'}, [], ...
    {'min_clean_fraction', 'MinCleanFraction'}, [], ...
    {'truncate_quant', 'TruncateQuantile'}, [], ...
    {'clwin_step_sizes', 'CleanWindowsStepSizes'}, [], ...
    {'shape_range', 'ShapeRange'}, []);
```

### *clean_rawdata()* は EEG.etc.clean_rawdata_log の下のオプションの入力を含む、使用されるすべてのパラメーターを保存します。

結果を再計算するには、すべての入力パラメータ、特に
'利用できるRAM_GB'。 簡単にするために、各データセットを作ることにしました
*clean_rawdata()* で処理する方法を運ぶ
データセットはバッチモードで処理され、そのまま再現できます。
元のコード。

サポート
-------

clean_rawdata() は ASR のオフラインバージョンを含んでおり、
慢性疾患の研究のためのプロジェクトのために開発 (PI サンドラ)
NINDS 80160 と 97484 がサポートした Loo 。

著者: 宮越真琴、スワルツ・センター 神経科学
(SCCN)、ニューラルコンピューティング研究所、UCサンディエゴ
