---
layout: default
title: Create an EEGLAB plugin
long_title: Create an EEGLAB plugin
parent: Contribute
grand_parent: Tutorials
nav_order: 1
---
EEGLABプラグインの作成と拡張
========================
お問い合わせ
プラグインの作成と拡張に関するこのセクションはかなり長いです。 しかし、EEGLABプラグインの作成は非常に簡単です。 急いでいるなら、 [例セクション](/tutorials/contribute/design_plugin.html#eegplugin_-function-examples) コードをコピーして貼り付けます。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

EEGLAB関数の書き方
--------------------------------

### EEGLAB機能カプセル化

EEGLABは、豊富なMATLAB環境で動作します。 構造の
EEGLAB関数は、元の新しい方法でそれらを組み合わせるのを容易にします
MATLABスクリプトは、多種多様なものを組み込むこともできます。
MATLABでは、ツールやメソッドの処理が可能です。 したがって、
EEGLABの機能を追加する簡単な方法は、EEGLABを使用することです
MATLABスクリプト内の関数とデータ構造、何か
多くまたはほとんどの EEGLAB のユーザーは定期的に行います。

EEGLAB関数はカプセル化と分離のレベルを提供します
変数名間の干渉の可能性を最小限に抑える
そして、MATLABスクリプトで、またはその関数の外部から、
それらを呼び出すことができる関数。 EEGLABは、本質的に、大きなセットです。
MATLABの機能。 

EEGLABに新しい機能を追加するには、機能のペアが必要です。
信号処理機能(例:
[サンプル。 m 点](http://sccn.ucsd.edu/eeglab/download/sample.m))、および
*pop_* 関数を伴って (例:
[人気カテゴリー](http://sccn.ucsd.edu/eeglab/download/pop_sample.m))。 ふりがな
*pop_* 関数は、ユーザが指定できるようにテキスト入力ウィンドウをポップアップします
シグナル処理関数への引数。 MATLABのヘルプメッセージ
各関数は、入力引数が何であるかを明確に記述する必要があります。
関数は、ヘルプメッセージの形式を使用して、出力されたものと要求します
お問い合わせ あなたが読む必要があります [EEGLAB機能](/tutorials/ConceptsGuide/EEGLAB_functions.html) チュートリアルのセクションを理解する
EEGLABの機能の異なるレベル。

### 信号処理機能

EEGデータフィールド上で直接動作する機能が遵守すべき
EEGLAB のヘルプメッセージの構文 EEGLAB のユーザは使い慣れています。 例えば、この[sample]を参照してください。
ヘッダ>(http://sccn.ucsd.edu/eeglab/download/sample.m).

### 関連するポップアップ_関数

信号処理機能に関連した *pop_* 関数は、
それにグラフィック ユーザー インターフェイス。 *pop_* 関数(全名は必須)
*pop_* で始まると、シグナル処理の名前が続きます。
関数)は信号処理として同じdisclaimerを含んでいるべきです
機能および

1.  EEGLAB のデータ構造 'EEG' を最初の入力として取り込む必要があります。 オプションで、
    関数の第2変数は信号処理機能かどうか指定できます
    ICAコンポーネントのアクティベーションやEEGデータに適用します。
    チャンネル.
2.  追加パラメータはオプションです。 空白のままの場合
    MATLAB の *pop_* 関数へのコマンドラインやスクリプト呼び出し
    ウィンドウは、自分の値を求めるためにポップアップする必要があります。
3.  *pop_* 関数は結果を含む 'string' を返す必要があります
    信号処理機能(または、場合によっては、
    *pop_* 関数)。 この文字列がMATLABで評価される場合
    関数 *eval*, 結果は、そのと同じでなければなりません
    *pop_* 関数自体、例えば、ユーザが持つ全てのパラメータを含む
    ポップアップインターフェイスウィンドウに入力しました。 この文字列は
    EEGLABコマンド履歴スタックにプッシュ。
4.  慣習によって、機能が図を引いたら、機能を呼び出す
    十分な引数なしで新しい数字をポップアップする必要があります。 しかし、与えられた
    十分な引数、関数は
    現在の図の出力グラフィックを直接描画します。
    *sbplot* を使用して、複数の部分の図を、例えば造ることを可能にします
    コマンド) *pop_* 関数を書くことは簡単で、通常は実行できます
    これを変更した場合、数分
    [人気カテゴリー](http://sccn.ucsd.edu/eeglab/download/pop_sample.m)
    機能ソース。

### EEGLAB関数のデバッグ方法

EEGLAB GUI から呼び出されると、EEGLAB はエラーを傍受します。
デバッグ機能への挑戦 ソリューションは、
コマンドラインから関数(*dbstop で前述)
error*) と EEGLAB はエラーを遮断しません。

EEGLAB GUI デザイン機能を利用する
-----------------------------------
関数 [スーパーギ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 作成に使用する主な機能
EEGLABのグラフィックインターフェイス。 私たちは、いくつかの基本の下に記述します
それのためのより高度の使用:

### supergui関数を使用する

ふりがな [スーパーギ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 手動で作成する負担を軽減するように設計されました
各機能のグラフィックインターフェイス。 代わりに、一連の制御が
近似の場所と図が自動的に作成されます。
以下の例を示します。

``` matlab
  supergui( 'geomhoriz', { 1 1 1 }, 'uilist', { ...
         { 'style', 'text', 'string', 'Hello!' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK' } } );
```

これは、次のグラフィックインターフェイスを作成します。

![センター](/assets/images/Supergui1.jpg)

上記のコマンドラインコールには、'geometry' と
'uilist'. 'geometry' は、このケースで幾何学を定義します。 3 行 { 1 1 1 1 1 1 }
(下のより複雑な幾何学参照)。 'uilist' は、コンテンツの定義
これらの行のそれぞれ。 最初の行には "{ 'style' というテキストが含まれています。
'text', 'string', 'Hello!' はコメントを受け付けていません。 2番目の行は "{ }" と "
3行目は "OK" ボタン "{ 'style', 'pushbutton' , 'string' を含んでいます。
お問い合わせ

しかし、*Ok*を押すと、アクションがないため何も起こらない
このボタンに関連付けられている。 UI 制御にアクションを関連付けるには、
単に 'callback' コマンドを使用し、任意の MATLAB コマンドを入力します。
関連する文字列パラメータ。

``` matlab
  supergui( 'geomhoriz', { 1 1 1 }, 'uilist', { ...
         { 'style', 'text', 'string', 'Hello!' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK' 'callback' 'close(gcbf);' } } );
```

上記は「callback」コマンド "close(gcbf)" を追加しました。
ユーザーが*Ok*ボタンを押しているとき現在の図。

ほぼすべてのジオメトリ(ただし、高度なセクションですべて詳細ではありません)
このスキームを使用して定義することができます。 例えば

``` matlab
  supergui( 'geomhoriz', { [1 1] 1 1 }, 'uilist', { ...
         { 'style', 'text', 'string', 'Enter some text' }, ...
         { 'style', 'edit', 'string', 'Hello!' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK' 'callback' 'close(gcbf);' } } );
```

![センター](/assets/images/Supergui2.jpg)

最初の行はジオメトリ\[1\]を持っています。つまり、2つのUIが
この行を共有し、同じ水平な範囲を持っています。 以下に示すように、 \[1 1\] を
\[1 0.5\] は、行の 2 番目の UI を強制してのみ
最初の1つの水平方向の半分。

![センター](/assets/images/Supergui3.jpg)

場合によっては、UIのスパムを1ライン以上持っていることは便利です
テキスト。 これは、例えば、*listbox* UI の場合です。 以下は定義します
*listbox* UI は複数の選択で、追加のコマンド 'geomvert を使用します。 お問い合わせ
垂直ジオメトリを指定する。 \[3 1 \] に設定されます。
最初の行の UI が 3 行のテキストと他の行に及ぶこと
行はテキストの 1 行だけにスパンします(キャリッジリターンを追加する必要があります -
文字10 - 最初のUIのテキストにこのテキストは整列されます
*listbox* UI の

``` matlab
  supergui( 'geomhoriz', { [1 1] 1 1 }, 'geomvert', [3 1 1], 'uilist', { ...
         { 'style', 'text', 'string', [ 'Make a choice' 10 10 10 ] }, ...
         { 'style', 'listbox', 'string', 'Choice 1|Choice 2|Choice 3' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK' 'callback' 'close(gcbf);' } } );
```

![センター](/assets/images/Supergui4.jpg)

### Inputgui関数を使用する

しかし、 [スーパーギ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) GUI だけを生成し、すべてのGUI が使える
イベントの制御フローは、UIによって処理する必要があります。つまり、
ボタン *Ok*、ボタン *Cancel* および関連するイベントの処理
これらのボタンはユーザーに残されます。 ふりがな [入力gui.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=inputgui.m) 関数(その
呼び出し [スーパーギ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 機能) 自動的にこれを補うのを助けて下さい
出力を処理することで、これらのボタンやボタンを作成できます。 例えば:

``` matlab
  res = inputgui( 'geometry', { [1 1] }, ...
         'geomvert', [3], 'uilist', { ...
         { 'style', 'text', 'string', [ 'Make a choice' 10 10 10 ] }, ...
         { 'style', 'listbox', 'string', 'Choice 1|Choice 2|Choice 3' } } );
```

![センター](/assets/images/Supergui5.jpg)

*res* 出力は結果 -- をこの場合、セル配列含んでいます
ユーザの選択肢(例えば、{\[1\]})を示す1から3までの単一値を含む。 このセル配列の要素数
出力を返すUIの数に依存します(一般的なテキストで、
ボタンは出力を戻しませんが、チェックボックス、リストボックス、および編集ボックスは行いません。
この関数を使用する別の方法は、各 UI のタグを設定し、使用することです。
第4出力:

``` matlab
  [res userdata err structout] = inputgui( 'geometry', { [1 1] }, ...
         'geomvert', [3], 'uilist', { ...
         { 'style', 'text', 'string', [ 'Make a choice' 10 10 10 ] }, ...
         { 'style', 'listbox', 'string', 'Choice 1|Choice 2|Choice 3' 'tag' 'list' } } );
```

出力構造 *structout* には、*listbox* UI (structout) の出力を含む *list* というフィールドが含まれます。 リスト = 1
インスタンス 開発者がいないのでGUIの作成に便利です。
出力順序を覚える必要があります。 注文を変更することができます
行、スクリプトの他の部分を変更する必要はありません。

以下に示す複雑なUIは、この技術を使用しています。 インスピレーションは、
*pop_newtimef* 関数。

``` matlab
    g = [1 0.3 0.6 0.34];
    geometry = { g g g g g g g g [1.025 1.27] [1] [1.2 1 1.2]};
    uilist = { ...
      { 'Style', 'text', 'string', 'Channel number', 'fontweight', 'bold'  } ...
      { 'Style', 'edit', 'string', '1' 'tag' 'chan'} {} {} ...
      ...
      { 'Style', 'text', 'string', 'Time limits [min max] (msec)', 'fontweight', 'bold' } ...
      { 'Style', 'edit', 'string', ' ' 'tag' 'tlimits' } ...
      { 'Style', 'popupmenu', 'string', 'Use 50 time points|Use 100 time points' ...
        'tag' 'ntimesout' 'value' 4} { } ...
      { 'Style', 'text', 'string', 'Frequency limits (Hz)', 'fontweight', 'bold' } ...
      { 'Style', 'edit', 'string', ' ' 'tag' 'freqs'  } ...
      { 'Style', 'popupmenu', 'string', 'Use limits, padding 1|Use limits, padding 2' ...
        'tag' 'nfreqs' }  ...
      { 'Style', 'checkbox', 'string' 'Log spaced' 'value' 0 'tag' 'freqscale' } ...
      ...
      { 'Style', 'text', 'string', 'Baseline limits [min max] (msec) (0->pre-stim.)', ...
        'fontweight', 'bold' } ...
      { 'Style', 'edit', 'string', '0' 'tag' 'baseline' } ...
      { 'Style', 'popupmenu',  'string', 'Use divisive baseline|Use standard deviation' ...
        'tag' 'basenorm' } ...
      { 'Style', 'checkbox', 'string' 'No baseline' 'tag' 'nobase' } ...
      { 'Style', 'text', 'string', 'Wavelet cycles [min max/fact] or sequence', ...
        'fontweight', 'bold' } ...
      { 'Style', 'edit', 'string', '3 0.5' 'tag' 'cycle' } ...
      { 'Style', 'popupmenu', 'string', 'Use limits|Use actual seq.' 'tag' 'ncycles' } ...
      { 'Style', 'checkbox', 'string' 'Use FFT' 'value' 0 'tag' 'fft' } ...
      { 'Style', 'text', 'string', 'ERSP color limits [max] (min=-max)', ...
        'fontweight', 'bold' } ...
      { 'Style', 'edit', 'string', ' ' 'tag' 'erspmax'} ...
      { 'Style', 'checkbox', 'string' 'see log power (set)' 'tag' 'scale' 'value' 1} ...
      {} ...
      { 'Style', 'text', 'string', 'ITC color limits [max]', 'fontweight', 'bold' } ...
      { 'Style', 'edit', 'string', ' ' 'tag' 'itcmax'} ...
      { 'Style', 'checkbox', 'string' 'plot ITC phase (set)' 'tag' 'plotphase' } {} ...
      { 'Style', 'text', 'string', 'Bootstrap significance level (Ex: 0.01 -> 1%)', ...
        'fontweight', 'bold' } ...
      { 'Style', 'edit', 'string', ' ' 'tag' 'alpha'} ...
      { 'Style', 'checkbox', 'string' 'FDR correct (set)' 'tag' 'fdr' } {} ...
      { 'Style', 'text', 'string', 'Optional newtimef() arguments (see Help)', ...
        'fontweight', 'bold'} ...
      { 'Style', 'edit', 'string', ' ' 'tag' 'options' } ...
      {} ...
      { 'Style', 'checkbox', 'value', 1, 'string', ...
        'Plot Event Related Spectral Power', 'tooltipstring', ...
        'Plot log spectral perturbation image in the upper panel' 'tag' 'plotersp' } ...
      { 'Style', 'checkbox', 'value', 1, 'string', ...
        'Plot Inter Trial Coherence', 'tooltipstring', ...
        'Plot the inter-trial coherence image in the lower panel' 'tag' 'plotitc' } ...
      { 'Style', 'checkbox', 'value', 0, 'string', ...
        'Plot curve at each frequency' 'tag' 'plotcurve' } ...
      };

      [ tmp1 tmp2 strhalt structout ] = inputgui( geometry, uilist, ...
           'pophelp(''pop_newtimef'');', 'Plot channel time frequency -- pop_newtimef()');
```

上記のスクリプトをコピーして貼り付けると、以下のGUIが生成されます。 お問い合わせ
幾何学が定義されたのか。 ふりがな [スーパーギ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 関数は、ウィンドウの幅と高さを自動的に変化させます。
要素。 また、コマンドを実行する *Help* ボタンに注意して下さい。
"pophelp(*pop_newtimef*);" で定義されている [入力gui.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=inputgui.m) command-line 呼び出し。
*Ok*を押すと、*structout*構造のフィールド
GUI 内のすべてのユーザエントリを含む。

![センター](/assets/images/Supergui6.jpg)

### 高度なGUI設計

1つの制限 [スーパーギ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 呼び出し形式は不可能である
ランダムな幾何学を定義する。 任意の行は同じにスパンする必要があります
高さ。 周囲の形成を可能にする高度な呼び出し形式があります
その問題。

``` matlab
  supergui('geom', { {2 2 [0 0] [1 2] } { 2 2 [1 0] [2 1] } { 2 2 [1 1] [2 2] } }, ...
           'uilist', { { 'style' 'listbox' 'string' 'cell 1|cell 2' } ...
                       { 'style' 'checkbox' 'string' 'cell 3' } ...
                       { 'style' 'text' 'string' 'cell 4' } });
```

![センター](/assets/images/Supergui7.jpg)

お問い合わせ
上記の入力はヘルプセクションで詳細です [スーパーギ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 機能。

EEGLAB拡張機能の書き方
---------------------------------

EEGLABには、*extension*(*plugin*とも呼ばれる)施設もあります。
指定された *plugin* にロードされた関数を自動的に検索
ディレクトリは、拡張を呼び出す1つ以上のメニュー項目を引き起こします
EEGLABメニューに表示されます。 EEGLAB *extensions*は、
EEGLABの配布を独立して、誰でもダウンロードして使用してください。 それらは含まれていることができます
EEGLAB拡張マネージャで。


EEGLABは、適切な名前のプラグインを自動的に組み込む
EEGLAB の *eegplugin_myfunc.m* という名前の関数
*eeglab.m* と同じディレクトリにあります。 (Here, *myfunc* は必須です)
延長のための主要な信号処理機能の名前)。 作成する
このディレクトリの *eegplugin_* 関数はメニュー項目を追加します。
*eegplugin_* 関数で指定されたメニューラベル(s)を
指定されたトップレベルのEEGLABメニューの下部(この拡張メニューラベル)
サブメニューの無制限数にリンクする可能性があります。 メニュー
項目(または項目)は標準か習慣EEGLABのデータ処理を呼ぶことができます
*pop_* 関数(以下例を参照)。 ユーザが EEGLAB をダウンロードしたときに
エクステンション(EEGLABエクステンションマネージャー、メイン担当)
EEGLABサイト、またはその他のWebサイト)、*eegplugin_*関数は、その後、
スタートアップでEEGLAB(名前のファイルやディレクトリを検索)
メインの EEGLAB ディレクトリの *eegplugin_* を開始します。

### eegplugin_ 関数の作成

新しい EEGLAB 拡張機能を作成するには、MATLAB 関数ファイルを作成するだけです。
その名前は *eegplugin_* で始まり、
*plugins*機能サブディレクトリ。 お問い合わせ
関数は 'test' 拡張子のように 3 つの引数をとらなければならない
*eegplugin_* 関数は以下を示します。

```matlab
>> eegplugin_test (fig, try_strings, catch_strings);
```

上記の3つの引数は、*eegplugin_* 関数に
エグラボ 最初の引数は、メインのEEGLABのハンドルです。
ウィンドウ。 第2引数と第3引数は、EEGLABが渡した構造です。
これにより、*eegplugin_* 関数がパラメータをチェックしたり、エラーを検出したりすることができます。
その他(下記参照) 延長を望まないとします
EEGLABの履歴とエラーメッセージ処理を使用します。 その場合、最後に無視できます
2つのパラメータ(*eegplugin_*関数が) <em>ログイン</em>
それでも3つの引数をすべてリストしなければなりません。または EEGLAB は呼び出しできません。

### 拡張メニュー項目またはサブメニューの追加

EEGLABのトップレベルの拡張機能で新しいメニューアイテムを作成する
メニューは、このコマンドを *eegplugin_* 関数に追加するだけです。

```matlab
uimenu(fig,'label', 'My menu item','callback',...
  ['EEG=pop_myfunc(EEG); ...
  [ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);' ]);
```

ステートメント *\[ALLEEG EEG CURRENTSET\] = eeg_store(ALLEEG、EEG、
CURRENTSET; * 上記では、変更されたEEGデータセットが行われることを保証します。
EEGLAB *ALLEEG*構造に格納されます。 *myfunc* は置換されるべきです
拡張子の名前と*マイメニュー項目*を簡略で使用
メニュー項目ラベル(通常、拡張子の名前)。

### エクステンションとEEGLABの歴史

EEGLABの歴史とやりとりする拡張機能が必要な場合
メカニズムは、2番目の('try_strings')を利用し、
eegplugin_ 関数呼び出しに対する3番目の ('catch_strings') 引数。 ふりがな
2番目の引数 (上の *eegplugin_test.m* を参照) にはコマンドが含まれています
入力データセットを点検する(MATLABの構造に整理される)
コマンドを実行しようとする。 第3引数('catch_strings')
エラーを処理するコマンドと、LASTCOM のコンテンツを追加します。
(つまり、最後のコマンド) 変数を EEGLAB の履歴に変換します。


*eegplugin_* 関数は 1 つ以上の EEGLAB メニュー項目を宣言する必要があります。 詳しくはこちら
メニュー宣言はこのようになります。

``` matlab
uimenu( submenu, 'label', 'My menu item', 'callback', ...
  [ try_strings.anyfield '[EEG LASTCOM] = pop_myfunc(EEG);' ...
  catch_strings.anyfield ]);
```


'try_strings' (above) のフィールドは次のようになります。

-   *try_strings.no_check* : 空でないEEGの存在を確認する
    データセットのみ
-   *try_strings.check_ica* : データセットがICAを含むことを確認します
    体重
-   *try_strings.check_cont* : データセットが連続していることを確認します
-   *try_strings.check_epoch* : データセットが epoched であることを確認 (not)
    連続データ)
-   *try_strings.check_event* : データセットにイベントが含まれていることを確認してください
-   *try_strings.check_epoch_ica* : データセットが epoched であることを確認
    **および**はICAの重量を含んでいます
-   *try_strings.check_chanlocs* : データセットが含まれていることを確認します
    チャンネルの場所ファイル
-   *try_strings.check_epoch_chanlocs* : データセットがであることを確認します
    epoched ** と** には、チャンネルの場所 (chanlocs) ファイルが含まれます
-   *try_strings.check_epoch_ica_chanlocs* : データセットがであることを確認してください
    epoched ** と** は ICA の重み** と** チャネルの場所が含まれています
    ファイル。


'catch_strings' のフィールドは次のようになります。

-   *catch_strings.add_to_hist* : LASTCOM 変数 コンテンツを追加 (if)
    EEGLABの歴史に空でない)
-   *catch_strings.store_and_hist* : LASTCOM変数のコンテンツを追加します。
    EEGLABの歴史に(空でない)**と**EEGデータセットを保存
    AllEEG変数で。
-   *catch_strings.new_and_hist* : LASTCOM 変数 コンテンツを追加 (if)
    EEGLAB の履歴に空でない**と** 新しいデータセットウィンドウがポップアップ表示されます。

### eegplugin_ 関数例

*eegplugin_* 関数の単純なタイプは、プロットを呼び出している
機能。 例えば、ERPをプロットする簡単な拡張子を書く
異なる色ですべてのチャンネルで試用平均(パフォーマンスなし)
点検するデータ:

``` matlab
% eegplugin_erp() - plot ERP plugin
function eegplugin_erp( fig, try_strings, catch_strings)

% create menu
plotmenu = findobj(fig, 'tag', 'plot');
uimenu( plotmenu, 'label', 'Plot ERP', ...
  'callback', 'figure; plot(EEG.times, mean(EEG.data,3));');
```


上記のテキストをファイルとして保存します。 *eegplugin_erp.m* に EEGLAB の *plugins* サブディレクトリに、 EEGLAB を再起動 (クリック)
[詳しくはこちら](http://sccn.ucsd.edu/eeglab/download/eegplugin_erp.m) お問い合わせ
この機能をダウンロードしてください。 次に、epochedデータセットで、メニューを選択します。
アイテム <span style="color: brown">プロット → プロット ERP</span> ERP平均をプロットする
すべてのデータセットのエポック。

次の例を説明します。 *PCA*という名前の拡張子を作成するには
PCAをデータに適用し、PCAの重量を貯える
ICAの重量(注意:ほとんどの目的のためにお勧めしません!)、MATLABを保存します
*eegplugin_pca.m* を *plugins* のサブディレクトリにファイルとして下にあるコマンド
EEGLABと
EEGLABを再起動 (クリック)
[詳しくはこちら](http://sccn.ucsd.edu/eeglab/download/eegplugin_pca.m) お問い合わせ
この .m ファイルをダウンロードします。

``` matlab
% eegplugin_pca() - a pca plugin
function vers = eegplugin_pca(fig, trystrs, catchstrs) 

vers = 'pca1.00';

% find tools menu
menu = findobj(fig, 'tag', 'tools');

% PCA command
cmd = [ '[~, EEG.icawinv] = runpca(EEG.data(:,:));' ]; 
cmd = [ cmd 'EEG.icaweights = pinv(EEG.icawinv);' ]; 
cmd = [ cmd 'EEG.icasphere = eye(EEG.nbchan); disp(''Done'');' ];

% create menu
uimenu( menu, 'Label', 'Run PCA', 'CallBack', cmd, 'separator', 'on');
```

Note: *eegplugin_* 関数を使って、新しい拡張関連を追加できます。
異なるEEGLABメニュー見出しの下にメニュー項目。 上記は項目を追加します。
(「Run PCA'」と表記) <span style="color: brown">ツール</span> メニュー
*findobj.m* 呼び出しで 'tag','tools' を指定する。 指定された場合
タグは *import data* で、EEGLAB は指定したメニューを追加します。
アイテムへ <span style="color: brown">ファイル → インポートデータ</span> サブメニュー 使用方法
タグ *import epoch* は指定されたメニュー項目を に追加します。
お問い合わせ <span style="color: brown">ファイル → インポート エポック情報</span> サブメニュー タグ
*import event* は指定されたメニュー項目を指定したメニュー項目に追加します。
<span style="color: brown">ファイル → インポートイベント情報</span> メニュー タグ
*export* は指定されたメニュー項目を指定したメニュー項目に追加します。
<span style="color: brown">ファイル → エクスポートデータ</span> メニュー 最後に、タグ
*plot* は指定されたメニュー項目をに付加します
<span style="color: brown">ピロー</span> メニュー (タグが入るべきであることに注意)
より低い場合)。


上記の *eegplugin_* 関数をインストールした後、新しい EEGLAB メニュー項目
<span style="color: brown">ツール → PCAを実行</span> 作成します。 メニュー
現在のEEGデータセットのPCA変換を学習するための項目。 ふりがな
PCAの分解がICAの代わりに保存されます
分解します。 (注:通常は不可)
PCAとICAの両方が線形分解であるため。

EEGLABを見る [erpsource 拡張子](https://github.com/sccn/erpsource) お問い合わせ
より精巧な延長の例。

### EEGLABメニューの統合

2011年以降、メニューの動作を制御することができます。
EEGLAB 内で。EEGLAB は自動的に有効または無効にすることができます(例えば、グレー
メモリ内のデータに基づいて、非応答性のメニュー項目を出し、作り出します。 かもしれません。
いくつかの拡張関連メニュー項目が自動的に無効になっています
もしそうでなければいけません。 ですから、
メニュー項目の有効化スキームを実装し、
拡張メニュー項目(s)が有効になったときに制御可能。 お問い合わせ
そのため、開発者は*userdata*で複数のキーワードを組み込む必要があります。
メニュー項目のフィールド:

<table>
<thead>
<tr class="header">
<th>キーワード</th>
<th>デフォルト</th>
<th>コンテンツ</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>エポック</strong></td>
<td style="background-color:lightgreen">お問い合わせ</td>
<td>設定する <strong>オフ</strong> epoched データセットのメニュー項目を無効にするには</td>
</tr>
<tr class="even">
<td><strong>連続的な</strong></td>
<td style="background-color:lightgreen">お問い合わせ</td>
<td>設定する <strong>オフ</strong> 継続的なデータセットのメニュー項目を無効にするには</td>
</tr>
<tr class="odd">
<td><strong>スタートアップ</strong></td>
<td style="background-color:orange">オフ</td>
<td>設定する <strong>お問い合わせ</strong> 起動時にメニュー項目を有効にする(データ読み込みなし)</td>
</tr>
<tr class="even">
<td><strong>トレーニング</strong></td>
<td style="background-color:orange">オフ</td>
<td>設定する <strong>お問い合わせ</strong> STUDYが処理されるときのメニュー項目を有効にする</td>
</tr>
<tr class="odd">
<td><strong>チャンロック</strong></td>
<td style="background-color:orange">オフ</td>
<td>設定する <strong>お問い合わせ</strong> チャネルの場所が不在である場合メニュー項目を無効にするため</td>
</tr>
</tbody>
</table>


セミコロンはキーワードを分けるべきです。 の一例
起動時や起動時にのみ有効にする拡張関連メニュー項目
EEGLABの研究の処理は以下のとおりです。

``` matlab
   toolsmenu = findobj(fig, 'tag', 'tools');
   uimenu( submenu, 'label', 'My menu', 'callback', mycommand, 'userdata', 'startup:on;study:on');
```

*epoch:on* または *continuous:on* が変更されないことに注意して下さい
これらはデフォルトの動作であるため、メニュー項目の動作。 以下について
たとえば、連続処理時または連続処理時にのみメニュー項目を有効にします。
チャネルの場所が現在あるepochedデータセット:

``` matlab
   toolsmenu = findobj(fig, 'tag', 'tools');
   uimenu( submenu, 'label', 'My menu', 'callback', mycommand, 'userdata', 'chanloc:on');
```

拡張メニュー項目の*userdata*パラメータ結果の省略
上記のテーブルで定義されたデフォルト動作を採用しています。

### プラグインの送信

EEGLAB のユーザが使えるように、上記のリストに拡張を追加できます。
EEGLABプラグインマネージャから自動的にダウンロードします。 これを行うには、[これを使用する]
フォームhttp://sccn.ucsd.edu/eeglab/plugin_uploader/upload_form.php)。 お問い合わせ
プラグインの新しいバージョンをアップロードしたい、 
[この単純化されたフォーム](http://sccn.ucsd.edu/eeglab/plugin_uploader/version_update.php).

不要なプラグインをアシスト
------------------------
プラグインの広範なコレクションは、そのことによってもう維持されていない
著者。 しかし、彼らはまだ広く使用されている。 例えば、
[FMR-IBの特長](https://github.com/sccn/fMRIb) Rami Niaziのプラグイン
アーティファクト除去)はもうサポートされていません。 Gitbub には、このプラグインの維持を継続したい場合は、いくつかの問題があります。 また、EEGLABプラグインがあれば、ルーチンを使っていますが、もうサポートされていない場合は、そのプラグインのメンテナーになることを検討してください。 クレジットを受け取る
