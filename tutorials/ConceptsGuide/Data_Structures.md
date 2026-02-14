---
layout: default
title: EEGLAB data structures
long_title: EEGLAB data structures
parent: Concepts guide
grand_parent: Tutorials
nav_order: 5
---
エッグラボ データ構造
=======================
お問い合わせ

このセクションでは、EEGLAB および EEGLAB の使用を希望するユーザーを対象としています。
MATLABスクリプトの関数:(/tutorials/ConceptsGuide/EEGLAB_functions.html) お問い合わせ
EEG構造をできるだけシンプルで透明にすることで、
高度なユーザーは、データを効率的に処理するためにそれらを使用することができます。 

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

導入事例
------------

EEGLAB MATLABスクリプトを書くには、いくつかの理解が必要です
EEGLABのデータ構造(EEG)とそのサブ構造(主に)
*EEG.data*、*EEG.event*、*EEG.urevent*、*EEG.epoch*、*EEG.chanlocs*および
*EEG.history* は必須です。 EEGLABのデータ構造をご紹介します。

- EEG: 現在のEEGデータセット
- AllEEG:すべての読み込まれたEEGデータセットの配列
- CURRENTSET: 現在のデータセットのインデックス
- LASTCOM: EEGLABメニューから発行された最後のコマンド
- AllCOM: EEGLABメニューから発行されたすべてのコマンド
- STUDY:EEGLABグループ解析構造
- CURRENTSTUDY: EEGLABがグループ分析を行う場合は1、それ以外の場合は0

EEGLABはグローバル変数を使用しないことに注意してください(上記の変数は、
コマンドラインからアクセス可能ですが、グローバルでは利用できません。
EEGLAB内の変数。 上記の変数は通常の変数です
グローバルなMATLABワークスペース。 主要な相互窓機能を除いてすべてのEEGLAB機能 [eeglab.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeglab.m) (その他)
display関数) は、これらの変数の1つ以上を明示的に処理します。
入力パラメータは、グローバル変数にアクセスしたり変更したりしません。 お問い合わせ
望ましくない 'side を生産する最小チャンスがあることを確認してください。
エフェクト

EEGとアレグ
---------------
EEGLAB変数 *EEG* は、すべてを含むMATLAB構造です。
現在のEEGLABデータセットに関する情報。 例えば、メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>お問い合わせ EEGLABの「sample_data」フォルダにある「eeglab_data_epochs_ica.set」のチュートリアルファイルを選択します。 それから *Open*を押して下さい。 それから入力*\>\> EEG*は以下のコマンドを生成します。
ライン出力:

``` matlab
>> EEG

    EEG =
             setname: 'EEG Data epochs'
            filename: 'eeglab_data_epochs_ica.set'
            filepath: '/data/matlab/eeglab/sample_data/'
             subject: ''
               group: ''
           condition: ''
             session: []
            comments: [9x769 character]
              nbchan: 32
              trials: 80
                pnts: 384
               srate: 128
                xmin: -1
                xmax: 1.9922
               times: [1×384 double]
                data: [32×384×80 single]
              icaact: [32×384×80 single]
             icawinv: [32×32 double]
           icasphere: [32×32 double]
          icaweights: [32×32 double]
         icachansind: [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32]
            chanlocs: [1x32 struct]
          urchanlocs: [1×32 struct]
            chaninfo: [1×1 struct]
                 ref: 'common'
               event: [1×157 struct]
             urevent: [1×154 struct]
    eventdescription: {[2×29 char]  [2×63 char]  [2×36 char]  ''  ''}
               epoch: [1×80 struct]
    epochdescription: {}
              reject: [1×1 struct]
               stats: [1×1 struct]
            specdata: []
          specicaact: []
          splinefile: []
       icasplinefile: ''
              dipfit: []
             history: ''
               saved: 'yes'
                 etc: [1×1 struct]
             datfile: 'eeglab_data_epochs_ica.fdt'
                 run: []
```

ヘルプメッセージを見る
お問い合わせ [eeg_checkset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m) 関数(一貫性をチェックする)
EEGLABのデータセット)の全てのフィールドの意味

EEGLAB変数 *ALLEEG* は、すべてのデータセットを保持する MATLAB 配列です。
現在の EEGLAB/MATLAB のワークスペースで。 実際には*ALLEEG*は構造です
*EEG*データセットの配列(上述)。 もし、現在の EEGLAB で
読み込まれるデータセットが1つあります。*ALLEEG*は*EEG*と等しいです。 2つのデータセットがロードされている場合は、*\>\> を入力します。 MATLABのALLEEG*
コマンドラインリターン:

``` matlab
ALLEEG =
    1x2 struct array with fields:
        setname
        filename
        filepath
        pnts
        nbchan
        trials
        srate
        xmin
        xmax
        data
        icawinv
        icasphere
        icaweights
        icaact
        event
        epoch
        chanlocs
        comments
        averef
        rt
        eventdescription
        epochdescription
        specdata
        specicaact
        reject
        stats
        splinefile
        ref
        history
        urevent
        times
```

Typing *\>\> AllEEG(1)* は、最初のデータセットの構造を返します。
AllEEG と入力 *\>\> allEEG(2)* は 2 番目の構造を返します。
データセット。 詳細はこちら [EEGLABの歴史](/tutorials/11_Scripting/Using_EEGLAB_history.html) もっとチュートリアルのセクション
これらの構造を操作するための情報。
*EEG*構造のほとんどのフィールドには、単一の値が含まれている(詳細として)
[eeg_checkset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m))。 しかし、*EEG*の重要な分野
構造はサブ構造を含んでいます。 簡潔に3つを記述します
※EEG.chanlocs*、*EEG.event*、および*EEG.epoch*

### EEG.chanlocs(エグ)

この EEG 構造フィールドは EEG チャネルに関する情報を格納します。
場所とチャンネル名。 例えば、チュートリアルデータセットをロードする
と入力 *\>\> EEG.chanlocs* を返します

``` matlab
>> EEG.chanlocs

    ans =
    1x32 struct array with fields:
        theta
        radius
        labels
        sph_theta
        sph_phi
        sph_radius
        X
        Y
        Z
```

ここでは、*EEG.chanlocs* は長さ 32 の構造配列です(レコード1つ)
このデータセットの32チャンネルのそれぞれ。 

タイピング *\>\>EEG.chanloc(1)*
リターン:

``` matlab
>> EEG.chanlocs(1)

    ans =
        theta:      0
        radius:     0.4600
        labels:     'FPz'
        sph_theta:  0
        sph_phi:    7.200
        sph_radius: 1
        X:      0.9921
        Y:      0
        Z:      0.1253
```

これらの値は、チャネルの位置座標とラベルを保存します。
最初のチャンネル ('FPz'). ご使用の際には [ポップアップ_chanedit.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_chanedit.m)
機能またはメニュー項目 <span style="color: brown">編集 → チャネルの場所</span>
チャンネルの場所情報を編集または再入力する。 任意の値
EEG構造フィールドは、MATLABから手動で変更することもできます
コマンドライン インポートのチュートリアルセクションも参照してください [チャネルの場所](/tutorials/04_Import/Channel_Locations.html).

