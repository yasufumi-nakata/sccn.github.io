---
layout: default
title: b. ERP-image
long_title: b. ERP-image
parent: 8. Plot data
grand_parent: Tutorials
---
サイトマップ
====================

データの収集は、データの動的情報、無視を遮断します。
大きく である である である である
脳 * * * * * * * * * * *
シングルトライアルのコレクション, 任意の多くの可能性関連でソート
変数。 ERP-image では、EEG のデータエポック (trials) は、 並行して実行します。
関連する寸法(例えば、被写体反応時間、内部致命的
スタットパワーレベル、特定のレイテンシーウィンドウ、アルファフェーズの電圧を意味します
stimulusのオンセット、または等で、
隣接する試行と、ついに2次元で色分けして視覚化
このページではjavascriptを使用しています。 [コンセプトガイド](ConceptsGuide/erp_image_background.html). 

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

基本的なプロットオプション
-----------------------
データエポックを抽出した後、チュートリアルデータセットをここで使用します。 選択する <span style="color: brown">ファイル → 既存のデータセットを読み込む</span>  メニューの項目は、Eeglab_data_epochs_ica.set です。
ERPをプロットする, チュートリアル
ERPをプロットする このチュートリアルでは、*POz* occipital のチャンネル (In27) のチャンネルを占有しています。

### プロット

選択する <span style="color: brown"> Plot → 空想</span>お問い合わせ お問い合わせ
ピックアップ [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) ウィンドウ(下)。 

チャンネル番号(27 または "..." ) 、 チャンネル *POz*) 、 *1* の 試行錯誤値、 *Ok* 詳しくはこちら

![](/assets/images/I82pop_erpimage.jpg)


ERPは、あらゆる方向のカラーイメージです。
ラインは単一の実験試験(または)で起こる活動を表します
隣接する単一試験の垂直移動平均)。 上記各々のカラーシーケンス線を重ねることにより、すべての試験
データセット、ERPImage は、 [アレンデックス](/tutorials/ConceptsGuide/erp_image_background.html) ERP画像の構成要素

標準で [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) 出力図(下)、ERPの最終工程
サイトマップ
イメージしたデータのエポックの平均。 

ヘッドプロット(左上)を含む
赤い点は、選択したチャンネルの位置を示す
モンタージュ。 これらのプロット機能(他のいくつか)のどちらもできます
オンオフ [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) ウィンドウ(above)
チェックボックス *plot ERP* と *plot scalp map* を 設定します。


![](/assets/images/1ERPimagesmooth.gif)


シングルトライアルのアクティビティには様々なバリエーションがありますので、
隣接する試験を横断する活動(口頭)を滑らかにするのに有用
四角形(箱車)の移動平均を使用して。

### プロット

繰り返しコールアップ [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) インタラクティブなウィンドウと
*1*の代わりに*10*に滑らかな幅を置いて下さい。 今(以下参照)です
単一の試験でドミナントのアルファバンド発振を簡単に確認できます。

*注記: 利用可能なオプションの数が多いため、パラメーター
最後の呼び出しから (もしあれば) はデフォルトとしてリコールされます (オプションとして)
テキストボックスで入力した引数はそのままです。 
体験してみると
この機能は、 MATLABの*\>\>eegh(0)*を入力してください。
コマンドラインで履歴をクリアします。


![](/assets/images/1ERPimage27.gif)

*ERP画像は、お試し用版です。 多数の を を
水平線として各(スムース)の試験。 (スクリーンおよび/またはプリンター)
解像度は、それらをすべて表示するのに不十分な場合があります)。 減らすために
イメージング遅延(および保存されたプロットファイルサイズを減らすために)、1つはできます
ERP-image行を解読します。 *4*入力
*Downsampling*箱の [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) ウィンドウは
decimate(reduce)の要素によって
*4*. *Smoothing* 側は(注)*2\*4より大きい場合=
8*は、滑らかなイメージから情報が失われません。
サンプルデータセットをイメージするには、解読する必要はありません。
比較的少ないので (83) 試験.

作品紹介
----------------------------------------------

このページではjavascriptを使用しています。
実験中に起こる順序。 可能です。
イベントフィールドとしてコードされている他の変数の順にそれらをソートする
データセット内の各試験に所在します。

Altogether,5 別の方法
*erpimage.m* は、*erpimage.m* は、
- フィルタ変数 (*sortvar* ) で フィルタ変数(例えば、RT) の入力項目の試行(epochs) を呼び出します。
お問い合わせ
-   値(*valsort*)でオプションを呼び出します。
    ウィンドウの値は ERPでこのオプション
    サイズ(ただし、インタラクティブウィンドウでは選択できません)。
-   は で で で で で で
    指定された周波数および時間における分光度または電力
    ウィンドウ。 このオプションは、P300 のオプションです。
    アルファ振幅でソート(オプションはまだ使用できません)
    インタラクティブウィンドウ)。
-   * * で で で で で
    指定された時間/周波数ウィンドウのフェーズ。
-   (*nosort* command-lineオプション). . .
    入力です。

