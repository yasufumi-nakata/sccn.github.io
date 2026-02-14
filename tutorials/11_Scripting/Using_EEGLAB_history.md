---
layout: default
title: a. Using EEGLAB history
nav_title: "a. EEGLABの歴史"
long_title: a. Using EEGLAB history
parent: 11. Write scripts
grand_parent: Tutorials
---
EEGLABの歴史
=====
お問い合わせ

このセクションは、少なくとも基礎を学んだユーザーのために意図されています
MATLABのWeb制作とEEGLABの制作
データの分析を自動化および/またはカスタマイズするため。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'eeglab_history.m'));">MATLABコマンド</button>

EEGLAB MATLAB は、
--------------------------------

EEGLAB は、MATLAB のコレクションのコレクションです。
スタッフ EEGLAB MATLABのコンセプト
これらの関数をスクリプトファイルまたはコマンドから呼び出す
EEGLAB GUI は、EEGLAB GUI で、 EEGLABの特長
歴史メカニズムは、データセットで実行されるすべての操作の追跡を維持します
EEGLABの特長
メニューベースでスクリプトベースのコンピューティング ユーザーが実行できるようにします。
サンプルデータセットで説明信号処理を行い、
EEGLAB の Windows で発行されたコマンドは、
テキストエディタを使用して変更することができます。

MATLABは、EEGLABの分析の実行をしています。
1 つ以上のデータセットの処理を大幅自動化します。 なので
高度な分析は、多くのパラメータの選択肢を伴って、かなり必要です
長い計算、それは頻繁に習慣を書くことは便利です
スクリプト、特に複数のデータセットを同じ方法で処理するか、または
複数の方法で1つのデータセットを処理する。

EEGLAB MATLAB は、EEGLAB MATLAB は、EEGLAB MATLAB は、EEGLAB MATLAB は、EEGLAB MATLAB は、EEGLAB MATLAB は、EEGLAB MATLAB は、EEGLAB は、EEGLab MATLAB は、EEGLab MATLAB は、EEGLab MATLAB は、EEGLab MATLAB は、EEGLAB は、MATLAB は、MATLAB は、EEGLAB は、MATLAB は、MATLAB は、E は、MATLAB は、MATLAB は、MATLAB は、E は、E は、MATLAB は、MATLAB は、MATLAB は、E は、E は、MATLAB は、MATLAB は、S は、E は、E は、E は、E は、E は、MATLAB は、 は、MATLAB は、S は、E は、
EEGLABデータ構造(EEG)とサブ構造(EEGLAB)
*EEG.data*、*EEG.event*、*EEG.urevent*、*EEG.epoch*、*EEG.chanlocs*、
*EEG.history*は必須です。
チュートリアルの例は、予約された変数名の一部を議論します
EEGLABおよび使用:

- EEG: 現在のEEGデータセット
- AllEEG: 全てを 記憶する
- 現在のデータセット

いつでも参照できます [エッグラボ データ構造](/tutorials/ConceptsGuide/Data_Structures.html) 詳しくはこちら
EEG構造について [EEGLABの特徴](/tutorials/ConceptsGuide/EEGLAB_functions.html) EEGLABの学習方法、およびストリーミング方法。

EEGLABの「データセット履歴」との違いは2つあります。
「セッション歴」 つまり「セッション履歴」は、すべて保存されます。
現在の EEGLAB は、
セッション。 対照的に、「データセット履歴」は、その関数呼び出しのみを保存します。
現在のデータセットを修正しました。 セッション履歴は、期間中のみご利用いただけます。
EEGLAB の 最近のコメント
データセット履歴が保存されるように、新しいセッション履歴を作成します。
*EEG.history* 保存時に EEG のデータセット構造のフィールド
セッション終了時のデータセット。 そのため、いつか回収されます。
EE で で で で
現在のセッションの最後にデータセットを保存します)。

EEGLABフォーラム
---------------------------------------------

このセクションでは、歴史の活用方法を説明します
スクリプトを書くための現在のデータセットの変更。

