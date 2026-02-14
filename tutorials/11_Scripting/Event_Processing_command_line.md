---
layout: default
title: b. Event Processing
long_title: b. Event Processing
parent: 11. Write scripts
grand_parent: Tutorials

---
イベント処理スクリプト
=====
お問い合わせ

このセクションは、EEGLAB/MATLAB を記述したいユーザーにとって不可欠です。
指定したタイプにデータタイムロックされた、または処理するスクリプト
イベントの組み合わせ。 EEGLABユーザーにとっても重要である
EEGLABのデータとイベントが実際に保存されているか知りたい
操作。 まず、説明するチュートリアルのセクションを読みたいと思うかもしれません [EEGLABイベント構造](/tutorials/ConceptsGuide/Data_Structures.html#eegevent).

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>


イベントを作成または変更するためのスクリプト
---------------------------
<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'event_processing_single_dataset.m'));">MATLABコマンドを表示する</button>

以下のスクリプトは、比較的高度な EEGLAB/MATLAB スクリプトです。 ふりがな
[EEGLABスクリプトチュートリアル](/tutorials/11_Scripting/Using_EEGLAB_history.html)
EEGLAB を使用して MATLAB スクリプトを書く方法に関する基本的な詳細が含まれています。 
まず、継続的なチュートリアルデータセットをインポートします。 以下のコード
EEGLAB パスを自動的に検出するため、MATLAB にコピーして貼り付けることができます。
コマンドウィンドウ。

``` matlab
%% Working with events
eeglab_path = fileparts(which('eeglab.m')); % get EEGLAB path
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab; % start EEGLAB
pop_editoptions( 'option_storedisk', 0); % Change option to process multiple datasets
EEG = pop_loadset( 'eeglab_data.set', fullfile(eeglab_path, 'sample_data')); % load data
```

ツイート
シフトイベントのレイテンシーを10サンプルで下回るシンプルなスクリプト。 このような操作は、アンプやコンピュータが行動イベントを収集する遅延のために時々必要です。 あるいは、使用してもよい [pop_adjustevents.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_adjustevents.m) 機能。 スクリプト 
このセクションから使用可能 [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=event_processing_single_dataset.m).

``` matlab
%% Adjust event latency
for iEvent=1:length(EEG.event)
     EEG.event(iEvent).latency = EEG.event(iEvent).latency + 10;
end
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET); % Store dataset
```

次のスクリプトは、データセットイベントリストを操作する方法を示しています
新しいクラス(pseudo)を追加することにより、チュートリアルデータセットを使用して
既存のデータセットへのイベント。 ここでは、新しいイベントを追加したい
既存の'square'タイプのイベントの前に、レイテンシーは100msです。 (注) わたしたちは言う
これを行うと、相対的なデータのepochingを許可するかもしれません
新規イベント

``` matlab
%% Add new cue events to a loaded dataset 0.1 second before time-locking event
nevents = length(EEG.event);
for index = 1 : nevents
    if ischar(EEG.event(index).type) && strcmpi(EEG.event(index).type, 'square')
    % Add events relative to existing events
        EEG.event(end+1) = EEG.event(index); % Add event to end of event list
        % Specifying the event latency to be 0.1 sec before the referent event (in real data points)
        EEG.event(end).latency = EEG.event(index).latency - 0.1*EEG.srate;
        EEG.event(end).type = 'cue'; % Make the type of the new event cue
    end
end

EEG = eeg_checkset(EEG, 'eventconsistency'); % Check all events for consistency
[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET); % Store dataset
eeglab redraw % Redraw the main EEGLAB window
```

EEGLAB 'urevent' 構造により、研究者がポイントを探索することができます。
※実験中の2つのイベント無し*は実際に
各イベントが異なる *context* で発生したため等価です。 しかし、
問題に苦しむ、脳機能への洞察は、これから一目瞭然
ダイナミクスがすべてのイベントにタイムロックされたときにビューのポイントが犠牲になります
特定のタイプは、単に *averaged* です。 特に、EEGLAB [エルプイメージ。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=erpimage.m) そして、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m)
関数は、潜在的な時間コースやスペクトルの違いを視覚化することができます
epochsの振幅は、いくつかの機能によってソートされたイベントにタイムロックされています
コンテキスト。 単純な例は、stimulus-locked epoch を並べ替える
その後の応答時間('rt')が、これは単純で簡単な例です。
関数 [eeg_urlatency.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_urlatency.m)
元のデータでイベントの遅延を得るのに便利です。 

グループ分析のためのイベント情報の追加
--------------
<button onclick="showModal(this)" data-command="eeglabp = fileparts(which('eeglab.m')); open(fullfile(eeglabp, 'tutorial_scripts', 'event_processing_study.m'));">MATLABコマンドを表示する</button>