以下では、応答時間イベントレイテンシー(反応時間)の順に同じ試行を並べ替えることを示しています。

### 反応時間による試行のソート

メニュー項目を使用する <span style="color: brown"> Plot → 空想</span> コールする [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) 再びウィンドウ:
- お問い合わせ *Epoch-sorting フィールド*、および *latency* 。 
- お問い合わせ *イベントタイプ*、および*rt*。 
- ※イベント時間
*-200 800* ms 対象 * は、
stimulusのオンセット。

結果のERP画像は、
*rt* イベントの*latency* は、
*rt* イベント/エポック 
もしそうでなければ、 [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m)
エポックでプロットする
 
 

![](/assets/images/ERPimagelatency.gif)

*注記*:これと他のインタラクティブなポップアップウィンドウで、保持
テキスト入力ボックスの上のラベル上のマウスカーソル数秒
説明コメントをポップアップします。

今、 [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) 下の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の
によって。

![](/assets/images/1ERPimagelatency.gif)

一般に、ユーザーはイベントフィールドの値にソートできます。

例えば、コールバック [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) ウィンドウ、プレス
*Epoch-sorting Field*は、
*レイテンシー* *イベントタイプ*ボックスから* rt* まで
*Rescale*の箱。出版物*Ok*。 

の 結果 プロット の, は stimulus によって stimulus
または2、ポスト刺激空間に合うように自動的に正規化された値
ディスプレイ用) 円滑な幅(10)は両方に適用されることに注意してください
対称変数 へ。
低い(1)および高い(2)の分類変数を接続する斜めライン
地域。

*注記*: MATLABのコンセプト
変数 explicitly (参照) [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) お問い合わせ


![](/assets/images/1ERPimageposition.gif)

### *アライナ*

*rt* イベントの*latency*は、
変数(*Epoch-sorting field*) ボタンの構成要素*latency*
※イベントタイプは必須です。
※Rescale*(else、応急自動正規化)

*Align* の項目は必須項目です。
変数をソート(その反応時間)と変更時間制限。
*Align* では、レイシの値が時間指定されます。
0.

試行値の中央値を選択する(ここでは、中央値)
反応時間) 新規時間 0 を指定する (これは、
応答時間は、メディアの反応時間をマイナスします)、私たちの慣習は、
このボックスに無限(*Inf*)のMATLABを実装しています。
異なる値を設定したい(例えば、プロット中)
1つのテーマは、
最近の投稿
*Align*の入力欄に入力して下さい。

*注記*: データのエポックの一時的な再配列、互いに相対的、
左下と右上隅に不足しているデータが発生します。
ERP-image は、ERP-image の関数は、Green(0) とshow です。
*NaN*s (MATLAB の no-a-number) は、


![](/assets/images/1ERPimageinfedit.gif)


ERPacts(以下)は、
約400 ms の s の
応答、および曲がる縦ライン、その時
各試験で刺激が贈られました。 下の図を比較してみる
とりあえず、RatshoerP をイメージ。


![](/assets/images/1ERPimageinf.gif)


### EEG の値を調べる
お問い合わせ [2004](http://www.sccn.ucsd.edu/papers/TICS04.html) 出版物、私達は論議しました
交通アクセス
いくつかのイベントのいくつかのクラスにタイムロックされたエポックは、制限されていません
タイムロックされた試験平均の特徴で完全に表現されるか、
イベント関連イベント(ERP)は、宇宙飛行士、宇宙飛行士、宇宙飛行士などです。

試行を試行してみる
*rt* は、
シンプル シンプル シンプル シンプル


これを行うには、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) ウィンドウから
メニュー:
- *時間保証(ms)*の横*-200 800*の項目に
stimulusのオンセット
- *Epoch-sorting field*、*Event type(s)*、*Align*の入力*Sort/alignの構成要素をクリア

次の 次の 次の
- ※相→周波数*:*10* (Hz) 試験 
- ※2 は、英語のみの対応となります。 

![](/assets/images/I84pop_erpimage.jpg)


以下は、ERPイメージファイルです。


![](/assets/images/1ERPimage10.gif)


刺激が斜めの赤いストライプをオンセットする前に活動がであることに注意してください
段階の分類によって作り出される:フェーズ(すなわち、波の潜伏
ピークス)は、再ソートされたトライアル全体に均一に配布されます。

自転車10Hzの音をそのままに、
毎  0  0  0  0
(例:100msの3 10Hzのサイクル)、-150から拡張
ms から 150 ms まで。各試験に合格し、
の順に試行してみる
最近の投稿
サーカ 10Hz の 試行錯誤
します を
このビューで明らかな隣接する試験の間。

武蔵小松
異なる時間と周波数ウィンドウを使用して異なるパスを表します
 私たちは  私たちは  私たちは  私たちは  私たちは  私たちは の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の
