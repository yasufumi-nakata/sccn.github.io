---
layout: default
title: a. Using EEGLAB history
long_title: a. Using EEGLAB history
parent: 11. Write scripts
grand_parent: Tutorials
---
EEGLABの歴史
=====
お問い合わせ

このセクションは、少なくとも基礎を学んだユーザーのために意図されています
MATLABのスクリプト作成とEEGLABとその多くの機能を使用したい
データの分析を自動化および/またはカスタマイズするため。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'eeglab_history.m'));">MATLABコマンドを表示する</button>

なぜ EEGLAB MATLAB スクリプトを書くのですか?
--------------------------------

EEGLABはMATLAB関数のコレクションで、その多くが呼び出すことができる
主なグラフィックインターフェイスから。 EEGLAB MATLABスクリプトを書く
これらの関数をスクリプトファイルまたはコマンドから呼び出す
EEGLAB GUI から対話的に呼び出す代わりに行します。 EEGLABの
歴史メカニズムは、データセットで実行されるすべての操作の追跡を維持します
EEGLABのグラフィックインターフェイスから移行を容易にし、
メニューベースでスクリプトベースのコンピューティング ユーザーが実行できるようにします。
サンプルデータセットで説明信号処理を行い、
スクリプトファイルで EEGLAB ウィンドウから発行されたコマンドを蓄積し、
テキストエディタを使用して変更することができます。

MATLAB スクリプトを書くことで、EEGLAB の分析を実行できます。
1 つ以上のデータセットの処理を大幅自動化します。 なので
高度な分析は、多くのパラメータの選択肢を伴って、かなり必要です
長い計算、それは頻繁に習慣を書くことは便利です
スクリプト、特に複数のデータセットを同じ方法で処理するか、または
複数の方法で1つのデータセットを処理する。

Note: EEGLAB MATLABスクリプトを書くには、いくつかの理解が必要です
EEGLABのデータ構造(EEG)とそのサブ構造(主に)
*EEG.data*、*EEG.event*、*EEG.urevent*、*EEG.epoch*、*EEG.chanlocs*、および
*EEG.history* は必須です。 これらのデータ構造を必要に応じて導入します。
チュートリアルの例は、予約された変数名の一部を議論します
EEGLABとその使用:

- EEG: 現在のEEGデータセット
- AllEEG:すべての読み込まれたEEGデータセットの配列
- CURRENTSET: 現在のデータセットのインデックス

いつでも参照できます [エッグラボ データ構造](/tutorials/ConceptsGuide/Data_Structures.html) 詳しくはこちら
EEG構造の説明と [EEGLABの機能](/tutorials/ConceptsGuide/EEGLAB_functions.html) EEGLAB関数の異なる種類について学習するためのドキュメント、およびそれらを使用する方法。

EEGLABの「データセット履歴」との違いは2つあります。
「セッション歴」 つまり「セッション履歴」は、すべて保存されます。
現在の EEGLAB のすべてのデータセットで発行された関数呼び出し
セッション。 対照的に、「データセット履歴」は、その関数呼び出しのみを保存します。
現在のデータセットを修正しました。 セッション履歴は、期間中のみご利用いただけます。
EEGLAB の現在のセッション -- 新しい EEGLAB セッションを開始する
データセット履歴が保存されるように、新しいセッション履歴を作成します。
*EEG.history* 保存時に EEG データセット構造のフィールド
セッション終了時のデータセット。 そのため、いつか回収されます。
データセットは、将来のEEGLABセッションで再読み込みされます(もちろん、
現在のセッションの最後にデータセットを保存します)。

EEGLABセッション履歴
---------------------------------------------

このセクションでは、歴史の活用方法を説明します
スクリプトを書くための現在のデータセットの変更。

EEGLAB を起動し、データセットをロードし、データスクロールウィンドウを呼び出します。
- 電話番号 <span style="color: brown">ファイル → データの読み込み</span>お問い合わせ EEGLAB分布の「sample_data」フォルダにある「eeglab_data.set」を選択します。 それから *Open*を押して下さい。
- メニュー項目を使用する <span style="color: brown">Plot → チャンネルデータ(スクロール)</span>お問い合わせ このポップアップ
お問い合わせ [エッグロット](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegplot.m)
下にデータをスクロールする。

