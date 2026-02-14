---
layout: default
parent: SIFT
grand_parent: Plugins
render_with_liquid: false

title: Chapter-7.-Statistics-in-SIFT
long_title: Chapter-7.-Statistics-in-SIFT
---
情報の流れやニューラルの注意点を推測するとき
システム、自信の間隔を作り出すことも非常に重要です
推定者のための統計的意義のしきい値。 最も一般的な
神経系識別に使用される統計的検査は、
下の表。 SIFTの統計的なルーチンは1つまたはに対処するように設計されます
これらの3つのテストの多くは、現在2つの主要なカテゴリの下に分類されます。
非パラメトリック代理統計、および非対称分析統計。



*テーブルキャプション。 一般的な統計検査。 ここでC(i,j)は
測定された情報はプロセス*j*からプロセス*i*に流れます。
ツイート<sub>ログイン</sub> 測定された情報の流れはそこにあります
本当の情報の流れ無し、C<sub>ベース</sub> 想定される情報
ベースラインの期間に流れます。 * 必須

|                                                  |                                                                                                |                                    |
|--------------------------------------------------|------------------------------------------------------------------------------------------------|------------------------------------|
お問い合わせ 試験 | 核催眠 | どんな質問がありますか? |適用方法 |
| **<img src="https://latex.codecogs.com/svg.latex?{ {H}_{null} }">※ | 工程から情報の流れが著しくない ※j*～*i* ? | フェーズランダム化分析試験 |
| **<img src="https://latex.codecogs.com/svg.latex?{ {H}_{base} }">** | 基準線に相対的な情報流の違いはありますか? | ブーツストラップリサンプリング |
| **<img src="https://latex.codecogs.com/svg.latex?{ {H}_{AB} }">※ | 実験的条件・人口AとBの違いはありますか? | ブートストラップ再販 |

## 7.1. 麻薬分析統計

近年、非ゼロ情報フローの非整形分析試験
*(H)<sub>ログイン</sub>)* 与えられた頻度で派生し、
PDC、rPDC、およびDTFの推定者(Schelter et al.、2005年)のために検証される;
Eichler、2006b、Schelter et al。、2009)。 これらのテストは利点を持っています
排ガスと比較して、非常に少ない計算時間を必要とする
統計情報 しかし、これらのテストは、非対称的なプロパティに基づく
VARモデルでは、それらは*asymptotically*正確であり、
サンプルの数が非常に大きくないとき、または不正確に苦しむ
想定される場合。 しかし、これらのテストは、
統計的意義を素早く確認できる便利な方法
より厳密な代理の統計的なテストと続く。 お問い合わせ
SIFTの**でテストを実施`stat_analyticStats()`**機能。 お問い合わせ
私たちの知識は、SIFTは公に利用可能なツールボックスです。
これらの分析テストを実施します。

## 7.2. 非パラメトリック代理統計

分析統計は、確率分布の知識を必要とする
質問の推定者。 推定者の分布が
未知の、非パラメトリック代理統計メソッドは、テストに使用できる
ゼロ以外の値または2つの条件間の値を比較する。
代理統計試験では、代理データ(変更サンプル)を利用しています。
元のデータ) 期待される確率を一時的に推定する
estimator か *null の配分のどちらかの配分*
推定値の分布に対応する場合
特定のヌル仮説が施行されました。 2つの人気のある代理
メソッドは **bootstrap 再サンプリングとフェーズ
ランダム化。** お問い合わせ
SIFTの**でテストを実施`stat_surrogateStats()`**機能。

### 7.2.1. ブーツストラップ再サンプリング

ブーツストラップ再サンプリング(EfronとTibshirani、1994年)が正式に正式に
代替品でランダムに再サンプリングすることにより、推定者の分布
オリジナルのデータセットから、推定値を再入力
再サンプルデータの収集。 これは多くの繰り返し(例えば、200-2000)
各リサンプルの推定値が保存されます。 いつか
手順は終了します。, 我々は、帝国分布を持っています
estimator は、推定値の推定値を計算することができます。
期待値の周りの信頼区間を取得し、実行する
異なる統計的検査(t-tests、ANOVAsなど)を比較する
推定値。 特定の条件の下で、それを示すことができます
再サンプル数が無限に近づくにつれて、ブートストラップ
分布は、データの真の分布にアプローチします。 ふりがな
収束速度は、データの性質上大きく左右されますが、ルール
の親指は250-1000再サンプルが一般に農産物に十分であるということです
配布物の合理的な見積もり。 