エッグラボ データセットをロードし、データウィンドウを転送します。
- 電話番号 <span style="color: brown">ファイル → データの読み込み</span>EEGLABの「sample_data」フォルダに「eeglab_data.set」と書いてあります。
- メニュー項目を使用する <span style="color: brown">Plot → チャンネルデータ(有料)</span>お問い合わせ このポップアップ
お問い合わせ [エッグロット](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)
下にデータをスクロールする。

![サイトマップ](/assets/images/Scrollchannelactivities1.png)

メニュー項目 <span style="color: brown">ファイル → 履歴スクリプト → セッション履歴スクリプトを保存</span> コマンド テンプレート
スクリプトファイル。 ファイルを現在のディレクトリに保存するか、
MATLAB パスのディレクトリ (英語)
*\>\> パス* セッションコマンドを保存する
*doitagain.m*(必須)
MATLABでは、
.m. .m.

*doitagain.m* は、
たとえば で で で <span style="color: brown">オープン</span> MATLABのグラフィカルインターフェイスのボタン。

```matlab
% EEGLAB history file generated on the 20-Dec-2020
% ------------------------------------------------
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','eeglab_data.set','filepath','/data/matlab/eeglab/sample_data/');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
eeglab redraw;
```

最初の2行はコメントです。 続いて6コマンドを実行します。
- EEGLAB は、
- 2番目のコマンドは、チュートリアルデータセットを読み込む
- EEGLABメモリにデータをセットする
- 4番目のコマンドは、データセットの一貫性をチェックします
- 第5コマンドはデータをプロットする
- 第6回は、EEGLABのグラフィカルインターフェイス(現データセットが更新されます)が更新されます。

*\>\> eeglab 再考*
メインのグラフィックインターフェイスが確実になるように、最後に追加されました。
データセットが処理された後更新される。 

今すぐプレス <span style="color: brown">ログイン</span> MATLABのボタンです。 テキストが作成されます。 テキストが実行されます。 <span style="color: brown">ファイル → 履歴スクリプト → スクリプトを実行</span> このメニュー項目は、MATLAB です。 グラフィカル は、EEGLAB のコンパイルを受け付けています。 また、MATLAB では、MATLAB では、以下の手順を実行できます。

``` matlab
doitagain
```

EEGLABは、EEGLABを運営しています。 プロフィール 別のデータセット
現在のデータセットを処理するために使用した同じコマンドを使用して、試します
お問い合わせ MATLAB は、
*doitagain.m* は、データセットで行います。
再びスクリプトを実行します。

EEGLAB *pop_* 関数は、EEGLAB *pop_* 関数の呼び出しをします。
ふりがなな [EEGLABの特徴](/tutorials/ConceptsGuide/EEGLAB_functions.html) EEGLAB は、

詳細については、
MATLABは、以下のとおりです。
お問い合わせ [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m)、ビア <span style="color: brown"> ヘルプ → EEGLAB
関数 → インタラクティブなポップアップ関数</span> または <span style="color: brown"> EEGLABメニュー</span>お問い合わせ お問い合わせ [eeg_store.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_store.m)、ビア <span style="color: brown"> → EEGLAB → 管理者機能</span>以下は、MATLAB にインストールします。

``` matlab
help pop_loadset
help eeg_store
```

EEGLABデータセット
-----------------------

EEGLAB、現時点では、
*\>\>\>\> お問い合わせ
変数 *EEG* は EEGLAB が MATLAB 構造で、保存されます。
データセットに関する情報 データセット名と
filename, チャンネル数と場所, サンプリング
料金、試行回数、各イベントに関する情報
トライアル/エポック、データ自体など。 完了のため
*EEG* フィールド情報と関連情報
[エッグラボ データ構造](/tutorials/ConceptsGuide/Data_Structures.html)お問い合わせ コンテンツ
*EEG*構造のフィールドは、*EEG.fieldname*の構成要素です。
MATLABでは、 EEG.nbchan* を入力
現在のデータセットのチャンネル数を返します。