### エッグ・エベント

*EEG* 構造フィールドには、実験的なイベントのレコードが含まれています。
データが記録されている間に発生し、追加可能
ユーザー定義イベント。 チュートリアルデータセットと入力を読み込みます。

``` matlab
>> EEG.event

    ans =
        1x157 struct array with fields:
            type
            position
            latency
            urevent
            epoch
```

一般的なフィールド *type*、*latency*、および *urevent* は常に存在します
イベント構造:

- ※type* にはイベントタイプが含まれています。
- *latency* はデータ サンプル単位のでき事の潜伏を含んでいます
- *urevent*は含んでいます
元のイベントのインデックス(= 'ur')ウレベントテーブル(以下参照)。

*position* のような他のフィールドはユーザ定義であり、
実験。 

ユーザーは、*duration* と呼ばれるフィールドを定義することもできます。
イベントの期間を定義するための(EEGLABによって認識)
削除されたデータの部分、フィールド *duration* が追加されました
ブレイク(境界線)イベントの期間を自動的に保存します。

epochsがデータセットから抽出された場合、別のフィールド、*epoch*、
イベントが所属するデータepoch(s)のインデックスを保存するために追加されます。

EEGLABイベントの構造について詳しく知るには、[event]を参照してください。
スクリプトチュートリアル](/tutorials/11_Scripting/Event_Processing_command_line.html)

また「オリジナル」イベント構造のドイツ「UR」も別々に存在します。
※イベント開催中のEEG.urevent*
もともとデータセットにロードされた情報とイベント
ユーザが手動で追加しました。 連続的なデータが最初に読み込まれるとき、
この構造の内容は、内容と同一です。
*EEG.event*構造(*urevent*のポインター フィールドをマイナス)
*EEG.event*)。 しかし、ユーザーがデータセットからイベントを外すため
生成物の拒絶またはデータからエポックを抽出する, 元のいくつか
(ur)イベントは、ウレベント構造にのみ存在し続けます。

EEG.event 構造の *urevent* フィールドには、インデックスが含まれています。
*EEG.urevent* 構造配列の同じイベント。 例えば: お問い合わせ
2番目のウレベントを含むデータの部分は、
遺物拒絶時のデータセット、第2回イベント <u>お知らせ</u>
*EEG.event* 構造に残りますが、まだ残っている
*EEG.urevent*の構造。 これで、データに残っている2番目のイベントは、
元の第3回イベントをリンクします。
*EEG.urevent*、すなわちチェック

``` matlab
>> EEG.event(2).urevent

    ans =
        3
```

#### イベントの種類

現在のデータ構造のイベントフィールドは、タイピングで表示できます。
''\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\> MATLAB コマンドラインで EEG.event '' を実行します。 
最初のイベントのフィールド値を表示するには、次のようにします。

``` matlab
>> EEG.event(1)

ans =
    type: 'square'
    position: 2
    latency: 129.087
    urevent: 1
```

イベント構造にカスタムイベントフィールドを追加できることを忘れないでください
また、イベント情報を随時インポートします。
データセットをロードします。 そのため、一部のイベントフィールドの名前は異なる場合があります。
異なるデータセットで。 イベントフィールド情報を簡単に行うことができます。
*\>\> {EEG.event.fieldname}* などのコマンドで取得します。 お問い合わせ
例:

``` matlab
>> {EEG.event(1:5).type}
```

*type* フィールドの内容を最初の 5 のイベントで返します。

``` matlab
ans =
    'square' 'square' 'rt' 'square' 'rt'
```

以下のコマンドを使用して、異なるイベントタイプをリストします。
加工されていないチュートリアルデータセット:

``` matlab
>> unique({EEG.event.type});

ans=
    'rt' 'square'
```

上記のコマンドは、イベントタイプが文字列として記録されると仮定します。 使用条件
*\>\> ユニーク(cell2mat({EEG.event.type}));* として保存されるイベントタイプの場合
数字。

回復したイベント名を使用してエポックを抽出することができます。 詳細はこちら
エポック抽出手順と同等のコマンドライン
上記のセクションで提示 [データの抽出]
epochs(/tutorials/07_Extract_epochs/Extracting_Data_Epochs.html).

``` matlab
>> EEG = pop_epoch( EEG, { 'square' }, \[-1 2\], 'epochinfo', 'yes');
```

#### イベントのレイテンシー

上記のセクションで同じコマンドを使って表示することができます。
イベントレイテンシフィールドの内容。 イベントレイテンシーはユニットに保存されます
データの標本は (1) 連続的な始まりに相対的にポイントします
データ行列(EEG.data)。 チュートリアルデータセット(いずれかのため)
処理)、タイプ:

``` matlab
>> [EEG.event(1:5).latency]

ans =
     129.0087 218.0087 267.5481 603.0087 659.9726
```

これらのレイテンシーを秒(上のサンプルポイントの代わりに)表示するには、
最初にこのセル配列を通常の数値配列に変換し、1 をサブトラクトする必要があります。
最初のサンプルポイントは0時間に対応し、サンプリングによる分割
レート。 そのため、

``` matlab
>> ([EEG.event(1:5).latency]-1)/EEG.srate

ans =
    1.0001 1.6954 2.0824 4.7032 5.1482
```

一貫性のために、エッチングされたデータセットでは、イベントのレイテンシーも
データの先頭に関してサンプルポイントでエンコードされる(as)
データが連続していた場合 したがって、エポックを抽出した後
[データ]
epoch抽出](/tutorials/07_Extract_epochs/Extracting_Data_Epochs.html)チュートリアル、最初の5つのイベントレイテンシーを見てみましょう:

``` matlab
>> {EEG.event(1:5).latency}

ans =
     129 218.00 267.5394 424 513 
``` 

なお、epochedデータセットでは、この情報は直接的な意味はありません。
代わりに、メニュー項目を選択 <span style="color: brown">編集 → イベントの値</span> (呼び出し機能) [pop_editeventvals.m がリリースされました。](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_editeventvals.m))表示する
このイベントのレイテンシは、epoch 時間ロックの相対秒で
イベント コマンドラインから、関数を使うことができます。 [eeg_point2lat.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_point2lat.m) 指定したレイテンシーをデータから変換する
秒単位でデータの先頭に相対的なポイント
エポックタイムロックイベントの相対的。 例えば:

``` matlab
>> eeg_point2lat(cell2mat({EEG.event(1:5).latency}), cell2mat({EEG.event(1:5).epoch}), EEG.srate, [EEG.xmin EEG.xmax])

ans =
    0 0.6953 1.0823 -0.6953 0
```

逆変換は機能を使って達成することができます [eeg_lat2point.mの](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_lat2point.m).

コマンドラインからイベント情報を取得するための最も便利な機能は EEGLAB 関数です。 [eeg_getepochevent.m の](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_getepochevent.m)お問い合わせ お問い合わせ
関数は、任意の取得するために、連続およびエポックデータの両方に使用できます。
イベントの種類を問わずイベントフィールド 例えば、チュートリアルデータを使用する
(エポック抽出後)、タイプ:

``` matlab
>> [rt_lat all_rt_lat] = eeg_getepochevent(EEG, 'rt', [], 'latency');
```

型 *rt* のでき事の潜伏を得るために。 最初の出力は、
データエポックあたり1つの値を含む配列(*first*イベント)
各データエポックに指定されたタイプ。 2番目の出力はセル配列です
*all*のフィールド値を含む各データ内の関連イベント
エポック。 レイテンシー情報はミリ秒単位で返されます。 (注:第3項)
入力は各々の特定の時間ウィンドウでイベントを検索できます
エポック。 空の値は、epoch 全体の時間範囲が
使用して下さい)。
同様に、'square'イベント'position'フィールドの値を取得するには お問い合わせ
各エポックのイベント, タイプ:

``` matlab
>> [rt_lat, all_rt_lat] = eeg_getepochevent(EEG, 'square', [], 'position');
```

連続したデータは単一のデータエポックとして振る舞います。

``` matlab
>> [~, all_sq_lat] = eeg_getepochevent(EEG, 'square');
```

連続データ内のすべての'square'イベントの遅延を取得する
(第二出力経由)

#### ウルビッツ

別の 'ur' ('オリジナル' のためのドイツ語) イベント
*EEG.urevent* は、元々のイベント情報を保持しています。
データセットに読み込まれます。 一部のイベントやデータ領域を含む場合
イベントはデータから削除され、これは影響しません
*EEG.urevent*の構造。 新規イベントを投入する場合
データセット、ウレベント構造は自動的に更新されます。 これは便利です
元のイベントの*context*に関する情報を得るために
実験。 データエポックを抽出した後でも、前の*コンテキスト*の
連続したデータセットや、epochedデータセットの各イベントは引き続きご利用いただけます。
現在、*EEG.urevent*構造は、
コマンドライン

*EEG.urevent*構造は*EEG.event*と同じフォーマットを持っています
構造。 イベント構造の*urevent*フィールド(例、
*EEG.event(n).urevent*)には、対応するイベントのインデックスが含まれている
urevent 構造配列 -- イベントからイベントへ'pointing'
対応するイベント、例えば「オリジナルイベント」の番号など
連続データイベントストリーム。 例えば、データの一部が
連続データセットから2番目のイベントが削除されます。
※EEG.event*では、アーティファクト拒否、第2回イベントは残しません。
構造。 ※*will* は、*EEG.urevent* 構造に残ります。
例:2番目の*EEG.event*は3番目の*EEG.urevent*を指すかもしれません:

``` matlab
>> EEG.event(2).urevent

ans =
    3
```

*EEG.event* 構造の *urevent* の徴候は必要ではないです
線形に増加して下さい。 例えば、エポックが抽出された後、
チュートリアルデータセット,

``` matlab
>> {EEG.event(1:5).urevent}

ans =
    [1] [2] [3] [1] [2]
```

つまり、イベント1と2(最初のデータエポック)とイベント4
と5(第2のデータエポック内)は同じ元の
イベント

いくつかの EEGLAB コマンドライン関数は、 *urevent* 構造を使用します。 [eeg_time2prev.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_time2prev.m), [eeg_urlatency.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_urlatency.m) そして、
[eeg_context.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_context.m)お問い合わせ 次へ
セクションでは、*EEG.event* 間の関連性についてのより多くの洞察を提供します。
*EEG.urevent*構造。

#### イベントの境界

EEGLABによる予約型「境界」が自動的に作成されるイベント
データの部分が連続データから除外される場合や、
連続的なデータセットは連結されます。 これらのイベントは、
レイテンシーと(可能な場合)これらを中止する期間
データに導入した操作。 下の画像では、データの一部
含まれたイベント \#2 は拒否され、型 'boundary' イベントは
イベント構造に追加。 イベントが行われるため、そのインデックスが2になりました。
レイテンシーでソート。 出口の構造は保持し続けます
オリジナルイベント情報を追加せず、'boundary'イベントを追加。


![画像:イベント連続.gif](/assets/images/Eventcontinuous.gif)

「境界」イベントのレイテンシーは通常2つのサンプル間で行われます。 例えば、サンプル101から200が削除されると、「境界」イベントのレイテンシは100.5で、サンプル100を保ちながら101が削除されたという曖昧さはありません。 また、'boundary' イベントの期間は、削除されたサンプル数(上記の例では100)を示しています。 この情報を保存すると、データが削除された回数を判断できます。 データセットをマージするときは、'boundary' イベントの期間が無関係でNaNに設定されます。

境界イベントは、データ範囲外のレイテンシーが許可されていることに注意してください。 データに1000サンプルがある場合、サンプルの限界は1〜1000です(MATLABはサンプル1から始まります)。 レイテンシー0.5と1000.5の型「境界」でのイベントは、データ制限の外で許可されます。 これらの境界イベントは、データがオンセットまたはデータの終了時に削除され、期間フィールドはどのくらいのデータが削除されたかを示します。

境界イベントは、*event.type* = の標準的なイベント構造です。
'境界'。 また、*event.duration* フィールドを保持している
拒否されたデータ部分(データサンプル)の期間。 それ以来
データセット内のすべてのイベントは、データセットで同じフィールドを持つ必要があります。
境界イベントを含む全てのイベントは、'duration' フィールドを持ちます。
真の境界型イベントを除き、デフォルトで0または空に設定します。 バウンダリー
イベントは処理する複数の信号処理機能によって使用されます
連続データ。 例えば、データのスペクトルを計算する [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m) 機能は連続した部分だけで作動します
データ(境界イベント間で)。 また、データエッチング機能
境界イベントを含むエポックを抽出しません。

*Epoched* データセットはデータepochs間の境界イベントを持っていません。
2次元サイズの配列(チャンネル、sample_points)に保存される代わりに
連続データのように、epochedデータは3D配列で保存されます
(チャンネル、sample_points、トライアル) データエポックのイベントはそのまま保存されます
データを連続していれば、2次元配列としてデータを処理する効果
サイズ(チャンネル、(sample_points\*trials))) このフォーマットは処理をします
コマンドラインからのイベントは便利です。

*EEG.urevent*の構造の目的は完全な記録を保持することです
以下に示すように、元の連続データから実験的なイベント。 ファンクション [eeg_context.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_context.m) *urevents*の使用
近隣イベントのコンテキストで定義されたイベントを見つけるための情報
実験(元のデータ)

![画像:Eventepoch.gif](/assets/images/Eventepoch.gif)