![画像:Scrollchannelactivities1.png](/assets/images/Scrollchannelactivities1.png)

メニュー項目 <span style="color: brown">ファイル → 履歴スクリプト → セッション履歴スクリプトを保存</span> コマンド履歴をascii-text MATLABに保存する
スクリプトファイル。 ファイルを現在のディレクトリに保存するか、
MATLAB コマンドパスのディレクトリ (すなわち、リストで返された
*\>\> パス* セッションコマンドを保存する
MATLABスクリプトファイルへの履歴 *doitagain.m*(可能)
標準のMATLABで終わる限り、このファイルの名前を選択します。
スクリプトファイルの拡張子「.m」。

これで、任意のテキストエディタでスクリプトファイル *doitagain.m* を開きます。
関数呼び出しを変更します。 たとえば、MATLABエディタでスクリプト *doitagain.m* を開きます。 <span style="color: brown">オープン</span> MATLABのグラフィカルインターフェイスのボタン。 スクリプトはこのように見えるはずです。

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
- 最初のコマンドは EEGLAB を起動します。
- 2番目のコマンドは、チュートリアルデータセットを読み込む
- 3番目のコマンドは、EEGLABメモリにデータセットを保存します
- 4番目のコマンドは、データセットの一貫性をチェックします
- 第5コマンドはデータをプロットする
- 第6回コマンドは、EEGLABのグラフィカルインターフェイス(現在のデータセットが変更された場合)を更新します。

Note: ファイルが保存されたとき、追加のコマンド *\>\> eeglab 再描画*
メインのグラフィックインターフェイスが確実になるように、最後に追加されました。
データセットが処理された後更新される。 

今すぐプレス <span style="color: brown">ログイン</span> MATLABエディタのボタン。 スクリプトが実行され、データスクロールウィンドウがポップアップ表示されます。 あるいは、EEGLABメニュー項目を使うこともできます。 <span style="color: brown">ファイル → 履歴スクリプト → スクリプトを実行</span> スクリプトを実行する(このメニュー項目は、MATLAB グラフィカルインターフェイスがアクセスできない EEGLAB のコンパイル済みバージョンに最も関連しています)。 また、MATLAB コマンドラインでスクリプトの名前を入力して実行することもできます(保存したフォルダをパスに割り当てます)。

``` matlab
doitagain
```

スクリプトは必要に応じて変更され、再び実行することができます。 EEGLAB グラフィカルインターフェイスとコマンド履歴を保存することで、EEG 解析スクリプトを書くための簡単な方法です。 これで、別のデータセットを処理する
現在のデータセットを処理するために使用した同じコマンドを使用して、試します
現在のMATLABセッションを閉じます。 MATLABを再起動し、スクリプトを読み込みます
*doitagain.m* は、データセットの名前を変更します(例えば、自分の1つを使用してください)。
再びスクリプトを実行します。

履歴フィールドのほとんどのコマンドは EEGLAB *pop_* 関数を呼び出します。
EEG構造を入力する関数です。 ふりがな [EEGLABの機能](/tutorials/ConceptsGuide/EEGLAB_functions.html) これらの関数を EEGLAB スクリプトで使用する方法について説明します。

詳細については、
MATLABは、以下のEEGLABメニューからこれらの機能に対するメッセージのヘルプを学習しなければなりません。
お問い合わせ [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m)、ビア <span style="color: brown"> ヘルプ → EEGLAB
関数 → インタラクティブなポップアップ関数</span> または <span style="color: brown"> ヘルプ → EEGLABメニュー</span>お問い合わせ お問い合わせ [eeg_store.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_store.m)、ビア <span style="color: brown"> ヘルプ → EEGLAB 高度な → 管理者機能</span>お問い合わせ 以下に示すように、MATLABコマンドラインヘルプも使用できます。

``` matlab
help pop_loadset
help eeg_store
```

EEGLABのデータセット履歴
-----------------------

EEGLABでは、現在のデータセットを記述するデータ構造は、
*\>\>\> を入力することで、MATLABコマンドラインから常にアクセス お問い合わせ
変数 *EEG* は EEGLAB が使用する MATLAB 構造で、全て保存します。
データセットに関する情報 データセット名と
filename, チャンネル数とその場所, データサンプリング
料金、試行回数、各イベントに関する情報
トライアル/エポック、データ自体など。 完了のため
*EEG* フィールドの説明とサンプルデータに関する例
[エッグラボ データ構造](/tutorials/ConceptsGuide/Data_Structures.html)お問い合わせ コンテンツ
*EEG*構造のフィールドは、*EEG.fieldname* を入力することでアクセスすることができます。
例えば、MATLABコマンドラインで*\>\> EEG.nbchan*を入力
現在のデータセットのチャンネル数を返します。

EEGLAB コマンドは、EEGLAB のメニューで発行され、影響を受ける
現在のEEGデータセットは、*EEG.history*フィールドに保存されます。 ふりがな
履歴フィールドの内容には、その関数呼び出しを含む
現在のデータセットを修正し、関数をプロットする呼び出し。 

*EEG.history*フィールドの使用は、学習を開始するための最も簡単な方法です
EEGLABスクリプトについて 例えば、バイナリデータセット(for)をインポートします。
インスタンス, [試験.CNT](http://sccn.ucsd.edu/eeglab/download/TEST.CNT)) 以下のメニュー項目を使用しました。
1. メニュー項目を使用する <span style="color: brown">ファイル → インポートデータ → EEGLAB関数とプラグインを使用して → Neuroscan .CNT ファイルから</span> ファイルをインポートする(すべてのデフォルトを使用する)
2. メニュー項目を使用する <span style="color: brown">ツール → サンプリング速度の変更</span> サンプリングレートを250に変更 Hzは、すべてのデフォルトを新しいデータセットを作成するために保ちます
3. メニュー項目を使用する <span style="color: brown">ツール → データをフィルタリング → 基本 FIR フィルター</span> 1 Hz (最初の編集箱)のハイ パス フィルターは、すべてのデフォルトを新しいデータセットを作成するために保ちます
4. メニュー項目を使用する <span style="color: brown">Plot → チャンネルデータ(スクロール)</span> データの視覚化

それからタイプして下さい*\>\> EEG.history* について
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

これらは、生データファイルをインポートした後、EEGLABで実行されるすべてのコマンドです。
前のセクションで保存した *session* の履歴は歴史です
EEGLAB が起動し、複数のデータセットの変更が含まれているため。
*EEG.history* フィールドは、現在のデータセットの変更のみが含まれています。

この場合、EEGLABに3つのデータセットがあり、データセット番号3の履歴フィールドです。 お問い合わせ
メニューを選択することにより、データセットに切り替える(元の連続データセット)
アイテム <span style="color: brown">データセット → データセット 1</span>, と入力します。 *\>\>
コマンドラインの EEG.history*(以下に示すように)、同じリストを取得します
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

注意: EEGLAB の読み込み (および保存) データセットのコマンドは、データセット履歴に保存されません。 理由
そのため、データセットを繰り返し読み込むと、
繰り返しロードコマンドをデータセット履歴にしたい。

*EEG.history*コマンドは、いくつかあるときに非常に便利です。
データセット(例えば、複数の被験者から)と同一を申請したい
それらすべてへの処理。 *EEG.history* フィールドは、
dataset EEG構造なので、EEGLABセッションで利用できます。 お問い合わせ
例えば、新しいデータセットがあれば、同じように処理したい
以前のデータセットは、古いデータセットを EEGLAB に読み込み、*\>\>\>\>\>
EEG.history* では、新しいデータセットで実行するコマンドのリストが表示されます。
EEGLABスクリプトを書くための基本的な方法は、これらを保存またはコピーして貼り付けるだけです。
MATLABスクリプトファイルへの履歴コマンド。

具体的に、最初に処理するために
データセットは、EEGLABのグラフィックインターフェイスを使用できます。 処理する
同様のデータセットは、最初に履歴をコピーまたは保存するだけです。
スクリプトファイルへのデータセット(拡張子「*.m*」のテキストファイル)
例: *doitagain.m*) は、異なるデータセットをロードして実行します。
MATLAB コマンドラインからのスクリプト。 スクリプトファイル
*doitagain.m*は、通常、現在のMATLABパスにある必要があります。
現在の作業ディレクトリを含みます。 ヘルプメッセージを読む
MATLAB の機能 *path.m* と *addpath.m* が MATLAB について詳しく知る
パス。 ステップバイステップの手順は以下の通りです。

1.  EEGLABに処理したいすべてのデータセットをロードします。
2.  最初にMATLABメニューから望む処理を実行します
    データセット。
3.  コマンド履歴(type *\>\>EEG.history*)を尋ね、コピーします。
    データ処理コマンド。
4.  EEGLABメニューから2番目のデータセットに切り替えて貼り付ける
    MATLAB コマンドラインにバッファされたコマンドで、再度実行します。
    新しいデータセットで。
5.  最後のデータセットが処理されるまで、このように進みます。

より高度なスクリプト例を以下に提示します。
セクション。

データセット履歴は、セッション履歴よりも使いやすいことが多い
データセットを操作するためのすべてのコマンドは含まないので。

メインの EEGLAB ウィンドウをリフレッシュ
------

EEGデータセットとのやり取りから切り替えたい時
EEGLAB のグラフィックインターフェイスと連携するコマンドラインで、
以下の2つのコマンドのいずれかを実行してください。

- EEGLABウィンドウがバックグラウンドで実行されていない場合、タイプ:
``` matlab
eeglab redraw;
```

![](/assets/images/eeglab20191.png)

-  開いた EEGLAB セッションがある場合、現在のデータセットタイプを以下のように変更して、現在のデータセットを上書きします。

``` matlab
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);
eeglab redraw;
```

新しいデータセットを作成するには、以下を入力します。

``` matlab
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG);
eeglab redraw;
```

EEGLABウィンドウで変更が反映されます。

EEGLABのデータ構造の操作
-------------------------------------------------------------------

EEGLAB MATLABのデータ構造は2つあります。*EEG*と*ALLEEG*。
*ALLEEG* 配列には、現在存在する全てのデータセット構造が含まれています。
EEGLABセッションで読み込まれる。 *EEG*構造は、すべて含まれています
処理中のデータセットに関する情報。 詳細はこちら [エッグラボ データ構造](/tutorials/ConceptsGuide/Data_Structures.html) 詳細については、.

前のセクションで見てきたように、EEGLAB セッション履歴では、複数の操作と処理ができます。
同時にデータセット。 現在の EEGLAB セッションのセッション履歴を表示するには、
*eegh* (履歴) コマンド。 タイピング:

``` matlab
eegh
```

MATLAB では、MATLAB コマンドで EEGLAB セッション履歴を出力します。
ラインウィンドウ。 例えば、既存のデータセット(Call)を開くと <span style="color: brown">ファイル → データの読み込み</span>;;; EEGLAB分布の "sample_data" フォルダにある "eeglab_data.set" のチュートリアルファイルを選択します。 その後、 *Open* を押します。
、入力 *eegh* の
コマンドラインは、次のテキストを返す必要があります。

``` matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset( 'eeglab_data.set', '/matlab/eeglab/sample_data');
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG);
```
最初のコマンド ([eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m)) EEGLAB を実行し、初期化
関数出力にリストされている複数の EEGLAB 変数。 対象外
これらの変数を変更し、EEGLAB関数(必要に応じて)にパスを追加し、 [eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m) 呼び出しは他の何も変更しません
MATLABワークスペース(EEGLABではグローバル変数はありません) 2番目のコマンド ([pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m)) データセットを
*EEG*の構造および最後の()[eeg_store.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_store.m)) ストア
*ALLEEG*構造内のデータセット。 