### 7.2.2. フェーズランダム化

相ランダム化(Theiler, 1992)は、非ゼロのテストのための方法です
動的システム内の情報フロー。 コンセプトはとてもシンプルです。
期待される確率分布を組み立てることから始まります。
null 仮説 (情報の流れなし) が行われたときに推定者
データを強制する。 *null分布を呼び出します。* 観察される
estimator の値は、null の quantiles と比較されます。
NULLの拒絶のための重要なレベルを得るために配分
その値の仮説。 具体的には、null を生成する
各シリーズのフェーズだけをランダム化します。
振幅分布を保存します。 見積もりをリクエストします。
この手順を何度も繰り返して、目的のnullを生成します
分布。 フェーズランダム化を実装する
複雑な力を得るために高速燃料変換(FFT)を適用
スペクトル、均一なランダム行列のそれらと相を交換する、
そして最終的に私達の代理データを得るために逆FFTを適用して下さい
マトリックス。 この手順では、(a) の surrogate の spectral の行列が
hermitian および (b) 代理スペクトルの実質の部品は同一です
元のデータへ。 周波数ドメイン情報から
フロー推定器は、相対的なフェーズに依存します。
多変量的時間シリーズ、任意の観察された情報の流れを代理
データセットはチャンスのために必要です。 したがって、推定者の値
より大きい, 言う, null 分布の値の 95% は、
5% レベル (p < 0.05) で重要な。 

重要なのは、上記のテスト(分析と代理の両方)のみです。
同様に重要なテスト、従って、共同テストするとき
値の収集(例えば、p-values を完全に取得する)
時間頻度のイメージ)、私達は少数の重要でない少数を期待します
重要なしきい値を超える値。 こんなに重要なのは、
False Discoveryのようなテストを使用して複数の比較のために正しい
料金(FDR) (Benjamini、Hochberg、1995) EEGLABの**使用`fdr()`**機能。 

## 7.3. SIFTにおける実用的な統計

モデルがフィットし、コネクティビティが計算されたら、私たちはしばしば
データセットの統計を計算したい 上記と述べた通り、これにはいくつかのアプローチを使用してSIFTで達成することができます。
アシンプトティック分析試験(PDC、RPDC、DTF対策用)
代理統計(bootstrapping、位相ランダム化)。 

### 7.3.1. SIFT ネイティブ機能

SIFT統計機能はコマンドラインからのみ利用できます。 これらの機能の助けを借りて、それらを使用する方法を見てみましょう。 

```matlab
% Analytic stats
EEG = pop_stat_analyticStats(EEG);

% Generate surrogate distribution 
EEG = pop_stat_surrogateGen(EEG);

% Compute stats on the surrogate distribution 
EEG = pop_stat_surrogateStats(EEG);
```

**EEG.CAT.Stats** 構造は、これらの関数によって計算された統計を保存し、**TimeFreqGrid** および**Brainmovie** 関数が以前の機能で使用できるはずです。 統計を計算する他の関数の**SIFT/stats**フォルダを参照してください。 これらの関数のほとんどは進行中の作業であり、終了しませんでした。そのため、SIFTメニューには含まれていません。 

### 7.3.2. SIFT接続構造で動作する

統計を計算するための別の現在の方法は、EEGデータセットのCATサブ構造に保存された接続マトリックスをエクスポートすることです。 MATLAB コマンドラインタイプ:

```
>> EEG(1).CAT.Conn

ans = 

  struct with fields:

      winCenterTimes: [0.1992 0.2070 0.2148 0.2227 0.2305 0.2383 0.2461 0.2539 0.2617 0.2695 0.2773 0.2852 0.2930 0.3008 … ]
    erWinCenterTimes: [-0.8008 -0.7930 -0.7852 -0.7773 -0.7695 -0.7617 -0.7539 -0.7461 -0.7383 -0.7305 -0.7227 -0.7148 … ]
               freqs: [2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 … ]
                dims: {'var_to'  'var_from'  'freq'  'time'}
              dDTF08: [8×8×49×238 single]
                 Coh: [8×8×49×238 single]
                pCoh: [8×8×49×238 single]
                   S: [8×8×49×238 single]
```