エッグラボ [データ構造](/tutorials/ConceptsGuide/Data_Structures.html) チュートリアルのセクションでは、イベントがどのように行われるかを示します。
グループ分析の処理 すべてのデータセットからイベント情報を引き出す
*STUDY.datasetinfo.trialinfo*構造で保存します。

特定のトライアルの場合、タイムロックイベントの情報のみが
保存される。 その他のイベントへの関心の他の情報がある場合
与えられた試験(例えば反応時間のような)、それはとして加える必要があります
イベントをロックするフィールド(例えば、EEG.events(1).rt = 1231)
1231 ms の反応時間を示します。 お問い合わせ
スクリプトを使用して実行し、グラフィック上ではまだ実行できません
インターフェイス。

独立した変数を追加したい場合は、単にスクリプトを書くだけです。
各データセットの EEG.event 構造をスキャンし、関連するフィールドを追加します。
各データトライアルのタイムロックイベント(0時以降) お問い合わせ
例えば、 フィールド 'previous_event_type' を追加しても構いません。
前のイベントの種類。 *STUDY* を作成したら、このフィールドは
※STUDY*の設計に自動的に考慮され、表示されます
インターフェイス。 以下は、単純なスクリプトスキャンイベントの例であり、追加します。
'square'タイムロックイベントへの新しい分野としての反応。 この方法
STUDYレベルで表示します。
反応時の注意
与えられた試験のために時間が欠落している、それは適切に対処されます
*STUDY*レベルで。 *STUDY*は単一のデータセットで作成されますが、
一般の場合、複数のデータセットから作成されます。 スクリプト 
お問い合わせ [詳しくはこちら](http://sccn.ucsd.edu/eeglab/locatefile.php?file=event_processing_study.m).

``` matlab
%% Modify the events of datasets for creating STUDY designs

% load the epoched tutorial dataset
eeglab_path = fileparts(which('eeglab.m')); % get EEGLAB path
[ALLEEG, EEG, CURRENTSET, ALLCOM] = eeglab; % start EEGLAB
pop_editoptions( 'option_storedisk', 0); % Change option to process multiple datasets
EEG = pop_loadset( 'eeglab_data_epochs_ica.set', fullfile(eeglab_path, 'sample_data')); % load data
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG);

% scan all datasets and modify events
% there is only one here so it is for illustration purpose
commands = {}; % for building the STUDY
for iDat = 1:length(ALLEEG)
     for iEvent = 1:length(ALLEEG(iDat).event)-1
           curEvent  = ALLEEG(iDat).event(iEvent); % current event
           nextEvent = ALLEEG(iDat).event(iEvent+1); % next event

           % only find reaction time event following time-locking events (TLE) within the same epoch
           if strcmpi( curEvent.type, 'square') && strcmpi( nextEvent.type, 'rt') && nextEvent.epoch == curEvent.epoch
                ALLEEG(iDat).event(iEvent).rt = (nextEvent.latency - curEvent.latency)/ALLEEG(iDat).srate * 1000; % latency of reaction time in ms
           end

     end
     % save dataset
     fileName = fullfile( ALLEEG(iDat).filepath, [ ALLEEG(iDat).setname(1:end-4) '_rtevents.set' ]);
     ALLEEG(iDat).saved = 'no';
     ALLEEG(iDat) = pop_saveset(ALLEEG, fileName);
     
     % add to list of dataset to build STUDY
     if isempty( ALLEEG(iDat).subject),  ALLEEG(iDat).subject = sprintf('S%2.2d', iDat); end % create subject name
     commands = { commands{:} 'index' iDat 'load' fileName 'subject' ALLEEG(iDat).subject }; 
end

% create study
[STUDY, ALLEEG] = std_editset( [], [], 'commands', commands,'updatedat','off' );
CURRENTSTUDY = true;
eeglab redraw

% Use menu item STUDY -> Select/Edit STUDY design then 
% under "Edit the independent variables for this design", press "New"
% You should be able to select event field 'rt' for creating designs
```

上記のスクリプトを実行した後、メニュー項目を使用して <span style="color: brown">研究 → 選択/編集 STUDY デザイン</span>、セクションの下の*New*ボタンを押して下さい*この設計*のための独立した変数を編集して下さい。 *rt* を選択して、新しい統計デザインを作成することができます(これは連続変数であるため、LIMO EEGLAB プラグインを使用して、単一のtrial EEG アクティビティを繰り返します)。 *STUDY* が既にある場合は、ディスクからトライアル情報を更新するか(または関数を呼び出します) [std_maketrialinfo.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=std_maketrialinfo.m from the MATLAB command line)).

各データセットのイベントを変更するのではなく、*STUDY.datasetinfo.trialinfo* フィールドを変更したい場合に注意してください。 ただし、STUDYを保存しても、EEGLABを再起動し、STUDYをリロードすると、変更が消去されます。 これは、EEGLABが個々のデータセットのイベントで*STUDY.datasetinfo.trialinfo*構造の内容を一貫して保持しているからです。