---
layout: default
title: d. Time-Frequency
long_title: d. Time-Frequency decompositions
parent: 8. Plot data
grand_parent: Tutorials
---

時間/頻度分解
=================================

時間/頻度分析は、変化または過度を特徴付ける
窓付き副鼻腔の合計として考慮されるデータのスペクトルコンテンツ
関数(すなわち、副鼻腔の波紋)。 長い歴史と歴史がたくさんあります
時間/頻度分解のための方法の最近の開発。 
基本的な と と と
数学 で で で で で [ で
2004年(平成16年))http://sccn.ucsd.edu/eeglab/download/eeglab_jnm03.pdf).
また、EEGLAB(Youtubeでホストする)では、時間制限の頻度で、ビデオのパフォーマンスについて説明しています。 人気カテゴリー

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN2TAoLHVW5NvNmJtwiHurzw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></center>

ERSP および ITC の頻度分析
------------------------------

### 時間頻度画像
データエポックを抽出した後、チュートリアルデータセットをここで使用します。 選択する <span style="color: brown">ファイル → 既存のデータセットを読み込む</span> メニューの項目は、Eeglab_data_epochs_ica.set です。

一時的な 分 * *
[(1993年)](http://sccn.ucsd.edu/~scott/ersp93.html)
(パワースペクトラムのエベント関連シフト)と相互トリルコヒーレンス
(ITC)イベントをEEGLABデータセットに、
選択する <span style="color: brown">Plot → 周波数変換 → 温度調節</span> 呼び出し [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) 機能。 お問い合わせ
*Channel 番号* の *14* (Cz) は あります。 ※Ok* は です。

デフォルト「Wavelet Cycles」のエントリは*3 0.8*です。
*newtimef.m*関数のヘルプは、
データの量とフェーズを測定するために使用されるウェーブレット
各々の成功、重複する時間ウィンドウは3サイクルで始まります
ウェーブレット(ハニング加工窓付) '0.8' は
より高い周波数に使用される波紋のサイクルの数
引き続き、20%(1マイナス0.8)に達して、ゆっくりと拡大します。
同等なFFTのウィンドウで見る
測定される個々の時間/頻度窓の形を制御して下さい
結果の時間/頻度の関数そして形によって
パン。 

*注記:この情報は、最も低い周波数を設定しません。
分析される。 現在のデフォルトでは、最も低い周波数ウィンドウは約0.5です
秒の長さ。 0.5秒の3つの周期を使用して最も低い頻度を置きます
3Hzの今のところは、この瞬間に、
*newtimef.m* の 'winlen' の 'winlen' の ' の 'winlen' の ' の ' を 'newtimef.m* の ' に 'winlen' の ' の ' の ' を ' の ' に ' の ' の の ' が 'newtimef.m* の の は 'winlen' の です。
xxx "xxx は また
青色EEGLABメニューウィンドウに表示します。
最少の頻度のウィンドウ('winlen') は、XXX のウィンドウ
長い(例えば、1秒の長さ)。 1サイクル使用していた場合、最も低い頻度
3つの共通点は、 お問い合わせ

![](/assets/images/newtimef1.png)

以下のウィンドウが表示されます。
 
 ![](/assets/images/newtimefplot1.png)

 - **トップイメージ**ショー
分光力におけるイベント関連の変化を意味します(事前刺激から)
ベースライン) エポックと各周波数(\<50)の間の毎回
映像を撮る
新しいウィンドウが開きます。 MATLAB の新機能
ERP は、8Hz で約370ms の パワーを 変換する ( )
ズームインし、正確な周波数を決定する画像)、パワー増加
13.5の Hz で、300 ms で開始します。
20-28 Hzの 左腕は、
の画像の部分、ERSPの点(および高いパーキーdB)
値、ベースラインに相対的、エポックの各時間)。

- より深い**のは、すべてのInter-Trialコヒーレンス(ITC)です。
ITC は、 
[ERPプロサイン](tutorials/08_Plot_data/Plotting_ERP_images.html)お問い合わせ
EEGでの試験時間と頻度
フェーズロック(フェーズランダムではなく)
ICT活用事例
最近の投稿
*upper では 

ヘルプメッセージ 
[newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m)
 関数は、そのパラメータ、画像に関する情報が含まれています
そして、その意味を刻んだ曲線。

※注記:オプションのパラメータ*padratio*の周波数は、現在進行中です。  例えば * * * * の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の 

### 重要性のためのマスキング

選択する <span style="color: brown">Plot → 頻度</span> そして、 
*Channel 番号* の *14* (Cz) の . *Bootstrapで*.05* の .
重要度* は、*FDR の項目* に必須項目です。
False ディスカバリー レート メソッド 比較( 統計参照) [アレンデックス](/tutorials/ConceptsGuide/statistics_theory.html) 詳しくはこちら

![](/assets/images/newtimef2.png)

以下のウィンドウが表示されます。
 
 ![](/assets/images/newtimefplot2.png)

 注意:
ITC および ERSP の出典は、
お問い合わせ は、事前にコメントを受け付けております。 しかし、ITC は重要性を兼ね備えています。 重要性を重視するのは、 重要性を満たすのが現状です。

### 時間頻度カーブ

時間頻度画像をプロットするだけでなく、プロットも可能
特定の周波数での時間頻度曲線。 選択する <span style="color: brown">Plot → 頻度</span> そして、 
ログイン 
- ※1*(FPz) ※半角数字
- *5 10 20* に *5 10 * に , * に . * とりあえずは、
- チェックボックス *各周波数の小ロットカーブ*

プレス *Ok*.

![](/assets/images/newtimef3.png)

以下のウィンドウが表示されます。
 
 ![](/assets/images/newtimefplot3.png)

 上記の で で で で で で で で で で で で で で の で で で で で の の の の の の の の の の の の の の の の の の の の で で で で で で の で で の の の の の の の の の の このサイトについて

ERP/ITC プロット
---------------------
単一の の の
シングルエポックのチャンネル (いくつかの関連性によってソート)
値)は、使用してイメージすることができます。 [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) メニュー項目を選択するか <span style="color: brown">Plot → コンポーネント →</span>.

コマンドラインから呼び出される 
お問い合わせ [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) そして、 [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m) その その として として として として
ERSP と ITC の画像 (さらに ERSP のベース ライン と パフォーマンス )
すべてのチャネルのための情報)は使用を可能にします
別のツールボックスのルーチン, [tftopo.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=tftopo.m) (EEGLABメニューから使用可能) [EEGLAB の作成](/tutorials/11_Scripting/) 詳細については、チュートリアル。



