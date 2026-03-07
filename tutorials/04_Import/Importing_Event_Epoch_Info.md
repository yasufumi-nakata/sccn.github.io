---
layout: default
title: b. Events
nav_title: "b. イベント"
long_title: b. Events
parent: 4. Import data
grand_parent: Tutorials
---
イベントやエポック情報のインポートと管理
===========

このチュートリアルでは、EEGLABでイベント情報の変更、選択、および管理方法を説明します。

EEGLABは、実験イベントの情報をMATLABの構造体配列 *EEG.event* に格納します。さらに、元のイベント情報は *EEG.urevent*（「ur」はドイツ語で「元の」という意味）に保存されます。これにより、データからいくつかのイベントが拒否された後でも、イベントの *context*（前後関係）に基づいてイベントを選択できます（チュートリアルのイベントスクリプトセクションを参照）。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

イベントのインポート
------------

選択する <span style="color: brown">ファイル → インポートイベント情報</span> メニュー項目。 イベントをインポートするさまざまな方法は以下のとおりです。

### データチャネルからのイベントのインポート

実験的なイベントに関する情報は、しばしば1つに記録されます
EEGデータ行の行(チャンネル)。
データをシミュレートし、データチャネルからイベントをインポートする方法を説明します。
EEG のデータセットを 33 行 (チャンネル) と 仮定, その後、その
32 はデータ チャネルであり、最後の (33) は値 1 のでき事チャネルです
(stimulus onset), 2 (subject response), 0 (Other). MATLABコード
そのようなデータを生成する(テスト、コピー、コードを貼り付ける)
MATLAB について

```matlab
eeglab
eegdata = rand(32, 256*100); % 32 channels of random activity (100 s sampled at 256 Hz).
eegdata(33,[10:256:256*100]) = 1; % simulating a stimulus onset every second
eegdata(33,[100:256:256*100]+round(rand*128)) = 2; % simulating reaction times about 500 ms after stimulus onsets
```

MATLABにコピーする、eegdata*をエクスポートする
EEGLABにテストデータセット <span style="color: brown">ファイル → インポートデータ →
ASCII/floatファイル MATLAB は、</span> メニュー項目, 選択
<span style="color: brown">ファイル → インポートイベント情報 → データから
チャンネル</span> 関数を呼び出すためのメニュー項目 [ポップ_chanevent.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanevent.m) .

![Ii21pop_chanevent.jpg](/assets/images/II21pop_chanevent.jpg)