前のセクションで示されているスクリプトの種類は、戻ってくる可能性があり、
EEGLAB のグラフィックインターフェイスと MATLAB のコマンドラインとの間の お問い合わせ
2つの主要なEEGLABの構造間の一貫性を維持して下さい(*EEG*および
*ALLEEG*)は変更するたびに*ALLEEG*を更新する必要があります
*EEG*の構造。 追加または直接変更
*EEG* はスクリプトまたは MATLAB コマンドラインからの値を設定します。
簡単なルールを尊重する必要があります。

複数のデータセットを格納する EEGLAB オプションを選択した場合、 <span style="color: brown">ファイル → 環境設定</span> メニュー項目(最初のチェックボックス)、すべての現在の EEGLAB データセットは
構造の配列*ALLEEG、*で貯えられる。 データセットを変更した場合、
変更されたEEGデータセットを*ALLEEG*にコピーするために注意を払って下さい。

従って、ローディングの後でそして作成するために*EEG*の構造を変更して下さい
新しいデータセットは、単にタイプするかもしれません:

``` matlab
ALLEEG(2) = EEG;
CURRENTSET = 2;
```

このコマンドは 'might' が期待どおりに動作します (新しいデータセットが新しい場合)
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
*ALLEEG*変数。 データセット番号は、その後、
変数 *CURRENTSET*。 以前のデータセットが既にある場合
dataset 2 に割り当てられた後、最後のコマンド (above) だけは、
それを上書きします。 メインの EEGLAB ウィンドウの変更を表示するには、
コマンド: *\>\> eeglab 再描画;*
*ALLEEG*構造を変更するために使用できる別のコマンドは、 [pop_newset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newset.m)お問い合わせ このコマンドは、広範な機能を実行します。
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

