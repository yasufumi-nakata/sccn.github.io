---
layout: default
title: c. Group level
title: c. Group-level analysis
parent: 11. Write scripts
grand_parent: Tutorials 
---
EEGLABスクリプトを用いたグループレベルの解析
=====
お問い合わせ

グラフィックインターフェイスから*STUDY*の構築(前述の通り)
セクション) 呼ばれるかもしれない別名 MATLAB 関数を呼ぶ
直接ユーザーによって。 これらの関数を簡潔に記述します。 お問い合わせ
MATLABは、より多くの情報のためのメッセージを支援します。 名前が始まる機能
*std_* は *STUDY* および/または *EEG* を引数として扱います。
チャネルまたはクラスターに直接信号処理および/またはプロットを実行
活動内容 関係なく、記述するチュートリアルの部分で文書を調べるのは自由です [STUDYの構造](/tutorials/ConceptsGuide/Data_Structures.html#the-study-structure).

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'study_script.m'));">MATLABコマンドを表示する</button>

STUDYの作成
-----------------

*STUDY*に多くのデータセットが含まれている場合は、代わりに*STUDY*を作成するために小さなスクリプトを書くことを好みます [ログイン](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_study.m) ログイン 多くの研究を造る必要がある場合や、
既存の *STUDY* にファイルを繰り返し追加します。

*注意事項:* STUDY構造を変更したい場合は、STUDYチェック機能(STUDYチェック機能)に注意してください。[std_checkset.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_checkset.m)) 複数のチェックを実行して、それが表しているデータセットと互換性を保つことができます。 だからこの機能
変更を解除する可能性があります(コマンドラインで警告が発行されます)。
データセットを自分で変更して達成できることが多い
同じ目標と変更がSTUDYで自動的に報告されます
構造。