**dDTF08**サブ構造の接続行列は、例えば、サイズ8コンポーネントx 8コンポーネントx 49周波数x 238時間ウィンドウです。 その他のサブ構造には、周波数とウィンドウセンターの配列が含まれています。

### 7.3.2.1. ベースラインへのポスト刺激接続の比較

自信の間隔を計算するBootstrappingは比較的簡単です。 データをランダムに選択し、接続解析を複数回再実行できます。

**重要な注意:** 視覚化セクションで提示されたシンプルなしきい値方法を使用して効果を探すことができます。 しかし、接続対策の重要性は時間がかかります。 これは、スクリプトとしてのみ提示される理由です。 患者になる。

チュートリアルに従った場合、データを用意する必要はありませんが、もしそうでなければ、次のスクリプトはチュートリアルの前のセクションで行われた分析を適用します(EEGLABでデータをインポートし、セクション5で提示されたEEGLABベースのプリプロセッシングを実行する必要があります)。

```matlab
% prepare data
EEG = pop_pre_prepData(EEG, 'nogui', 'SignalType',{'Components'}, 'NormalizeData', {'Method' {'time'  'ensemble'} }, 'verb', 1);

% fit AR model
EEG = pop_est_fitMVAR( EEG, 'nogui', 'Algorithm', 'Vieira-Morf', 'ModelOrder', 15, 'WindowLength', 0.4, 'WindowStepSize', 0.01, 'verb', 1); 

% Compute connectivity
EEG = pop_est_mvarConnectivity( EEG, 'nogui', 'ConnectivityMeasures', {'Coh' 'S'}, 'freqs', [2:50], 'verb', 1); 
```

その後、ブーツトラップ接続を補正し、ランダムなファッションと再コンパイル接続でデータ試用を繰り返し選択できます。

```matlab
% Bootstrap data trials and repeat 100 times, assuming you have already preprocessed data from the GUI
allCoh = cell(1,100);
parfor iAccu = 1:100
     EEGTMP = EEG(1);
     EEGTMP.CAT.srcdata = EEG(1).CAT.srcdata(:,:,ceil(rand(1,EEG(1).trials)*EEG(1).trials)); % randomly select data epochs
     EEGTMP = pop_est_fitMVAR( EEGTMP, 'nogui', 'Algorithm', 'Vieira-Morf', 'ModelOrder', 15, 'WindowLength', 0.4, 'WindowStepSize', 0.01, 'verb', 1); 
     EEGTMP = pop_est_mvarConnectivity( EEGTMP, 'nogui', 'ConnectivityMeasures', {'Coh' 'S'}, 'freqs', [2:50], 'verb', 1); 
     allCoh{iAccu} = EEGTMP.CAT.Conn.Coh;
end
cohConcat = cat(5, allCoh{:}); % concatenate along 5th dim
cohConcatBaselined = bsxfun(@minus, cohConcat, mean(mean(cohConcat(:,:,:,1:71,:),4),5); % 1 to 71 correspond to -1 to -0.25 seconds

% compute 95% confidence interval
ci = stat_surrogate_ci(cohConcat, 0.05, 'both');

% compute p-value (baseline bootstrap compared to 0) and correct for multiple comparisons using FDR
pVals = stat_surrogate_pvals(cohConcatBaselined, zeros(size(cohConcatBaselined,[1:4])), 'both');
pValsCorrected = fdr(pVals); % for info only. For FDR correction, we would need at least 1000 repetitions.
```

次のスクリプトを使用して結果をプロットすることができます。 以下では、結果をプロットするために、低レベル関数**vis_TimeFreqGrid**を使用していますが、**EEGに統計情報を置く場合。 CAT。 Stats** サブ構造では、上位レベルの **pop_vis_TimeFreqGrid** 関数も使用できます。

```matlab
stats = [];
stats.alpha = 0.05;
stats.tail  = 'both';
stats.Coh.ci = ci;
stats.Coh.pval = pVals; % uncorrected
vis_TimeFreqGrid('EEG', EEG(1), 'Conn', EEG(1).CAT.Conn, 'MatrixLayout', {'Partial', 'UpperTriangle', 'Coh' 'LowerTriangle', 'Coh' 'Diagonal' 'S', 'AllColorLimits', 99.9  }, ...
   'baseline', [-1 -0.25], 'Thresholding', {'Statistics', 'ThresholdingMethod', 'pval'}, ...
   'nodelabels', { 'IC8' 'IC11' 'IC13' 'IC19' 'IC20' 'IC23' 'IC38' 'IC39' }, 'stats', stats);
```

