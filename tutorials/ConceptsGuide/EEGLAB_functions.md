---
layout: default
title: EEGLAB functions
long_title: EEGLAB functions
parent: Concepts guide
grand_parent: Tutorials
---
EEGLABの機能
=======
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

EEGLABは、初心者と専門家のMATLABユーザーの両方での使用のために設計されました。
MATLABの専門知識のレベルに応じて、ユーザーは相互に作用することができます
EEGLABのグラフィックインターフェイス(GUI)のみで、EEGLABを呼び出すことができます。
MATLABのコマンドラインから直接機能するか、または独自の記述
EEGLAB関数と構造を用いたMATLABスクリプト。

EEGLABの機能には3種類あります。

1.  EEGLAB の構造を管理または確認する EEGLAB 機能。 例えば
    [eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m), [eeg_checkset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m), [eeg_store.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_store.m), [pop_newset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newset.m), [std_checkset.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_checkset.m), [eeg_checkchanlocs.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkchanlocs.m), [eeglab_error.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab_error.m), [eeg_retrieve.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_retrieve.m)など...


2.  Pop_functions: MATLAB は、独自のグラフィックインターフェイスで機能します。
    いいえ (または少数) 引数で呼び出される (EEGLAB ユーザから)
    インターフェイス)、これらの機能は収集するために照会窓を現れます
    ユーザーからの追加のパラメータ選択。 それから一般的に呼ばれる
    EEGLABのツールボックス信号処理機能の1つ以上。 ふりがな
    また、MATLAB コマンドラインや
    MATLABスクリプトから。 例えば
    [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m), [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m), [pop_topoplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_topoplot.m)など...

3.  信号処理機能: 経験豊富なMATLABユーザーは、
    MATLAB コマンドラインから直接 EEGLAB シグナル処理機能または
    独自の分析スクリプトから。 例えば、
    [エルプイメージ。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m), [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m), [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m)など...

*pop_* 関数の動作方法が最初に確認されます。

EEGLAB pop_ 関数
----------------------

接頭辞 *pop_* または *eeg_* の関数は、
EEG構造は最初の入力引数として構成します。 プレフィックス機能
*pop_* は EEGLAB メニューまたは MATLAB から呼び出すことができます。
コマンドラインは、プレフィックス *eeg_* の関数は呼び出されます。
MATLABコマンドラインから。 EEGLABでメニューエントリを選択したら
メインウィンドウ、EEGLAB は *pop_* 関数を呼び出します。通常はそれを提供します。
1つの変数だけ、現在のデータセットを含んでいるEEGの構造
(メニュー項目を選択する場合、呼び出しするポップアップ_関数がリストされています)
ポップアップウィンドウのタイトルバー)。 pop_ 関数がないので、
実際に任意の処理を実行するのに十分なパラメータを与えられた、それはポップアップ
ユーザーが追加のパラメータを提供するように要求するウィンドウ。 あなたが持っているとき
必要なパラメータを pop_ ウィンドウに入力し、データ
加工を行います。 EEGLAB は、完全な関数呼び出しを追加し、
入力したパラメータを含むデータセット履歴
ポップアップウィンドウ。 データセット履歴からこのコマンドをコピーすると
MATLAB コマンドラインに貼り付け、処理は
対話型クエリウィンドウをポップアップせずに直接実行します。
しかし、すべての入力パラメータを関数呼び出しに削除してみてください。
EEG構造を命名し、POP_functionを命名する
処理を実行する前にクエリウィンドウをポップアップします。
たとえば、新しいMATLABセッションを開き、試してみる(タイプが必要)
*\>\>\> eeglab* では、以下の関数へのアクセスパスを追加します。

``` matlab
EEG = pop_loadset;
```

インタラクティブなウィンドウは、データセット名を尋ねるためにポップアップ表示されます。iT は [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m) コマンドは、
EEGLABメニュー <span style="color: brown">ファイル → データの読み込み</span>. 

![画像:Pop_loadset.png](/assets/images/Pop_loadset2.png)

お問い合わせ
一方、ユーザーは2つの文字列引数を引数に渡します。 [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m) 関数、ファイル名を含む最初のファイル
ファイルパスの2つ目は、インタラクティブなウィンドウが表示されず、データセット
直接読み込まれます。

``` matlab
EEG = pop_loadset('myfile.set', 'myfilepath')
```

別の例を試してください。

``` matlab
EEG = pop_eegfilt(EEG);
```

これは、データをフィルタリングすることを可能にするインタラクティブなウィンドウをポップアップします
ウィンドウに入力するパラメータに従って。 お問い合わせ
このグラフィックインターフェイスを関与させないEEGデータセットを、タイプろ過して下さい:

``` matlab
EEG = pop_eegfilt( EEG, 1, 0);
```