MATLABスクリプトは以下のとおりです。
GUI-equivalentコマンドライン関数を呼び出す [std_editset.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_editset.m) 
"5subjects"フォルダから(チュートリアルデータをダウンロードできます) [詳しくはこちら](https://sccn.ucsd.edu/eeglab/download/STUDY5subjects.zip)) それからあなたが不圧縮したフォルダへのパスを変更します。 このページで使用されるコードスニペットは、 [勉強_script.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=study_script.m)

``` matlab
[STUDY ALLEEG] = std_editset( STUDY, [], 'name','N400STUDY',...
        'task', 'Auditory task: Synonyms Vs. Non-synonyms, N400',...
        'filename', 'N400empty.study','filepath', './',...
        'commands', { ...
      { 'index' 1 'load' 'S02/syn02-S253-clean.set' 'subject' 'S02' 'condition' 'synonyms' }, ...
      { 'index' 2 'load' 'S05/syn05-S253-clean.set' 'subject' 'S05' 'condition' 'synonyms' }, ...
      { 'index' 3 'load' 'S07/syn07-S253-clean.set' 'subject' 'S07' 'condition' 'synonyms' }, ...
      { 'index' 4 'load' 'S08/syn08-S253-clean.set' 'subject' 'S08' 'condition' 'synonyms' }, ...
      { 'index' 5 'load' 'S10/syn10-S253-clean.set' 'subject' 'S10' 'condition' 'synonyms' }, ...
      { 'index' 6 'load' 'S02/syn02-S254-clean.set' 'subject' 'S02' 'condition' 'non-synonyms' }, ...
      { 'index' 7 'load' 'S05/syn05-S254-clean.set' 'subject' 'S05' 'condition' 'non-synonyms' }, ...
      { 'index' 8 'load' 'S07/syn07-S254-clean.set' 'subject' 'S07' 'condition' 'non-synonyms' }, ...
      { 'index' 9 'load' 'S08/syn08-S254-clean.set' 'subject' 'S08' 'condition' 'non-synonyms' }, ...
      { 'index' 10 'load' 'S10/syn10-S254-clean.set' 'subject' 'S10' 'condition' 'non-synonyms' }, ...
        { 'dipselect' 0.15 } });
```

上記では、コマンドの各行がデータセットをロードします。 

最後の行
同等のダイポールモデルが15%未満のコンポーネントを選択
コンポーネントのスカルプマップからの残留分散。 お問い合わせ サポート
詳細は std_editset* をご覧ください。 

データセットへのパスについて
上のコードは相対パスです。 その後、同じコードを実行する
snippet、MATLABの現在のディレクトリには、データセットが含まれている必要があります。

新しい*STUDY*(またはディスクから読み込まれたら)を作成したら、両方
*STUDY* 構造とその対応 *ALLEEG* 居住者配列 *EEG*
MATLAB ワークスペースでは構造が変数になります。 

タイピング *\>\>
MATLAB コマンドラインの STUDY* はフィールドの値を表示します。

``` matlab
>> STUDY =

  struct with fields:

          history: 'STUDY = []; [STUDY ALLEEG] = std_checkset(STUDY, ALLEEG);'
          datasetinfo: [1×10 struct]
          name: 'N400STUDY'
          task: 'Auditory task: Synonyms Vs. Non-synonyms, N400'
          notes: ''
          filename: 'N400empty.study'
          filepath: '.'
          subject: {'S02'  'S05'  'S07'  'S08'  'S10'}
          group: {}
          session: []
          condition: {'non-synonyms'  'synonyms'}
          etc: [1×1 struct]
          cache: []
          preclust: [1×1 struct]
          cluster: [1×1 struct]
          changrp: [1×61 struct]
          design: [1×1 struct]
          currentdesign: 1
          saved: 'yes'
```

*conditions*は個々のデータセット(*synonyms*と*non-synonyms*)で定義されているため、EEGLABはこれらの2つの条件を比較するために*STUDY*の設計を自動的に作成します。 また、ご使用いただくこともできます。 [std_makedesign.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_makedesign.m) コマンドラインから異なるデザインを作成する機能。 EEGLABのグラフィックインターフェイスでデザインを作成して、履歴で返されたものを見てみましょう(ビア [ログイン m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegh.m) 関数)。 デザインを作成するためのイベント情報を追加する場合は、チュートリアルのセクションを参照してください。 [グループ分析のためのイベント情報の追加](http://localhost:4000/tutorials/11_Scripting/Event_Processing_command_line.html#adding-event-information-for-group-analysis).

チャネル対策の計算とプロット
----------------------------------------

### コンピューティング対策

関数を使う [pop_precomp.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_precomp.m) (関数を呼び出す)
[std_precomp.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_precomp.m) チャネル対策を優先します。 例えば、
次のコードは、コンピューティング用のグラフィックユーザーインターフェイスを呼び出します
チャネルにおける対策

``` matlab
 >> [STUDY ALLEEG] = pop_precomp(STUDY, ALLEEG);
```

コマンドラインから優先措置を使用する場合は、以下のコードスニペットがすべてのものを補う
チャンネルを欠落させ、すべてのチャネルとすべてのデータセットのERPを計算します
与えられた研究。 レイテンシーから構成されるベースライン(*erpparams*)を削除する追加のパラメータ(-200 ms〜0 ms)も使用されます。

``` matlab
>> [STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels', 'erp', 'on', 'erpparams', {'rmbase' [-200 0]});
```

### プロット対策

同じ機能を使って結果をプロットすることができます。
コンポーネントクラスタ用 例えば、壮大な平均ERPをプロットする
チャンネル 'Oz', あなたが試すかもしれません:

``` matlab
>> STUDY = std_erpplot(STUDY, ALLEEG, 'channels', {'Oz'});
```

![ファイル:Erp_chann_oz](/assets/images/channel_oz.png)

出力変数をヘルプメッセージに記述したように追加することでデータを取得できます。 [std_erpplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_erpplot.m) 関数は std_plotcurve 関数を使ってリプロットします。

``` matlab
[STUDY erpdata erptimes] = std_erpplot(STUDY, ALLEEG, 'channels', {'Oz'}, 'timerange', [-200 1000]);
std_plotcurve(erptimes, erpdata, 'plotconditions', 'together', 'plotstderr', 'on', 'figure', 'on', 'filter', 30);
```

上記のように、 [std_plotcurve.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_plotcurve.m) 関数は付加的な持っています
標準的な間違いをプロットする変数はから利用できません
EEGLABのグラフィックインターフェイス。 関数の出力 [std_erpplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_erpplot.m) また、追加で制御することもできます
ネイティブパラメータ [std_erpplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_erpplot.m) そして、 [pop_erpparams.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpparams.m). 


たとえば、追加通知
上記のオプション *timerange* は、レイテンシ範囲を間にあるように制約します
200〜1000ms。

![ファイル:Erp_chann_oz](/assets/images/Erp_chann_Oz.png)

グラフィックインターフェイスをプロットするチャンネルから他のコマンドを試し、履歴で返されたものを見る (ビア [ログイン m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegh.m) 関数) 異なるフォーマットでERPをプロットする。

### その後の処理のための計算された対策の取得

すべてのSTUDYプロット機能は、プロット結果を返すことができます。 アフター
STUDY の結果をプロットし、EEGLAB の履歴を調べます()<i>ログイン</i> から
MATLAB コマンドライン) は、STUDY 関数が呼び出されたかを確認します。
この関数の助けを見てみましょう。 通常は追加可能です
追加パラメータ。

例えば、EEGLAB の履歴に次の行が表示される場合:

``` matlab
>> STUDY = std_erpplot(STUDY,ALLEEG,'channels',{ 'FP1'});
```

結果を取得するには、2つの出力を追加し、ERPデータとERP用の1つ
時間値、続くように:

``` matlab
>> [STUDY erpdata erptimes] = std_erpplot(STUDY,ALLEEG,'channels',{ 'FP1'}, 'noplot', 'on');
```

ふりがな <i>エルプデータ</i> 配列は全ての対象のERPデータを含んでいます。
また、STUDYデザインによりサイズも異なります。 次のコマンドは、
第二の全ての被写体(デザインに含まれる)のERPをプロットする
STUDYの設計の細胞(*synonyms*の状態)。

``` matlab
>> figure; plot(erptimes, erpdata{2});
```

![](/assets/images/plot_erp.png)


小さなスクリプトは、小さな研究で時間頻度分解を計算します。
また、データセットで時間の頻度分解を比較します
STUDYレベルでの時間頻度分解によるレベル。

``` matlab
% Compute newtimef on first dataset for channel 1
options = {'freqscale', 'linear', 'freqs', [3 25], 'nfreqs', 20, 'ntimesout', 60, 'padratio', 1,'winsize',64,'baseline', 0};
TMPEEG = eeg_checkset(ALLEEG(1), 'loaddata');
figure; X = pop_newtimef( TMPEEG, 1, 1, [TMPEEG.xmin TMPEEG.xmax]*1000, [3 0.8] , 'topovec', 1, 'elocs', TMPEEG.chanlocs, 'chaninfo', TMPEEG.chaninfo, 'plotphase', 'off', options{:},'title',TMPEEG.setname, 'erspmax ',6.6);

% Compute newtimef for all datasets and plot first channel of first dataset
[STUDY, ALLEEG] = std_precomp(STUDY, ALLEEG, 'channels','recompute','on','ersp','on','erspparams',{'cycles' [3 0.8] 'parallel' 'on' options{:} },'itc','on');
STUDY = std_erspplot(STUDY,ALLEEG,'channels',{TMPEEG.chanlocs(1).labels}, 'subject', 'S02', 'design', 1 );
```

以下のスクリプトの結果(プロットをクリックしてカラースケールを調整するサイドパネルを削除します)。 同じ機能で結果が同じであることは驚くべきことではありません
どちらのケースでも使われています。

![ボーダー|700px](/assets/images/newtimef_res.png)

### 統計結果の取得

統計を計算できる全てのプロット機能は、
出力中の統計配列。 最初に統計を有効にする必要があります
グラフィックインターフェイスから、またはコマンドラインコールを使用する。 

条件統計を計算するインスタンスの場合、タイプ:

``` matlab
>> STUDY = pop_statparams(STUDY, 'condstats', 'on');
```

それから、与えられたチャネルのために、タイプして下さい:

``` matlab
>> [STUDY erpdata erptimes pgroup pcond pinter] = std_erpplot(STUDY,ALLEEG,'channels',{ 'FP1'});
```

![](/assets/images/plot_erp_stats.png)

今、タイピング:

``` matlab
>> pcond

    pcond =
        [820x1]
```

統計配列は、毎回820 p値、1つが含まれています。

返される統計の種類は、パラメータに依存することに注意してください。
ERP パラメータ グラフィック インターフェイスで選択 (例えば、
選択された *permutation* 統計値、surrogate に基づく p 値
データが返されます。

*pgroup* と *pinter* 配列は、グループとグループ間での統計を含む
ANOVAの相互作用の用語, それぞれ, グループと条件の両方の場合
あります。 

その他の機能など [std_specplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_specplot.m), [std_erspplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_erspplot.m)と [std_itcplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_itcplot.m) アクション
同様の方法(詳細については、関数ヘルプメッセージを参照してください)。 より多くの制御のために、また直接呼ぶことができます注意して下さい [スタコンド。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=statcond.m) 関数は、*erpdata* セル配列をとして与えます
入力。 
ヘルプメッセージを見る [スタコンド。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=statcond.m) この件名にもっと役立つ機能(このページの最後に例も参照)。

### 他のソフトウェアパッケージで処理する結果を保存する

SPSS、Statistica、Stata、R、SAS、Excel で処理したSTUDY結果を簡単に保存できます。 MATLAB 配列をテキストファイルに保存するのは簡単です。 5つの異なるオプションがあります。 すべてのオプションは同等です。 以下は、条件1のデータを保存しています。 タブ区切り値のあるファイルを保存するものもありますが、デフォルトではコンマ区切り値でファイルを保存します。 以下のほとんどの機能には多くのオプションがあります。

``` matlab
array = erpdata{1}; % or array = rand(100,200); 
dlmwrite('matlabarray1.txt',array,'delimiter', '\t', 'precision', 10); % tab separated values
xlswrite('matlabarray2.xls',array);
csvwrite('matlabarray3.csv',array); % comma separated values
writematrix(array, 'matlabarray4.csv');
writetable(table(array), 'matlabarray5.csv')
```

サイズ750ポイント×13の対象のERPデータに3つの条件があることを想像してみてください()<i>エルプデータ</i> 前のセクションで得られた。 3つの条件があると想像してみてください <i>エルプデータ</i> 配列。 以下のショートスクリプトは、ファイル 'erpfile.txt' に保存され、最後の列で条件を追加します。 このファイルを任意の統計ソフトウェアにインポートし、カテゴリ予測として最後の列を使用する可能性があります。

``` matlab
[STUDY erpdata erptimes] = std_erpplot(STUDY,ALLEEG,'channels',{ 'FP1'}, 'noplot', 'on');
dlmwrite('erpfile.txt',squeeze([ erptimes' erpdata{1} ones(size(erpdata{1},1),1)*1 ]),'delimiter', '\t', 'precision', 2);
dlmwrite('erpfile.txt',squeeze([ erptimes' erpdata{2} ones(size(erpdata{2},1),1)*2 ]),'-append', 'delimiter', '\t', 'precision', 2);
dlmwrite('erpfile.txt',squeeze([ erptimes' erpdata{3} ones(size(erpdata{3},1),1)*3 ]),'-append', 'delimiter', '\t', 'precision', 2);
```

n x m条件のセットがある場合、同じことが起こります。 2つの分類変数を表す2つのカラムを追加できます。

``` matlab
dlmwrite('erpfile.txt',squeeze([ erpdata{1,1} ones(size(erpdata{1,1},1),1)*[1 1] ]),'delimiter', '\t', 'precision', 2);
dlmwrite('erpfile.txt',squeeze([ erpdata{1,2} ones(size(erpdata{1,2},1),1)*[1 2] ]),'-append', 'delimiter', '\t', 'precision', 2);
dlmwrite('erpfile.txt',squeeze([ erpdata{2,1} ones(size(erpdata{2,1},1),1)*[2 1] ]),'-append', 'delimiter', '\t', 'precision', 2);
dlmwrite('erpfile.txt',squeeze([ erpdata{2,2} ones(size(erpdata{2,2},1),1)*[2 2] ]),'-append', 'delimiter', '\t', 'precision', 2);
```

被写体をケースとして使用できるようにしたいと想像してみてください。 この場合、カラムとして定義することはできません。 ほとんどの固定ソフトウェアを使用すると、2つのフォーマット(通常は長くて広いフォームと呼ばれる)の間で変換できます。 上記の場合、ワイドからロングまで変換したい。 MATLABスクリプトも使えます。 例えば、例えば <i>エルプデータ</i> 条件 1 は 750 ポイントと 13 件を含み、長いフォームでデータを保存すると、このように見えます。 このファイルは、2つの列のみ、対象のインデックスの1つと1つが含まれます。

``` matlab
dlmwrite('erpfile.txt',[ erpdata{1}(:,1) ones(size(erpdata{1},1),1)*1],'delimiter', '\t', 'precision', 2);
for iSubject = 2:size(erpdata{1},2)
    dlmwrite('erpfile.txt',squeeze([ erpdata{1}(:,iSubject) ones(size(erpdata{1},1),1)*iSubject]),'-append', 'delimiter', '\t', 'precision', 2);
end
```

ERSPデータの一般的なケースを見てみましょう。 以下のスクリプトは、ERP データを保存することができます(無視対記憶状態)。 以下の例では、 12 時間のステップ、10 の周波数、71 チャンネル、13 件を表示しています。 これを行うためのよりエレガントで高速な方法。

```matlab
chanlocs = eeg_mergelocs(ALLEEG.chanlocs);
[STUDY erspdata ersptimes erspfreqs] = std_erspplot(STUDY,ALLEEG,'channels',{chanlocs.labels}, 'noplot', 'on');
erspdata =

  2×1 cell array

    {10×12×71x13 single}
    {10×12×71x13 single}
    
if exist('erpfile.txt'), delete('erpfile.txt'); end
for iFreq = 1:10
  for iTime = 1:12
    for iChan = 1:71
      for iSubject = 1:13
          dlmwrite('erspfile.txt',squeeze([ erspdata{1}(iFreq,iTime,iSubject) iFreq iTime iChan iSubject 1]),'-append', 'delimiter', '\t', 'precision', 2);
          dlmwrite('erspfile.txt',squeeze([ erspdata{2}(iFreq,iTime,iSubject) iFreq iTime iChan iSubject 2]),'-append', 'delimiter', '\t', 'precision', 2);
      end
      end
  end
end
```

以下は、保存したファイルの先頭に列名を追加しています。 スクリプトを変更して、自動的に追加することもできます。 これは一例です。 実際の周波数と時間は保存されるだけでなく、交換する <i>フィードバック</i> そして、 <i>ログイン</i> お問い合わせ <i>erpfreqs(iFreq)</i> そして、 <i>erptimes(iTime) は、</i> 上記のスクリプトで。 

![スクリーンショット 2022-11-04 3 47 27 PM](https://user-images.githubusercontent.com/1872705/200086058-98a10d7a-27f8-4f60-8bd4-e70d6170f6a6.png)

コンポーネント対策の計算とプロット
-----------------------------

### コンポーネントの複雑な対策

関数 [pop_precomp.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_precomp.m) また、測定を計算するために使用することができます
コンポーネントを扱う。 チャネルを扱うときとして、機能 [std_precomp.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_precomp.m) また、プレコンピューティングコンポーネント
対策 構文は両方のケースで非常に似ています。 お問い合わせ
インスタンス、関数 [pop_precomp.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_precomp.m) 次の方法で呼ばれる
コンポーネントのコンピューティング対策のためのグラフィックユーザーインターフェイスを起動します。

``` matlab
[STUDY ALLEEG] = pop_precomp(STUDY, ALLEEG, 'components'); % pop up graphical interface
```

同じ操作を使わなくても実行できます。
関数のとき GUI [std_precomp.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_precomp.m) 型を定義するパラメータで呼び出されます。
計算したい測定。 例えば、次のコードで
スニペット、ERPはすべてのコンポーネントに計算されます。

``` matlab
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components', 'recompute', 'on', 'erp', 'on', 'filter', 30);
```

計算された措置の種類は、密接な関係にあります
仮説をテストし、措置の選択
技術的に実行できる分析の種類を制約します。 お問い合わせ
例えば、次のセクションでは、各コンポーネントからの対策は、
ICAコンポーネントのクラスタリングを実行するために集約。 EEGLAB jargon では、
これは *pre-clustering* と呼ばれます。 前処理で使用される措置
レベルは、プロットに使用するために事前に入力する必要があります。 それから、先に
プリクラスタリング、使用される措置の慎重な評価、および
その世代で使用するパラメータは、運ぶ必要があります。

以下は、対策を生成するために使用されるコードです。

``` matlab
[STUDY ALLEEG] = std_precomp(STUDY, ALLEEG, 'components',...
    'erp','on','erpparams',{'rmbase' [-200 0] },...
    'scalp','on',...
    'spec','on','specparams',{'freqrange' [3 50] 'specmode' 'fft' 'logtrials' 'off'},...
    'ersp','on','erspparams',{'cycles' [3 0.8] 'nfreqs' 100 'ntimesout' 200},...
    'itc','on');
```

### コンポーネントの前処理とクラスタリング

ICAコンポーネントのクラスタリングのために、通常は利用可能なすべてのアクティビティを計算します。 
パワースペクトルのクラスタリングを指定する
\[3 30\]-Hz 周波数範囲、\[100 600\]-ms タイムウィンドウ内のERP、
dipoleの場所情報(10によって重くされる)およびERSP情報
上記のデフォルト値、タイプ:

``` matlab
>> [STUDY ALLEEG] = std_preclust(STUDY, ALLEEG, 1,...
        {'spec' 'npca' 10 'weight' 1 'freqrange' [3 25] },...
        {'erp' 'npca' 10 'weight' 1 'timewindow' [100 600]  'erpfilter' '20'},...
        {'dipoles' 'weight' 10},...
        {'ersp' 'npca' 10 'freqrange' [3 25]  'timewindow' [-1600 1495]  'weight' 1 'norm' 1 'weight' 1});
```

または、グラフィックインターフェイスでこれらの値を入力するには、次のようにします。

``` matlab
>> [STUDY ALLEEG] = pop_preclust(STUDY, ALLEEG);
```

コマンドラインからクラスターコンポーネントを作成するには、次のようにします。

``` matlab
>> [STUDY] = pop_clust(STUDY, ALLEEG, 'algorithm','kmeanscluster', 'clus_num', 10);
```

またはグラフィックインターフェイスをポップアップする:

``` matlab
>> [STUDY] = pop_clust(STUDY, ALLEEG);
```

### コンポーネントクラスターの可視化

コンポーネントクラスターを視覚化するための主な機能 [pop_clustedit.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_clustedit.m)お問い合わせ このインターフェイスをポップアップするには、単にタイプします。

``` matlab
>> [STUDY] = pop_clustedit(STUDY, ALLEEG);
```

この関数は、プロットするためのさまざまなプロット関数を呼び出します。 
 - scalpのマップ ([std_topoplot.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_topoplot.m)), 
 - パワースペクトル ( )[std_specplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_specplot.m)), 
 - 同等のダイポール (等価ダイポール)[std_dipplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_dipplot.m)), 
 - ERPsについて[std_erpplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_erpplot.m)), 
 - ERSPs()[std_erspplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_erspplot.m)), 
 - ITCs(イッツ)[std_itcplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_itcplot.m)). 