返された引数 *CURRENTSET* は新しいセット番号を保持します
EEGLABに保存されているデータセット。
注意: *EEG* には現在のデータセットのみが含まれているため、使用する必要があります。
この構造を更新するときに余分な注意。 e.g. 必ず確認してください
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
*EEG.event*情報からEEG.epoch*の構造。 このコマンド
イベント構造が変更される場合にのみ使用されます。 イベントを見る
スクリプトのチュートリアル](/tutorials/11_Scripting/Event_Processing_command_line.html)
EEGイベントと連携

上記のコマンドは、複数のコマンドを維持するオプションがある場合に便利です。
データセットがオンになっています。 複数のデータセットを維持するオプションがオフの場合
(ビア・ザ・ <span style="color: brown">ファイル → 環境設定</span> メニュー項目)
*ALLEEG* 変数は使用されません。*EEG* は変数だけです
データセット情報が含まれています。 このオプションを使用する場合は、
一度に1つのデータセットを処理する(ここでの目標は、より少ないメモリを使用することです。
より大きなデータセットを処理することができる。 ユーザーによる変更
*EEG*構造は即刻適用され、あります
不可逆。 一貫性のために、上記のすべてのコマンドが機能します。
ただし、*ALLEEG*変数は空になります。

ユーザによる*EEG*構造に追加された新しいフィールドは、
EEGLAB関数で削除します。 データセットに関する追加情報
user-added フィールドに格納される可能性があります。

``` matlab
EEG.analysis_priority = 1;
```

このページの冒頭で述べたように、EEGLAB(EEG: 現在のEEGデータセット;ALLEEG:すべての読み込まれたEEGデータセットの配列; CURRENTSET: 現在のデータセットのインデックス; LASTCOM: EEGLABメニューから発行された最後のコマンド; ALLCOM: EEGLABメニューから発行されるすべてのコマンド; STUDY: EEGLABグループ解析構造; CRENURTSTUDY: EEGLABグループ解析が0の場合、グループ解析が1EGLABの場合)。
EEGLABはグローバル変数を使用しないことに注意してください(上記の変数は、
コマンドラインからアクセス可能ですが、グローバルでは利用できません。
EEGLAB内の変数。 上記の変数は通常の変数です
グローバルなMATLABワークスペース。 主要な相互窓機能を除いてすべてのEEGLAB機能 [eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m) (その他)
display関数) は、これらの変数の1つ以上を明示的に処理します。
入力パラメータは、グローバル変数にアクセスしたり変更したりしません。 お問い合わせ
望ましくない 'side を生産する最小チャンスがあることを確認してください。
データセットのエフェクト

基本的なスクリプト例
------------------------
EEGLABが保存したショートまたはロングEEGLAB MATLABスクリプトの構築と実行
歴史は、そのシンプルにすることができます。 EEGLAB の処理を目的と実行するだけです。
EEGLABメニューからEEGLABコマンド履歴を保存し、再実行
保存されたスクリプトファイル。 MATLABは、実行した全てのステップを繰り返します。
手動で。

以下は、メインの最初のいくつかのステップの次の例です。
歴史からコピーしたMATLABスクリプトのチュートリアル。 一部が含まれています
データセットで実行しなければならない最初の基本的な操作。 お問い合わせ
チュートリアルデータセット *eeglab_data.set* と、
対応するチャンネルの場所ファイル *eeglab_chan32.locs*. 追加しました
コンピュータとMATLABスタイルのデータファイルを見つけるためのコードの数行
コメントはありません。 
EEGLABの歴史から直接スクリプトをコピーします。 このセクションのスクリプトは利用できます [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab_history.m)お問い合わせ コマンドのタイピング ''\>\> eegh は戻ります。



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

*eeg_store* や *pop_newset* などのコマンドは、複数のデータセットを管理するためのものです。
現在のデータセットの処理に興味がある場合は、安全に無視できます。 以下は同じスクリプトです。
コメントや追加のデータ管理コマンドなしで、コンパクト化。

*注意事項:* 以前述べたように、関数は
メインの EEGLAB インタラクティブウィンドウから、ウィンドウタイトルバーのアンダーリング *pop_* 関数の名前を表示します。 例えば、選択 <span style="color: brown">ファイル → 既存のデータセットをロードする</span> 既存のデータセットで読み込むには、EEGLAB関数を使用します。 [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m).

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

追加コメント付きの EEGLAB 履歴からの別の例は以下にコピーされます(機能ヘルプメッセージを参照してください)
詳細情報)。 以下では、現在のデータセットを再サンプルし、EEGLAB のグラフィックインターフェイスで元のデータセットを選択します。

