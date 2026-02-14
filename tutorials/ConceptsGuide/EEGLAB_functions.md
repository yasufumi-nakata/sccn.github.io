---
layout: default
title: EEGLAB functions
nav_title: "EEGLABの機能"
long_title: EEGLAB functions
parent: Concepts guide
grand_parent: Tutorials
---
EEGLABの特徴
=======
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

EEGLABは、初心者と専門家のMATLABのユーザーインターフェイスで、カスタム設計されています。
MATLAB のクライアントは、
EEGLABのグラフィック(GUI)のみで、EEGLABのライブラリ。
MATLABの直接機能、または
EEGLAB関数と構造解析

EEGLABの特徴は3つあります。

1.  EEGLAB の機能について
    [eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m), [eeg_checkset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m), [eeg_store.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_store.m), [pop_newset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newset.m), [std_checkset.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_checkset.m), [eeg_checkchanlocs.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkchanlocs.m), [eeglab_error.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab_error.m), [eeg_retrieve.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_retrieve.m)など...


2.  Pop_functions: MATLAB は、MATLAB の機能を実装しています。
    または、EeGLAB のユーザから
    インターフェイス)、これらの機能は収集するために照会窓を現れます
    ユーザーからの追加のパラメータ選択。 それから一般的に呼ばれる
    EEGLABのツールボックス処理機能の1つ以上。 ふりがな
    MATLAB や
    MATLAB について
    [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m), [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m), [pop_topoplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_topoplot.m)など...

3.  信号処理機能: MATLAB,
    MATLAB より直接 EEGLAB の処理機能または
    独自の分析スクリプトから。 例えば、
    [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m), [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m), [topoplot.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m)など...

*pop_* 関数の動作方法が必須です。

EEGLAB pop_ 関数
----------------------

接頭辞 *pop_* の関数は、
EEG構造は、その構成を構成します。
*pop_* は EEGLAB メニュー または MATLAB から始まる。
プレフィックス *eeg_* の関数は、
EEGLABのメニューのエントリを選択
*pop_* は、EeGLAB のウィンドウで動作します。
1つの変数は、現在のデータが
(メニュー項目を選択する場合、呼び出しするポップアップ_関数がリストされています)
ウィンドウのタイトルバー
実際に任意の処理を実行するのに十分なパラメータを与えられた、それはポップアップ
ユーザーが追加のパラメータを提供するように要求するウィンドウ。 あなたが持っているとき
ウィンドウに入力し、
EEGLABは、
入力したパラメータを含むデータセット履歴
ポップアップウィンドウ。 データセット履歴からこのコマンドをコピーすると
MATLABは、
対話型クエリウィンドウをポップアップせずに直接実行します。
しかし、すべての入力パラメータを関数呼び出しに削除してみてください。
EEG構造を命名し、POP_functionを命名する
処理を実行する前にクエリウィンドウをポップアップします。
タイプ して して して して して して して して
*\>\>\> eeglab* では、以下のとおりです。

``` matlab
EEG = pop_loadset;
```

な な を お問い合わせ [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m) コマンドは、
EEGLABメニュー <span style="color: brown">ファイル → データの読み込み</span>. 

![サイトマップ](/assets/images/Pop_loadset2.png)

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
このサイトは、以下のとおりです。

``` matlab
EEG = pop_eegfilt( EEG, 1, 0);
```

このコマンドは1Hzで実行されます。 この関数は、 [pop_eegfilt.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_eegfilt.m)
お問い合わせ EEGLAB 関数が動作する
EEG履歴
必要に応じて関数入力。 機能助けメッセージは利用できます
EEGLABの特長 <span style="color: brown">ヘルプ →
EEGLAB 関数 →</span>, から
[インターネット](http://sccn.ucsd.edu/eeglab/allfunctions/)またはから
コマンドライン (type *\>\>help pop_xxx*)

*pop_xxx* 関数 oreeg_xxx* のみ
*eeg_xxx* 関数
EEGデータ構造は、
インタラクティブなウィンドウ。 したがって、それらは通常は使用できません
EEGLABのメニューは、

pop_ 関数対信号処理
----------------------

*pop_funcname.m* 関数は
*EEG*データ操作 グラフィックユーザーインターフェイス(gui)機能
ふりがな
データセットの知識がないスタンドアローン処理機能
EE を を を
データ マトリックスか。
例えば、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) データ処理を呼び出し、
機能のプロット [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m)お問い合わせ 入力パラメータを確認するため
EEGLABヘルプメニュー
MATLAB 関数ヘルプ (MATLAB )
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

EEGLABのメニューは、 [eeglab.mの](https://github.com/sccn/eeglab/blob/develop/eeglab.m) 関数 お問い合わせ 

``` matlab
help eeglab
```


*POP_関数が返すもの? メニュー

EEGLAB インターフェイスから出てきた、POP_ 関数は、
変数。 すなわち、EEGデータが生成される(出典時)
構造自体。 しかし、コマンドラインから呼び出されると、
エッグラボ ツールのbox の
有用な場合(例えば、結果がプロットされた)。 変数を決定するため
関数で返されると、どのように動作するかを理解することが重要です。
必要なデータ処理を実行するには、ほとんどのポップアップ_関数
(各名 *pop_xxx*) 在留資格取得
(*xxxx*)。 直進する
より高度なスクリプトを実行します。 大切なこと
pop_ 関数と対応する
関数は同じ変数を返す(通常、ポップアップ_関数は助ける
メッセージは処理機能ヘルプメッセージにユーザーを参照します。
出力変数を記述して下さい)。 例えば、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) 関数は同じ出力をとして戻します [m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) 関数:

``` matlab
figure; [outdata1, outvar, outtrials] = pop_erpimage(EEG,1,12);
```

または同等の非ポップ関数呼び出し

``` matlab
figure; [outdata2, outvar, outtrials] = erpimage( mean(EEG.data([12], :),1), ...
ones(1, EEG.trials)*EEG.xmax*1000, linspace(EEG.xmin*1000, EEG.xmax*1000, EEG.pnts), 'C3', 5, 0 ); close
```

*注記:*pop_xxx* は、
関数が呼ばれるときだけ自動的に新しい図が作成されます
ウィンドウモード。 コマンドは、
すべての非ポッププロットコマンドと同様に、
MATLAB *figure* コマンドは必須です。
※EGLAB の検索結果
メカニズム。 この機能を使用すると、化合物の数値を作成することができます。
MATLAB *subplot* または EEGLAB より [sbplot.mの特長](http://sccn.ucsd.edu/eeglab/locatefile.php?file=sbplot.m).


EEGLABデータ処理機能が機能し、ライセンスを付与します。
彼らがどのように働くか、そして彼らが呼び出されるかの微妙さ。 ユーザが読み取る
各機能で提供される文書を慎重に処理します。 ほとんどの人
関数、関数のドキュメントは関数を記述するはず
すべての可能な状況で出力される、時折、ユーザーは見ている必要があります
関数スクリプトファイル自身が、データの処理方法を正確に確認
EEGLAB関数は、
可能です。