これらの関数のすべてが同じ呼び出し形式に従う (ただし) [std_dipplot.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_dipplot.m) 若干異なります。ヘルプメッセージを参照してください。 
機能の使用 [std_topoplot.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_topoplot.m) 例として、次のコードがプロットされます。
クラスターの平均スカルプマップ2:

``` matlab
 >> [STUDY] = std_topoplot(STUDY, ALLEEG, 'clusters', 2, 'mode', 'together');
```

![](/assets/images/clust2.png)


以下のコードスニペットは、クラスタ3の平均スカルプマップをプロットします
クラスタ3に属するコンポーネントのスカルプマップ:

``` matlab
 >> [STUDY] = std_topoplot(STUDY, ALLEEG, 'clusters', 2, 'mode', 'apart');
```

![](/assets/images/clust2maps.png)

次のコードは、クラスタ2のコンポーネント3をプロットします。

``` matlab
 >> [STUDY] = std_topoplot(STUDY, ALLEEG, 'clusters', 2, 'comps', 3);
```

![](/assets/images/clust2_2.png)

カスタム対策の計算とプロット
------------

### カスタム対策の計算

このセクションでは、EEGLAB 2021.0 以降のバージョンが必要です。
STUDYのカスタム対策をSTUDYで計算することができます。 [std_precomp.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_precomp.m)
機能。 カスタムを呼び出す前に
機能、 [std_precomp.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_precomp.m) 関数は便利なようにデータセットの修飾語を適用します
*rmclust*、*rmicacomps*か*interp*は部品を取除くか、またはinterpolate
チャンネル. オプション *customparam* を使用して、追加のパス
カスタム機能へのパラメーター。 

