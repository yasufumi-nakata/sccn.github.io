---
layout: default
title: CleanLine
long_title: CleanLine
parent: Plugins
render_with_liquid: false
nav_order: 11
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/cleanline).

![スクリーンショット 2024-08-02 に 09 14 11](https://github.com/user-attachments/assets/4e5be390-d091-4bdf-9ddc-e6fff8b692bb)

# クリーンライン

EEGLABのCleanLineプラグインへようこそ! 

このプラグインは、ICAコンポーネントのノイズを適応的に推定して削除します。
マルチ・タパリングとThompson F-statisticを使用して、またはスカルプ・チャネル。

CleanLineは、ベータ版のMakoto Miyakoshiのおかげで、Tim Mullen(tim@sccn.ucsd.edu)によって書かれています 
テスト。 CleanLineは、Mitra LabのChronuxから修正された機能を利用します 
ツールボックス(www.chronux.org)。

CleanLine は、クリスチャン・コテーズ BCILAB ツールボックスから arg() の機能も使用しています。 
(sccn.ucsd.edu/wiki/BCILAB) )

# インストール

CleanLineのインストールは簡単です。

1) CleanLineをダウンロードします(あなたがこれを読んでいるなら、あなたはすでにこのステップを完了しているでしょう)

2) パッケージを解凍し、コピーする <eeglabroot>/プラグイン/ Matlabコマンドラインからeeglabを起動します。
   代わりに、ClearLine(サブフォルダ)をパスに追加して、EEGLABが現在あることを確認してください。 
   パスで。

3) EEGLAB GUI を使用する場合は、Tools-->CleanLine から CleanLine を起動できます。
   代わりに、コマンドラインから CleanLine を起動できます。

```matlab
EEGclean = pop_cleanline(EEG);
```

   コマンドライン例やその他のパラメータについては、下の「Command-line example」セクションを参照してください。
   
5) 助けのため、タイプ

```matlab
doc cleanline
```

   または、ツールチップのヘルプテキストのためのGUIで任意のテキストボックス、チェックボックスなどの上にマウスを保持します。


# インフォメーション

Sinusoidalの騒音は記録された電気生理学的データで顕著なアーティファクトである場合もあります。 これはステムすることができます 
AC電源ラインの変動(例:50/60) Hzラインノイズ+調和)、電源サプライヤー(例:in 
医療機器)、蛍光灯など ノッチフィルタリングは、一般的に望ましくないため 
バンドホールの作成、ノッチ周波数周辺の周波数の重要な歪み(同様に) 
他の周波数でのフェーズの歪みとして、Gibbbsはタイムドメインでリッピングします)。 その他のアプローチ
sinusoidal(「ライン」)の騒音低減には、適応的な回帰的フィルタリングアプローチ(RLS、LMSなど)が含まれます。
しかし、これらは通常参照信号(例えば、外部に記録されたノイズリファレンス)が必要です。 
頻繁に利用できません。 ICAなどの分離アプローチは、ラインノイズを緩和するのに役立ちますが、  
多くの場合、ノイズの空間非静止性のためにノイズを完全に除去することができません。 

CleanLineは、Partha MitraとHemant Bokilが提唱するラインノイズ除去のためのアプローチを使用しています。 
「ブライン・ダイナミクス」(2007年)第73.4章 

簡略化すると、スライドウィンドウでデータが反転されます。 各ウィンドウ内で、信号が変換されます 
マルチタッパーFFTを使用した周波数ドメイン。 複雑な振幅(振幅と位相)は、
各頻度で得られる。 白に埋め込まれた決定的な副鼻腔の仮定の下で 
ノイズは、この副鼻信号のマルチタッパートランス(スペクトル)の回帰を設定できます。 
特定の頻度で元のデータの多重スペクトルに。 回帰係数 
分泌物の複雑な広さ(段階および広さ)を表す複雑な数です 
シンスイド。 このことから、シンスイドのタイムドメイン表現が構築され、サブトラクトされる可能性があります。 
データから線を外す。

