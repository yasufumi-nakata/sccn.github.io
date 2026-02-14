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
基本的な EEGLAB 関数で使用される方法は簡単です。 とりあえず
数学の細部は参照のペーパーで与えられます[(Delormeおよび
2004年(平成16年))http://sccn.ucsd.edu/eeglab/download/eeglab_jnm03.pdf).
また、以下のEEGLAB(Youtubeでホストされている)で計算時間頻度分解に関するビデオの短いシリーズを見たい場合もあります。 右上のアイコンをクリックすると、プレイリスト内のすべての動画のリストが表示されます。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN2TAoLHVW5NvNmJtwiHurzw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></center>

ERSP および ITC の時間頻度分析
------------------------------

### 時間頻度画像
データエポックを抽出した後、チュートリアルデータセットをここで使用します。 選択する <span style="color: brown">ファイル → 既存のデータセットを読み込む</span> メニュー項目を選択し、EEGLABの「sample_data」フォルダにあるチュートリアルファイル「eeglab_data_epochs_ica.set」を選択します。 それから *Open*を押して下さい。

一時的な *event 関連の分裂、* または ERSP を検出するため、
[(1993年)](http://sccn.ucsd.edu/~scott/ersp93.html)
(パワースペクトラムのエベント関連シフト)と相互トリルコヒーレンス
(ITC)(event-related Phase-locking)イベントをepoched EEGLABのデータセットで、
選択する <span style="color: brown">Plot → 周波数変換 → チャネル時間頻度</span> 呼び出し [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) 機能。 お問い合わせ
*Channel 番号* の *14* (Cz) を入力してください。 他のデフォルトは残ります。 ※Ok*を押します。

デフォルト「Wavelet Cycles」エントリは*3 0.8*です。
*newtimef.m*関数のヘルプメッセージで説明したように、これは
データの量とフェーズを測定するために使用されるウェーブレット
各々の成功、重複する時間ウィンドウは3サイクルで始まります
ウェーブレット(ハニング加工窓付) '0.8' は
より高い周波数に使用される波紋のサイクルの数
引き続き、20%(1マイナス0.8)に達して、ゆっくりと拡大します。
同等なFFTウィンドウで最高の周波数でサイクルします。 お問い合わせ
測定される個々の時間/頻度窓の形を制御して下さい
結果の時間/頻度の関数そして形によって
パン。 

*注記:この情報は、最も低い周波数を設定しません。
分析される。 現在のデフォルトでは、最も低い周波数ウィンドウは約0.5です
秒の長さ。 0.5秒の3つの周期を使用して最も低い頻度を置きます
約6Hzまで分析 3Hz近くでこの最低の頻度を作るために、私達は
オプションの *newtimef.m* 引数 " 'winlen' を追加する必要があります。
xxx "xxx はデータのサンプリング速度 (また)
青色EEGLABメニューウィンドウに表示します。 これは、
最低の頻度の窓の長さ('winlen')はxxxのサンプルであるべきです
長い(例えば、1秒の長さ)。 1サイクル使用していた場合、最も低い頻度
1つのHzです。3つの周期を使うと、最低の頻度は3つのHzです。

![](/assets/images/newtimef1.png)

以下のウィンドウが表示されます。
 
 ![](/assets/images/newtimefplot1.png)

 - **トップイメージ**ショー
分光力におけるイベント関連の変化を意味します(事前刺激から)
ベースライン) エポックと各周波数(\<50)の間の毎回
Hz)。 これらの変更を詳しく調べるには、色画像をクリックします。
新しいウィンドウがポップアップ表示されます。 MATLAB ズーム機能でズームが可能
任意の時間/周波数ウィンドウ。 ERSPイメージは8Hzで約370msの電力を短く減少させます(クリック)
ズームインし、正確な周波数を決定する画像)、パワー増加
13.5 Hz で、300 ms で始まる。 より多くのスペクトル変化
20-28 Hzで発生します。 上のイメージに隣接する左のパネルはベースラインの平均電力スペクトルおよび
上部の画像の下部部分、ERSPの封筒(低いおよび高い平均dB)
値、ベースラインに相対的、エポックの各時間)。

