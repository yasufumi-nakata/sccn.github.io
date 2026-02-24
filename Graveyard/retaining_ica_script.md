---
layout: default
---

複数のICA重量をデータセットに入れる
---------------------------------------------

ICAの重み(例えばEEG.weightsおよび
EEG.sphere は、MATLAB 構造の拡張性プロパティーを使用します。 お問い合わせ
MATLAB コマンドラインは、新しい重みと球変数を定義するだけです。
前の分解の重量を保って下さい。 例えば、

``` matlab
>> EEG.icaweights2 = EEG.icaweights; % Store existing ICA weights matrix
>> EEG.icasphere2 = EEG.icasphere; % Store existing ICA sphere matrix
>> [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET); % copy to EEGLAB memory
>> EEG = pop_runica(EEG);  % Compute ICA weights and sphere again using
% binica() or runica(). Overwrites new weights/sphere matrices
% into EEG.icaweights, EEG.icasphere
>> [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET); % copy to EEGLAB memory
```

データセットが保存されると重量のセットが保存されます。
リロード時にリロードされます。 [スクリプト]を参照してください。
チュートリアル:(/tutorials/advanced-topics/writing-EEGLAB-scripts.html)
EEGLAB の MATLAB スクリプトの作成に関する情報。