EEGLAB は、EEGLAB のパートナーです。 メニュー
現在のEEGデータセットは、*EEG.history* です。
履歴フィールドの内容には、その関数呼び出しを含む
現在のデータセットを修正し、関数をプロットする呼び出し。 

*EEG.history*は、
EEGLABでは、バイナリデータセット(for)をインポートします。
インスタンス, [品質保証](http://sccn.ucsd.edu/eeglab/download/TEST.CNT)) 以下のメニュー項目を使用しました。
1. メニュー項目を使用する <span style="color: brown">ファイル → インポートデータ → EEGLAB関数とプラグイン → Neuroscan .CNT ファイルから</span> ファイルをインポートする(すべてのデフォルトを使用する)
2. メニュー項目を使用する <span style="color: brown">ツール → サンプリング速度の変更</span> サンプリングを250に Hz は、すべてのデフォルトで新しいデータセットに
3. メニュー項目を使用する <span style="color: brown">基本のFIRをクリアする</span> 1 Hz の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s s の s s の s s の s s の s s の s s s s s s の s s s s s s の s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s s
4. メニュー項目を使用する <span style="color: brown">Plot → チャンネルデータ(有料)</span> データの視覚化

お問い合わせ EEG.history*について
コマンドライン 次のテキストを取得する必要があります。

```matlab
EEG.history

ans =
     EEG.etc.eeglabvers = '2020.0'; % this tracks which version of EEGLAB is being used, you may ignore it
     EEG = pop_loadcnt('/Users/arno/Downloads/TEST.CNT' , 'dataformat', 'auto', 'memmapfile', '');
     EEG = eeg_checkset( EEG );
     EEG = pop_resample( EEG, 250);
     EEG = eeg_checkset( EEG );
     EEG = pop_eegfiltnew(EEG, 'locutoff',1,'plotfreqz',1);
     EEG = eeg_checkset( EEG )
```

また、メニューを選択することで、現在のデータセット履歴を保存できます。
アイテム <span style="color: brown">ファイル → 履歴を保存 → データセット履歴スクリプトを保存</span>.

実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行中は、 実行されます。
保存する *session* の履歴
エッグラボ 多重データセット変更が始まります。
*EEG.history*は、現在のデータセットの変更のみとなります。

このページではjavascriptを使用しています。
メニューを選択することにより、データセットに切り替える(元の連続データセット)
アイテム <span style="color: brown">データセット → データセット 1</span>, と入力します。 *\>\>
EEG.history*(以下に示す)、
最後の4を除いて上記のコマンド。 データセット1はメモリに保存されたコピーです
データセットが読み込まれた後。 データセット 3
データセットから派生するので、すべての歴史を継承
それに適用される変更。

```matlab
EEG.history

ans =
     EEG.etc.eeglabvers = '2020.0'; % this tracks which version of EEGLAB is being used, you may ignore it
     EEG = pop_loadcnt('/Users/arno/Downloads/TEST.CNT' , 'dataformat', 'auto', 'memmapfile', '');
     EEG = eeg_checkset( EEG );
```

選択の後でプロセスを繰り返す <span style="color: brown">データセット → データセット 2</span>、私達は得ます

```matlab
EEG.history

ans =
     EEG.etc.eeglabvers = '2020.0'; % this tracks which version of EEGLAB is being used, you may ignore it
     EEG = pop_loadcnt('/Users/arno/Downloads/TEST.CNT' , 'dataformat', 'auto', 'memmapfile', '');
     EEG = eeg_checkset( EEG );
     EEG = pop_resample( EEG, 250);
     EEG = eeg_checkset( EEG );
```

EEGLAB の 管理 の 管理 の 管理 と 管理 の 管理 の 管理 の 管理 の 管理 の 管理 の 管理 の 管理 の 管理 と 管理 の 管理 と 管理 の 管理 の 管理 と 管理 の 管理 と 管理 の 管理 の 管理 と 管理 の 管理 と 管理 の 管理 と 管理 管理 の 管理 と 管理 の 管理 と 管理 の 管理 の 管理 管理 管理 の 管理 管理 の 管理 管理 管理 管理 管理 の 管理 管理 管理 管理 管理 管理 の 管理 管理 管理 の 管理 管理 管理 管理 管理 管理 と 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 と 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 管理 
そのため、データセットを繰り返し読み込むと、
繰り返しロードコマンドをデータセット履歴にしたい。

*EEG.history*のコマンドは、
データセット(例えば、複数の被験者から)と同一を申請したい
*EEG.history* は、
EEGLAB は、EEGLAB で、EEGLAB を運営しています。
例えば、新しいデータセットがあれば、同じように処理したい
最近のデータセット EEGLAB に、*\>\>\>\>\>\>\>\>\>
EEG.history* では、新しいデータセットで実行します。
EEGLAB は、EEGLAB の略称で、
MATLABは、

具体的に、最初に処理するために
データセットは、EEGLABのグラフィックをそのまま処理します。
同様のデータセットは、最初に履歴をコピーまたは保存するだけです。
テキストファイルへ
例: *doitagain.m* は、別のデータセットをロードして実行します。
MATLAB のファイル
*doitagain.m* は、通常、現在のMATLAB のパスです。
現在の作業ディレクトリを含みます。 ヘルプメッセージを読む
MATLAB の機能 *path.m* と *addpath.m* は MATLAB です。
パス。 ステップバイステップの手順は以下の通りです。

1.  EEGLABに任せる
2.  最初にMATLABメニュー
    データセット。
3.  *\>\>\>EEG.history* のコマンドをコピーします。
    データ処理コマンド。
4.  EEGLABメニューへ
    マトラボ コマンド で
    新しいデータセットで。
5.  最後のデータセットが処理されるまで、このように進みます。

より高度なスクリプト例を以下に提示します。
セクション。

データセット履歴は、セッション履歴よりも使いやすいことが多い
データセットを操作するためのすべてのコマンドは含まないので。

EEGLAB ウィンドウを閉じる
------

EEGデータセット
エッグラボ は、
以下の2つのコマンドのいずれかを実行してください。

- EEGLABウィンドウが実行中の場合、タイプ:
``` matlab
eeglab redraw;
```

![](/assets/images/eeglab20191.png)

-  エッグラボ 最近の投稿

``` matlab
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
eeglab redraw;
```

新しいデータセットを作成するには、以下を入力します。

``` matlab
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG);
eeglab redraw;
```

EEGLABウィンドウで変更する

EEGLABデータ構造
-------------------------------------------------------------------

EEGLAB MATLABのデータ構造は2つあります。*EEG*と*ALLEEG*。
*ALLEEG*は、現在進行中のデータセットです。
EEGLAB では、EEGLAB で勉強しています。
処理中のデータセットに関する情報。 詳細はこちら [エッグラボ データ構造](/tutorials/ConceptsGuide/Data_Structures.html) 詳細については、.

このページではjavascriptを使用しています。 多岐に渡る
現在の EEGLAB のセッションは、
*eegh* (履歴) コマンド。

``` matlab
eegh
```

MATLAB では、MATLAB では、EEGLAB のセッションを出力します。
ラインウィンドウ。 <span style="color: brown">ファイル → データの読み込み</span>;;;;;;; EEGLAB の「sample_data」のフォルダにある「eeglab_data.set」のチュートリアルファイル。、*Open* など。
、入力 *eegh* の
コマンドラインは、次のテキストを返す必要があります。

``` matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset( 'eeglab_data.set', '/matlab/eeglab/sample_data');
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG);
```
最初のコマンド ([eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m)) EEGLABは、初期化
EEGLAB 変数を出力する。 対象外
変数を継承する、EEGLAB関数() は、 [eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m) 呼び出しは他の何も変更しません
MATLABワークスペース(EEGLABグローバル変数)[pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m)) データセットを
*EEG* および[eeg_store.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_store.m)) ストア
*ALLEEG*ファイルデータセット 

