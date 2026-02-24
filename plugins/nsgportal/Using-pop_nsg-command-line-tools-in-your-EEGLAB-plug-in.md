---
layout: default
parent: NSGportal
grand_parent: Plugins
render_with_liquid: false

title: Using-pop_nsg-command-line-tools-in-your-EEGLAB-plug-in
nav_title: "使用-pop_nsg-command-line-tools-in-your-EEGLAB-plug-in"
long_title: Using-pop_nsg-command-line-tools-in-your-EEGLAB-plug-in
---
# あなたの EEGLAB プラグインで pop_nsg コマンドラインツールを使用する

 このチュートリアルの目的は、*pop_nsg*コマンドラインツールの使用を実証することです(参照) [チュートリアル2](https://github.com/sccn/nsgportal/wiki/Creating-and-managing-an-NSG-job-using-pop_nsg-from-the-command-line)) NSG 機能を搭載した EEGLAB プラグインの実装 *pop_nsg* コマンドラインツールを使用してサンプルプラグインを実装することでここに実証されます。 この目的のために実装されたプラグイン(*pop_icansg*)は、ロードされたEEGデータセットでICA(2つのオプションから選択された方法を使用して)を計算するために実装された*pop_runica*の軽量版です。 しかし、ここには、*pop_runica* で利用可能な多くのオプションとパラメーターを表示する代わりに、*pop_icansg* は、NSG 経由で実行する標準の *pop_nsg* コマンドラインオプションを有効にすることに重点を置いています。 以下は、このプロセスに関与する各手順について説明します。
  
   まず、EEGLABメニュー選択で*pop_nsginfo*を使用してNSGクレデンシャルを指定する必要があります**ツール > NSGポータルへ NSGポータルの設定と認証情報** またはコマンドラインで関数 *pop_nsginfo* を呼び出すことで変更します。 *../eeglab/plugins* の下の *nsgportal* のプラグインのフォルダーがあることを確認してください。

## サンプルプラグイン *pop_icansg*
  
このチュートリアルで実装されているプラグイン(*pop_icansg*)は、*nsgportal*プラグインファイルで配布され、*nsgportal/demos/demo_plugin/icansg/*で見つけることができます。 プラグインをインストールするには、プラグイン(*icansg*)を含むフォルダを*./eeglab/plugins*に移動し、EEGLABを再起動します。

プラグインフォルダには2つのファイルがあります。 [eegplugin_icansg.m ディレクティブ](https://github.com/sccn/nsgportal/blob/master/demos/demo_plugin/icansg/eegplugin_icansg.m) そして、 [ログイン](https://github.com/sccn/nsgportal/blob/master/demos/demo_plugin/icansg/pop_icansg.m).
 最初の関数は、EEGLABメニューからプラグインを起動し、現在のEEGデータセット構造(現在EEGLABに読み込まれたデータセット)を*pop_icansg.m*に入力することができます。 この関数で使用される構文の説明は、 [この EEGLAB wiki セクション](https://sccn.ucsd.edu/wiki/A07:_Contributing_to_EEGLAB#How_to_write_an_EEGLAB_extension)  
 
2番目の関数はこのチュートリアルの焦点になります。 プラグインの目的は、それぞれインフォマックスまたはJADE ICAの分解を実行する2つの実装された分解アプローチを使用して、NSGを介してICA分解を実行することです。 *eegplugin_icansg*関数で指定されたEEGLAB GUIメニュー項目を手動で選択することにより、EEGLABメニューから呼び出されると(下の図を参照)、プラグインはEEGLABに読み込まれた現在のEEGデータセット構造を使用し、ICAメソッドを使用するオプションのエントリウィンドウが表示されます。 下の図は、選択した*eegplugin_icansg*メニュー項目と、*pop_icansg*ウィンドウがポップアップして表示されます。 

<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/plugin_runicansg.jpg?raw=true" alt="drawing" width="600"/>
</center>

プラグインのポップアップ機能(*pop_icansp*)は、MATLABコマンドラインから呼び出すこともできます。この場合、EEGデータセット構造の入力や、データに適用するデコンポジションメソッドを渡すこともできます。 以下のサンプルコードは、EEG のデータセット構造と ICA のデコンポジションタイプの両方が適用されます。そのため、現在読み込まれた (EEG 構造) データセット (*'runica'* を使用して) *without* で ICA デコンポジションを実行します。

`OUT_EEG = pop_icansg(EEG,'icatype','runica')`

プラグインを呼び出して実行した後、*pop_icansg* は、NSG ジョブを送信するために必要なデータとスクリプトを含むフォルダーを作成します。 その後、プラグインは、そのジョブをNSGに送信し、ジョブが終了すると、EEGデータセットとICAデコンポジションを取得します。 この処理は、次の手順で進めます。

1.  入力を管理する
2.  一時的なフォルダーを作成し、入力データを保存します。 
3.  M-file MATLABスクリプトをNSG経由で実行する
4.  NSGにジョブを送信
5.  ジョブ完了時に定期的なNSGポーリングを有効にします。 
6.  入力データとジョブ結果をダウンロード
7.  NSGジョブリストからジョブを削除
8.  結果を EEGLAB にロードし、プラグインコマンド出力で返します。

次のセクションでは、これらの手順を詳細に説明します。 サブセクション見出しはコメント見出しに直接参照されます [ログイン](https://github.com/sccn/nsgportal/blob/master/demos/demo_plugin/icansg/pop_icansg.m).  
 
### セクション1:プラグインの入力を管理する 
```
if nargin < 1   
    help pop_icansg;
    return;
end

allalgs   = { 'runica' 'jader' }; 

if nargin < 2  % Pop up window call: No ICA method specified; 
               %           pop up the parameter input window.
   
    cb_ica = 'close(gcbo);';        
    promptstr    = { { 'style' 'text'    'string' 'ICA algorithm to use (click to select)' } ...
                     { 'style' 'listbox' 'string' char(allalgs{:}) 'callback', cb_ica }};
    geometry = { [2 1.5]};  geomvert = 1.5;                        
    result       = inputgui( 'geometry', geometry,'geomvert', geomvert, ...
                             'uilist', promptstr,'helpcom', 'pophelp(''pop_icansg'')', ...
                             'title', 'Run ICA decomposition in NSG -- pop_icansg()');
    if ~isempty(result)
        options = { 'icatype' allalgs{result{1}}};
    else
        return;
    end
else % Command line call specifying the ICA decomposition method;
     %  in this case no pop-up parameter input window is created.
    options = varargin;   
end
```

上のコードサブセクションでは、プラグインは*pop_icansg*関数の入力を処理します。 このコードは、EEGLABメニューからプラグインを呼び出しる2つの方法(上の**Pop-upウィンドウコール**コードセクションを参照)とMATLABコマンドラインコール(上の**Command line call**コードセクションを参照)をサポートしています。 関数が1つの引数だけで呼び出される(EEGセットを分解する)場合、そのコードは、ICAアルゴリズムが使用するパラメータ入力ウィンドウをポップアップします。 選択したオプションは変数 *options* に格納されます。 コマンド・ライン・コールが ICA のアルゴリズムを(任意入力 '*icatype*' を使用して)使用すると、関数は変数 *options* にその引数を割り当てます。

### セクション2:仮フォルダを作成し、入力データを保存します。 

このセクションの最初の部分では、NSGの資格情報とオプション(結果を受け取るために出力フォルダの場所を含む)は、*nsg_info.m*を呼び出すことで取得されます。 これらのオプションは、もちろん、すでに*pop_nsginfo.m*をそのまま使用して設定されている必要があります。 [詳細はこちら](https://github.com/sccn/nsgportal/wiki/Setting-up-the-plug-in). 
この情報は、NSG出力フォルダ(*pop_nsginfo.m*で定義されている)の一時的なフォルダ(*icansgtmp*)を作成するために使用されます。
仮出力フォルダの場所は自由に選択可能です。 ここでは、NSGオプションで定義された出力フォルダを使用します。これにより、ユーザーはこの場所にファイルを書き込みおよび変更する権限を持つと仮定します(そのオプションは以前にユーザによって定義されたため)。

```
nsg_info;                   % Get the name and path of the temporary folder
jobID = 'icansg_tmpjob';    % Specified job ID (must be a string)

% Create a temporary folder

foldername = 'icansgtmp';                        % Temporary folder name
tmpJobPath = fullfile(outputfolder,'icansgtmp');
if exist(tmpJobPath,'dir'), 
      rmdir(tmpJobPath,'s'); 
end
mkdir(tmpJobPath);                               % Make the temporary folder
```
シンプルさの酒は、例えば、ハードコードされたジョブID(文字列変数 *jobID* のコードセクション)を使用します。 これは、以前の*pop_icansg*ジョブがNSG処理キューに依って、他のジョブがこのプラグインを介して(誰からも)送信されない場合があり、以前のNSGジョブレコードが削除された場合(以下に示すように)結果を取得した後に。 しかし、複数の同時ジョブ送信をNSGジョブキューでアクティブにできるようにしたい場合、個別のジョブ ID を生成し、NSG ジョブラベルが混在していないようにすることをお勧めします。 たとえば、現在の名前に3桁のランダム番号を付けてジョブIDを作成できます(MATLABコード:ジョブID = ['icansg_tmpjob' num2str(floor(rand(1)*1000))))))。

次に、次のコードで仮フォルダに入力データを保存します。

```
% Save data in the folder previously created. 
% Here you may change the filename to match the one
% in the script to be executed via NSG

pop_saveset(EEG,'filename', EEG.filename, 'filepath',tmpJobPath);
```
ここでは、データファイルの名前は変更されませんが、次のセクションでその処理と一致させるために変更されることがあります。

### セクション3:m-fileスクリプトをNSG経由で実行するように管理

NSG(コードセクション3)を介して実行されるMATLABスクリプトは、スクリプトが異なる入力オプションに柔軟に適応できるように書かれています。 たとえば、データセットの名前と、使用するICAアルゴリズムは、ポップアップパラメータ入力ウィンドウまたはコマンドラインを介して、入力として提供されます。 これらの値は、NSG 経由で実行されるスクリプトを構成するために使用されます。

```
fid = fopen( fullfile(tmpJobPath,'icansg_job.m'), 'w');
fprintf(fid, 'eeglab;\n');
fprintf(fid, 'EEG = pop_loadset(''%s'');\n', EEG.filename);
fprintf(fid, 'EEG = pop_ica(EEG, ''%s'',''%s'');\n', options{1},options{2});
fprintf(fid, 'pop_saveset(EEG, ''filename'', ''%s'');\n',EEG.filename);
fclose(fid);
```
ここで、*icatype* は 'runica' で、EEG ファイル名は *tempdatafile.set* で、NSG 経由で実行するスクリプトは次のように読みます。
```
eeglab;                                     % The composed script to be run via NSG 
EEG = pop_loadset('tempdatafile.set');
EEG = pop_ica(EEG, 'icatype','runica');
pop_saveset(EEG, 'filename', 'tempdatafile.set');
```

### セクション4:NSGにジョブを送信

セクション2と3では、ジョブファイルがフォルダー*icansgtmp*で作成されました。 このセクションでは、NSGにジョブが提出されます。 (コードのこの部分は、使用しているものと同様に見えるかもしれません) [チュートリアル2](https://github.com/sccn/nsgportal/wiki/Creating-and-managing-an-NSG-job-using-pop_nsg-from-the-command-line)).

```
MAX_RUN_HOURS = 0.5;
jobstruct = pop_nsg('run',tmpJobPath,'filename', 'icansg_job.m', ...
                    'jobid', jobID,'runtime', MAX_RUN_HOURS);  % run the job via NSG; here 
                                                               % ask for up to 30 min runtime
```
デフォルトのNSGオプションは*pop_nsg*コードでハードコードされていますが、プログラマがこれらのオプションの一部または全部を、例えばプラグインのメインGUIでパラメータ入力編集(このチュートリアルでは示されていない)使用できるようにすることができます。 

代わりに、プラグイン関数はここで終わるかもしれません(セクション4)。この場合、ユーザーは*pop_nsg*ポップアップウィンドウを介してジョブを管理することができます(参照) [チュートリアル1](https://github.com/sccn/nsgportal/wiki/Creating-and-managing-a-job-from-pop_nsg-GUI))。 このリサールは、処理を待ち受けるNSGジョブキューでジョブがしばらくの間残る可能性があることです。 そのため、ジョブが終了するまでプラグイン機能とウィンドウがアクティブに残るくありません。 そのため、ジョブの完了を待ちますように、*pop_nsg* を介してジョブを管理するためにユーザーを指示したい場合、または、後で NSG ジョブの状態をチェックするために、*pop_nsg* にログバックするかを選択できます。 *do* が NSG ジョブが終了するまでプラグインを掛けたい場合は、以下のように関数コードを続けてください。

### セクション5:NSGから定期ジョブステータスポーリングを有効化

次に、*nsg_recurspoll.m*を使って定期的なジョブステータスポーリングを実行します。
 
```
POLL_INTERVAL = 60;  % use a (default) 60-second polling interval value
jobstructout = nsg_recurspoll(jobstruct,...
                  'pollinterval', POLL_INTERVAL); % recursively poll for NSG job status 
                                                  % and display latest results
```
この関数は、送信されたNSGジョブのステータスを60秒ごとに取得します(引数をオプション*'pollinterval'*)、ジョブが完了するまでの実行を継続します。 **注記: EEGLAB で他の作業を実行し、後でジョブのステータスを確認したい場合(セクション 4) の最後にコメントを参照してください。

### セクション6:NSGジョブデータと結果をダウンロード

関数 *nsg_recurspoll.m* が終了した後、NSG のジョブ結果は、別のコールを使用して *pop_nsg* をダウンロードします。
```
pop_nsg('output',jobstructout); 
```

### セクション7:ユーザーのNSGジョブリストからジョブを削除

ユーザの NSG ジョブリストから NSG ジョブレコードを削除するために、*pop_nsg* を呼び出すことができます。 

```
pop_nsg('delete',jobstructout);
```
一般的に、その結果が取得されると、ジョブレコードを削除することをお勧めします。 これは、もはやアクティブでないジョブでNSGアカウントを乱雑にすることを避けます。

### セクション8:NSGジョブ結果をEEGLABにロードし、呼び出し機能から結果を返す

ここでは、EEGデータ*と*その計算されたICA分解がEEGLABにロードされ、関数出力で返されます。 ここでは、*nsg_info.m* で定義されたデフォルトの出力フォルダパスを使用します。

```
OUT_EEG = pop_loadset(EEG.filename, fullfile(outputfolder, ['nsgresults_' jobID],foldername));
```

## *pop_icansg*の実行例

この例では、完成したプラグイン*pop_icansg*をEEGデータセットに適用する。

### データの読み込み

 ここでは、EEG サンプルデータ、*eeglab_data_epochs_ica.set* を EEGLAB で配布しています。 データをロードするには、EEGLABメニュー(メニュー項目を選択することで**File > 既存のデータセット**をロードするか、コマンドラインコールを*pop_loadset*(例として)使用してください。
 
 `EEG = pop_loadset('filename','eeglab_data_epochs_ica.set','filepath','/eeglab/sample_data/');`


### プラグインの呼び出し *pop_icansg*

*pop_icansg*を使って読み込まれたEEGデータセットのICA分解を計算し、「runica」メソッドを選択します。 これを実行するには、EEGLABメニュー項目**Tools > NSG**でICAを実行し、ポップアップパラメータ選択ウィンドウでICAメソッド'runica'を選択します。 選択後に「OK」を押します。
Else は、同じプロセスを実行しますが、コマンドラインから次のコマンドを使用します。
 
 ```
 OUT_EEG = pop_icansg(EEG,'icatype','runica');
 ```
 
### NSGジョブが完了するまで待っています

*pop_icansg* が実行されると、MATLAB コマンドラインウィンドウで、以下のようなメッセージが蓄積されます。
```
1  >> Scaling components to RMS microvolt
2  >> Saving dataset...
3  >> Job has been submitted!
4  >> Accessing jobs on NSG...Done.
5  >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-1 >> EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
6  >> Accessing jobs on NSG...Done.
7  >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
8  >> Job status on 6-10-2019 15:10:3 : QUEUE
9  >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
10 >> Job status on 6-10-2019 15:11:3 : SUBMITTED
11 >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
12 >> Job status on 6-10-2019 15:12:3 : LOAD_RESULTS
13 >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
14 >> Job status on 6-10-2019 15:13:3 : COMPLETED
15 >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
16 >> ./icansgtmp/
17 >> ./icansgtmp/eeglab_data_epochs_ica.set
18 >> ./icansgtmp/tempdatafile.fdt
19 >> ./icansgtmp/icansg_job.m
20 >> ./icansgtmp/tempdatafile.set
21 >> ./icansgtmp/eeglab_data_epochs_ica.fdt
22 >> ./scheduler_stderr.txt
23 >> ./scheduler_stdout.txt
24 >> ./stderr.txt
25 >> ./stdout.txt
26 >> Done.
27 >> File downloaded and decompressed in the
28 >> output folder specified in the settings
29 >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
30 >> Accessing jobs on NSG...Done.
31 >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-291E9AF9FAB64B918C07259E310A3A78" on NSG...Done.
32 >> Accessing jobs on NSG...Done.
33 >> pop_loadset(): loading file /Users/amon-ra/Downloads/nsgtmp/nsgresults_icansg_tmpjob/icansgtmp/eeglab_data_epochs_ica.set ...
34 >> Reading float file '/Users/amon-ra/Downloads/nsgtmp/nsgresults_icansg_tmpjob/icansgtmp/eeglab_data_epochs_ica.fdt'...
35 >> Scaling components to RMS microvolt
```

最初の2行目は、入力として提供されたデータセットが一時フォルダ*icansgtmp*に保存されたことを示しています。 行 3 と 4 は、ジョブが NSG に提出されたことを確認します。 ライン5〜14は、ジョブステータス(60秒間隔)で定期的な更新を提供します。 行 15 宛先 32 作業の結果をダウンロードするプロセスの詳細. 最終的なライン33-35文書は機能出力をローディングします。
これは、ジョブ全体の出力プリントです。これらすべてのメッセージを生成するために、ジョブは正常に完了しなければなりません。 しばらくお待ちください。

*pop_icansg* を呼び出すことで生成されたジョブについて好奇心旺盛な場合は、NSG ジョブの出力を受信し、サブフォルダ '*icansgtmp*' を一覧表示するフォルダを確認してください。 これにより、NSG ジョブおよび出力ファイル(s) に送信されたデータが格納されます。
 
##  ニュース

ここでは、NSG経由でアクセス可能なサンディエゴスーパーコンピュータセンター(SDSC)の高性能コンピューティング(HPC)リソースの簡単な例で、フレキシブル*pop_nsg*コマンドラインツールを使用して、EEGLABプラグインにシームレスに統合することができます。
この例は、証拠の概念例だけを意図しています。 プラグイン内の他の実装のバリエーションを自由に探索できます。 あなたのプラグインは、ほぼすべてのケースでは、NSGを介してローカルマシン*else*上のコンピューティングのオプションをユーザーに与える必要があります。 ユーザーは、さらにNSG 起動変数を指定できるようにし、NSG ユーザが、長い NSG 計算を起動する前に、データの小さなサブセットでプラグインのパフォーマンスをテストするかどうかを検討する必要があります。 