まず関数を呼び出します [std_precomp.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_precomp.m) 変換された単一致命的なデータを格納する。 例えば、ベースライン(820のうち1～410のデータサンプル)を外します。 単一のトライアルを変更したくない場合は、後で説明するように読み込みます。 

```matlab
std_precomp(STUDY, ALLEEG, 'channels', 'customfunc', @(data)bsxfun(@minus, data, mean(data(:,1:410,:),2)), 'interp', 'on');
```

低パスフィルタの下のコードは、単一の試行処理の別の例として10 Hzの下の単一trialデータをフィルタリングします。

```matlab
std_precomp(STUDY, ALLEEG, 'channels', 'customfunc', @(data)reshape(eegfilt(data(:,:), EEG(1).srate, 0,10,EEG(1).pnts,60,0,'fir1'), size(data)), 'interp', 'on');
```

私たちが使うのは、 [std_readata.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_readata.m) 処理されたデータをインポートし、選択したSTUDY設計に従ってそれを整理するために、この場合、2つの条件 *synonyms* versus *non-synonyms*。 各条件のデータ配列は820時間のサンプル、61チャネルおよび5つの主題です。

```matlab
[~, customdata] = std_readdata(STUDY, ALLEEG, 'channels', {ALLEEG(1).chanlocs.labels }, 'design', 1, 'datatype', 'custom');
customdata

  2×1 cell array
    {820×61×1×5 single}
    {820×61×1×5 single}
```

