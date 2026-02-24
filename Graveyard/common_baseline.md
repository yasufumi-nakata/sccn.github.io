---
layout: default
---
ERSP条件を渡る共通のベースライン
=========

計算イベント関連の分光力(ERSP)
2つ以上の実験からのデータエポックのセットに変換
条件、ユーザーは、すべての条件から同じ(ログ)パワーベースラインベクトルをサブトラクトする場合があります。 両方とも [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) 関数
そして、 [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m) 関数は、リターンスペクトルベースラインを呼び出す

その後に使用できる値 ''newtimef() '' 計算。 お問い合わせ
インスタンスは3つのデータを3つのセットから仮定します
EEGLABで実験条件を10件保存しました
ディレクトリの*subj\[1:10\]data\[1:3\].set*という名前のデータセットファイル
*/home/user/eeglab* および各被写体の 3 つのデータセット
同じ ICA の重量を含んで下さい、次の MATLAB コードはプロットします
ICAコンポーネント1 ERSPは、一般的なスペクトルを使用して3つの条件のための
10件ごとにベースライン:

``` matlab
eeglab; % Start eeglab
Ns = 10; Nc = 3; % Ns - number of subjects; Nc - Number of conditions;'
for S = 1:Ns  % For each of the subjects
    mean_powbase = []; % Initialize the baseline spectra average over all conditions for each subject
    for s =1:Nc  % Read in existing EEGLAB datasets for all three conditions
        setname = ['subj' int2str(S) 'data' int2str(s) '.set'];  % Build dataset name
        EEG = pop_loadset(setname,'/home/user/eeglab/'); % Load the dataset
        [ALLEEG EEG] = eeg_store(ALLEEG, EEG, Nc*(S-1) + s);  % Store the dataset in ALLEEG
        [ersp,itc,powbase{s}] =pop_timef( ALLEEG(s),0, 1, [-100 600], 0, 'plotitc', 'off', 'plotersp', 'off' );
        % Run simple newtimef() for each dataset, No figure is created because of options 'plotitc', 'off', 'plotersp', 'off'
        mean_powbase = [mean_powbase; powbase{s}];  % Note: curly braces
    end % condition
    % Below, average the baseline spectra from all conditions
    mean_powbase = mean(mean_powbase, 1);

    % Now recompute and plot the ERSP transforms using the same baseline
    figure;  % Create a new figure (optional figure('visible', 'off'); would create an invisible figure)
    for s = 1:Nc; % For each of the three conditions
        sbplot(1,3,s); % Select a plotting region
        pop_newtimef( ALLEEG(s), 0, 1, [-100 600], 0, 'powbase', mean_powbase, ...
        title', ['Subject ' int2str(S)]); % Compute ERSP using mean_powbase''
    end % End condition plot
    plotname = ['subj' int2str(S) 'ersp' ];  % Build plot name
    eval(['print -depsc ' plotname]); % Save plot as a color .eps (postcript) vector file
end % End subject
eeglab redraw  % Update the main EEGLAB window
```

上記の計算などの繰り返し処理は、
それぞれに多くのエポックがある場合、手で実行する時間がかかります
データセットと多くのデータセット。 そのため、最高のパフォーマンスを発揮します。
EEGLAB MATLAB スクリプトは、MATLAB で終了するまで実行する
セッション。 EEGLAB 関数を使用してスクリプトを書くことで、
データパラメータとイベントへのアクセスを維持しながら、比較的簡単に
MATLAB信号処理とグラフィックスの柔軟性とパワー
環境。

<u>ノート: </u>

-   通常、ユーザーは ERSP を蓄積し、保存したいと思うかもしれません
    上記*newtimef.m*で返された他の出力変数は可能にする
    被験者間のさらなる定量比較。

-   EEGLABの現在のバージョンでは、クロスコヒーレンス関数 {
    {File\|crossf.m} との違いの意義を計算することができます
    2つの条件の一貫性。- 未来に、 [newtimef.m リリース](http://sccn.ucsd.edu/eeglab/locatefile.php?file=newtimef.m) 可能にするために延長されます

    複数の ERSP と ITC の比較は、直接変換します。
-   反復的な正規化の同じタイプ(上記のイラストレーション)は
    { で返された "baseamp" パラメータに適用される
    お問い合わせ