前のセクションで示されているスクリプトの種類は、戻ってくる可能性があり、
EEGLABのグラフィックとMATLABのコラボレーション
つの * * * * * * * *
*ALLEEG*が変更されました。
*EEG*追加または直接変更
*EEG* は、MATLAB のファイルから構成されます。
簡単なルールを尊重する必要があります。

複数のデータセットを EEGLABオプション <span style="color: brown">ファイル → 環境設定</span> メニュー項目(必須項目)、すべての現在の EEGLAB は、
構造の*ALLEEG、*で保存するeノート。
変更されたEEGデータセットを*ALLEEG*にコピーしてください。

を変更 * *
新しいデータセットは、単にタイプするかもしれません:

``` matlab
ALLEEG(2) = EEG;
CURRENTSET = 2;
```

'might' は 'might' が 'might' の 'might' の 'might' が 'might' の 'might' に 'might' が 'might' の 'might' の 'might' が 'might' に 'might' の が 'might' の に 'might' の が あります。
過去のものとは内部的に一貫しています。 しかし、コマンドを使用する方が良い [eeg_store.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_store.m)', 広範囲を実行します。
変更されたデータセットを保存する前に、データセットの一貫性をチェックします。
次のコマンドを使用して、新しいデータセットをデータセットに設定します。
番号2