<img width="1110" alt="Screen Shot 2023-08-26 at 9 31 05 AM" src="https://github.com/sccn/SIFT/assets/1872705/4b490066-ee57-42d8-b399-82bc86af33e4">

*充填キャプション。 ベースラインと比較してコネクティビティと重要性(複数の比較に誤って)のマスク。 * 必須

### 7.3.2.2. 2つの条件を比較する

上記と同じ方法でデータを準備します。 これは、接続値の分布が同じ分布から来るnullの仮説との接続を比較することです(したがって、両方のデータセットのデータを使用し、ヒューズデータから試用をランダムに引き出すことによってそれらを再構築)。

```matlab
% Bootstrap data compare EEG(1) and EEG(2)
originalDiff = EEG(1).CAT.Conn.Coh - EEG(2).CAT.Conn.Coh; % this is the original difference
allTrials = cat(3, EEG(1).CAT.srcdata, EEG(2).CAT.srcdata); % concatenate all normalized trials
allCoh = cell(1,100);
parfor iAccu = 1:100
     allDataShuffled = shuffle(allTrials,3);
     EEGTMP1 = EEG(1); EEGTMP1.CAT.srcdata = allDataShuffled(:,:,1:EEGTMP1.trials); % randomly select data epochs
     EEGTMP2 = EEG(2); EEGTMP2.CAT.srcdata = allDataShuffled(:,:,EEGTMP1.trials+1:end); % Second dataset contains all the other epochs
     EEGTMP1 = pop_est_fitMVAR( EEGTMP1, 'nogui', 'Algorithm', 'Vieira-Morf', 'ModelOrder', 15, 'WindowLength', 0.4, 'WindowStepSize', 0.01, 'verb', 1); 
     EEGTMP2 = pop_est_fitMVAR( EEGTMP2, 'nogui', 'Algorithm', 'Vieira-Morf', 'ModelOrder', 15, 'WindowLength', 0.4, 'WindowStepSize', 0.01, 'verb', 1); 
     EEGTMP1 = pop_est_mvarConnectivity( EEGTMP1, 'nogui', 'ConnectivityMeasures', {'Coh' 'S'}, 'freqs', [2:50], 'verb', 1); 
     EEGTMP2 = pop_est_mvarConnectivity( EEGTMP2, 'nogui', 'ConnectivityMeasures', {'Coh' 'S'}, 'freqs', [2:50], 'verb', 1); 
     allCoh{iAccu} = EEGTMP1.CAT.Conn.Coh - EEGTMP2.CAT.Conn.Coh;
end
cohConcat = cat(5, allCoh{:}); % concatenate along 5th dim

% compute 95% confidence interval
ci = stat_surrogate_ci(cohConcat, 0.05, 'both');

% compute p-value (compared to no effect or 0) and correct for multiple comparisons using FDR
pVals = stat_surrogate_pvals(cohConcat, originalDiff, 'both');
pValsCorrected = fdr(pVals); % For illustration only, increase repetition to 1000 or more to use FDR in practice
```

下記の違いを描いています。

```matlab
stats = [];
stats.alpha = 0.05;
stats.tail  = 'both';
stats.Coh.ci = ci;
stats.Coh.pval = pVals; % uncorrected
EEGTMP = EEG(1); EEGTMP.CAT.Conn.Coh = originalDiff;
vis_TimeFreqGrid('EEG', EEGTMP, 'Conn', EEGTMP.CAT.Conn, 'MatrixLayout', {'Partial', 'UpperTriangle', 'Coh' 'LowerTriangle', 'Coh' 'Diagonal' 'S', 'AllColorLimits', 99.9  }, ...
   'baseline', [-1 -0.25], 'Thresholding', {'Statistics', 'ThresholdingMethod', 'pval'}, ...
   'nodelabels', { 'IC8' 'IC11' 'IC13' 'IC19' 'IC20' 'IC23' 'IC38' 'IC39' }, 'stats', stats);
```