研究設計に従って組織された未処理の単一致命的なデータを読みたい場合は、以下に示すようにERP単trialデータをお読みください。 出力配列の最後の寸法が異なることに注意してください。 これは、カスタム機能が汎用用途のためであり、各チャネルの2-D配列出力を可能にします(この場合、第3次元は1よりも大きくなります)。

```matlab
[~, erpdata] = std_readdata(STUDY, ALLEEG, 'channels', {ALLEEG(1).chanlocs.labels }, 'design', 1, 'datatype', 'erp');
erpdata

  2×1 cell array
    {820×61×5 single}
    {820×61×5 single}
```

### カスタム対策のプロット

それからあなたは使用することができます [std_plotcurve.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_plotcurve.m) データ平均をプロットする。 例えば、以下の関数はERPを計算します。
各チャンネルとプロット(*erpdata*出力配列を使用して、または*customdata*出力配列を使用して)

```matlab
std_plotcurve(EEG(1).times, erpdata, 'chanlocs', ALLEEG(1).chanlocs);
customdata = cellfun(@squeeze, customdata, 'uniformoutput', false);
std_plotcurve(EEG(1).times, customdata, 'chanlocs', ALLEEG(1).chanlocs);
```

![](/assets/images/custom_plot2.png)

またはあなた自身の機能を使うことができます。 たとえば、以下のコードスニペットは、各条件のチャンネル全体でルートの平均平方(RMS)を計算します。