*33*はイベントのチャンネルに必須項目です。 特許出願中
(トップ)* (注記: テキストにマウスを置く * 変換 抽出する*
コンテキストヘルプメッセージが表示されます。

*Ok* を押すと、EEGLABがテストデータからイベントを抽出します。メニュー項目を選択 <span style="color: brown">編集 → イベント
バリュー</span> インポートされたイベントタイプとレイテンシーを検査します。

### MATLABをビルドするか、 テキストファイル をインポートする

新着情報
テキストファイル
[チュートリアル_eventtable.txt](http://sccn.ucsd.edu/eeglab/download/tutorial_eventtable.txt).
このテキストファイルは3つの列で構成され、最初に含まれている
イベントの遅延(秒)、イベントの2番目のタイプ、および
イベントを記述する3番目のパラメータ(例えば、刺激位置)。 たとえば、そのようなファイルの先頭行は次のようになります。

<table>
<tr>
<td><strong>オンセット</strong></td>
<td><strong>タイプ:</strong></td>
<td><strong>ポジション</strong></td>
</tr>
<tr>
<td>1</td>
<td>ターゲット</td>
<td>1</td>
</tr>
<tr>
<td>2.3047</td>
<td>フィードバック</td>
<td>1</td>
</tr>
<tr>
<td>3</td>
<td>ターゲット</td>
<td>2</td>
</tr>
<tr>
<td>4.7707</td>
<td>フィードバック</td>
<td>2</td>
</tr>
<tr>
<td>5</td>
<td>ターゲット</td>
<td>1</td>
</tr>
<tr>
<td>6.5979</td>
<td>フィードバック</td>
<td>1</td>
</tr>
<tr>
<td>...</td>
<td>...</td>
<td>...</td>
</tr>
</table>

メニュー項目を選択 <span style="color: brown">ファイル → インポートイベント情報 → インポート
MATLAB または ASCII ファイル</span>

![こちら](/assets/images/pop_importevent.png)

チュートリアルテキストファイルのためにブラウズ [チュートリアル_eventtable.txt](http://sccn.ucsd.edu/eeglab/download/tutorial_eventtable.txt)ヘッダー行数を 1 に設定します。
(ファイルの最初の行では、列フィールド名を与えます)
入力フィールド(すなわち、列に関連付けられている名前を)設定します。
配列を *latency type position* に設定します。フィールド名はスペースまたはコンマで区切ります。フィールドのうち2つは *latency* と *type* でなければなりません。EEGLABはこれらのフィールドを認識して適切に処理します。MATLABの配列からイベント情報をインポートすることも可能です。
このウィンドウでは、 *イベントインデックス*とチェックボックス
*イベントを追加しますか?* は、既存のイベントを置換するのではなく新しいイベントを追加するために使用されます。複数のイベントファイルからイベントをインポートする場合に便利です。

#### イベントの整列に関する重要な注意

上記の必須入力は、*データイベントへのイベントレイテンシーを一元化*です。
既存のイベントレイテンシに最初のイベントレイテンシを揃え、チェック
*NaN*(MATLAB)の数値
このオプションは無視されます(上記の例のように)。
しかしながら、EEGが保存された基本イベントは、
イベントチャンネル(上記データチャネルからのインポートイベント参照)
インスタンス。 詳細なイベント情報はテキストに別々に記録されます
そこで、このイベントは、
EEGイベントと整列

*データイベントへのイベントレイテンシを整列* オプションでは、テキストファイルの最初のイベントがEEG記録中の最初のイベントに対応する場合、この値を1に設定します。テキストファイルのイベント1がEEGの対応するイベントに整列されます。この値は、テキストファイルのイベントがEEG記録のどのイベントから開始するかを示すためにも使用できます。

イベントを整列するときは、次のセクションに示すように、関数
2つのイベントタイプのレイテンシーが表示されますので、ユーザーは確認することができます
実験の知識に基づいて整列されていること(のために)
たとえば、テキストファイルに記録されるよりも多くのイベントがあるかもしれません。
EEG(エッグ)
最後のチェックボックスは、新しいイベントのサンプリングレートを自動的に調整するので、最も近い古いイベントと整列します。 これは、重要なにつながる可能性があるサンプリング速度の小さな違いを修正することができます
実験の終了による差(例えば、0.01%のクロック差は1時間後に360ミリ秒の差をもたらす)
修正)。

### プレゼンテーションファイルからイベントをインポートする

EEGLAB は、EEGLAB のソフトウェアの保存を行ないます。
サンプルファイルはこちらからダウンロードできます:
[TEST.SMA](http://sccn.ucsd.edu/eeglab/download/TEST.SMA)（SnapMasterデータファイル）および
[TEST.LOG](http://sccn.ucsd.edu/eeglab/download/TEST.LOG)（Presentationイベントログファイル）。

まずSMAデータファイルを、メニュー項目 <span style="color: brown">ファイル → インポート → .SMAデータファイル</span> を使用してインポートします。それから選択して下さい <span style="color: brown">ファイル → インポートイベント情報 →
プレゼンテーションログファイルから</span> イベントをインポートする
以下に示すようにプレゼンテーションログファイル</span>



![こちら](/assets/images/load_presentation_file.png)



その後、次のウィンドウがポップアップ表示されます</span>


![Pop_importpres2.jpg _ プロフィール](/assets/images/Pop_importpres2.jpg)

フィールドをスクロールして、どのフィールド(すなわち、ファイル列)が含まれているかを選択します。
イベントタイプとイベントレイテンシを含むカラム。 デフォルト値が適切です。MATLABコマンドウィンドウに以下のように表示されます。

```matlab
Replacing field 'Event Type' by 'type' for EEGLAB compatibility
Replacing field 'Time' by 'latency' for EEGLAB compatibility
Renaming second 'Uncertainty' field
Reading file (lines): 6
Check alignment between pre-existing (old) and loaded event latencies:
Old event latencies (10 first): 10789 21315 31375 41902 51962 62489 ...
New event latencies (10 first): 10789 21315 31376 41902 51963 62489 ...
Best sampling rate ratio found is 0.9999895. Below latencies after adjustment
Old event latencies (10 first): 10789 21315 31376 41902 51963 62488 ...
New event latencies (10 first): 10789 21315 31375 41902 51962 62489 ...
Pop_importevent warning: 0/6 have no latency and were removed
eeg_checkset: value format of event field 'Duration' made uniform
eeg_checkset: value format of event field 'Uncertainty2' made uniform
eeg_checkset note: creating the original event table (EEG.urevent)
Done.
```

プレゼンテーションで記録された最初のイベントレイテンシを揃える機能
SnapMasterでEEGの記録が公開されました
ファイル。 SnapMasterファイルに記録された最初のイベントに整列させます。関数は最適なサンプリングレート比を計算します。これは
見本抽出率の小さい相違のために大きいにつながることができます
実験終了時の差(例:0.01%クロック差)
1時間半に360ミリ秒の差が出ます。
修正されていない場合）。イベントがバイナリEEGファイルに対してシフトされている場合は、手動でイベントやPresentationファイルをテキストファイルとしてインポートしてください（前のセクションで説明）。Presentationファイルの末尾にコメントが含まれている場合、インポートに失敗することがあります。インポートが失敗した場合は、ファイル末尾のコメントを削除してみてください。それでもうまくいかない場合は、Presentationファイルをテキストファイルとして前のセクションの方法でインポートしてください。

注意: プレゼンテーションファイルには、より多くのイベント(反応時間など)が含まれています。
生EEGデータファイルに含まれるイベントよりも多くのイベントが含まれている場合があります。イベントが整列されると、自動的に重複するイベントが削除されます。

### E-Primeについて

E-prime は、 アスキー
データをインポートするためのインポーター。 利用する <span style="color: brown">ファイル → インポートイベント情報 →
E-Prime ASCIIファイルから</span> メニュー項目は、呼び出しと同じです <span style="color: brown">株式情報 → ASCII/floatファイルまたは MATLAB は、</span> メニュー項目。 設定する
E-Prime 列のディレクトリは、 E-Prime は、
たとえば、スプレッドシートアプリケーションで)、列の一部を編集する
MATLABでは、
E-Primeファイル (sccn.ucsd.edu の eeglab で) は、ASCII が正常に実行されます。
メニュー

### DAT情報通信

DATファイル [TEST.DAT](http://sccn.ucsd.edu/eeglab/download/TEST.DAT) は関連する [TEST.CNT](http://sccn.ucsd.edu/eeglab/download/TEST.CNT) ファイルに対応しています。DATファイルにはイベント情報が含まれています。まずNeuroscanのCNTファイルを <span style="color: brown">ファイル → インポート → Neuroscan .CNTファイル</span> メニューからインポートし、<span style="color: brown">ツール → エポック抽出</span> を使用してエポック化します。インポートするファイルを選択すると、以下のウィンドウが表示されます。

![こちら](/assets/images/Pop_loaddat.gif)

.DATファイルでは、
エポック。 しかし、実験設計によっては反応がない場合もございます。
特定のエポックの時間。 その後、反応のためにコード値を使用する必要があります
これらのエポックの時間レイテンシー。 例えば、
*1000*（ms）のように、被験者が応答しなかった場合のコード値を設定する必要があります。実験のすべてのエポックがすでに反応時間を持っている場合は、この設定は不要です。

### EEGLABにEPOC情報(MATLABの配列やテキストファイル)をエクスポート

エポック情報は、EEGデータとは別にMATLAB配列やテキストファイルからインポートできます。エポック情報ファイルでは、各エポックに1つのエントリがあります。このようなファイルや配列のインポート方法を示すため、シミュレートされたEEGデータを作成します。

```matlab
eegdata = rand(32, 256, 10); % 32 channels, 256 time points per epoch, 10 epochs
```

メニュー項目 <span style="color: brown">ファイル→ インポートデータ→ ASCII/floatデータ または MATLAB配列</span> を選択します。参照して下さい [前のセクション](http://localhost:4000/tutorials/Import/Importing_Continuous_and_Epoched_Data.html) チュートリアルの。 

MATLABの3D配列はデータエポックとして自動的にインポートされます。最初の次元はデータチャネル、2番目はデータポイント、3番目は試行（エポック）として解釈されます。例えば、上記の32チャネル、256サンプル、10エポックのシミュレーションデータからイベント情報を追加する場合、各エポックのstimulus/responseが正解（'correct'）か不正解（'wrong'）か、
'wrong' と ミリ秒 で 録画応答 レイシー。
イベントファイルは次のようになります。

<table>
<tr>
<td><strong>エポック</strong></td>
<td><strong>フィードバック</strong></td>
<td><strong>レスポンス_レイテンシー</strong></td>
</tr>
<tr>
<td>1</td>
<td>correct</td>
<td>502</td>
</tr>
<tr>
<td>2</td>
<td>correct</td>
<td>477</td>
</tr>
<tr>
<td>3</td>
<td>correct</td>
<td>553</td>
</tr>
<tr>
<td>4</td>
<td>correct</td>
<td>612</td>
</tr>
<tr>
<td>5</td>
<td>wrong</td>
<td>430</td>
</tr>
<tr>
<td>...</td>
<td>...</td>
<td>...</td>
</tr>
</table>

このファイル [チュートリアル_epoch.txt](http://sccn.ucsd.edu/eeglab/download/tutorial_epoch.txt) かもしれません
ダウンロード(またはテキストファイル内の上の配列からコピー) それから選択して下さい
メニュー項目 <span style="color: brown">ファイル → epoch 情報 → MATLAB から
array または ascii ファイル</span>, 次のウィンドウを上げます:

![Ii33pop_inportepoch.jpg](/assets/images/II33pop_inportepoch.jpg)


は、*tutorial_epoch.txt*を参照して、フィールドに入力してください。
*epochrt*(rtは'reaction time'の頭字語です)。ふりがな
レイテン インフォメーション
*Field名(s)を入力して入力してください。
このファイルは1つのヘッダの行程です。
無視 * * *
最後に、反応時間はミリ秒で記録されます。
*1E-3*(例:第2回第1位)
最後のエントリ, *古いepoch 削除 ...*, 元の投稿
*Ok* は、
<span style="color: brown">編集 → イベントの値</span> メニュー項目を使用して、何が変更されたかを確認します
反応時間情報に起こった(矢印を使用して移動します)
第2イベント:

![Ii33pop_editeventvals.jpg _ 公式サイト](/assets/images/II33pop_editeventvals.jpg)

上記のインポートが完了すると、各エポックに *rt* イベントが作成されます。
レイテンシ情報を含む列、関数は作成されます
いくつかのタイプ。 試行回数(10、この場合は、
EEGデータセットで試用してみる
"eegdata" 変数を呼び出します。

注意: 便宜上、標準のエポック情報は
変数 *EEG.epoch* の現在のところ。 イベント
*EEG.event* 構造体に格納されており、コマンドラインでの処理に使用されます。詳細はイベントスクリプトの書き込みを参照してください。
詳細については、チュートリアル。

イベントの管理
------------------------

現在のセクションでは、イベントの処理に精通するのに役立つはずです
EEGLABでのイベント処理方法を説明します。
データを削除する関数()[pop_eegplot.m 関数](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_eegplot.m), 
[選択する](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_select.m)) また、中に発生するイベントも削除します
削除されたデータ(その対応するイベントではない)。
連続データを処理する機能([pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m),
[pop_resample.m 関数](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_resample.m), [pop_mergeset.m 関数](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_mergeset.m)) 取ります
'boundary' イベント (EEGLAB が追加データイベント)
削除されたデータの部分または「ハード」境界
統合データセット. イベント *type* フィールドは,データエポックを解析する,ERP-imageのプロットイベントを. [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) 機能。 最後に、グループレベルの解析にイベント情報を広く利用しています。

### プロットイベント

チュートリアルデータセット *eeglab_data.set* を *sample_data* フォルダから <span style="color: brown">ファイル → ロードデータセット</span> メニュー項目で読み込みます。次に、<span style="color: brown">プロット → データ（スクロール）</span> メニュー項目でデータと関連イベントを視覚化します。

![](/assets/images/Scroll_raw_data.png)

イベントは縦線として表示されます。 異なるイベントタイプが表示されます。
異なった色。 ボタン ※イベントタイプ*はイベントの一覧が表示されます。
このデータセットの型

### 認定イベントフィールド

EEGイベントのレポート
データが記録されたときに発生しました。 見るために
イベントの情報は、 <span style="color: brown">編集 → イベント
バリュー</span> メニュー項目(前のステップでインポートされたチュートリアルデータセットのイベントを示す下のウィンドウを参照してください)。

![](/assets/images/V1pop_editeventvals.png)

*type* と *latency* は、EEGLABの必須イベントフィールドです（以下参照）。これらの
イベントのプロット、トライアルのソートなどのためのフィールド (注)1つでも可
これらのフィールドを欠いているプロセスイベントは、この強く制限しますが、
イベント処理の可能性の範囲 他の分野を含む
*epoch*、*duration*、*urevent* はEEGLABによって自動的に作成されるフィールドで、エポック情報やイベントデータの保存に使用されます。ユーザー定義フィールドには任意の名前を付けることができます（例: *position*）。
認定されたイベントフィールドの短い説明は以下のとおりです。 もっと詳しく
情報は、イベントスクリプトチュートリアルで見つけることができます。

-   <u>タイプ:</u> イベントタイプを含みます。例えば、
    stimulus type（刺激タイプ）、'rt' は被験者のボタン押しです。基本的に
'boundary' の型イベントを、データ境界線( ) で指定します。
連続データ)。
-   <u>レイテンシー</u> - イベントレイテンシーが含まれています。 レイテンシー情報
    連続データまたはミリ秒単位で秒単位で表示
    epoched タイム 相対 相対 相対
    イベントスクリプトセクションでレイテンシ情報が表示されます。
    データサンプルに内部的に保存されます。 これらは僅かなサンプルかもしれません
    イベントの時間の解像度がデータ解像度を超えた場合。
-   <u>期間</u> - イベントの期間。連続データではサンプル単位、
    エポック化データではミリ秒単位で表示されます。
-   <u>urevent</u> - 'ur' はドイツ語で「元の」という意味で、元の
    イベント構造体へのインデックスです。最初にイベントがインポートされた時点で
    *urevent* 構造体が作成されます。
    このフィールドは自動管理されるため、手動で修正しないでください。詳細は
    イベントスクリプトチュートリアルで。
-   <u>エポック</u> - イベントが属するデータエポック（もしあれば）のインデックス。
    このフィールドは、エポック化されたデータにのみ存在します
    （連続データには存在しません）。

注意: すべてのイベントフィールドには、数字または文字列が含まれている場合があります。
*latency*、*duration*、*urevent*、*epoch* は常に数値です）。*type* フィールドは数値（例: 1、2等）または文字列（例: 'square'、'rt'等）のいずれかです。[ERPlab](https://github.com/lucklab/erplab) を使用する場合、*type* フィールドは数値であることが期待されます。EEGLABは
1つのフィールドに数値と文字列の混合データを処理できます。イベント構造をチェックする関数 [eeg_checkset.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m)
*eventconsistency* では、データセットが変更されます。
各フィールドのコンテンツが一貫性を維持し、自動的に強制されます。
必要に応じて数値値を文字列に変換します。 この機能も自動的に 
レイテンシーの増加によるリゾートイベント。 

### イベントの追加、変更

新しいイベントを手動で入力するには、 <span style="color: brown">編集
→ イベントの値</span> メニュー項目。 *Insertイベント*ボタン、追加追加
イベント前のイベント。 ※イベント*ボタンはイベントを追加
*その後*現在のイベント。 新規イベントの投入後、または
イベントフィールド情報は、すぐに変更できます。
対応ボックス , 型 *new*500 の リリース
タイムロックの開始時刻
*type* の編集ボックスイベント *latency* の編集ボックスの 500.
注意: *cancel* ボタン、新しいボタン。
情報は保存されます。

![](/assets/images/V121pop_editeventvals_2.png)

※Ok* と、イベントが離脱したあとは、
レイテンシーを増加させるため)、フィールドの内容は変更される場合があります。
前回の最後に示されているように、一貫性を確保するために
セクション。

上記のグラフィックインターフェイスでは、すべての実験的なでき事は手動である場合もあります
それぞれの編集ウィンドウに新しい値を入力するだけで変更
フィールド。 イベントも削除できます(*イベント削除*ボタン)。

参照: [EEGLABのプラグイン](https://github.com/jadesjardins/vised_marks)
EEGLAB プラグイン
EEGブラウザで直接イベントを開催する
例えば(例えば)

### 一括でイベントを変更する

一括でイベントを変更する場合は、まずイベントをテキストファイルにエクスポートし、スプレッドシートで編集してから再インポートします。チュートリアルデータセット *eeglab_data.set* をEEGLABの *sample_data* フォルダから読み込み、<span style="color: brown">ファイル → エクスポート → テキストファイルへのイベント</span> でイベントを保存
データファイル。 このデータファイルを使用して、すべてのイベントの名前を変更する方法を示します。
Excel の "response" の型でイベントに "rt" の型になります。
以下の図は、エクスポートされたファイル(左)と編集されたファイル(右)を示しています。

![](/assets/images/Spreadsheet_event.png)

それから、<span style="color: brown">ファイル → インポートイベント情報 → ASCII/MATLABファイルから</span> メニュー項目を使用して変更されたファイルを選択します。
列名は、ヘッダの 1 行があることを示し、
ユニットレイテンシをNaNに(時間情報交換)
また、アライメントオプションのチェックを外します(チェックしたままにしても、何もありません)
効果)。 今、すべてのイベントが名前を変更しました (インターフェイスに注意)
次のセクションで提示されたイベントを選択すると、名前を変更することができます
イベント名は、

![](/assets/images/Event_reimport.png)

### 選択/取消/催し物

可能です。
チュートリアルデータセット *eeglab_data.set* を読み込み、<span style="color: brown">編集 → エポックやイベントを選択</span> メニュー項目を使用します。イベントの選択、除去、名前の変更が可能です。

たとえば、「正方形」イベントだけを保持するには、以下に示すようにイベントタイプに「正方形」を入力します。

![](/assets/images/pop_select_events_new2.png)

また、イベントの種類は「スクエア」と「rt」のみです。イベントの種類は「rt」に変わります。

![](/assets/images/pop_select_events_new3.png)

例えば、「rt」タイプのイベント名を「response」に変更するには、タイプフィールドに「rt」を入力し、名前変更フィールドに「response」を入力します。必ず *選択したイベントのみを選択* オプションを使用してください。それ以外の場合、タイプが「rt」でないすべてのイベント
"rt" は削除されます。

![](/assets/images/pop_select_events_new.png)

注意: 指定した範囲外のイベントを選択するには、フィールド範囲エントリの右側にある *NOT* チェックボックスを使用します。
選択したイベントの型の名前を変更できます(オプション)
古いイベント名を新しいフィールドに保つ)最後の編集
ボックス。

より複雑なものを指定することもできます。
イベントフィールドの選択と範囲の組み合わせは、
例えば、0〜400ミリ秒の範囲でレイテンシを持つイベントを選択できます。
イベント選択インターフェイスを秒間使用し、残りの名前を変更します
"slow_rt" としてイベント