``` matlab
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, 2);
```

または

``` matlab
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG);
```

次の空きスペースで新しいデータセットを作成する
*ALLEEG* 変数。データセットは、
変数 *CURRENTSET*
dataset 2 は、最後のコマンド (above) は、
EEGLAB ウィンドウが開きます。
コマンド: *\>\> eeglab 再配置
*ALLEEG*は、 [pop_newset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newset.m)お問い合わせ このコマンドは、広範な機能を実行します。
データセットの一貫性は、より有用な高度なオプションを持っています。 お問い合わせ
蓄積された変更タイプで現在のデータセットを変更します。

``` matlab
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'overwrite', 'on');
```

変更された構造を保持するために新しいデータセットを作成する場合は、 
使用:

``` matlab
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);
``` 

*CURRENTSET* は新しい番号セットです。
EEGLABは、
注意: *EEG* 現在データセットのみが配布されます。
このサイトについて
処理したいデータセットが含まれています。
上記関数は関数を呼び出します [eeg_checkset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m) お問い合わせ
変更されたデータセットの内部の一貫性を確認してください。

``` matlab
EEG = eeg_checkset(EEG);
```

または

``` matlab
EEG = eeg_checkset(EEG, 'eventconsistency');
```

上記2つ目のコマンドは、イベントの一貫性のための追加のチェックを実行します
(完成までに時間がかかることもあります)
*EEG.event* 情報からEEG.epoch* まで
イベント構造が変更される場合にのみ使用されます。 イベントを見る
スクリプトのチュートリアル:(/tutorials/11_Scripting/Event_Processing_command_line.html)
EEGイベント

上記のコマンドは、複数のコマンドを維持するオプションがある場合に便利です。
データセットがオンになっています。 複数のデータセットを維持するオプションがオフの場合
(ビア・ザ・ <span style="color: brown">ファイル → 環境設定</span> メニュー項目)
*ALLEEG* の変数はそのままです。*EEG* は変数です
データセット情報が含まれています。 このオプションを使用する場合は、
一度に1つのデータセットを処理する(ここでの目標は、より少ないメモリを使用することです。
より大きなデータセットを処理することができる。 ユーザーによる変更
*EEG*構造は即刻です。
不可逆。 一貫性のために、上記のすべてのコマンドが機能します。
は、*ALLEEG* の変数は空で指定します。

ユーザ名 * ユーザ名 * ユーザ名 *
EEGLAB関数が削除されます。
user-added フィールドに格納されます。

``` matlab
EEG.analysis_priority = 1;
```

このページの先頭へ 現在のEEGデータセット、ALLEEG:すべての読み込みEEGデータセットの配列、現在のデータセットの構成 LASTCOM: EEGLABメニューから発行された最終コマンド; ALLCOM: EEGLABメニューから発行されたすべてのコマンド: EEGLABグループ CRENURTSTUDY: EEGLABグループ解析が0の場合、グループ解析は1EGLABの場合)。
EEGLAB は、グローバル変数の定義です。
コマンドラインからアクセス可能ですが、グローバルでは利用できません。
EEGLAB の変数です。
主要な 相互 相互 EEGLABの機能 [eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m) (その他)
display)関数 は、
入力パラメータは、グローバル変数にアクセスしたり変更したりしません。 お問い合わせ
望ましくない 'サイド 最小チャンス へ。
データセットのエフェクト