```matlab
figure;
nCond = length(STUDY.design.variable(1).value);
for iCond = 1:nCond
  rms = sqrt(mean(mean(customdata{iCond},3).^2,2));
  hold on; plot(EEG(1).times, rms);
end
legend(STUDY.design.variable(1).value)
setfont(gcf, 'fontsize', 16); % change font size
```

![](/assets/images/custom_plot1.png)

### カスタム対策に関する統計計算

関数を使うことができることに注意して下さい [std_stat.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_stat.m) *customdata* と *customerp* のセル配列の統計を上回る。 以下のコードスニペットは、複数の比較のために、パーマテーション統計と偽の発見修正を使用します。 出力は 61 チャネルによるサイズ 820 のサンプルの修正された p 値の配列です。

```matlab
std_stat(erpdata, 'condstats', 'on', 'mcorrect', 'fdr', 'method', 'permutation')
ans =

  1×1 cell array
    {820×61 double}
```

以下のコードスニペットは、FielTripで利用可能なクラスターメソッドを使用して複数の比較の修正を行います。

```matlab
std_stat(erpdata, 'condstats', 'on', 'fieldtripmcorrect', 'cluster', 'fieldtripmethod', 'montecarlo', 'mode', 'fieldtrip')
ans =

  1×1 cell array
    {820×61 double}
```

また、低レベル関数を呼び出すこともできます。 [スタコンド。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=statcond.m) そして、 [スタコンドフィールドトリップ.m](http://sccn.ucsd.edu/eeglab/locatefile.php?file=statcond.m) 直接(追加情報のための機能ヘルプメッセージを参照)。 例えば:

```matlab
res = statcond(erpdata); size(res)
ans =
   820    61
```