**データセット間の「ハード」境界**。 連続したデータセットが連結されると、境界の「ハードル」タイプ
*EEG.event* と、
*EEG.urevent*の構造。 特に、最初の緊急事態が発生した場合
ペアは1つのデータセットで最後のイベントでした。次のイベントは
次の連結データセットで最初のイベント(不要)
同時に録音)、隣接するペアのレイテンシー
尿素は直接比較できません。 いわゆる「ハード」境界
連結データセット間でのジョイントをマークするイベントは、通常どおり
type 'boundary' が、特別な 'duration' 値、 *NaN* (MATLAB 数値)
'not-a-number' の値。 彼らは唯一の「境界」イベントです
*EEG.urevent* は、*EEG.event* で唯一の「境界」イベントです。
'NaN' と *EEG.event.urevent* ポインタの 'duration' を使って
尿道。 ハードドライブの「境界」イベントは、などの機能のために重要です [eeg_context.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_context.m) 一時的な関係に関係する
実験中のイベント(例:ウレベント)

### EEG.epochの特長

*EEG.epoch* 構造は連続したデータセットで空ですが、
エポック抽出時に自動的に充填されます。 機能による*EEG.event*構造から計算されます [eeg_checkset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_checkset.m) (付き)
'eventconsistency' を、使用したいユーザーの利便性としてフラグします。
EEGLABスクリプトを書いています。 使用するEEGLAB関数の1つ
*EEG.epoch*構造はあります [eeg_context.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_context.m)お問い合わせ 各 *EEG.epoch* エントリーはタイプをリストします。
*epoch* レイテンシ(msec)は、エポック中に発生した全てのイベントのことです。
変換後に設定したチュートリアルで次の例を実行しました
データエポックに。

``` matlab
>> EEG.epoch

ans =
    1x80 struct array with fields:
        event
        eventlatency
        eventposition
        eventtype
        eventurevent
```

このデータセットには80個のエポック(またはトライアル)が含まれています。 タイプ:

``` matlab
>> EEG.epoch(1)

ans =
    event: [1 2 3]
    eventlatency: {[0] [695.3125] [1.0823e+03]}
    eventposition: {[2] [2] [2]}
    eventtype: {'square' 'square' 'rt'}
    eventurevent: {[1] [2] [3]}
```

最初のフィールド *EEG.epoch(1).event* すべてのイベントのインデックスが含まれています
このエポックの間に発生した。 フィールド *EEG.epoch(1).eventtype*,
*EEG.epoch(1).eventposition*および*EEG.epoch(1).eventlatency*は細胞です
イベントの各イベントのイベントフィールド値を含む配列
エポック。 *EEG.epoch(1).eventlatency*のレイテンシーは
エポックタイムロックイベントに関するミリ秒。 

一部のデータセットには、*EEG.epoch.eventduration* が含まれています。 
ミリ秒単位のイベント。 このフォーマットは異なることに注意してください 
※フレームとして保存されるEEG.event.duration*(ただし表示)
秒またはミリ秒。

エポックを抽出するときは、すべて削除することができますが、選択したセット
データからのイベント。 例えば、イベントが1つしかない場合
epochは、epochテーブルが読みやすくなります。 チュートリアルを使用する
データエポック抽出後のデータセット、項目選択 <span style="color: brown">編集 → 選択する epoch/event</span> メニューで、入力します(ポップアップで)
下のウィンドウ) 'rt' を *Event type* フィールドで選択します。
選択したイベントを削除し、他のイベントをすべて削除* 代わりに * 削除 epochs
いかなるイベントでも参照されません*。 *Ok*を押して、新しいデータセットを作成します。 注意:
この娘(そしてその将来の子供のデータセット、もしあれば)は痕跡を含まない
実際に発生した全てのイベント(*EEG.urevent*を除く)
実験中は、この工程で消去された。

![画像:Pop_selectevent.jpg](/assets/images/Pop_selectevent.jpg)

その後、タイピング

``` matlab
>> EEG.epoch(1)
```

フィードバック

``` matlab

ans =
    event: 1
    eventlatency: 1.0823e+03
    eventposition: 2
    eventtype: 'rt'
    eventurevent: 3
```

つまり、epoch 番号 1 には、型 'rt' の 1 つのイベントが 1 個あります。
latency 1082.3 ms. また、これは最初のイベントであることを示しています
データセット(例:*event:1*)が、3番目のイベントだったことに注意
元のデータセットは対応するurevent以来(貯えられる)
*EEG.event.urevent*は3です。

### 保存された .set ファイル

EEGLABのデータセットは、*.set*ファイルに保存されます。 *.set* ファイルは MATLAB ファイルです。 コマンドを使用して EEG 構造を保存できます。

```matlab
save -mat myfile.set EEG
```

EEGLABの有効なデータセットファイルとなります。 別のサポートされている形式は、構造自体のコンテンツを保存することです(EEGLAB 2021のデフォルト)。

```matlab
save -mat myfile.set -struct EEG
```

しかし、別のサポートされているフォーマットは、2つのファイルを保存することです。 メタデータ (拡張子 .set と MATLAB ファイルの種類) を含む 1 つのファイル (.fdt 拡張子を持つ .float32 )。 生データファイルは、サンプルxチャネル(最初の1つのチャネルのすべてのデータ、そして2番目のチャネルのためのすべてのデータなど)で整理されます。 場合によっては、サンプルxトライアルxチャンネルで生データファイルが整理されています。 以下のMATLABコマンドと同じです。
生データファイル(拡張子 .dat)の別の形式は、.fdt ファイルと比較して、データがトランスポーズされたまま保存することであった。 このフォーマットは10年以上前から廃止されましたが、EEGLABは引き続き読むことができます。

```matlab
data = EEG.data;
EEG.data = 'myfile.fdt';
floatwrite(data(:,:)', 'myfile.fdt');
save -mat myfile.set EEG
```

機能によって実行される追加のチェックがあります [pop_loadset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadset.m)なので、この関数を使って EEGLAB のデータセットを読み込むことをおすすめします。

```matlab
EEG = pop_loadset('myfile.set')
```

STUDYの構造
---------
このセクションでは、EEGLAB の記述に必要な構造の詳細を提供します。
EEGLABで動作するカスタムMATLABスクリプト、関数、プラグイン
STUDY構造とスタディセット。

※STUDY* 構造体には、各データセットの情報が含まれています。
すべてのデータセットの処理を可能にする追加情報
お問い合わせ ※STUDY*構造体は以下です。 このチュートリアルでは、
小さなサンプルスタディセットの解析から得られた例
10つのデータセット、各5つの被験者から2つの条件を比較し、ダウンロードできます。 [詳しくはこちら](http://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip) (1.8
GB)。
関数を使用してスタディセットをロードした後(前のセクションを参照するか、または下述のように) [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_loadstudy.m)MATLABの*STUDY*を入力
コマンドラインは以下のような結果を生み出します。

``` matlab
>> STUDY

STUDY =
    name:       'N400STUDY'
    filename:   'N400.study'
    filepath:   '/eeglab/data/N400/'
    datasetinfo:    [1x10 struct]
    session:    []
    subject:    {1x5 cell}
    group:      {'old' 'young'}
    condition:  {'non-synonyms' 'synonyms'}
    setind:     [2x5 double]
    cluster:    [1x40 struct]
    notes:      ' '
    task:       'Auditory task: Synonyms Vs. Non-synonyms, N400'
    history:    [1x4154 char]
    etc:        [1x1 struct]
```

