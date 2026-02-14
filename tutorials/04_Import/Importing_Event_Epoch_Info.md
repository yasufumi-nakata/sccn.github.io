---
layout: default
title: b. Events
long_title: b. Events
parent: 4. Import data
grand_parent: Tutorials
---
イベントやエポック情報のインポートと管理
===========
お問い合わせ

チュートリアル EEGLABは、 変更、変更、選択、および変更

EEGLABは、実験イベントの開催場所とイベントの開催場所を、
このサイトでは、MATLABのコンテンツが公開されました。
カンファレンスの詳細は、EeGLAB の EEG.event をご覧ください。
(*ur*) Eメール、EeG.urevent
対応する尿道。 これにより、ユーザーがイベントを選択できる
前回(または)イベント *context*、さらに*after*データ
チュートリアルのイベントスクリプトセクションに記載されているように、データからいくつかのイベントが拒否されました。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
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

![Ii21pop_chanevent.jpg はコメントを受け付けていません。](/assets/images/II21pop_chanevent.jpg)

*33*はイベントのチャンネルに必須項目です。 特許出願中
(トップ)* (注記: テキストにマウスを置く * 変換 抽出する*
コンテキストヘルプメッセージが表示されます。

プレス *Ok*. お問い合わせ
EEGLAB は、EEGLAB のプログラムを準備中です。
テストデータから。 メニュー項目を選択 <span style="color: brown">編集 → イベント
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

![サイトマップ](/assets/images/pop_importevent.png)

チュートリアルテキストファイルのためにブラウズ [チュートリアル_eventtable.txt](http://sccn.ucsd.edu/eeglab/download/tutorial_eventtable.txt)ヘッダー行数を 1 に設定します。
(ファイルの最初の行では、列フィールド名を与えます)
入力フィールド(すなわち、列に関連付けられている名前を)設定します。
array から *latency 型 position* へ へ フィールド名が 引用符 か、
com で で で されます されます されます されます されます
フィールドの2つに*latency*と*type*の同時通訳。
EEGLAB は、EEGLAB が、EEGLAB が、EEGLAB が、EEGLAB を、EEGLAB に、EEGLAB が、EEGLAB が、EEGLAB が、EEGLAB が、EEGLAB が、EEGLAB が、EEGLAB が、EEGLAB が、EEGLAB に、EEGLAB が、EEGLAB が、EEGLAB で、EEGLAB を に表示します。 MATLAB は、MitLab は、MitLab の、MitLab の、MitLab の、MitLab の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub の、Mithub 、Mithub の、Mithub の、Mithub の、Mithub の、Met など、Mithub は、Mithub で、Mithub の を に に して、Mit を に に する。
このウィンドウでは、 *イベントインデックス*とチェックボックス
*イベントを返したいですか?* は、置換ではなく新しいイベントを投入するために使われます。これはデフォルトの動作です。サブセット
最近の投稿
複数のイベントファイル。

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

とりあえず、あえず、あたたかな、あたたかな、あたたかな、あたたかな、あたたかな、あたかな、あたかな、あたたかな、あたかな、あたかな、あたたかな、あたかな、あたたかな。
テキストファイルの最初のイベントが最初のイベントに対応する場合
EEG でレコードの検索結果は、
この値が 1 の場合、イベントのテキストファイルでイベント 1 が表示される
EEGイベントの対応
また、テキストファイルの開始前にイベントが始まることを示すために使用されます
EEGHの記録

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
サンプルファイルはこちらからダウンロードできます。
[ソリューション](http://sccn.ucsd.edu/eeglab/download/TEST.SMA) (スナップマスター)
お問い合わせ SMAファイル [ダウンロード](http://sccn.ucsd.edu/eeglab/download/TEST.LOG)
イベントログファイル  リンク  リンク * * *

SMAデータファイル
メニュー項目を使用して <span style="color: brown">ファイル → インポート → . SMAデータ
ファイル</span>お問い合わせ それから選択して下さい <span style="color: brown">ファイル → インポートイベント情報 →
プレゼンテーションログファイルから</span> イベントをインポートする
以下に示すようにプレゼンテーションログファイル</span>



![サイトマップ](/assets/images/load_presentation_file.png)



その後、次のウィンドウがポップアップ表示されます</span>


![Pop_importpres2.jpg _ プロフィール](/assets/images/Pop_importpres2.jpg)

フィールドをスクロールして、どのフィールド(すなわち、ファイル列)が含まれているかを選択します。
イベントタイプとイベントレイテンシを含むカラム。 デフォルト値は
お問い合わせ MATLAB が返されます。

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
ファイル。 SnapMasterのファイル作成
ふりがな
関数は、最高のサンプリング速度比を計算します。これはアカウントかもしれません
見本抽出率の小さい相違のために大きいにつながることができます
実験終了時の差(例:0.01%クロック差)
1時間半に360ミリ秒の差が出ます。
修正されていない)。 イベントがシフトされている場合(敬称して)
バイナリーEEGファイルについて
手動でイベントやプレゼンテーションファイルをテキストファイルとしてインポートする
前のセクションで説明します。 プレゼンテーションファイルの一部
ファイルの末尾にコメントが含まれている場合、サポートできません。 お問い合わせ
プレゼンテーションファイルをインポートしても失敗し、削除してみてください
ファイルの最後にコメント。 それでもうまくいかない場合、ぜひお試しください。
プレゼンテーションファイルをテキストファイルとしてインポートします。
前のセクション。

注意: プレゼンテーションファイルには、より多くのイベント(反応時間など)が含まれています。
生EEGデータファイル
お問い合わせ イベントが整列されると、自動的に重複するイベントを削除します。

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

DATファイル [TEST.DATの特長](http://sccn.ucsd.edu/eeglab/download/TEST.DAT) サンプルに関連付けられている [品質保証](http://sccn.ucsd.edu/eeglab/download/TEST.CNT) DATファイルとDATファイル イベント イベント イベント 100 100 100 100 100 CNTは、 に に に に に に に は は は <span style="color: brown">ツール → 抽出エポック</span>ウィンドウが大きかったので、 ウィンドウが開きます。 Neuroscan をインポートします。 メニュー <span style="color: brown">ファイル → インポート ソース ソースファイル</span>お問い合わせ インポートするファイルを選択すると、2番目のウィンドウが表示されます。

![サイトマップ](/assets/images/Pop_loaddat.gif)

.DATファイルでは、
エポック。 しかし、実験設計によっては反応がない場合もございます。
特定のエポックの時間。 その後、反応のためにコード値を使用する必要があります
これらのエポックの時間レイテンシー。 例えば、
*1000*(ms) の 、 被写体 が あります。
(実験のすべてのエポックがすでに反応時間を持っている場合は、
お問い合わせ

### EEGLABにEPOC情報(MATLABの配列やテキストファイル)をエクスポート

epoch は、 epoch は、
EEGデータとMATLABを組み合わせて、
テキスト epoch 情報ファイル、epoch は 1 のエントリです。
このようなファイルや配列をインポートするには、シミュレートされたファイルを作成すると、
EEGデータ。

```matlab
eegdata = rand(32, 256, 10); % 32 channels, 256 time points per epoch, 10 epochs
```

メニュー項目を選択 <span style="color: brown">ファイル→ インポートデータ→ ascii/floatデータ MATLAB は、</span>お問い合わせ 参照して下さい [前のセクション](http://localhost:4000/tutorials/Import/Importing_Continuous_and_Epoched_Data.html) チュートリアルの。 

MATLAB は 3 D で、
データエポックとして自動的に輸入される:最初の次元はあります
データチャネルとして解釈され、データポイントとして2番目に、および3分の1
試験 例えば 例えば 例えば サンプル サンプル  10
エポック シミュレーション から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から から
stimulus/response は、 'true' または 'true' または 'true' の応答です。
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
<td>変更について</td>
<td>502</td>
</tr>
<tr>
<td>2</td>
<td>変更について</td>
<td>477</td>
</tr>
<tr>
<td>3</td>
<td>変更について</td>
<td>553</td>
</tr>
<tr>
<td>4</td>
<td>変更について</td>
<td>612</td>
</tr>
<tr>
<td>5</td>
<td>ログイン</td>
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

![Ii33pop_inportepoch.jpg はコメントを受け付けていません。](/assets/images/II33pop_inportepoch.jpg)


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
お問い合わせ <span style="color: brown">編集 → イベントの値</span> メニュー項目は何かを点検します
反応時間情報に起こった(矢印を使用して移動します)
第2イベント:

![Ii33pop_editeventvals.jpg _ 公式サイト](/assets/images/II33pop_editeventvals.jpg)

上記 とき とき とき とき とき
*rt* が作成されます。
レイテンシ情報を含む列、関数は作成されます
いくつかのタイプ。 試行回数(10、この場合は、
EEGデータセットで試用してみる
"eegdata" 変数を呼び出します。

注意: 便宜上、標準のエポック情報は
変数 *EEG.epoch* の現在のところ。 イベント
*EEG.event* では、クライアントのクライアントをフォローしています。
ラインデータ処理。 イベントスクリプトの書き込みを参照してください。
詳細については、チュートリアル。

イベントの管理
------------------------

現在のセクションでは、イベントの処理に精通するのに役立つはずです
EEGLAB は、EEGLAB のプロジェクトで、EEGLAB のプロジェクトを運営しています。
データを削除する関数()[pop_eegplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_eegplot.m), 
[選択する](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_select.m)) また、中に発生するイベントも削除します
削除されたデータ(その対応するイベントではない)。
連続データを処理する機能([pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m),
[pop_resample.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_resample.m), [pop_mergeset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_mergeset.m)) 取ります
'boundary' イベント (EEGLAB が追加データイベント)
削除されたデータの部分または「ハード」境界
統合データセット. イベント *type* フィールドは,データエポックを解析する,ERP-imageのプロットイベントを. [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) 機能。 最後に、グループレベルの解析にイベント情報を広く利用しています。

### プロットイベント

Eeeglab_data.set* は、Eeglab のデータベースです。
*sample_data* は、 <span style="color: brown">ファイル → ロード
データセット</span> メニュー項目。 次に、 <span style="color: brown">パロット →
データ(スクロール)</span> データと関連イベントを視覚化するためのメニュー項目。

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

*type* と *latency* は、EEGLAB の公式イベントです。
フィールド(以下参照)。 つの つの つの
イベントのプロット、トライアルのソートなどのためのフィールド (注)1つでも可
これらのフィールドを欠いているプロセスイベントは、この強く制限しますが、
イベント処理の可能性の範囲 他の分野を含む
*epoch*、*duration*、*urevent*はEEGによって作成されたLABはあります。
epoch のエラー、または
イベントデータの保存 ユーザー定義フィールドには、他の名前を持つことができます 
*position* は、
認定されたイベントフィールドの短い説明は以下のとおりです。 もっと詳しく
情報は、イベントスクリプトチュートリアルで見つけることができます。

-   <u>タイプ:</u> お問い合わせ
stimulus type、'rt' は サブジェクトボタンプレスです。
(例、時間) 基本情報
'boundary' の型イベントを、データ境界線( ) で指定します。
連続データ)。
-   <u>レイテンシー</u> - イベントレイテンシーが含まれています。 レイテンシー情報
    連続データまたはミリ秒単位で秒単位で表示
    epoched タイム 相対 相対 相対
    イベントスクリプトセクションでレイテンシ情報が表示されます。
    データサンプルに内部的に保存されます。 これらは僅かなサンプルかもしれません
    イベントの時間の解像度がデータ解像度を超えた場合。
-   <u>期間</u> - イベントの期間。 お問い合わせ
    連続データとミリ秒単位で表示
    epochedデータ。 は、
-   <u>エクステンション</u> - 'ur' in' は、
    ドイツ)イベント構造。 最初のイベントはインポートされ、
    'urevent' は、
    このフィールドは、Uncovery で、
    適度に修正しないでください。 このフィールドは詳細に記載されています
    イベントスクリプトチュートリアルで。
-   <u>エポック</u> - イベントが落ちるデータエポック(もしあれば)のインデックス
    このフィールドは、データ通信のみが公開されます。
    データが抽出されているので(ここにいない場合ではない)
    連続的な)。

注意: すべてのイベントフィールドには、数字または文字列が含まれている場合があります。
*レイテンシ*、*duration*、*urevent***、*epoch*は、
数字)。 * * * * * * * 
等)または文字列(例、'square'、'rt'etc)。 使用時間に注意
お問い合わせ [ERPラボ](https://github.com/lucklab/erplab) フィールドは、値が値と予想されます。 EEGLABは、
1つのフィールドに両方のフォーマット(数値と文字列)の混合物を処理します。 ツイート
イベント構造をチェックする機能([eeg_checkset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m)
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

ふりがな [EEGLABのプラグイン](https://github.com/jadesjardins/vised_marks)
EEGLAB プラグイン
EEGブラウザで直接イベントを開催する
例えば(例えば)

### 一括でイベントを変更する

 新しい  新しい  新しい  新しい  新しい  新しい に に に に に に に に に に に に に に に 。 に に に 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。
eeglab_data.set* の使い方
*EEGLABのsample_data*はメニューの項目です。 <span style="color: brown">ファイル → エクスポート → テキストファイルへのイベント</span> 保存
データファイル。 このデータファイルを使用して、すべてのイベントの名前を変更する方法を示します。
Excel の "response" の型でイベントに "rt" の型になります。
以下の図は、エクスポートされたファイル(左)と編集されたファイル(右)を示しています。

![](/assets/images/Spreadsheet_event.png)

それから、使用して下さい <span style="color: brown">ファイル → インポートイベント情報 → から
ASCII は、</span> メニュー項目は変更されたファイルを選択します。 お問い合わせ
列名は、ヘッダの 1 行があることを示し、
ユニットレイテンシをNaNに(時間情報交換)
また、アライメントオプションのチェックを外します(チェックしたままにしても、何もありません)
効果)。 今、すべてのイベントが名前を変更しました (インターフェイスに注意)
次のセクションで提示されたイベントを選択すると、名前を変更することができます
イベント名は、

![](/assets/images/Event_reimport.png)

### 選択/取消/催し物

可能です。
eeglab_data.set* の使い方
※EEGLABでは、イベントの開催、 <span style="color: brown">編集 →
エポックやイベントを選択</span>メニュー項目。 大切なイベントを除去したり、イベントの名前を変更したりすることができます。 

たとえば、「正方形」イベントだけを保持するには、以下に示すようにイベントタイプに「正方形」を入力します。

![投稿ナビゲーション](/assets/images/pop_select_events_new2.png)

また、イベントの種類は「スクエア」と「rt」のみです。イベントの種類は「rt」に変わります。

![投稿ナビゲーション](/assets/images/pop_select_events_new3.png)

とりあえず、あえず、とりあえず、とりあえず、とりあえず。
タイトルイベント テキストボックスに「response」をつけます。 お問い合わせ 
オプション *選択したイベントのみを選択して、他のイベントをすべて削除します*。 それ以外の場合は、タイプされていないすべてのイベント
"rt" は削除されます。

![投稿ナビゲーション](/assets/images/pop_select_events_new.png)

注意: 指定した範囲外のイベントを選択するには、*イベントを選択してください
フィールド範囲のエントリの右側に上記の*ボックスを選択していません。 お問い合わせ
選択したイベントの型の名前を変更できます(オプション)
古いイベント名を新しいフィールドに保つ)最後の編集
ボックス。

より複雑なものを指定することもできます。
イベントフィールドの選択と範囲の組み合わせは、
の の の
0〜400ミリミリ秒でレイテンシーを呼びます。
イベント選択インターフェイスを秒間使用し、残りの名前を変更します
"slow_rt" としてイベント