典型的には、1つは正確なライン頻度を知らない。 例えば、米国では電力線ノイズ 
正確に60Hz(または一定期間にわたって一定のフェーズを持っている場合でも)であることを保証するものではありません。
この問題を暗示するために、Thompson F-Test は統計的意義を決定するために適用される場合があります
上記の回帰における非ゼロ係数の(有意に非ゼロの副鼻腔の徴候) 
広さ)。 その後、ラインの予想される場所の周りの狭いバンド内で検索することができます 
重要な閾値(p=0.05など)よりも、このF-statisticを最大化する周波数。

ライン周波数スキャンは、'ScanForLines'オプションを使用して有効/無効にすることができます。

短い(例えば2-4秒)の窓を合わせるのに頻度、段階を推定するのに使用することができます
副鼻腔ノイズコンポーネントの振幅(通常、録音の経過に変化する) 
セッション 窓の重なりの点の中断はsigmoidal機能を使用して滑らかにすることができます。
以下の例では、異なるスムース要因(シグマイドのスロープ)のそのような機能を示しています。

```matlab
winsize = 4;                        % window length in seconds
winstep = 2;                        % window step in seconds (50% overlap)
Fs      = 128;                      % sampling rate
tau     = [1 10 100]';              % smoothing factors
overlap = winsize-winstep;
toverlap = -overlap/2:(1/Fs):overlap/2;

% specify the smoothing function
foverlap = 1-1./(1+exp(-repmat(tau,1,length(toverlap)).*repmat(toverlap,length(tau),1)/overlap));

% define some colours
yellow  = [255, 255, 25]/255;
red     = [255 0 0]/255;
h       = zeros(1,3+length(tau));

% plot the figure
figure;
axis([-winsize+overlap/2 winsize-overlap/2 0 1]); set(gca,'ColorOrder',[0 0 0; 0.7 0 0.8; 0 0 1],'fontsize',11);
hold on
h(1)=hlp_vrect([-winsize+overlap/2 -overlap/2], 'yscale',[0 1],'patchProperties',{'FaceColor',yellow,        'FaceAlpha',1,'EdgeColor','none','EdgeAlpha',0.5}); 
h(2)=hlp_vrect([overlap/2 winsize-overlap/2],   'yscale',[0 1],'patchProperties',{'FaceColor',red,           'FaceAlpha',1,'EdgeColor','none','EdgeAlpha',0.5});
h(3)=hlp_vrect([-overlap/2 overlap/2],          'yscale',[0 1],'patchProperties',{'FaceColor',(yellow+red)/2,'FaceAlpha',1,'EdgeColor','none','EdgeAlpha',0.5});
h(4:end) = plot(toverlap,foverlap,'linewidth',2);
plot(toverlap,1-foverlap,'linewidth',1,'linestyle','--');
hold off;
xlabel('Time (sec)'); ylabel('Smoothing weight'); 
title('Plot of window overlap smoothing function vs. time for different smoothing factors');
legend(h,[{'Window 1','Window 2','Overlap'},cellstr(num2str(tau))']);
```

スムーズな要因は、cleanline() の 'SmoothingFactor' パラメータによって決定されます。

CleanLine では、'Bandwidth' パラメータでマルチタッパー周波数の解像度を指定できます。 
これは、与えられた周波数で副鼻腔のスペクトルのピークの幅です。 時間頻度による 
不確実性原則、帯域幅の減少は滑走窓の必要な長さを増加させます 
適度な頻度分解を得るために。 CleanLine が使用するタッパーの数、K は 
Tが秒(窓の長さ)の一時的な決断であるK=2TW-1によって与えられ、Wは頻度です 
Hzの解像度(Bandwidth)。 CleanLineはTをスライドウィンドウの長さに固定するので、W(Bandwidth)は
必須パラメータのみ。 'Verbosity' オプションが 1 に設定されている場合は、CleanLine はマルチタッパーを表示します。
関数の実行上のコマンドラインのパラメータ。


# CleanLineの実行のヒント

デフォルトオプションは非常にうまく機能する必要がありますが、設定に応じて調整する必要があります。 
複数のエポックを持っている場合は、ウィンドウサイズとステップサイズが正確に分割するようにする必要があります 
epochの長さ。 言い換えれば、ラインノイズから2つのエポックをオーバーラップするために任意のスライドウィンドウが欲しくありません 
相と振幅は、その点でシフトし、タイムドメイン線の減算を実行できません。
比較的短いエポック(例えば<5秒)を持っている場合は、各ウィンドウが長さになるように取られた場合、それは最善です
エポックとステップサイズはウィンドウの長さに等しいです。 この方法では、行が推定され、 
各エポックを個別に削除します。 GUI を使用する場合は、ウィンドウの長さとステップサイズのデフォルト値
epoch の長さに自動的にセットされます。