*STUDY.datasetinfo* は長さがある構造の配列です
*STUDY*のデータセットの数。 各構造店舗情報
その主題、条件、セッションを含むデータセットの1つについて、
グループラベル また、データセットファイル自体にポインタが含まれています
(*詳細は以下に説明)

*STUDY.datasetinfo* サブフィールド *subject*、*group*、*session* および
*condition* は、対象グループ、セッション、条件をラベル付けます。
研究の各データセットに関連付けられている。 この情報は、
*STUDY* 構造が作成されるとユーザが提供しました。 その他,
デフォルト値は想定されます。

*STUDY.cluster* フィールドはクラスター構造の配列で、初期化
*STUDY*が作成され、クラスタリング後に更新される場合
(*詳細は以下に説明) 独立したコンポーネントをクラスターした後、各データセット内の各識別されたコンポーネントが1つのコンポーネントクラスターに割り当てられます。
クラスタリングのために識別されるすべてのコンポーネントを含むクラスタ1。

*STUDY.history* フィールドは *history* フィールドと同等です。
*EEG*の構造。 すべてのコマンドラインコールを関数に保存します。
gui から。 コマンド履歴を用いた基本的なスクリプト作成
情報、参照 [EEGLABの歴史](/tutorials/11_Scripting/Using_EEGLAB_history.html) チュートリアルのセクション。

*STUDY.etc* フィールドには、管理に役立つ内部情報が含まれています
*STUDY*構造をクラスタリング機能で使用 お問い合わせ
特に、クラスタリング前のプリクラスタデータが保存されます
実行する。

### STUDY.datasetinfo サブ構造
*STUDY.datasetinfo* フィールドは、情報を保持するために使用されます
研究の一部であるデータセット。 以下は、例えば *datasetinfo* です。
構造、最初のデータセットに関する情報を保持する1
*スタディ*:

``` matlab
>> STUDY.datasetinfo(1)

    ans =
        filepath:   '/eeglab/data/N400/S01/'
        filename:   'syn01-S253-clean.set'
        subject:    'S01'
        group:      'young'
        condition:  'synonyms'
        session:    1
        trialinfo:  [1×426 struct]
        comps:      [3 5 6 7 8 9 11 13 14 15 16 17 19 20 21 24 25 28 29 34 35 44 52]
        index:      1
```

*STUDY*がユーザによって作成されたとき、この情報は投稿されました。

*datasetinfo.filepath* と *datasetinfo.filename* フィールドは
ディスク上のデータセットの場所。

*datasetinfo.subject* フィールドは、データセットの対象となるコードを添付します。
注意: *STUDY* に含まれている同じ主題からの複数のデータセットはあります
異なる *datasetinfo* エントリに保存され、通常区別されます。
異なる実験条件や/または表現として
異なる実験セッション。

*datasetinfo.group* フィールドは、対象グループラベルを
データセット。

*datasetinfo.condition* および *datasetinfo.session* フィールドホールド
データセット条件とセッションラベル。 *condition* フィールドが空の場合、
すべてのデータセットは同じ条件を表すと仮定されます。 もし、
*session* フィールドは空で、同じ条件のすべてのデータセットは仮定されます
異なるセッションで記録されていること。

*datasetinfo.index* フィールドは、*ALLEEG* 内のデータセットインデックスを保持しています。
現在ロードされたデータセット構造のベクトル。 冗長ですが、
サブ構造が別の関数への入力として使用されるとき有用
(例: *datasetinfo.index = 1* は *ALLEEG(1)*、*datasetinfo.index.= に対応する必要があります)
*ALLEEG(2)*等への2*。

*datasetinfo.comps* フィールドはコンポーネントのインデックスを保持しています
クラスタリングに指定されているデータセット。 空の場合、すべて
そのコンポーネントはクラスター化される。

*datasetinfo.trialinfo* フィールドは各データに関する情報を保持しています
トライアル 連続データが空です。 このフィールドでは、
与えられたデータセット内の試験との違いは、以下に記載されています。

``` matlab
>> STUDY.datasetinfo(1).trialinfo(1)

ans =
  struct with fields:

           chan: 0
    description: 'syn'
       duration: 128
         points: 1
           type: 'S253'
```

トライアル情報のデータ構造のフィールドはイベントのフィールドをミラーリングします
データセットの構造(フィールドは*EEG.event*と同じです)。 ふりがな
フィールド 'type' には、刺激の種類が含まれています。 フィールド 'duration'
サンプルの刺激の提示の持続時間を示します。 その他
フィールド ('chan', 'description', 'points') には、
与えられたデータセット。 一般的に、異なるデータセットは異なる
フィールド。 

### STUDY.design サブ構造
推論テストを実行する目的のために、任意の(m x n)設計は
可能(独立変数の選択を含む)
条件、グループ、セッション、特定の刺激関連試験、または
その他のトライアルサブセット ※STUDY*の設計分野の説明です。

これは、現在の(v2019)STUDY.designサブ構造です。

``` matlab
>> STUDY.design(1)

  ans =
             name: 'Design 1 - compare letter types'
         variable: [1x2 struct]
            cases: [1x1 struct]
         filepath: ''
          include: {}
```

これらのサブ構造の各コンテンツの展開、取得

``` matlab
             name: 'Design 1 - light and audio all subjects'

         variable: [1x2 struct]
                 label: 'condition'
               pairing: 'on'
                 value: {'ignore'  'memorize'  'probe'}
               vartype: 'categorical'

           cases: [1x1 struct]
              label: 'subject'
              value: {'S01'  'S02'  'S03'  'S04'  'S05'  'S06' }

         include: {}
```

-   'variable' フィールドは、'independent 変数の略です。' 現在、
    EEGLAB を使用する場合は、2 つの独立した変数まで定義できます。
    標準プロット機能(LIMOエクステンションをEEGLABに使用する場合)
    統計を計算し、結果をプロットするために、任意の数
    独立した変数は使用することができます)。 STUDY.design(x).variable(1)
    STUDYの最初の独立した変数の説明が含まれています
    設計番号 x、STUDY.design(x).variable(2) は含んでいます
    2番目の独立した変数の説明(もしあれば)。 詳しくはこちら
    独立した変数は「ラベル」、ペアリングステータス('on'、
    ペアリングされたデータと 'off' がペアリングされていないデータ)、関連する値、および
    タイプ(分類的または連続的) - 連続変数が
    LIMO エクステンションを EEGLAB に使用する場合のみ関連します。 お問い合わせ
    例えば、この特定の例では独立した変数
    'condition' は、'ignore'、'memorize'、'probe' の値を取ることができます。 お問い合わせ
    グラフィックインターフェイスSTUDY.designセクションで詳細, 値がかもしれない
    値ラベルを連結し、それらを分離することによって結合される
    '-' 文字で。 例えば、'memorize - Probe' は新しい値です。
    変数 'condition' では、 変数 'condition' に、 変数 'condition' に 含まれたデータセットを指しています。
    'memorize' または 'probe' stimuli のいずれか。