このコマンドは1Hz以上のデータをハイパスします。 この関数が引数として受け取るパラメータを表示するには、 [pop_eegfilt.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_eegfilt.m)
お問い合わせ すべてのインタラクティブな EEGLAB ポップアップ_ 関数が動作することに注意してください
この方法。 EEG履歴フィールドからコマンドをコピーして変更することができます。
必要に応じて関数入力。 機能助けメッセージは利用できます
EEGLABのグラフィックインターフェイスから <span style="color: brown">ヘルプ →
EEGLAB 関数 → インタラクティブなポップ関数</span>, から
[インターネット](http://sccn.ucsd.edu/eeglab/allfunctions/)またはから
コマンドライン (type *\>\>help pop_xxx*)

注意: *pop_xxx* 関数または *eeg_xxx* のみ
関数はEEGデータセット構造を処理します。 *eeg_xxx*関数
EEGのデータ構造を引数として取りますが、ポップアップしません
インタラクティブなウィンドウ。 したがって、それらは通常は使用できません
EEGLABのメニューはコマンドラインのみです。

pop_ 関数対信号処理関数
----------------------

前述のように *pop_funcname.m* 関数は
*EEG*データ上で動作するグラフィックユーザーインターフェイス(gui)機能
スタンドアローン処理機能を使用した構造 *funcname.m*。 ふりがな
データセットの知識がないスタンドアローン処理機能
構造は、それがEEGLABであるかどうか適したデータ マトリックスを、処理できます
データ マトリックスか。
例えば、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) データ処理を呼び出し、
機能のプロット [エルプイメージ。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m)お問い合わせ 入力パラメータを確認するため
これらの機能に、EEGLABヘルプメニュー(EEGLABから)を使用する
ウィンドウ) または MATLAB 関数ヘルプ (MATLAB コマンドラインから)。 お問い合わせ
例:

``` matlab
help pop_erpimage
help erpimage
```

前述したように、次の2つの関数呼び出しは同等です。

``` matlab
eeglab; close; % add path
eeglabp = fileparts(which('eeglab.m'));
EEG = pop_loadset(fullfile(eeglabp, 'sample_data', 'eeglab_data_epochs_ica.set'));

figure; 
subplot(1,2,1); [outdata, outvar, outtrials] = pop_erpimage(EEG,1,12);
subplot(1,2,2); [outdata, outvar, outtrials] = erpimage( mean(EEG.data([12], :),1), ...
ones(1, EEG.trials)*EEG.xmax*1000, linspace(EEG.xmin*1000, EEG.xmax*1000, EEG.pnts), 'C3', 5, 0 );
```

![](/assets/images/erpimage_same.png)

EEGLABメニュー項目で呼ばれるポップアップ機能のリストは、 [eeglab.mの](https://github.com/sccn/eeglab/blob/develop/eeglab.m) 関数ヘッダー。 MATLABコマンドラインでアクセスするには、次のようにします。 

``` matlab
help eeglab
```


**POP_関数が返すものは何ですか? メニュー

EEGLAB インターフェイスから呼び出されると、POP_ 関数は戻らない
変数。 代わりに、EEGデータを変更(呼び出されたとき)
構造自体。 しかし、コマンドラインから呼び出されると、
EEGLAB ツールボックスのビジュアライゼーション関数は、変数を返す
有用な場合(例えば、結果がプロットされた)。 変数を決定するため
関数で返されると、どのように動作するかを理解することが重要です。
必要なデータ処理を実行するには、ほとんどのポップアップ_関数
(各名 *pop_xxx*) 同様に名前付けされた処理を呼び出す
関数(*xxxx*)。 これらの関数を直接呼び出すことができます。
より高度なスクリプトを実行します。 大切なこと
pop_ 関数と対応する処理の両方が
関数は同じ変数を返す(通常、ポップアップ_関数は助ける
メッセージは処理機能ヘルプメッセージにユーザーを参照します。
出力変数を記述して下さい)。 例えば、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) 関数は同じ出力をとして戻します [エルプイメージ。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) 関数:

``` matlab
figure; [outdata1, outvar, outtrials] = pop_erpimage(EEG,1,12);
```

または同等の非ポップ関数呼び出し

``` matlab
figure; [outdata2, outvar, outtrials] = erpimage( mean(EEG.data([12], :),1), ...
ones(1, EEG.trials)*EEG.xmax*1000, linspace(EEG.xmin*1000, EEG.xmax*1000, EEG.pnts), 'C3', 5, 0 ); close
```

*注記:*pop_xxx*がプロット機能の場合、
関数が呼ばれるときだけ自動的に新しい図が作成されます
ポップアップウィンドウモード。 それ以外の場合は、*pop_xxx* コマンドをプロットします。
すべての非ポッププロットコマンドと同様に、
上記の例のように、MATLAB *figure*コマンドで優先されます。 注意:
※EGLABの履歴でコマンドを実行する前にFigure*を追加
メカニズム。 この機能を使用すると、化合物の数値を作成することができます。
MATLAB *subplot* またはより柔軟な EEGLAB バージョン [sbplot.mの特長](http://sccn.ucsd.edu/eeglab/locatefile.php?file=sbplot.m).


EEGLABのデータ処理機能を使用するには、いくつか理解する必要があります。
彼らがどのように働くか、そして彼らが呼び出されるかの微妙さ。 ユーザが読み取る
各機能で提供される文書を慎重に処理します。 ほとんどの人
関数、関数のドキュメントは関数を記述するはず
すべての可能な状況で出力される、時折、ユーザーは見ている必要があります
関数スクリプトファイル自身が、データの処理方法を正確に確認
実行します。 EEGLAB関数はオープンソースなので、常に
可能です。