基本的なスクリプト例
------------------------
EEGLABが保存済みか、LongEEGLAB MATLABが管理および実行
そもそもそも、 EEGLAB の処理を実践する
EEGLABメニューからEEGLABコマンド履歴書、再実行
保存されたファイル。 MATLABは、実行する手順を説明します。
手動で。

以下は、メインの最初のいくつかのステップの次の例です。
パート から パート まで
データセットで実行しなければならない最初の基本的な操作。 お問い合わせ
チュートリアルデータセット *eeglab_data.set* と、
対応するチャンネルファイル *eeglab_chan32.locs*. 追加しました
コンピュータ と コード
コメントはありません。 
EEGLABのストーリーをコピーします。 [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab_history.m)このページの先頭へ eegh は、



``` matlab
%% Getting started with EEGLAB history
% The line below was added by us to locate data files
eeglab_path = fileparts(which('eeglab.m'));

% Start eeglab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

% Change option to process multiple datasets
pop_editoptions( 'option_storedisk', 0);

% Load the dataset (We modified the path manually here)
EEG = pop_loadset( 'eeglab_data.set', fullfile(eeglab_path, 'sample_data'));

% Load the channel location file, enabling automatic detection of channel file format'; We modified the path manually here
EEG.chanlocs=pop_chanedit(EEG.chanlocs, 'load',{ fullfile(eeglab_path, 'sample_data', 'eeglab_chan32.locs'), 'filetype', 'autodetect'});

% Store the dataset into EEGLAB
[ALLEEG EEG CURRENTSET ] = eeg_store(ALLEEG, EEG);

% High pass filter the data with cutoff frequency of 1 Hz.
EEG = pop_eegfilt( EEG, 1, 0, [], [0]); 

% Below, create a new dataset with the name filtered Continuous EEG Data
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'filtered Continuous EEG Data');% Now CURRENTSET= 2
EEG = pop_reref( EEG, [], 'refstate',0); % Re-refrence the new dataset

% This might be a good time to add a comment to the dataset.
EEG.comments = pop_comments(EEG.comments,'','Dataset was highpass filtered at 1 Hz and rereferenced.',1);

% You can see the comments stored with the dataset either by typing >> EEG.comments or selecting the menu option Edit->About this dataset.
EEG = pop_epoch( EEG, { 'square' }, [-1 2], 'newname', 'Continuous EEG Data epochs', 'epochinfo', 'yes');

% Extract epochs time-locked to the event - 'square', from 1 second before to 2 seconds after those time-locking events.
% Now, either overwrite the parent dataset, if you don't need the continuous version any longer, or create a new dataset
%(by removing the 'overwrite', 'on' option in the function call below).
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'Continuous EEG Data epochs', 'overwrite', 'on');
EEG = pop_rmbase( EEG, [-1000 0]); % Remove baseline

% Add a description of the epoch extraction to EEG.comments.
EEG.comments = pop_comments(EEG.comments,'','Extracted ''square'' epochs [-1 2] sec, and removed baseline.',1);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);  %Modify the dataset in the EEGLAB main window
eeglab redraw % Update the EEGLAB window to view changes
```

*eeg_store* や *pop_newset* は、 複数のデータセットが あります。
現在のデータセットの処理に興味がある場合は、安全に無視できます。 以下は同じスクリプトです。
コメントや追加のデータ管理コマンドなしで、コンパクト化。

*注意事項:* 以前述べたように、関数は
EEGLABの ウィンドウから、ウィンドウのタイトルバーのアンダーリング *pop_* 関数の呼び出し。 <span style="color: brown">ファイル → 既存のデータセットをロードする</span> EE で で で [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m).