-   'cases' フィールドには、単一の 'cases' の説明が含まれています(a
    臨床研究の統計で採用される用語。 現在の使用
    インターフェイスは、 'cases' を定義することができません。
    (単一の被写体をプロットするときは、使用するオプションを選択します)
    統計のための単一の試験は「ケース」の同等を自動的に作ります
    'trials' へ。

-   'filepath' フィールドは、データファイルが存在しているパスです。
    保存される。

-   'include' フィールドは独立した変数と値のリストです。
    たとえば、'memorize' stimuli を含むデザインに含める
    唯一の(およびすべての対象データセットを無視する)(または、シングルトライアルの場合)
    この独立した変数を持たない統計、すべての試験)
    値。

#### *STUDY*の設計独立した変数の定義

ほとんどの独立した変数は時主要な*STUDY*インターフェイスで定義されます
STUDY. 'condition', 'group', 'session' は独立した
最初の*STUDY*編集GUIで定義された変数。 これらに加えて
変数、EEGLAB はデータの各サブセットに対して独立した変数を抽出します
epochs フィールド情報に基づくタイムロックイベント
各データセット。 関数 [std_maketrialinfo.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_maketrialinfo.m) 作成する
*STUDY.datasetinfo* の 'trialinfo' サブ構造 例えば、最初に
*STUDY*内のデータセットは、プロパティを持つ場合があります。

``` matlab
  STUDY.datasetinfo(1).condition = 'a';
  STUDY.datasetinfo(1).group = 'g1';
  STUDY.datasetinfo(1).trialinfo(1).presentation = 'evoked';
  STUDY.datasetinfo(1).trialinfo(2).presentation = 'evoked';
  STUDY.datasetinfo(1).trialinfo(3).presentation = 'evoked';
  STUDY.datasetinfo(1).trialinfo(4).presentation = 'spontaneous1';
  STUDY.datasetinfo(1).trialinfo(5).presentation = 'spontaneous1';
  STUDY.datasetinfo(1).trialinfo(6).presentation = 'spontaneous1';
  STUDY.datasetinfo(1).trialinfo(7).presentation = 'spontaneous2';
  STUDY.datasetinfo(1).trialinfo(8).presentation = 'spontaneous2';
  STUDY.datasetinfo(1).trialinfo(9).presentation = 'spontaneous2';
```

'trialinfo' 構造は、各試験のプロパティについて説明しています。
データセット番号 1. 試用番号1、2、3はプレゼンテーションタイプの試験です
'evoked', Whereas 試験 4, 5, 6 はプレゼンテーションタイプの試験です
'spontaneous1' と試用版 7, 8, 9 は、プレゼンテーションタイプの試用版です。
'spontaneous2'。

関数 [std_makedesign.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_makedesign.m) (またはそのGUI等)
[pop_studydesign.m がリリースされました。](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_studydesign.m))上記の情報を使用して作成します
STUDYの設計。 'variable1' エントリのコンテンツ
[std_makedesign.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_makedesign.m) 関数は 'datasetinfo' のフィールドか、
'datasetinfo.trialinfo' のフィールド。 'trialinfo' のフィールドは、
STUDY.datasetinfo構造のフィールドに類似した方法。 例えば
STUDY.datasetinfo は上記と定義されます。

std_makestudy() を呼び出すには、次のように記述します。

``` matlab
>> STUDY = std_makedesign(STUDY, ALLEEG, 1, 'variable1', 'presentation');
```

「表示」の特定の値を選択する お問い合わせ

``` matlab
>> STUDY = std_makedesign(STUDY, ALLEEG, 1, 'variable1', 'presentation', 'values1', { 'spontaneous1' 'spontaneous2' } );
```

### STUDY.changrp サブ構造

*STUDY.changrp* サブ構造は、
*STUDY.cluster* データ チャネルのための構造。 たくさんあります
*STUDY.changrp* にデータ チャネルがある要素。 各要素
*STUDY.changrp*は1つのデータ チャネルおよびregroup情報を含んでいます
すべての被験者を横断するデータチャネル。 例えば、事前入力後
*STUDY.changrp(1)* をタイプするチャネルの対策は戻ります

``` matlab
>> STUDY.changrp

    ans =
    1x14 struct array with fields:
        name
        channels
        chaninds
```

*changrp.name* フィールドには、チャンネルの名前(つまり 'FP1')が含まれています。
*changrp.channels* フィールドには、このチャネルの名前が含まれています。
グループ グループには複数のチャンネルが含まれている可能性があるためです(for)
チャネルのグループ全体でERPのような計算措置のインスタンス、または
たとえば、すべてのデータチャネルで RMS を計算します。
これらの機能はGUIではまだ完全にサポートされていません。

### STUDY.clusterサブ構造

*STUDY.cluster*のサブ構造はについての情報を保存します
*STUDY*に適用されるクラスタリング方法およびクラスタリングの結果。
各*STUDY*データセットのクラスタリングのために識別される部品はそれぞれあります
複数のコンポーネントクラスターに割り当てられます。 お問い合わせ
異なったクラスターは空間的におよび/または機能的に明瞭であるかもしれません
記録されたデータの起源とダイナミクス。 例えば、1つのコンポーネント
クラスターは、目の点滅のために考慮することができます, 目の動きのための別の, 第三
中央ポスターアルファバンド活動等のため 各クラスター
別の *STUDY.cluster* フィールドに格納されます。
*STUDY.cluster(2)*、*STUDY.cluster(3)*、等...

最初のクラスター、*STUDY.cluster(1)*は、すべてのコンポーネントで構成されます
クラスタリングのために識別されたすべてのデータセットから。 作成されました
*STUDY*が作成され、クラスタリングの結果ではありません。
*ParentCluster*。 このクラスターには、そのコンポーネントが含まれているわけではありません。
同等ダイポールモデルは、より高い割合の分散を発揮します
コンポーネントのスカルプマップ。 これらのコンポーネントは除外されています
クラスタリング(参照) [コンポーネントのクラスタリング](/tutorials/10_Group_analysis/component_clustering_tools.html)
コンポーネントをクラスタリングから除外する方法の詳細については、チュートリアル。
MATLAB コマンドラインで *STUDY.cluster* をタイピング

``` matlab
>> STUDY.cluster

    ans =

    1x23 struct array with fields:
        name [string]
        parent [integer]
        child [cell]
        comps [array]
        sets [array]
        algorithm [cell]
        preclust [struct]
        topo [2-D array]
        topox [array]
        topoy [array]
        topoall [cell]
        topopol [array]
        dipole [struct]
```

この情報(クラスタリング結果を含む)は、すべてアクセスすることができます。
MATLABのコマンドラインから、またはインタラクティブ機能を使用して [pop_clustedit.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.phpfile=pop_clustedit.m).