連続した未塗装のデータをクリーニングする場合、最大4秒のスライドウィンドウを50%使用したい場合 
オーバーラップ。

EEGLAB GUI を使用する場合、eegh() コマンドが返されるように EEG.history にコマンドが保存されます。 
CleanLineの最後のGUI実行に対応するコマンドライン関数呼び出し。

チャンネル/コンポーネントのサブセットでオプション('PlotFigures',true)を試してみると便利です
CleanLineのパフォーマンスの感覚は、差分パラメータの選択肢(そしてまた最も多くを識別するために)
重要な行はスペクトルに嘘をつきます)、パラメータに満足したら、このオプションをオンにします
残りのチャンネル/コンポーネントをすべてクリーニングする前にオフ。 注:PlotFiguresが*considerably遅い*ならクリーンラインは*です 
有効になっています。 クリーニング操作の最終結果が見えるよう気にならない場合は、
計算をスピードアップする('ComputeSpectralPower',false')を設定したい。


# 典型的なコマンドライン例(複数トライアル)

```matlab
% This will run cleanline on all channels, scanning for lines +/- 1 Hz around the 60 and 120 Hz frequencies. 
% Each epoch will be cleaned individually and epochs containing lines that are significantly sinusoidal at 
% the p<=0.01 level will be cleaned. 

EEG = pop_cleanline(EEG, 'Bandwidth',2,'ChanCompIndices',[1:EEG.nbchan] ,'SignalType','Channels','ComputeSpectralPower',true,'LineFrequencies',[60 120] ,'NormalizeSpectrum',false,'LineAlpha',0.01,'PaddingFactor',2,'PlotFigures',false,'ScanForLines',true,'SmoothingFactor',100,'VerbosityLevel',1,'SlidingWinLength',EEG.pnts/EEG.srate,'SlidingWinStep',EEG.pnts/EEG.srate);
```

# Cleanline.mのヘルプ (これらは pop_cleanline に渡すこともできます)

## 機能入力
  **LineFrequencies:** ラインノイズの頻度を削除                                                                      
                        入力範囲:無制限                                                                           
                        デフォルト値: 60 120                                                                                
                        入力データタイプ:実数(倍)                                                                 
                                                                                                                              
  **ScanForLines:** ラインノイズのスキャン                                                                                   
                        これは指定されたLineFrequenciesの周りの狭い範囲で正確な行の周波数をスキャンします    
                        入力範囲 : [true false]                                                                           
                        デフォルト値: true                                                                                      
                        入力データ タイプ: boolean                                                                              
                                                                                                                              
  **LineAlpha:** 重要な副鼻腔の検出のためのp値                                                                        
                        入力範囲: [0 1]                                                                                 
                        デフォルト値: 0.01                                                                                   
                        入力データタイプ:実数(倍)                                                                 
                                                                                                                              
  **帯域幅:**帯域幅(Hz)                                                                                        
                        これは、固定周波数で副位のピークの幅です。 このように、これは定義します     
                        多層周波数分解能。                                                                     
                        入力範囲:無制限                                                                           
                        デフォルト値: 1                                                                                      
                        入力データタイプ:実数(倍)                                                                 
                                                                                                                              
  **SignalType:** クリーンな信号の種類                                                                               
                        クリーンなICAコンポーネントは、チャンネルにバックプロジェクトされます。 チャンネルをクリーンにしている場合, ICAの活性化    
                        クリーンなチャネルに基づいて再構築されます。                                                            
                        可能値:'コンポーネント','チャンネル お問い合わせ                                                              
                        デフォルト値 : 'コンポーネント お問い合わせ                                                                         
                        入力データ タイプ: 文字列                                                                               
                                                                                                                              
  **ChanCompIndices:** チャン/コンプリートのID                                                                           
                        入力範囲:無制限                                                                           
                        デフォルト値: 1:152                                                                                  
                        入力データタイプ: 貴重なMaatlab表現。                                                     
                                                                                                                              
  **スライドWinlength:** 滑走窓の長さ(秒)                                                                           
                        デフォルトはエポックの長さです。                                                                          
                        入力範囲: [0 4]                                                                                 
                        デフォルト値: 4                                                                                      
                        入力データタイプ:実数(倍)                                                                 
                                                                                                                              
  **スライドWinStep:** 滑走窓ステップ サイズ(秒)                                                                        
                        スライドウィンドウ間のオーバーラップの量を決定します。 デフォルトはウィンドウの長さです(なし)           
                        オーバーラップ)。                                                                                             
                        入力範囲: [0 4]                                                                                 
                        デフォルト値: 4                                                                                      
                        入力データタイプ:実数(倍)                                                                 
                                                                                                                              
  **SmoothingFactor:** 窓の重複の滑らかな要因                                                                       
                        隣接するスライド窓間の1つの平均(ほとんど)の線形スムースの価値。 Inf の値は   
                        滑らかになりません。 中間値は、隣接するウィンドウ間でシグモイダルスムースを作り出します。               
                        入力範囲:[1つのInf]                                                                               
                        デフォルト値: 100                                                                                    
                        入力データタイプ:実数(倍)                                                                 
                                                                                                                              
  **PaddingFactor:** FFTのパディングの要因                                                                                    
                        信号は滑走窓の長さより大きい2つの望ましい力にゼロパッドを入れられます。 ふりがな    
                        方式はNFFT = 2^nextpow2 (SlidingWinLen* (PadFactor+1)です。 例えば、SライディングWinLen = 500の場合、PadFactor = -1の場合、    
                        PadFactor = 0 なら、PadFactor = 1 なら、FFT を 512 ポイントに渡します。PadFactor=1 なら、1024 ポイントなどにパッドを入れます。                                                                                                  
                        入力範囲: [-1 インフ]                                                                              
                        デフォルト値: 2                                                                                      
                        入力データタイプ:実数(倍)                                                                 
                                                                                                                              
  **コンピューティングパワー:** 独自でクリーンなスペクトを可視化                                                                
                        元のきれいなスペクトル力は処理の端で計算され、視覚化します                             
                        入力範囲 : [true false]                                                                           
                        デフォルト値: true                                                                                      
                        入力データ タイプ: boolean                                                                              
                                                                                                                              
  **ノーマライズスペクトラム:** 期限切れでログスペクトラムを正規化(一般的に推奨されません)                                                                     
                        入力範囲 : [true false]                                                                            
                        デフォルト値: false                                                                                      
                        入力データ タイプ: boolean                                                                              
                                                                                                                              
  **VerboseOutput:** 動詞出力を生成する                                                                                
                        入力範囲 : [true false]                                                                           
                        デフォルト値: true                                                                                      
                        入力データ タイプ: boolean                                                                
                                                                                                                              
  **PlotFigures:** Plot 個人図                                                                               
                        処理中に各チャネル/コンプに対して、F-statistic、スペクトラムなどの数値を生成します。       
                        入力範囲 : [true false]                                                                            
                        デフォルト値: false                                                                                      
                        入力データ タイプ: boolean  
 
##  出力情報
  **EEG** クリーンEEGデータセット
  
  **Sorig**各コンポーネント/チャネルのためのオリジナルのマルチタッパースペクトル
  
  **Sclean**各コンポーネント/チャネルのための掃除された多重スペクトル
  
  **f** スペクトラムがSorig、Scleanで推定される周波数
  
  **amps** 各ウィンドウの副鼻腔線の複雑な広さ(ウィンドウのラインタイムシリーズは、周波数f{i}と複雑なシンノイドを作成することで再構築できます)
広さ amps{i})

  **freqs** 各ウィンドウ(セル配列)で行が削除された正確な周波数
  
  **g**** 変数構造。 関数呼び出しは、呼び出しで正確にレプリカすることができます >> クリーンライン(EEG、g);


# CleanLineのバージョン
V1 - Tim Mullenによるオリジナルバージョン

V2 - Arnaud DelormeとArnaud Delormeの統合によるケイ・ロビンスによる書き換えを含み、 
マコト宮越によるテスト