![スクリーンショット 2023-08-26 3 17 28 PM](https://github.com/sccn/SIFT/assets/1872705/1138b9a5-36d3-4d66-b7c7-3bd4e44c1032)

*充填キャプション。 重要性(未修正)のためのチュートリアルデータセットの正しいと間違った条件間の接続性の違い。 * 必須

上記のソリューションは、ANOVAや他の種類の統計的なプロットに一般化します。 TFCE(レスホールドフリークラスターエンハンスメント方式)は、FDR(偽発見率)よりも攻撃力が少なく、複数の比較を補正します。 ※limo_tcfe* 関数を TFCE に適用させることもできます。

## 7.4. SIFTにおけるグループ分析

認知実験は通常、コホート全体で行われます
参加者は、差分を特徴付けるのに便利です。
個人のためのグループ内との間の脳ネットワーク活動
異なった条件。 

そのような分析は、
scalp チャネルで解析を実行すると比較的単純に、
ソースドメイン内の接続を推定する際に、より複雑
ダイポーラICプロセス間。 これは主にそれの事実のために
参加者間でICソースを装備することは困難です。 私たちは、
通常、クラスタリング技術を使用して、ダイポーラソースを装備
参加者全員に、場合によっては、参加者のサブセットが引き続き行われる
他のすべての場所で観察された複数のソースを展示しない
参加者 これらを考慮に入れない場合 *missing
変数*は、平均の偏差推定値を取得する危険性があります。
被写体人口を越えた接続。 この行方不明変数
問題は統計学でよく知られ、いくつかのアプローチはありました
これに対処するための提案。 

現在、ソースのグループ分析
ドメインは 2 つの方法を使用して可能です: disjoint クラスタリング, これを行う
欠落した変数問題を考慮に入れないが、まだあるかもしれない
一般的な分析に役立ちます。特に高い合意がある場合
ソースの場所とソースの面でデータセットのコホートを渡る
より堅牢な統計情報を提供するベイジアンの混合モデルアプローチ
データセットを渡る。 これらの方法の簡単な説明は以下のとおりです。

### 7.4.1. クラスタリング解除

上記のように、ユーザーは**EEGに保存されている接続マトリックスをエクスポートする必要があります。 CAT。 Conn** 構造と外部ソフトウェアを使用して、意義を計算します。 

このアプローチは3段階のプロセスを採用しています。

**1. K ROI(クラスター)を特定する。** ソースの親和性クラスタリングを使うことができます
EEGLABの計測製品クラスタを使用して、被写体人口を越える。

**2. 個別に統計的にすべての着信および発信を計算する
ROIの各ペア間の重要な接続。** そのためには、2つのクラスター間の接続ごとに、被写体全体に重要な場合は、\[ K X K] を作成します。
\[x freq x 時間 \] \] グループ接続行列。 接続の一部のペアは、他のものよりも多くの被写体を持っているかもしれません。 ユーザーは、すべての被験者に対して大きなコネクティビティマトリクスを構築し、NaNsといくつかの被験者におけるコネクションを交換し、LIMOを使用して計算統計(LIMOはNaNsを処理できる)に使うことができることに注意してください。

**3. SIFTの視覚化のルーチンを使用して結果を視覚化して下さい。 メニュー
この方法は、被験者がいないときに低統計力に苦しむ
ソースの場所の面で高い合意(可変的な問題に従う)。

### 7.4.2. ベイジアンミックスチャーモデル

より堅牢なアプローチ(Wes Thompson の開発)は、スプラインとモンテカルロメソッドを滑らかに使用
ポスターの確率の共同推定(自信あり)
間隔)クラスターの遠心分離機の場所および間カルスターの
接続性。 このメソッドは "missing変数" を考慮に入れます。
問題は密接なクラスタリングのアプローチに固有のものであり、堅牢性を提供します。
グループ接続統計。 ポスターは [ニュース](https://sccn.ucsd.edu/~scott/pdf/Thompson_and_Mullen_Poster_ICONXI.pdf) このトピックでは、コードはまだ利用できません。

### 7.4.3. グループSIFT

[グループSIFT](https://github.com/sccn/groupSIFT) 宮越真琴とコラボレーターが開発した。 その妥当性は、SIFTの著者によって評価されていないので、あなた自身のリスクでそれを使用してください。