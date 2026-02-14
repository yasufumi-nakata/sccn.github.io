---
layout: default
title: Create an EEGLAB plugin
long_title: Create an EEGLAB plugin
parent: Contribute
grand_parent: Tutorials
nav_order: 1
---
EEGLAB プラグイン
========================
お問い合わせ
この投稿をお気に入りにする しかし、EEGLAB は、 急いでいるなら、 [例セクション](/tutorials/contribute/design_plugin.html#eegplugin_-function-examples) コードをコピーして貼り付けます。

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

### EEGLABカプセルの機能化

EEGLABの環境は、
EEGLAB関数は、翻訳済みで、
MATLABは、
MATLAB、ツールやメソッドの処理をしています。
EEGLABの特徴
MATLAB.com は、
???????????? EEGLABのメリット

EEGLAB関数はカプセル化とカプセル化をしています。
変数名間の干渉の可能性を最小限に抑える
関数の外部から、
それら 。 。 EEGLAB は、本質的、本質的な、
MATLABの特徴 

EEGLABに新機能が搭載されているので、機能の優先順位を上げます。
信号処理機能(例:
[m 点](http://sccn.ucsd.edu/eeglab/download/sample.m))、および
(例:
[人気カテゴリー](http://sccn.ucsd.edu/eeglab/download/pop_sample.m))。 ふりがな
*pop_* 関数は、ユーザが指定するテキストの入力ウィンドウに
シグナル処理関数を記述する。 MATLABのヘルプ
各関数は、入力引数が何であるかを明確に記述する必要があります。
関数は、ヘルプメッセージの形式を使用して、出力されたものと要求します
お問い合わせ あなたが読む必要があります [EEGLABの機能](/tutorials/ConceptsGuide/EEGLAB_functions.html) チュートリアルのセクションを理解する
EEGLABの特徴

### 信号処理機能

EEGフィールドを直接操作する機能が有効
EEGLAB のヘルプメッセージの構文 EEGLAB のユーザは、使い慣れている.. 例えば,この[サンプル].
ヘッダ>(http://sccn.ucsd.edu/eeglab/download/sample.m).

### 関連するポップアップ_関数

信号処理機能に関連した *pop_* 関数は、
*pop_* 関数(全名必須)
*pop_* は、登録して、シグナル処理をしています。
) は、関数を偽物として扱う
機能および

1.  EEGLAB のデータ構造 'EEG'
    関数の第2変数は信号処理機能かどうか指定できます
    ICAコンポーネントのアクティベーションやEEGデータ
    チャンネル.
2.  追加パラメータはオプションです。 空白のままの場合
    MATLAB の *pop_* は、
    ウィンドウは、自分の値を求めるためにポップアップする必要があります。
3.  *pop_* 関数は 'string' の ' 文字列' の ' 文字列' の 文字列' の 文字列' の 文字列' の 文字列' の 文字列' の 文字列' の 文字列' の ' の 文字列' の ' の 文字列' の 文字列' の ' の 文字列' の 文字列' の ' の 文字列' の 文字列' の の 文字列' の 文字列' 文字列' の 文字列' の の 文字列' 文字列' の 文字列' 文字列' の の の 文字列' の 文字列' の の 文字列' 文字列' の の 文字列' の の の の の 文字列' の の 文字列' の の の 文字列' の の の の 文字列' 文字列' 文字列' 文字列' の 文字列' 文字列' の の の の 文字列' の の 文字列' 
    信号処理機能(または、場合によっては、
    *pop_* 関数。この文字列はMATLABで評価される場合
    *eval*, 結果は、
    *pop_* は、 、 ユーザが パラメータを 設定する
    ポップアップインターフェイスウィンドウに入力しました。 この文字列は
    EEGLABのパートナー
4.  慣習によって、機能が図を引いたら、機能を呼び出す
    十分な引数なしで新しい数字をポップアップする必要があります。 しかし、与えられた
    十分な引数、関数は
    現在の図の出力グラフィックを直接描画します。
    *sbplot* は、複数の部分の図を、
    *pop_* は、通常実行されます。
    これを変更した場合、数分
    [人気カテゴリー](http://sccn.ucsd.edu/eeglab/download/pop_sample.m)
    機能ソース。

### EEGLABの関数

EEGLAB GUI は、 EEGLAB はエラーを呼び出します。
デバッグ機能への挑戦 ソリューションは、
外部リンク
EEGLAB はエラーを伴います。

EEGLAB GUI デザイン機能
-----------------------------------
関数 [恋物癖](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 作成に使用する主な機能
EEGLABの強み
それのためのより高度の使用:

### supergui関数

ふりがな [恋物癖](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 手動で作成する負担を軽減するように設計されました
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

'geometry' と
'uilist'.' 'geometry' は、このうちの日常の学習者です。 3 行 { 1 1 1 1 1 1 1 1 1 1
'uilist' は、
{ { { { {
'text', 'string', 'Hello!' はコメントを受け付けていません。
3行目は "OK" ボタン "{ 'style', 'pushbutton' , 'string' です。
お問い合わせ

しかし、*Ok* と、 問題は、
お問い合わせ UI の制御は、
'callback' コマンド コマンド コマンド コマンド
関連する文字列パラメータ。

``` matlab
  supergui( 'geomhoriz', { 1 1 1 }, 'uilist', { ...
         { 'style', 'text', 'string', 'Hello!' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK' 'callback' 'close(gcbf);' } } );
```

"callback" コマンド "close(gcbf)" を追加しました。
現在の * とき とき とき

ほぼすべてのジオメトリ(ただし、高度なセクションですべて詳細ではありません)
このスキームを使用して定義することができます。 例えば

``` matlab
  supergui( 'geomhoriz', { [1 1] 1 1 }, 'uilist', { ...
         { 'style', 'text', 'string', 'Enter some text' }, ...
         { 'style', 'edit', 'string', 'Hello!' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK' 'callback' 'close(gcbf);' } } );
```

![センター](/assets/images/Supergui2.jpg)

ジオ は は つの つの つの つの
この行を共有し、同じ水平な範囲を持っています。 以下に示すように、 \[1 1\] を
\[1 0.5\] は、行の 2 の 経路 は のみ
最初の1つの水平方向の半分。

![センター](/assets/images/Supergui3.jpg)

場合 以上
以下は、
*listbox* UI は、複数の選択で、 'geomvert' を実行します。
垂直ジオメトリを指定する。 \[3 1 \] に設定されます。
最近の投稿
行はテキストの 1 行だけにスパンします(キャリッジリターンを追加する必要があります -
文字10 - テキストをこのテキストに整列する
*listbox* UI の

``` matlab
  supergui( 'geomhoriz', { [1 1] 1 1 }, 'geomvert', [3 1 1], 'uilist', { ...
         { 'style', 'text', 'string', [ 'Make a choice' 10 10 10 ] }, ...
         { 'style', 'listbox', 'string', 'Choice 1|Choice 2|Choice 3' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK' 'callback' 'close(gcbf);' } } );
```

![センター](/assets/images/Supergui4.jpg)

### Inputgui関数

しかし、 [恋物癖](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) GUI は、 GUI は、
イベントの制御フローは、UIによって処理する。つまり、
ボタン *Ok*、ボタン *Cancel* およびイベントの処理
これらのボタンはユーザーに残されます。 ふりがな [入力gui.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=inputgui.m) 関数(その
呼び出し [恋物癖](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 機能) 自動的にこれを補うのを助けて下さい
出力を処理することで、これらのボタンやボタンを作成できます。 例えば:

``` matlab
  res = inputgui( 'geometry', { [1 1] }, ...
         'geomvert', [3], 'uilist', { ...
         { 'style', 'text', 'string', [ 'Make a choice' 10 10 10 ] }, ...
         { 'style', 'listbox', 'string', 'Choice 1|Choice 2|Choice 3' } } );
```

![センター](/assets/images/Supergui5.jpg)

*res* の入力結果は -- に、セルを配列します。
ユーザの選択肢(例えば、{\[1\]})を示す1から3までの単一値を含む。 このセル配列の要素数
エントリーフォーム
ボタンは出力を戻しませんが、チェックボックス、リストボックス、および編集ボックスは行いません。
この関数は、 UI のタグは、
第4出力:

``` matlab
  [res userdata err structout] = inputgui( 'geometry', { [1 1] }, ...
         'geomvert', [3], 'uilist', { ...
         { 'style', 'text', 'string', [ 'Make a choice' 10 10 10 ] }, ...
         { 'style', 'listbox', 'string', 'Choice 1|Choice 2|Choice 3' 'tag' 'list' } } );
```

出力構造 *structout* 、*listbox* UI (structout) の入力項目 *list* の項目。 リスト = 1
開発者 に に
出力順序を覚える必要があります。 注文を変更することができます
行、スクリプトの他の部分を変更する必要はありません。

この技術は、
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

このページではjavascriptを使用しています。
幾何学が定義されたのか。 ふりがな [恋物癖](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 関数は、ウィンドウの幅と高さを自動的に変化させます。
キーワード *Help* ボタンを押してください。
"pophelp(*pop_newtimef*);" の定義 [入力gui.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=inputgui.m) command-line ディレクティブ
*Ok*と、*structout*の構造の分野
. . . .

![センター](/assets/images/Supergui6.jpg)

### 研究開発

1つの制限 [恋物癖](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 呼び出し形式は不可能である
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
上記の入力はヘルプセクションで詳細です [恋物癖](http://sccn.ucsd.edu/eeglab/locatefile.php?file=supergui.m) 機能。

EEGLAB拡張機能の書き方
---------------------------------

EEGLABは、*extension*(*plugin*)の施設です。
*plugin* にロードされた関数検索
ディレクトリは、拡張を呼び出す1つ以上のメニュー項目を引き起こします
EEGLABメニュー
EEGLABが独自に開発した、スマホでダウンロードしてください。
EEGLABでは、


EEGLAB は、
EEGLAB の *eegplugin_myfunc.m* 関数
※eeglab.m* は必須です。 (必須)
延長のための主要な信号処理機能の名前)。 作成する
*eegplugin_* 関数はメニューの項目です。
*eegplugin_* は、
最近のコメント
サブメニューの無制限数にリンクする可能性があります。 メニュー
項目(項目)は、標準の項目(項目)を、標準の項目(項目)にするか、
*pop_* 関数(以下例を参照)。 ユーザは EEGLAB のファイル
エクスカウン(EEGLABエクスカウンマネージャー、サイン)担当
EEGLABサイト、またはその他のWebサイト、*eegplugin_*関数は、
ファイル名のファイルやディレクトリの検索
EEGLAB ディレクトリの *eegplugin_*

### eegplugin_ 関数

EEGLAB の拡張機能、MATLAB の拡張機能
*eegplugin_* は、
*plugins*機能サブディレクトリ
関数 'test' は 'test' は 'test' は 'test' は 'test' は 'test' は 'test' は 'test' は 'test' は ' は 'test' は ' は 'test' は ' は 関数 'test' は 'test' は 関数 ' は 'test' は ' は 関数 は 'test'
*eegplugin_* 関数は以下です。

```matlab
>> eegplugin_test (fig, try_strings, catch_strings);
```

関数は、*eegplugin_* 関数に
エグラボビンは、EeGLABの
ウィンドウ。 第2引数と第3引数は、EEGLABが渡された構造です。
,*eegplugin_* を エラー が が
その他(下記参照) 延長を望まないとします
EEGLABのコメントとエラーメッセージの処理
2つのパラメータ(*eegplugin_*) <em>ログイン</em>
. . . お問い合わせ

### 拡張メニュー項目またはサブメニューの追加

EEGLABの新機能
メニューは、このコマンドを *eegplugin_* に置き換えます。

```matlab
uimenu(fig,'label', 'My menu item','callback',...
  ['EEG=pop_myfunc(EEG); ...
  [ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);' ]);
```

*\[ALLEEG EEG CURRENTSET\] = eeg_store(ALLEEG、EEG、
CURRENTSET; * は、変更されたEEGデータセットを生成します。
EEGLAB *ALLEEG*構造に格納されます。 *myfunc* は、実行中
拡張子の名前と*マイメニュー項目*を簡略で使用
メニュー項目ラベル(通常、拡張子の名前)。

### エクスカウンとEEGLABの歴史

EEGLABの歴史とやりとり機能拡張
' ' ' '
'catch_strings' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の ' の の ' の ' の ' の の ' ' ' ' ' ' ' ' ' ' ' の ' の の の の の ' ' ' の ' ' ' ' の の ' の の ' の ' ' の の ' ' ' ' ' の の ' ' ' ' ' ' ' ' ' ' の ' ' ' ' ' ' ' '
2 サブドメインの指定例 ( *eegplugin_test.m* を参照)
MATLAB に実装する
コマンドを実行する。 第3引数('catch_string')
LASTCOMは、 お問い合わせ
変数を EEGLAB の文字列に変換します。


*eegplugin_* 関数は 1 個の EEGLAB メニューの項目に指定します。
メニュー宣言はこのようになります。

``` matlab
uimenu( submenu, 'label', 'My menu item', 'callback', ...
  [ try_strings.anyfield '[EEG LASTCOM] = pop_myfunc(EEG);' ...
  catch_strings.anyfield ]);
```


'try_strings' (above) のフィールドは、

-   *try_strings.no_check* : 空の旅
    データセットのみ
-   *try_strings.check_ica* : リソースセットがICAで利用可能
    体重
-   *try_strings.check_cont* : データセットは
-   *try_strings.check_epoch* : データセットが epoched 確認済み (not)
    連続データ)
-   *try_strings.check_event*: スタッフ
-   *try_strings.check_epoch_ica* : データセットは epoched です。
    * は、
-   *try_strings.check_chanlocs* : リソースセットは、
    チャンネルの場所ファイル
-   *try_strings.check_epoch_chanlocs* : セッションセットは、
    epoched ** と** , チャンネルは、します。
-   *try_strings.check_epoch_ica_chanlocs* : セッションセットはオプションです
    epoched ** と** は ICA の 重み** と** の です。
    ファイル。


'catch_strings' のフィールドを読み込みます。

-   *catch_strings.add_to_hist* : LASTCOM 変数 (if)
    EEGLABの歴史
-   *catch_strings.store_and_hist*: LASTCOM の変数
    EEGLABの歴史
    AllEEG 変数
-   *catch_strings.new_and_hist* : LASTCOM 変数 従います (if)
    エッグラボ 空室検索 新しいデータセットウィンドウが開きます。

### eegplugin_ 関数例

*eegplugin_* 関数の 文字列 は、
機能。 Eメール:erp
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


EEGLAB の *plugins* に EEGLAB の *plugins* の サブディレクトリに EEGLAB を 読み込みます。
[詳しくはこちら](http://sccn.ucsd.edu/eeglab/download/eegplugin_erp.m) お問い合わせ
この機能では、この機能が機能しています。
アイテム <span style="color: brown">プロット → プロット ERP</span> ERP Purpleをプロットする
すべてのデータセットのエポック。

*PCA*は、
PCA は、PCA は、
在留資格(在留資格) MATLABは、
*pca.m* は、
EEGLABと
EEGLAB を実装
[詳しくはこちら](http://sccn.ucsd.edu/eeglab/download/eegplugin_pca.m) お問い合わせ
お問い合わせ

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

*eegplugin_* 関数、新しい追加関連 など。
このページはお気に入りに追加されます。
(「Run PCA'」と表記) <span style="color: brown">ツール</span> メニュー
*findobj.m* で 'tag','tools' で . 指定された .
タグは、 *import data* で、EEGLAB は、 テキスト から テキスト から テキスト から テキスト から テキスト まで テキスト から テキスト まで テキスト から テキスト から テキスト まで テキスト から テキスト まで テキスト から テキスト から テキスト まで テキスト から テキスト まで テキスト テキスト から テキスト テキスト から テキスト まで テキスト テキスト から テキスト テキスト まで テキスト テキスト テキスト テキスト から テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト テキスト
アイテムへ <span style="color: brown">ファイル → インポートデータ</span> サブメニュー 使用方法
タグ *import epoch* は、 いくつかの項目に追加します。
お問い合わせ <span style="color: brown">ファイル → インポート エポック情報</span> サブメニュー タグ
*importイベント* メニュー
<span style="color: brown">ファイル → インポートイベント情報</span> メニュー タグ
*export* は、
<span style="color: brown">ファイル → エクスポートデータ</span> メニュー 最後に、タグ
*plot* は、
<span style="color: brown">ピロー</span> メニュー (タグが入るべきであることに注意)
より低い場合)。


*eegplugin_* は、 EEGLABメニュー
<span style="color: brown">ツール → PCARUN</span> 作成します。 メニュー
現在のEEGデータセットのPCA変換は学習項目です。
PCAの分解は、
分解します。 (注:通常は不可)
PCAとICAの融合

EEGLABを見る [erpsource ファイル拡張子](https://github.com/sccn/erpsource) お問い合わせ
より精巧な延長の例。

### EEGLABメニュー

2011年以降、メニューの動作を制御することができます。
EEGLAB .EEGLAB は、現在、現在、EEGLAB にインストールされています。
メモリ内のデータに基づいて、非応答性のメニュー項目を出し、作り出します。 かもしれません。
いくつかの拡張関連メニュー項目が自動的に無効になっています
もしそうでなければいけません。 ですから、
メニュー項目の有効化スキームを実装し、
拡張メニューの項目が有効になっています。
仮想通貨、開発者は、*userdata* で複数のものをコンパイルする。
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
<td>設定する <strong>オフ</strong> メニュー</td>
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
<td>設定する <strong>お問い合わせ</strong> STUDYが処理をしているときのハッシュメニュー</td>
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
EEGLAB研究のこだわり

``` matlab
   toolsmenu = findobj(fig, 'tag', 'tools');
   uimenu( submenu, 'label', 'My menu', 'callback', mycommand, 'userdata', 'startup:on;study:on');
```

*epoch:on* または *continuous:on* が変更されます。
これらはデフォルトの動作であるため、メニュー項目の動作。 以下について
たとえば、連続処理時または連続処理時にのみメニュー項目を有効にします。
の場所 の場所 の場所 現在

``` matlab
   toolsmenu = findobj(fig, 'tag', 'tools');
   uimenu( submenu, 'label', 'My menu', 'callback', mycommand, 'userdata', 'chanloc:on');
```

拡張メニューの項目*userdata* パラメータ結果の
上記のテーブルで定義されたデフォルト動作を採用しています。

### プラグインの送信

エッグラボ ユーザが ユーザが ユーザが ユーザが ユーザを 拡張する ユーザが ユーザの ユーザが ユーザの ユーザが ユーザの ユーザが ユーザの ユーザが ユーザの ユーザが ユーザの ユーザが ユーザ を ユーザ に ユーザが ユーザ を ユーザ に ユーザ ユーザが ユーザ に ユーザが ユーザ を ユーザ ユーザ に ユーザが ユーザ ユーザが ユーザ を ユーザ ユーザ ユーザ に ユーザ ユーザ を ユーザ ユーザ ユーザ に ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ ユーザ
EEGLABのプラグインについて
フォームhttp://sccn.ucsd.edu/eeglab/plugin_uploader/upload_form.php)。 お問い合わせ
プラグインの新しいバージョンをアップロードしたい、 
[この単純化されたフォーム](http://sccn.ucsd.edu/eeglab/plugin_uploader/version_update.php).

不要なプラグインをアシスト
------------------------
プラグインの広範なコレクションは、そのことによってもう維持されていない
著者。 しかし、彼らはまだ広く使用されている。 例えば、
[FMR-IBの特長](https://github.com/sccn/fMRIb) Rami Niaziのプラグイン
アーティファクトはサポートしています。 Gitbub は、このプラグインの実装、問題。また、EEGLAB のプラグイン、ルーチンのプラグイン、その他のサポート、そのプラグインのメンテラーのヘルプ、その他。