ウィンドウ。 結果は選択した強度に依存します
データ内の頻度、特にその量の運動量(すなわち、
データがこの周波数で長いバーストを展示しました。
フェーズロック(またはない)を実験的なイベントに。 

より明確に並べ替えるフェーズを見るには、同じ設定を維持しますが、
今回は、*50* で入力してください。 無視する試み*。 お問い合わせ
パワーで試用回数の50%
タイムウィンドウは拒否されます。他の40トライアルのみ(大文字50%)
画像をイメージします。 ここで(下)、私たちはより良いアルファ波の見方を見ることができます
刺激に従って再同期するようです。 時間 0 の前に、アルファ
段階はより少し任意です(均一に分配される)、およびあります
パーキープで少しずつ。200ms、アルファ活動
(パート)
P400 ERPは、



![](/assets/images/1ERPimage1050.gif)


フェーズを代表するこれらの試験の私達の解釈(平均)
視覚的な印象だけに基づく同期の必要性。 お問い合わせ
アルファ活動が部分的に再同期されるかどうかを統計的に評価して下さい
stimuli(stimuli), 部分真鍮, カスタマイズ
段階の一貫性(または段階閉鎖の要因) 刺激の順序間の
そしてポスト刺激データ。 

この測定値、*Inter-Trial Coherence
(ITC)* 用語集は 0 と 1 の 値が あります。1 の 値が あります。
ウィンドウ の の の の の の の の
このレイテンシウィンドウは、すべての試験で定数です。 0 の値は
すべての試験のフェーズ値が均一に分散されるとき
単位の円。 練習では、0よりも若干大きい値が期待されます
ランダムな位相分布試験の任意の有限数。

Plotting インタートライアルコヒーレンス ERP 
------------------------------------------

Inter-Trial Coherence (ITC) は、詳細を記述しています。 [時間頻度分解セクション](/tutorials/08_Plot_data/Time-Frequency_decomposition.html) チュートリアルとオンラインチュートリアルで。

ERP-image の図を ITC にプロットする
次のパラメーター [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) ウィンドウ:
- ???????????????????????????????????????????????????????????????????????????????????????????????????????????????
- ※相差→周波数*による相続試験 ※9 11*
- *Inter-TrialCoherence →の頻度*箱の*9の11*の顧客
- *Signif で *0.01* が あります。
※NOT*は、複数の修正を行いました。

Ok* は、

これらの2つのエントリは等しい必要があります(実際にはウィンドウ
ユーザが異なる値を入力するのを防ぎます。 エントリー
1つの頻度(例えば、*10*の前に)の代りの頻度範囲は指示します
[m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) 最大電力でデータ頻度を見つける
入力データ(9～11Hz)


![](/assets/images/I84pop_erpimage2.jpg)


次のウィンドウが作成されます。


![](/assets/images/I84Coher_freq.jpg)


ERPPanel(&micro;V)は、ERPPanel(&micro;V)を発売しました。
ショー ショー ショー ショー ショー * 必須
ログイン 青の領域は1%
ランダムなデータから描画された代理データによると、自信の限界
ベースラインの窓。 ここでは、選択した周波数で電力 (10.12)
Hz は、epo に python に s を s から s へ s へ s へ s へ s へ s から s へ s へ s へ s から s へ s へ s へ s へ s へ s s へ s s へ s s へ s s s へ s s s s s s s へ s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s  

数字
*25.93 dB*のベース ラインの絶対的な
ベースラインパワーレベル。 結果を比較するには、この値を設定するのに役立ちます
ウィンドウで見る

最近の投稿 コヒーレント
(ITC)、試験の相の度を合成
stimulusの現在のところ。 値 *10.12 Hz* は、次のようになります。
選択した分析周波数。 相同期化が進む
より 約 約 約 約
ミリ秒

*注記*:ICCの重要度は、より早くなります。
ソリューション また、CICC、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、CRE、C、CRET、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、COR、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、CORD、

ERP Prott では、このサイトについて詳しく説明しています。 
[アレンデックス](/tutorials/ConceptsGuide/erp_image_background.html)

Plottings of Plottings and Plottings and Plottings and Plottings and Plottings and Plottings and Plottings and Plottings and Plottings and Plottings and Plottings, Plottings, Plottings, Plottings, Plottings, Plottings, Plottings, Plottings, Plottings, Plottings, Plotting, Plottings, Plottings, Plottings, Plottings, Plottings, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plotting, Plot
--------------------------------------------------------------------
他にもいくつかあります [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) オプション
以下の例で簡単に説明する: 

- *イメージアンプ*エントリー [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) ウィンドウはイメージの広さを可能にしました
シグナル(関心の頻度)を単一の試験で、代わりに
生の信号自体。 チェックボックス 
- *Plot の は、Plot の は、Plot の に あります。
プロフィール *2 50* を入力すると、この周波数の制限が指定されます。
グラフ。
- *Epoch-sorting field* を *latency* に置き換えてください。
お問い合わせ 
- *マークタイム*の下の*500*をプロットするために入れて下さい
500 ms の 縦 の 印 (illustrative 目的 )
- * 500 1500* の現在の* の制限時間* の
ウィンドウ
- *3*を*に*Amplitudeの限界(dB)付属品*。

![](/assets/images/I85pop_erpimage.jpg)

ふりがな [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) 下の図が現れます。

![](/assets/images/I85erpimage.jpg)


