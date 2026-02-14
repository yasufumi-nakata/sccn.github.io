イベントコンテクスト('EEG.urevent'テーブルより確実に取得)
データ分析において価値あることができます。 たとえば、すべて勉強したい
イベントを先行またはフォローする特定のタイプのイベント
特定の範囲内で遅延することにより、他のタイプのもの。 古典的なERP
例は[Squires et]によるデモンストレーションでした
お問い合わせhttp://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=64341)
まれな刺激が文字列に続くと、P300ピークが大きいこと
他のまれな刺激に従うときよりも標準的な刺激。 (v4.4)コマンドライン機能 [eeg_context.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_context.m) イベントを探す
指定した *target* 型(s) は、前および/またはイベントの成功のために
の指定 *neighbor* の型。

以下のスクリプトは、シンプルなデモンストレーションスクリプトです。 [eeg_context.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eeg_context.m) サンプルデータセットで対象イベントを見つける

その後、適切なボタンを押して応答を押します。 いくつかの応答
応答が従わないことを確かめることによって曖昧さは解決されます
ターゲットを成功させる。 (その場合、その応答は、
第2ターゲット)。 また、反応したターゲットをフォローするのも見つかります
EEG ダイナミクスは、非対応のターゲットを想定しています。
これらのターゲットは、'miss' に従わないものとは異なる可能性があります。

``` matlab
% For each target 'square' event, find the succeeding 'rt' and 'square' events

[targsrt,nextrts,nxtypert,rtlats] = eeg_context(EEG,{'square'},{'rt'},1);  % find succeeding rt events
[targssq,nextsqs,nxtypesq,sqlats] = eeg_context(EEG,{'square'},{'square'},1);  % find succeeding square events

% find target 'square' events with appropriate button-press responses

selev = []; % selected events
rejev = [];  % rejected events
for e=1:length(targsrt) % For each target,
    if rtlats(e) > 200 & rtlats(e) < 1500 ...  % if 'rt' latency in acceptable range
    & (sqlats(e) > rtlats(e) | isnan(sqlats(e))) % and no intervening 'square' event,
        selev = [selev targsrt(e,1)];  % mark target as responded to
    else  % Note: the isnan() test above tests for NaN value
    % of sqlats (when no next "square")
        rejev = [rejev targsrt(e,1)];
    end
end
rts = rtlats(selev); % collect RT latencies of responded targets
whos rtlats sqlats nextrts nextsqs
selev = targs(selev); % selev now holds the selected EEG.event numbers
rejev = targs(rejev);
fprintf(['Of %d "square" events, %d had acceptable "rt" responses ',...
'not following another "square".\n'],length(targsrt),length(selev));

%
% find targets following non-responded targets
%
aftererr = rejev+1;  % find target events following an unresponded target
aftererr(find(ismember(aftererr,selev)==0)) = [];  % remove events themselves
% not responded
whos selev rejev aftererr
fprintf(['Of %d "square" events following non-responded targets, ',...
'%d were themselves responded.\n\n'], length(rejev), length(aftererr));
```