EEGLAB バージョン 14 は、それぞれの情報に関する詳細情報を含むために使用します。
クラスター(ERP、スペクトラム、時間頻度データなど)
クラスター) この情報は、この構造で利用可能になります
与えられたクラスターがプロットされたとき。 これらの配列は、ユーザーにアクセス可能であった
しかし、主にプロットの目的のために使用される値をキャッシュした(EEGLAB)
それらをプロットされたたびに再ロードする必要はありません。

EEGLAB 2019以降では、よりシンプルなキャッシュアプローチを採用しています。
すべてのプロットされたデータはSTUDYに保存されます。 キャッシュ構造。 STUDYでデータが利用可能である場合
キャッシュすると、キャッシュされた値が自動的に返されます。 お問い合わせ
この情報にアクセスし、返り値を使用することをお勧めします
プロット関数 std_erpplot, std_specplot, std_erspplot -
必要な分解のプロット。 

各クラスターの*cluster.name*サブフィールドは、
クラスター番号(例:クラスター配列のインデックス)
'cls 2'、'cls 3' など。 これらのクラスター名は、任意のものに変更することができます
(例えば、より有意義な) コマンド・ラインまたはviatheを介してユーザ名 [pop_clustedit.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_clustedit.m) インターフェイス。


*cluster.comps* と *cluster.sets* フィールドは、どのコンポーネントを記述するか
現在のクラスターに属します: *cluster.comps* はコンポーネントを保持します
それぞれのデータセットのインデックスと*cluster.sets*
複数のデータセットが同じように使用できることに注意してください。
コンポーネントの重みとスカルプマップ -- 例えば2つのデータセットを含む
同じ被験者と異なる実験条件のデータ
同じセッションで収集されるため、同じICAを使用して
分解および同じコンポーネントのインデックス。 後述のセクションで、*cluster.sets*
異なるデータセットインデックスを含む各行に複数の行が含まれる場合があります。

*クラスター。 preclust* サブフィールドはサブ構造の保持
クラスターに含まれるコンポーネントのプリクラスタ情報。
このサブ構造は、プリクラータリングメソッド(s)、
各パラメータ、および結果の前処理PCAデータ
matrices(例えば、コンポーネントERP、ERSP、および/またはITCをそれぞれ意味する)
条件)。 *preclust*サブ構造に関する追加情報
次のセクションで、その使用がさらに(階層)
サブクラスタリングの説明

*cluster.centroid* フィールドは、クラスター測定のセントロイドを保持しています。
コンポーネントをクラスターするために使用される各測定(例、平均またはセンチロイド)
各クラスターコンポーネント ERSP、ERP、ITC、パワースペクトラなど
*STUDY*条件)、クラスタリングで採用されていない措置に加えて、
相互クラスターの視覚化および編集機能のプロットのために利用できる、 [pop_clustedit.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_clustedit.m).

*cluster.algorithm*サブフィールドは、選択したクラスタリングアルゴリズムを保持します
(例:*kmeans*) およびで使用される入力パラメータ
事前にクラスタリングしたデータをクラスタリングします。

*cluster.parent*および*cluster。 Child* サブフィールドは
階層クラスタリング (参照) [コンポーネントのクラスタリング](/tutorials/10_Group_analysis/component_clustering_tools.html) チュートリアルのセクション)。

*クラスター。 Child* サブフィールドには、あるクラスターのインデックスが含まれています。
このクラスターからコンポーネントのクラスタリングによって作成される(おそらく、
追加のクラスターコンポーネントと一緒に。 *cluster.parent* フィールド
親クラスターのインデックスが含まれています。

*cluster.topo* フィールドには、コンポーネントの平均トポグラフィが含まれています。
クラスター。 そのサイズは67x67で、ピクセルの座標は
*cluster.topox* および *cluster.topoy* (それらのサイズのそれぞれ[1x67\])。
これは、スカルプに補間活性が含まれているので、異なる
電極位置をスキャンした被写体を視覚化できる
同じ地理的なプロット。 *クラスター。 topoall* セル配列には 1 つが含まれています
各コンポーネントと条件の要素。 *cluster.topopol*は
各コンポーネントの極性を示す-1sと1sの配列。
コンポーネントの極性は固定されません。
コンポーネントのアクティビティとそのスカルプマップは、バックプロジェクションを変更しません
データチャネルへのコンポーネント) 真の頭皮の極性は取られます
コンポーネントERPを表示する際に考慮に入れます。

最後に、*cluster. dipole* 構造は遠心分離機の同等を含んでいます
コンポーネントクラスターのダイポール位置。 この構造は同じです
単一のコンポーネントのダイポール(参照) [ICAソース](/tutorials/09_source/DIPFIT.html) チュートリアルのセクション)。

クラスター2(*artifacts*)が4つの15の構成要素から成っていることを仮定して下さい
データセットの *cluster* 構造は次の通りです。
値:

``` matlab
>> STUDY.cluster(2)

    ans =
        name:       'artifacts'
        parent:     {'ParentCluster 1'}
        child:      {'muscle 4' 'eye 5' 'heart 6'}
        comps:      [6 10 15 23 1 5 20 4 8 11 17 25 3 4 12]
        sets:       [1 1 1 1 2 2 2 3 3 3 3 3 4 4 4]
        algorithm:  {'Kmeans' [2]}
        preclust:   [1x1 struct]
```

この構造フィールド情報は、このクラスターが他にはないと言います
*ParentCluster*(常に、クラスター1)よりも*parent*クラスター
3つ*子*クラスター(クラスター4、5、6)があります。 によって作られました
'Kmeans' *algorithm* と要求されたクラスターの数が '2' であった。 お問い合わせ
EEGLAB 2019 では、階層の使用をお勧めしません。
クラスタリング。 多くの場合、単純なクラスタリングは、同様の結果またはより良い結果を得ることができます。

*STUDY.cluster(2).preclust*にプリクラータリングの詳細は保存されます。
サブ構造(上図ではなく下図)。 例えば、
この場合、*cluster。 preclust* サブ構造には、
PCA-reduced 平均活性スペクトラ(各2条件)
クラスター内のすべての15コンポーネント。

*cluster.preclust* サブ構造には、いくつかのフィールドが含まれています。
例:

``` matlab
>> STUDY.cluster(2).preclust

    ans =
        preclustdata:   [15x10 double]
        preclustparams: { {1x9 cell} }
        preclustcomps:  {1x4 cell}
```

*preclustparams* フィールドは、セル配列の配列を保持します。 各セル
array には、コンポーネントの測定が使用されるものを示す文字列が含まれています。
クラスタリング(例、コンポーネントスペクトラ(*spec*)、コンポーネント ersps
(*ersp*)、等...)、また測定に関連する変数。 お問い合わせ
この例は1つのセル配列のみです。1つの測定のみです。
パワースペクトラム)はクラスタリングで使用されました。

例えば:

``` matlab
>> STUDY.cluster(1).preclust.preclustparams

    ans =
        'spec' 'npca' [10] 'norm' [1] 'weight' [1] 'freqrange' [3 25]
```