- **より低いイメージ**は、すべてのInter-Trialコヒーレンス(ITC)を示しています
頻度。 以前は ITC に遭遇しました。 
[ERPイメージプロット](tutorials/08_Plot_data/Plotting_ERP_images.html)お問い合わせ 重要な ITC は
単一の試験で与えられた時間と頻度で EEG の活動
フェーズロック(フェーズランダムではなく)
時間連動実験イベント ここでは、ICT
約10Hzで簡単に増加(電力増加と同時に)
*upper パネル*で。 

ヘルプメッセージ 
[newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m)
 関数は、そのパラメータ、画像に関する情報が含まれています
そして、その意味を刻んだ曲線。

※注記:オプションのパラメータ*padratio*を変更して周波数解像度を増加させる場合があります。 例えば、*padratio*を*16*に置くと、かなり不必要な計算費で滑らかな一見のプロットを与えます。 

### 重要性のためのマスキング

選択する <span style="color: brown">Plot → チャネル時間頻度</span> そして、 
*Channel 番号* の *14* (Cz) を入力してください。 *Bootstrapで*.05*を使う
重要度*は、*FDRの正しい*チェックボックスを複数回確認します
False Discovery Rateメソッドを使用した比較(統計参照) [アレンデックス](/tutorials/ConceptsGuide/statistics_theory.html) 詳しくはこちら プレス *Ok*.

![](/assets/images/newtimef2.png)

以下のウィンドウが表示されます。
 
 ![](/assets/images/newtimefplot2.png)

 注意:
重要な ITC および ERSP を示す time/frequency ポイントは、
必ずしも同じです。 ERSP は、前のセクションで記述された領域の意義に達します。 しかし、ITCは重要性に達しません。 重要性を評価するために使用される方法は、ランダムなデータのシャッフルに基づいているので、これらの特徴の正確な意義の制限は若干異なる可能性があります。

### 時間頻度カーブ

時間頻度画像をプロットするだけでなく、プロットも可能
特定の周波数での時間頻度曲線。 選択する <span style="color: brown">Plot → チャネル時間頻度</span> そして、 
ログイン 
- ※1*(FPz) ※チャネル番号*
- *Frequency limit* 編集ボックスに *5 10 20* を入力し、 * 実際の freq.* を隣接するドロップダウンリストで使用してください。
- チェックボックス *各周波数の小ロットカーブ*

プレス *Ok*.

![](/assets/images/newtimef3.png)

以下のウィンドウが表示されます。
 
 ![](/assets/images/newtimefplot3.png)

 上記のプロットは、選択した周波数で時間を通してスペクトル電力とITCの変動を示しています。 このプロットフォーマットは、意味のためにマスクを許可しません。

高度な ERSP/ITC プロット
---------------------
単一の分析の頻度のスペクトルのperturbationsおよび
シングルエポックのチャンネル (いくつかの関連性によってソート)
値)は、使用してイメージすることができます。 [エルプイメージ。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) メニュー項目を選択するか <span style="color: brown">Plot → コンポーネント → チャネルERPイメージ</span>.

コマンドラインから呼び出される 
お問い合わせ [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) そして、 [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m) ルーチンは、その図の各部分のデータをMATLAB変数として返すことができます。 蓄積する
ERSP と ITC の画像 (さらに ERSP のベースラインと意義レベル)
すべてのチャネルのための情報)は使用を可能にします
別のツールボックスのルーチン, [tftopo.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=tftopo.m) (EEGLABメニューから現在使用不可) 詳細はこちら [EEGLABスクリプト作成](/tutorials/11_Scripting/) 詳細については、チュートリアル。



