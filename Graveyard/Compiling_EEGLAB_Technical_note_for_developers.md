---
layout: default
---

このページでは、SCCNで計算リソースを設定する方法について説明します。
EEGLABを一晩コンパイルする。 ノートと指示を3つ用意しています。
別のOS: macOS、Ubuntu、およびWindows。 現在の設定では、
2つの仮想マシンをホストするMacコンピュータ(*delorming.ucsd.edu*)を使用して
(VM). VMWare Fusionは、Windows(Windows)を実行するためにホストマシンで使用されます。
10 x64)とLinux(Ubuntu 64ビット18.04) コンパイルされた EEGLAB ファイル
macOS と Windows は、一般的なフォルダーに同期して保存されます。
Googleドライブ。 Ubuntu の VM のコンパイルされたファイルを転送します。
ホストマシンのGoogleドライブファイル、アップロードされ、
同期。 3つのOSでEGLABのコンパイルが行われる
夜。 そのためには、システムデーモン
([ログイン](https://help.ubuntu.com/community/CronHowto)) は実行するために使用されます
Mac(ホスト)とUbuntu(VM)マシンのタスク。 自動化する
Windows VM でのコンパイル、タスクスケジューラでジョブが設定されました。 お問い合わせ
以下のセクションでは、各OSの詳細が提供されます。 前のページへ
まず、ホストMacがインターネットに接続されていることを確認してください。
Googleドライブアプリで使用しているGoogleアカウントにアクセスすることができます。

自動コンパイルノート
===========================

macOSの自動コンパイルセットアップ (ホスト機械:delorming)
--------------------------------------------------------------

-   ホストマシンにMATLABをインストールして起動します。 現在の設定で
    (10/18) MATLAB 2018a をインストールします。 チェックすることが重要です。
    インストールされているバージョンでMathworksがリリースしたアップデートをインストールします。
    E.g. 2018aバージョンのアップデート
    [詳しくはこちら](https://www.mathworks.com/downloads/web_downloads/download_update?release=R2018a&s_tid=ebrg_R2018a_2_1757132)
    コンパイルされたEEGLABの適切な操作が必要です。

<!-- -->

-   セットアップ [エグラボ git](https://github.com/sccn/eeglab.git)
    リポジトリ。 3つのOS全体で一貫して、リポジトリ
    *\~/program_files/eeglab* で作成する必要があります。 次のコード
    ターミナルでフォルダを作成し、セットアップに使用できる
    リポジトリ。

``` powershell
cd ~
mkdir program_files
git clone https://github.com/eeglabdevelopers/eeglab.git
git pull
git submodule update --init --recursive
git pull --recurse-submodules
```

-   EEGLAB を MATLAB パスに追加します。 問題が発生する可能性があります。
    アクセス これを修正する。 *pathdef.m* ファイルを検索し、
    アクセス ファイルを見つけるには、MATLABコマンドウィンドウに入力します。
    *('pathdef.m')*。 出力を使用してファイルを見つける
    *chmod 777 path2def* を使用してパーミッションを変更する端末

``` powershell
chmod 777 path2pathdef.m
```

-   Mac用のGoogleドライブアプリをダウンロードしてインストールします。 デフォルト名
    Googleドライブのフォルダは*Googleドライブ*です。 Unix ベースの
    パス名のシステムスペースは問題が発生する可能性があります(また、)
    *Google Drive* と名前を変更します。
    フォルダの名前を変更した後、リンクを更新する必要があります
    Googleドライブアプリの新しいフォルダへ。 可能です。
    紛失したアプリケーションから通知を受け取る
    ファイルへのリンク。 これは、このステップで何をすべきかの思い出です。

<!-- -->

-   フォルダ *eeglab_comp_daily* をコピーします。
    *.../program_files/eeglab/functions/adminfunc/*、*Google
    ドライブ*フォルダ。 このフォルダには3つのサブフォルダが含まれています。
    *compile_tools*、*macos*、*ubuntu*および*windows*。 フォルダ
    *compile_tools* はコンパイルに必要なスクリプトが含まれています
    [crontab] の設定
    求人情報https://help.ubuntu.com/community/CronHowto)。 フォルダ
    ※macos*、*ubuntu*、*windows*は初期に空になりますが、
    各OSのコンパイルファイルでポップアップします。

<!-- -->

-   毎日のコンパイルを自動化する*crontab*ジョブを設定します。 お問い合わせ
    ここに示すように、ターミナルから*crontab*ジョブを作成します。

``` powershell
crontab –e
```

これはテキストエディタを開きます(例えば、vim)、それからのコンテンツを使用します
file *crontab_task_mack_bckup.txt* フォルダー *compile_tools* へ
ジョブを作成する:

``` powershell
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * command to execute
59 23 * * * /Users/eeglab/Google_Drive/eeglab_comp_daily/compile_tools/cronjob_eeglab_mac.sh
```

この crontab ジョブはファイルの実行を指しています
*cronjob_eeglab_mac.sh* は同じフォルダーにあります。
EEGLABリポジトリの更新を行い、コンパイルを開始します。
*eeglab_compile.m* ファイルに実装しました。

Ubuntu で自動コンパイルセットアップ (仮想マシン: delorming)
------------------------------------------------------------------

VMWare Fusionを使用してホストマシンにUbuntuをインストールして起動します。 おすすめ
インストール:

-   Ubuntu VM に MATLAB をインストールします。 現在の設定では、
    MATLAB 2018aをインストールしました。 MAC の設定で表示される MATLAB の更新
    同様にインストールする必要があります(セクション\#を参照してください)。
-   [EEGLAB] セットアップ
    ツイートhttps://github.com/eeglabdevelopers/eeglab.git) リポジトリ。 ふりがな
    */home/delorming/program_files* でリポジトリを作成する必要があります。 お問い合わせ
    これは、MAC設定で使用しているコードと同じです。

``` powershell
cd ~
mkdir program_files
git clone https://github.com/sccn/eeglab.git
git pull
git submodule update --init --recursive
git pull --recurse-submodules
```

-   EEGLAB を MATLAB パスに追加します。 問題が発生する可能性があります。
    アクセス Macの設定で同じステップで詳細を参照してください。

<!-- -->

-   *open-vmware-tools*をインストールし、サービスを開始します。 これは必要です
    *host*と仮想Ubuntu間でファイルの共有を確実にする
    機械。

``` powershell
sudo apt-get install open-vm-tools
sudo /etc/init.d/vmware-tools start
```

-   *delorming*、ネットワーク上のホスト機械。 これを行うには、
    *Files*を開き、*Otherの場所*をクリックして下さい(ステップ1を参照してください)
    下の図)、[*delorming*] アイコンをダブルクリックします(ステップ2参照)
    下の図で)。

![](/assets/images/Mount_delorming_network1.jpg)

これを行うと、ホストへのローカル接続を示すリンク
機械は確立されました(下の図を見て下さい)。

![](/assets/images/Mount_delorming_network2.jpg)

接続が確立されると、フォルダー *compile_tools* が
*ホストマシンのGoogle_Drive*フォルダは、次のようにアクセスできます。

``` powershell
cd /run/user/1000/gvfs/sftp:host=delorming.local/Users/eeglab/Google_Drive/eeglab_comp_daily/compile_tools
```

-   crontab ジョブを作成する前に、ファイルを確認してください
    *cronjob_eeglab_ubuntu.sh* は実行可能です(ファイル権限の変更)
    必要)。 このためには、次のコードを使うことができます。
    現在のディレクトリ *compile_tools*:

``` powershell

sudo chmod 777 cronjob_eeglab_ubuntu.sh
sudo chmod +x cronjob_eeglab_ubuntu.sh
```

-   それから、*crontab*はコンパイルを実行するように作成する必要があります
    毎日。 このために、ファイル内のコード
    *crontab_task_ubuntu_bckup.txt* を使用する必要があります(下のコードを参照してください)。

``` powershell
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                   7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * * command to execute
1 1 * * * /run/user/1000/gvfs/sftp:host=delorming.local/Users/eeglab/Google_Drive/eeglab_comp_daily/compile_tools/cronjob_eeglab_ubuntu.sh
```

*crontab* を設定した後、コンパイルは
ホストのコンパイルで使用される非常に同じファイルの実行
機械 *delorming*。 このファイルがホストにあることを忘れないでください
マシンは、そのフォルダのローカル共有を介してアクセスされます。 アフター
コンパイルを実行し、ローカル*eeglab*フォルダで実行し、
コンパイルファイルはホストマシンに転送され、保存されます
*\~/Google_Drive/eeglab_comp_daily/ubuntu/*.

### Ubuntu VM で経験するネットワークの問題

Ubuntu VM がネットワークアクセスを失います。
Windows VM が起動して実行されます。 この行動の理由は、
未知、一時的解決策は: 1-Identify
接続されていないインターフェイス (ダウン) (コマンド: ip a) 2-Start
インターフェイスの id を使用して手動でサービス, 'ens33' この場合 ()
使用コマンド: sudo ifup ens33)

この後、ホストマシンは再びネットワーク上にインストールする必要があります
(前の手順を参照してください).

Windowsで自動コンパイルセットアップ(仮想マシン)
--------------------------------------------------------

Windows VM のコンパイルセットアップでは、手順の一部を繰り返します。
ホストとUbuntu VMのコンパイル。 しかし、いくつかの異なるステップは
コンパイルプロセスを自動化し、 git をインストールするために必要な
管理ソフトウェア。

-   MATLABをインストールし、MATLABに示されているアップデートを開始
    バージョン。 ホストとUbuntuの仮想マシンに関しては、現在
    MATLAB 2018a をアップデートで使用しました。
-   Googleドライブをダウンロードしてインストールします。 このVMでは、
    ※Google Drive*フォルダの名前は変更されません。
-   gitおよびgit Managerソフトウェアをダウンロードしてインストールします。 現在のところ
    セットアップ, [Windows用のGit](https://gitforwindows.org/) 使用済みです。
-   git bash で EEGLAB git リポジトリを設定します。 この使用のために、
    MacとUbuntuのコンパイルと同じコード - しかし、から
    Git Bashターミナル。

``` powershell
cd ~
mkdir program_files
git clone https://github.com/eeglabdevelopers/eeglab.git
git pull
git submodule update --init --recursive
git pull --recurse-submodules
```

-   EEGLAB を MATLAB パスに追加します。
-   毎日のコンパイルを自動化するには、Windowsの*タスクスケジューラ*
    使用しています。 以下の手順に従って、新しいタスクを作成します。

* *スタートメニュー*から、*タスクスケジューラ*を開きます。 プログラムが
メニューに直接リストされていないので、**scheduler**を入力できます。
同じメニューのバーを検索して見てみましょう。

* タスクスケジューラを開くと(下の図を参照)、クリックしてください
**'タスクを作成**' 右メニューで (赤いドットボックスでハイライト)。
![](/assets/images/Task_scheduler_main_interface_f1.jpg )

* タスクの名前を入力してください(下の図のステップ1参照)
短い説明(下の図のステップ2を参照してください)。 オプションをチェックする
ユーザーがログインしているか否かをタスクを実行できるようにする(ステップ3参照)
下の図) タスクに最も高い特権を与える(参照)
ステップ4 下の図で)。
![](/assets/images/Task_scheduler_create_task_f2.jpg )

* タスクの*Triggers*を設定します。 そのためには、*Triggers* をクリックします。
上部メニュー(下図1参照) 次に実行するオプションを設定します
タスクは毎日(下の図の2参照)、タスクのタイミングを指定する
実行する必要があります(下の図の3を参照してください)。 *OK*をクリックします。 実行する時間
タスクは、ホストのコンパイルをオーバーラップしないように設定する必要があります。
Ubuntuのマシン。

![](/assets/images/Task_sheduler_create_task_trigger_f3.jpg )

トリガーを設定した後、グラフィックインターフェイスはタスクを表示します
次のようにします。

![](/assets/images/Task_scheduler_create_task_trigger_f3b.jpg )

* メニュー *Action* をセットアップして実行するスクリプトを指定します。
毎日。 *.bat*ファイル(*batchjob_eeglab_win.bat*)を作成しました。
基本的には crontab ジョブと同じ関数を実行します
Mac(ホスト)と仮想Linuxマシンで実装:更新
git リポジトリはコンパイルファイルを実行します。 これを設定する
オプション、上部メニューの「アクション」をクリックします。 (図の1を参照してください。
お問い合わせ 次に、*New* ボタンをクリックすることで新しいアクションを追加します(2 参照)
下の図)。 新しいウィンドウ(*New action*)がポップアップして、
実行するファイルを指定します。 ファイルの探しと選択
*batchjob_eeglab_win.bat* は *.\Google にあります。
Drive\eeglab_comp_daily\compile_tools* をクリックして *Browse. * 必須
ボタン(下図3参照) *OK*をクリックします。
![](/assets/images/Task_scheduler_create_task_actions_f4.jpg )

* 最後に、上部メニューに戻るタスクを作成する *General* と
*OK*をクリックします。 これでタスクが作成され、コンパイルが準備完了です
日常を走る

マニュアルコンパイルノート - すべてのプラットフォームに共通
==================================================

1円 デフォルトプラグインで EEGLAB をクローンする

``` Matlab
git clone --recurse-submodules https://github.com/sccn/eeglab.git
```

2\。 追加のプラグインをインストールします。 (既にインストールされているプラグイン)
スキップします。 プラグイン clean_rawdata のフォルダー
(**manopt/reference/m2html**)とFieldTrip(**compat**)
**外部/afni**, **外部/spm8**, **外部/spm12**,
**外部/gifti**、**外部/eeglab**、**外部/bemcp**)
コンパイルの問題を避けるために削除されます。 GITリポジトリを使用していない
これらのフォルダを削除し、より多くの問題が発生します。 利用する
次のようなスクリプトを実行します。

``` Matlab
eeglab  % restart the fleshly installed eeglab

% Installing plugins
plugin_askinstall('ANTeepimport', 'eegplugin_eepimport', true);
plugin_askinstall('bva-io', 'eegplugin_bva_io', true);
plugin_askinstall('clean_rawdata', 'eegplugin_clean_rawdata', true);
plugin_askinstall('dipfit', 'eegplugin_dipfit', true);
plugin_askinstall('egilegacy', 'eegplugin_egilegacy', true);
plugin_askinstall(' Fieldtrip-lite', 'ft_defaults', true);
plugin_askinstall('Fileio', 'ft_read_data', true);
plugin_askinstall('firfilt', 'eegplugin_firfilt', true);
plugin_askinstall('IClabel', 'eegplugin_iclabel', true);
plugin_askinstall('Picard', 'picard_standard', true);
plugin_askinstall('musemonitor', 'eegplugin_musemonitor', true);
plugin_askinstall('neuroscanio', 'eegplugin_neuroscanio', true);
plugin_askinstall('xdfimport', 'eegplugin_xdfimport', true);
plugin_askinstall('iirfilt', 'iirfilt', true);
plugin_askinstall('vised', 'vised', true);

% Removing clean_rawdata files
% For clean_rawdata, remove folder manopt/reference/m2html.
CleanRawData_folder = fileparts(which('clean_rawdata.m'));
rmdir(fullfile(CleanRawData_folder,'manopt','reference','m2html'), 's');

% Removing FieldTrip files
% For FieldTrip remove folders compat, external/afni, external/spm8, external/spm12, external/gifti, external/eeglab, external/bemcp and external/npmk
FieldTrip_folder = fileparts(which('ft_defaults.m'));
rmdir(fullfile(FieldTrip_folder,'compat'), 's');
rmdir(fullfile(FieldTrip_folder,'external','afni'), 's');
rmdir(fullfile(FieldTrip_folder,'external','spm8'), 's');
rmdir(fullfile(FieldTrip_folder,'external','spm12'), 's');
rmdir(fullfile(FieldTrip_folder,'external','gifti'), 's');
rmdir(fullfile(FieldTrip_folder,'external','eeglab'), 's');
rmdir(fullfile(FieldTrip_folder,'external','bemcp'), 's');
rmdir(fullfile(FieldTrip_folder,'external','npmk'), 's');
rmdir(fullfile(FieldTrip_folder,'external','signal'), 's');
```

3\。 アプリケーションコンパイラ(Matlabタブ「Apps」とボタンを開きます。
「アプリケーションコンパイラ」
4. "eeglab.prj" ファイルを開きます。
5. プラグインのパスを確認してください。 新しいバージョンが利用可能であれば、名前を変更してください。
eeglab.prj ファイルのバージョン。 プロジェクトを決して残さない
応用コンパイラ。
9. 「パッケージ」を押して待ちます(通常30分以上)
10. 成功すると、3つのフォルダが作成されます。 コンパイルされたテストをすることができます
"for_testing" フォルダ内のプログラムを実行して EEGLAB バージョン。
11. コンパイルされたバージョンをテストして、潜在的なランタイムエラーを確認します(メモを参照してください)
テスト
[詳しくはこちら](https://sccn.github.io/others/Compiled_EEGLAB.html#how-to-check-the-integrity-of-the-compiled-version)).
MacとOSXでは./run_eeglab.sh MATLAB_PATHを使用します。

<font color=red>既知のエラー: DIPFIT から eLoreta を実行して、見つけることができません
precompute_dpss ディレクティブ</font>お問い合わせ お問い合わせ

将来のインクルージョンを選択するが、テストが必要です。 プラグインがある場合
プラグインとテストを組み合わせて試してみてください。
コンパイルされた EEGLAB バージョンのプラグイン。 機能的であれば、電子メール
eeglab_at_sccn.ucsd.edu とプラグインはプラグインに含まれています
次のリリース。

12円 新しいプラグインの追加

-   ダウンロードまたはクローンプラグイン
-   eeglab に追加します。 m 点
-   コンパイラ
-   このページの更新

| プラグイン名 | コメント |
|-------------------|-------------------------------------------------------------------------------------------------------|
| バイオシグ | フィールドトリップ |
| MFFMatlabIO | 実行時間にJARファイルを見つけることでの問題; 含める前に、よりデバッグが必要 |
| bids-matlab-tools | 未テスト |