``` matlab
%% Reduce sampling rate
% Reduce the sampling rate to 128 Hz (the above example was already sampled at 128 Hz'')
EEG = pop_resample( EEG, 128);

% Save it as a new dataset with the name Continuous EEG Data resampled
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'Continuous EEG Data resampled');

% Now on the GUI we returned to the previous dataset (before downsampling)
EEG = eeg_retrieve(ALLEEG, 1); CURRENTSET = 1;
```

pop_ 関数と低レベルの信号処理関数を使用する
-------

まず、ERPのスカルプマップを0msから500msまで作成します。 [pop_topoplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_topoplot.m) 機能。 EEGLABの歴史からこの部分をコピーすることができます。 EEGLABでデータセットをロードするために、このコマンドを実行する前に、前のセクションでスクリプトを実行する必要があります。 このセクションのスクリプトは利用できます [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab_history.m).

``` matlab
%% Plot ERP maps 
% Every 100 ms from 0 ms to 500 ms [0:100:500]
% Plot marks showing the locations of the electrodes on the scalp maps.
pop_topoplot(EEG,1, [0:100:500] , 'ERP scalp topographies',[2:3] ,0, 'electrodes', 'on');
```

![](/assets/images/topoplot_history2.png)

pop_ 関数を呼び出す代わりに、EEGLAB データを直接呼び出します。
処理機能。 EEGLABで生成されたスクリプトはEEGLABで生成されず、EEGLABの履歴からコピーされます。
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

EEGLAB MATLABスクリプトを書くための次のステップ
EEGLAB関数パラメータを変更し、ループを追加する学習
複数の分析を行います。 スクリプトの例をいくつか紹介します。