クラスタリングで使用されるデータ対策は、コンポーネントのスペクトラでした。
与えられた周波数範囲(" 'freqrange' [3 25]*)、スペクトルは
主寸法10個(* 'npca'[10]*)に短縮、正規化(*)
'norm' [1]*) と 1 (* 'weight' [1]') の重みをそれぞれ指定します。 いつか
1つ以上の方法は、クラスタリングに使用されます。
複数のセル配列を含む。
*preclust.preclustdata* フィールドには、指定したデータが含まれています。
クラスタリングアルゴリズム(*Kmeans*)。 データサイズ幅は、データサイズ幅の数値です。
ICAコンポーネント(15)は、保持されたプリンシパルコンポーネントの数で
上記に示すspectra (10)。 冗長性を防ぐため、測定のみ
クラスター内の 15 個のコンポーネントの値をデータに残しました。 ふりがな
他のコンポーネントの計測データを他のクラスターに保持しました。

*preclust.preclustcomps* フィールドは、サイズのセル配列(nsubjects x)です。
各セルがクラスターされたコンポーネントを保持するnsession(i.e., all)
親クラスターのコンポーネント。

#### *STUDY* クラスターの .sets、.comps サブ構造を理解する

この部分では、*clust* は現在の関心のクラスターを示します。
vSTUDY.cluster(クラスト).sets* と *STUDY.cluster(クラスト).comps* フィールドには
与えられたクラスターに含まれるコンポーネントのリスト。
*STUDY.cluster(クラスト).sets*は\[datasets_with_same_ica x ncomps\]です。
対応するデータセットのインデックスを与える行列
*STUDY.datasetinfo* はリストされている部品に対応します
*STUDY.cluster(クラスト).comps*。 *STUDY.cluster(クラスト).sets*および
※STUDY.cluster(clust).comps* は同じカラム数です。 しかし、
*STUDY.cluster(clust).sets*は、データセット(from)が複数行ある場合
同じ被写体)は同じICAの分解を持っています - 例が与えられます
各コンポーネントが2つのデータセットに含まれている場合のクラスターの下(2
同じICAの分解を含む.setsフィールドの行。

``` matlab
>> STUDY.cluster(clust)

    ans =
         name: 'Cls 3'
         sets: [2x13 double]
        comps: [23 5 13 47 38 3 50 5 12 4 11 3 5]
       parent: {'Parentcluster 1'}
```

もし、何らかの理由で、*STUDY.cluster(clust).sets*が均質でない場合には、
いくつかの主題は、同じ分解といくつかのデータセットを持っています
他の被写体は、同じデータセットの異なる数を持っています
分解、NANは欠落したデータセットに差し込みます。 しかし、
これらの欠落したデータセットの存在は、いくつかの分析を破る可能性があります(警告)
関連するときにメッセージが表示されます。

### STUDYデータファイル

特定の*STUDY*の設計のための事前入力措置が、あるファイルはあります
ディスクに保存 これらのファイルには、次のような名前があります。

``` matlab
  S01.daterp  % ERP data for data channels
  S01.icaerp  % ERP data for ICA components
  S01.datspec % Spetrum data for data channels
  S01.icaspec % Spetrum data for ICA components
  S01.dattimef % Single-trial time-frequency data for data channels
  S01.icatimef % Single-trial time-frequency data for ICA components
  S01.daterpim % ERPIMAGE data for data channels
  S01.icaerpim % ERPIMAGE data for ICA components
  S01.icatopo  % ICA component topographies
```

*S01* は、これらのファイルが対象のファイルであることを示しています。 1. お名前
*STUDY* のネーミング条約に基づくファイルです。 最初の場合
subject は 'xx01' という名前で、ファイル名は 'xx01' から始まります。 お問い合わせ
単に数字(1, 2, 3, 等)であるべきではない理由もあります。
ほとんどのオペレーティングシステムは、起動するファイルを保存することができません
番号。

EEGLABのバージョンのネーミング条約が古いことに注意
2019年(EEGLAB 12、13、14)は若干異なります。
各*STUDY*の設計のためにrecomputedである必要(のための場合ではない)
EEGLAB 2019以降バージョン EEGLABの古いバージョンでは、
2つの追加ファイル*xxxx.datersp*と含まれている*xxxx.datitc*
平均的な時間頻度分解 - すべてのファイルが含まれているので
単一トリルデータ、これらのファイルは削除されました。

ファイル構造は、以下のすべてのファイルタイプに似ています。

``` matlab
>> fileContent = load('-mat', 'S01.daterp');
>> fileContent

    ans = 
         chan1: [750×784 single]
         chan2: [750×784 single]
         chan3: [750×784 single]
         chan4: [750×784 single]
         chan5: [750×784 single]
         ...
        chan70: [750×784 single]
        chan71: [750×784 single]
        labels: {1×71 cell}
         times: [1×750 double]
      datatype: 'ERP'
    parameters: {'rmcomps'  {1×3 cell}  'interp'  [1×71 struct]}
     datafiles: {'/data/data/STUDIES/STERN/S01/Memorize.set'  '/data/data/STUDIES/STERN/S01/Ignore.set'  '/data/data/STUDIES/STERN/S01/Probe.set'}
     trialinfo: [1×784 struct]
```

*chanxx* は、これらのチャネルのERPデータを表すフィールドです。 アメリカ向け
コンポーネント、プレフィックスは <i>コンプリート</i> 代わりに <i>チャン</i>お問い合わせ 詳しくはこちら
チャンネルデータには、時間xの試用版の配列が含まれています。 以下
追加フィールドの説明:

-   *labels*: これはチャンネルラベルのセル配列です { 'Cz' 'Pz'
    お問い合わせ このフィールドは、データチャネルのみに存在し、
    ICAコンポーネントを提示します。
-   *データ型*: このフィールドには、ファイルに保存されたデータの種類が含まれています。 ニュース
    以下に詳細が記載されています。
-   *パラメータ*: 各測定を計算するために使用されるパラメータは、例えば、コンポーネントのスペトラの周波数範囲もファイルに保存されます。 測定ファイルは標準のMATLABコマンドを使用して読み、処理することができる標準的なMATLABファイルです。 含まれている変数名は自己説明であるべきです。
-   *datafile*: このファイルを計算するために使用されるファイルの一覧です。
-   *trialinfo*:各データトライアルに関する情報 これは似ています
    フィールド 'trialinfo' 内の情報のリストに
    *STUDY.dataset*(STUDY.dataset*)(情報も含む)
    条件、グループおよびセッションは別に貯えられます
    *STUDY.dataset*の構造。

フィールドデータ型は複数の値を取ることができます。

-   *ERP*:ERPデータ
-   *SPECTRUM*: SPECTRUMデータ(レガシー)
-   *TIMEF*:時間頻度データ
-   *ERPIMAGE*:ERPIMAGEデータ

ERPIMAGEデータの場合、 <i>コンプリート</i> そして、 <i>チャン</i> フィールドは
文字の文字列を含む。 この場合、文字列は
データを読み込みます。 これは、単一trialを格納することを避けます
必要がない場合は、複数回データが必要になります。