```matlab
eeglab_path = fileparts(which('eeglab.m'));
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
pop_editoptions( 'option_storedisk', 0);
EEG = pop_loadset( 'eeglab_data.set', fullfile(eeglab_path, 'sample_data')); % We modified the path manually here
EEG.chanlocs=pop_chanedit(EEG.chanlocs, 'load',{ fullfile(eeglab_path, 'sample_data', 'eeglab_chan32.locs'), 'filetype', 'autodetect'});
EEG = pop_eegfilt( EEG, 1, 0, [], [0]); 
EEG = pop_reref( EEG, [], 'refstate',0);
EEG.comments = pop_comments(EEG.comments,'','Dataset was highpass filtered at 1 Hz and rereferenced.',1);
EEG = pop_epoch( EEG, { 'square' }, [-1 2], 'newname', 'Continuous EEG Data epochs', 'epochinfo', 'yes');
EEG = pop_rmbase( EEG, [-1000 0]);
EEG.comments = pop_comments(EEG.comments,'','Extracted ''square'' epochs [-1 2] sec, and removed baseline.',1);
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, 1);
eeglab redraw 
```

EEGLAB にコメントを受け付けていません。
お問い合わせ とりあえず、 翻訳済みデータセット

``` matlab
%% Reduce sampling rate
% Reduce the sampling rate to 128 Hz (the above example was already sampled at 128 Hz'')
EEG = pop_resample( EEG, 128);

% Save it as a new dataset with the name Continuous EEG Data resampled
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'Continuous EEG Data resampled');

% Now on the GUI we returned to the previous dataset (before downsampling)
EEG = eeg_retrieve(ALLEEG, 1); CURRENTSET = 1;
```

関数と関数の高速化
-------

ErPのスカルプマップを0msから500msまで作成可能 [pop_topoplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_topoplot.m) EEGLABの歴史 EEGLAB では、このコマンドをロードする、 このサイトについて [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab_history.m).

``` matlab
%% Plot ERP maps 
% Every 100 ms from 0 ms to 500 ms [0:100:500]
% Plot marks showing the locations of the electrodes on the scalp maps.
pop_topoplot(EEG,1, [0:100:500] , 'ERP scalp topographies',[2:3] ,0, 'electrodes', 'on');
```

![](/assets/images/topoplot_history2.png)

 pop _ _ _ お問い合わせ
EEGLAB では、EEGLAB のライセンスを発行しています。
イラストの目的で弊社から書いていただきました。 上記のコマンド [pop_topoplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m) 信号処理機能を直接呼び出して実行できます。 [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m)
以下に示すように:

``` matlab
%% Topographic plot
% Define variables:
times = [0:100:500];
pos = round(eeg_lat2point(times/1000, 1, EEG.srate, [EEG.xmin EEG.xmax]));

% Convert times to points (or >pos = round( (times/1000-EEG.xmin)/(EEG.xmax-EEG.xmin) * (EEG.pnts-1))+1;)
% See the event tutorial for more information on processing latencies
mean_data = mean(EEG.data(:,pos,:),3);

% Average over all trials in the desired time window (the third dimension of 
% EEG.data allows to access different data trials). See tutorial about data structures
maxlim = max(mean_data(:));
minlim = min(mean_data(:));
maplimits = [ -max(maxlim, -minlim) max(maxlim, -minlim)]; % Get the data range for scaling the map colors

% Plot the scalp map series
figure
for k = 1:6
    sbplot(2,3,k);
    % A more flexible version of subplot
    topoplot( mean_data(:,k), EEG.chanlocs, 'maplimits', maplimits, 'electrodes', 'on', 'style', 'both');
    title([ num2str(times(k)) ' ms']);
end
cbar; % A more flexible version of MATLAB colorbar
```

トポグラフィのプロットは、スケールを除いて、以前のものとほぼ同じです。

![](/assets/images/topoplot_history1.png)

EEGLAB MATLABは、次の手順を実行します。
EEGLAB関数学習
複数の分析を行います。 スクリプトの例をいくつか紹介します。
