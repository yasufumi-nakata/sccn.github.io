---
layout: default
title: Download EEGLAB compiled
long_title: Download the compiled of EEGLAB 
parent: Download EEGLAB
---

EEGLABのコンパイルバージョン
=========================
お問い合わせ

EEGLABは、Mac、Windows、Ubuntu、Ubuntuなどのコンパイルされたバイナリとして存在します。
[EEGLABダウンロード]でダウンロードできます。
ページ:()https://sccn.ucsd.edu/eeglab/download.php)。 EEGLABのコンパイル版をインストールする方法は次のとおりです。

<center> <iframe width="560" height="315" src="https://www.youtube.com/embed/_F-5spN1FL4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center> 

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

MACバージョンをインストールする手順は次のとおりです。 Windows版は同じ手順に従います(ただし、これはMAC版に焦点を合わせる理由です)。 アーカイブを解凍し、インストーラを実行します。 

-   EEGLABコンパイル版のZIPファイルをダウンロード
    [ダウンロードページ](http://sccn.ucsd.edu/eeglab/download.php) そして、
    それを解凍して下さい
-   zipファイルを解凍し、インストールファイルを実行します。
-   何らかの理由でインストールプロセスが失敗した場合は、管理者として実行する必要があります。

次の画面がポップアップ表示されます。

<br/><br/> 

<img width="844" alt="Screen Shot 2023-09-01 at 11 40 52 AM" src="https://github.com/sccn/sccn.github.io/assets/1872705/de3a5a88-8c88-4c72-84ca-5d54bab23cb2">

<br/><br/> 

次回のプレス 次の3つの画面で、次の3つの画面で次のいずれかを押します。 デフォルトパスを変更しないでください。

<br/><br/> 

<img width="839" alt="Screen Shot 2023-09-01 at 11 40 59 AM" src="https://github.com/sccn/sccn.github.io/assets/1872705/4b291279-5d08-462a-b89f-6b6283b7e6cb">

<br/><br/> 

<img width="841" alt="Screen Shot 2023-09-01 at 11 41 17 AM" src="https://github.com/sccn/sccn.github.io/assets/1872705/1a2b6822-59d6-4e2c-b376-5bdd0d020a0d">

<br/><br/> 

<img width="841" alt="Screen Shot 2023-09-01 at 11 10 54 AM" src="https://github.com/sccn/sccn.github.io/assets/1872705/9c197d8b-d664-4787-a770-634cd36a5b44">

<br/><br/> 

**MACのみ**. インストールが完了すると、次のメッセージが表示されます。 **メッセージを受信できる* * 必須

<br/><br/> 

<img width="837" alt="Screen Shot 2023-09-01 at 11 54 52 AM" src="https://github.com/sccn/sccn.github.io/assets/1872705/eaee9f29-9875-4b2e-91f6-5e904484278f">

<br/><br/> 

代わりに、インストールした EEGLAB バージョンに移動し、 MAC の [**EEGLAB_verbose**] または [*EEGLAB.exe**] を Windows で選択します。 MACで**EEGLAB.app**をクリックしないでください。コマンドプロンプトがないので、上記のパスを設定しない限り、EEGLABは起動しません(無視すべき部分)。 パスの設定は可能ですが、簡単です。 また、MACでは、コマンド "./run_EEGLAB.sh /Applications/MATLAB/MATLAB_Runtime/R2024a/" (MATLABのランタイムバージョンは、EEGLABをコンパイルするために使用されるものと一致し、EEGLABで自動的にインストールする必要があります。 見つけられない場合 [詳しくはこちら](https://www.mathworks.com/products/compiler/matlab-runtime.html)).

<br/><br/> 

![スクリーンショット 2024-08-29 に 13 20 25](https://github.com/user-attachments/assets/6757f18f-eb1d-4c4c-8b04-6924bba63275)

<br/><br/> 

EEGLABの開始まで約1分かかります。

<br/><br/> 

<img width="844" alt="Screen Shot 2023-09-01 at 11 42 30 AM" src="https://github.com/sccn/sccn.github.io/assets/1872705/8a08b846-a0cb-45b2-9be8-f8732f5a6ecf">

## トラブルシューティング

MACとWindowsの両方で、EEGLABを管理者として実行して、いくつかのフォルダにアクセスする必要があります。

MAC OSXでは、お使いのオペレーティングシステムが古いというメッセージが表示されているため、コンパイル済みのEEGLABバージョンの古いバージョンを試してみる必要があります。

問題に遭遇し、解決方法を教えてください。 お問い合わせ 

## コンパイルされたバージョンでコードとスクリプトを実行する

スクリプトはコンパイルされたバージョンの EEGLAB GUI から実行できます。 MATLAB と EEGLAB のすべての機能を使用できるが、関数とサブスクリプトは使用できません。 別のスクリプトを呼び出すスクリプトがある場合は、両方のスクリプトを単一のスクリプトに結合する必要があります。 ユーザ定義関数を呼び出す場合は、この関数をスクリプトに変換し、スクリプト内のコードを含める必要があります。 以下のメニューはスクリプトを実行するために使用できます。

![スクリーンショット 2024-07-10 に 16 00 43](https://github.com/sccn/sccn.github.io/assets/1872705/5cfc2ad8-f0fa-4e5b-b866-099370f2f83e)

スクリプトとコードスニペットもコマンドラインから実行できます。 以下は、Windows のコマンドラインから例です。 同じことは、**EEGLAB_verbose** 実行可能を使用して MAC で行われる場合があります。 Windows では DOS コマンドラインで EEGLAB を含むフォルダーに移動します。 exe ファイルとタイプ:

```
.\EEGLAB.exe "disp('hello world');"
```

以下は出力です。

![スクリーンショット 2024-07-10 に 15 53 41](https://github.com/sccn/sccn.github.io/assets/1872705/d6192ace-79d0-4741-9c5a-7b9415976c9f)

MATLAB と EEGLAB コードを含むスクリプトを書くこともできます。 たとえば、ファイル**script.m**で同じテキスト "disp('hello world');" を保存し、タイプします。

```
.\EEGLAB.exe ".\script.m"
```

以下は出力です。

![スクリーンショット 2024-07-10 に 15 59 15](https://github.com/sccn/sccn.github.io/assets/1872705/8cec47dc-e82f-4012-a646-b968760c7358)

もちろん、上記の「hello world」の例を実行すると、特に興味深いものではありません。 代わりに、チュートリアルセクションで提供される EEGLAB スクリプトを実行したい場合があります。

EEGLABのコンパイルとMATLABバージョンの類似性
------------------------------------------------------

-   両方のバージョンのグラフィカルインターフェイスは同じです
-   EEGLAB のグラフィックインターフェイスには何もありません。
    EEGLABのコンパイル版では不可能なMATLAB。 お問い合わせ
    すべてのプラグインと、添付されているすべての外部モジュールを使用
    EEGLAB に、スクリプトを保存し、MATLAB スクリプトを実行します。

### コンパイルされたバージョンを使用することができないもの

-   新しいプラグインを追加したり、サードパーティをインストールしたりすることはできません 
    プラグイン。 そのためには、EEGLABは、
    追加プラグイン。
-   スクリプトを使用する場合は、外部カスタムMATLABを使用できません。
    関数または新しい関数を定義する
-   スクリプトを使用する場合は、可能な MATLAB コマンドの範囲は
    MATLABコアコマンド、すべてのEEGLABコマンド、および数に限ります。
    シグナル処理、統計、および
    最適化ツールボックス(コンパイル時に含まれているコマンド)
    コード)。
-   EEGLABソースコードの変更はできません。

よくある質問
--------------------------

-   EEGLAB でコンパイルした MATLAB スクリプトの一部を実行できます。
    バージョン? はい、標準 MATLAB 関数や EEGLAB を使用する限り
    関数。

-   コンパイルされたコードはコンパイルされていないコードよりも速くなりますか? いいえ、MATLABのランタイムエンジンが解釈するのと同じ速度です。
-   MATLABを所有していないので、法的ですか? はい、それは完全に法的です。
    MATLABの海賊版版を運営することは違法ですが、
    MATLABのランタイムエンジンを配布し、コンパイルする完全法的
    MATLABコード。
-   このプログラムを私のような商用アプリケーションに使用することができる
    プライベート臨床練習? EEGLABは、臨床ソフトウェアパッケージではなく、研究ソフトウェアパッケージです。 プログラムは保証無しでできるだけ早く提供されます
    どんな種類の。 EEGLABコアコードは BSD でリリースされますが、
    商用利用が可能な2.0ライセンス、プラグインの一部
    コンパイルされたバージョンに含まれていない(プラグインを含む)
    ソースの再構築など。
-   トラブルシューティング! バグ報告を投稿することを躊躇しないでください
    [エッグラボ GitHubの問題トラッカー](https://github.com/sccn/eeglab/issues)
    EEGLABのコンパイルされたバージョンを実行している問題が発生した場合。

コンパイルされたバージョンの完全性を確認する方法
--------------------------------------------------

MATLABとコンパイルされたEEGLABバージョンのほとんどの違い
外部データファイルが処理されるため発生する。 わたしたちの想い
コンパイルされたバージョンの完全性をチェックする(可能ではない)
このプロセスを自動化します。 スクリプトを実行できます
*test_compiled_version.m* フォルダ関数/support_files (you)
データファイルへのパスを変更する場合があります。 テストのために、私達は使用します [スタンスチュディ](https://sccn.ucsd.edu/eeglab/download/STUDYstern_125hz.zip) (0.9 Gb)。 パソコン上のデータをダウンロードしてください。

1.  EEGLABを始める
2.  オプションを編集し、それらを変更します。オプションに戻り、オプションを確かめる
    変更しました
3.  連続したチュートリアルデータセット「eeglab_data.set」をロードします。 電極を調べ、クリーンな生データを実行、実行
    ICA、IClabelを実行
4.  Dipfitを使用してICAコンポーネントのソースローカリゼーションを実行
5.  Plot 3-D 共同登録後のERP
6.  Stern の調査、プレコンプト ERPs をロードし、それらをプロットします。 統計を使ってみてください。
7.  ヘルプメニューが機能していることを確認してください

上記のチェックをすべてチェックすると、コンパイルされた EEGLAB バージョンが
確認されたとみなされます。 Windowsでバージョンを別々にチェックします。
Unix/MacOS. リリース


EEGLABを自分でコンパイルできますか?
----------------------------

EEGLAB コンパイルは通常、 "eeglab.prj" ファイルの開き (in) で構成されます。
MATLAB Compiler Graphical App を使用したルート EEGLAB フォルダー)
*package*ボタンを押します。 しかし、いくつかの問題があるかもしれません
それはあなたのシステムで固定を要求します。 詳細は下記をご覧ください。

### 手動コンパイルノート

1. デフォルトプラグインで EEGLAB をクローンする

``` Matlab 
git clone --recurse-submodules https://github.com/sccn/eeglab.git
```

2. 追加のプラグインをインストールします(すでにインストールされたプラグインは、
スキップします。 プラグインのclean_rawdataからいくつかのフォルダ
フィールドヒント
コンパイルの問題を避けるために削除されます。 **GITバージョンのFieldTripは使用しないでください。** は200Mbの代わりに1.5Gbをリリースするからです。 代わりに最新のプラグインを取得します。 利用する
プラグインをインストールし、これらのフォルダを削除します。

```matlab
eeglab  % restart the fleshly installed eeglab

% Installing plugins
plugin_askinstall('ANTeepimport', 'eegplugin_eepimport', true);
plugin_askinstall(' Fieldtrip-lite', 'ft_defaults', true);
plugin_askinstall('Fileio', 'ft_read_data', true);
plugin_askinstall('IClabel', 'eegplugin_iclabel', true);
plugin_askinstall('PICARD', 'picard', true);
plugin_askinstall('vised', 'vised', true);
plugin_askinstall('bids-matlab-tools', 'bids_export', true);
plugin_askinstall('bids-validator', 'pop_validatebids', true);
plugin_askinstall('bva-io', 'eegplugin_bva_io', true);
plugin_askinstall('clean_rawdata', 'eegplugin_clean_rawdata', true);
plugin_askinstall('dipfit', 'eegplugin_dipfit', true);
plugin_askinstall('egilegacy', 'eegplugin_egilegacy', true);
plugin_askinstall('firfilt', 'eegplugin_firfilt', true);
plugin_askinstall('iirfilt', 'eegplugin_iirfilt', true);
plugin_askinstall('musedirect', 'eegplugin_musedirect', true);
plugin_askinstall('musemonitor', 'eegplugin_musemonitor', true);
plugin_askinstall('neuroscanio', 'eegplugin_neuroscanio', true);
plugin_askinstall('xdfimport', 'eegplugin_xdfimport', true);
plugin_askinstall('mffmatlabio', 'pop_mffimport', true);
plugin_askinstall('scd', 'eegplugin_scd', true);
plugin_askinstall('snapmaster', 'eegplugin_snapmaster', true);
plugin_askinstall('biosig', 'sread', true);

% Removing clean_rawdata files
% For clean_rawdata, remove folder manopt/reference/m2html.
CleanRawData_folder = fileparts(which('clean_rawdata.m'));
rmdir(fullfile(CleanRawData_folder,'manopt','reference','m2html'), 's');
rmdir(fullfile(CleanRawData_folder,'manopt','tests'), 's');

% Removing ICLabel files
iclabel_folder = fileparts(which('iclabel.m'));
% rmdir(fullfile(iclabel_folder,'matconvnet','examples'), 's'); % not there any more?

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
rmdir(fullfile(FieldTrip_folder,'external','mffmatlabio'), 's');
rmdir(fullfile(FieldTrip_folder,'external','egi_mff_v2'), 's');
```

3. オプション: eeglab.m ファイルを編集し、EEGLAB (line 900) のコンパイルされたバージョンに新しいプラグインを追加します。

3. Matlabエディタで「eeglab.prj」ファイルを開きます。 プラグインのパスを確認します。 新しいバージョンが利用可能な場合は、eeglab.prj ファイルのバージョンの名前を変更します。

3. EEGLAB バージョンを eeg_getversion.m に変更します。 eeglab.prj ファイルの**と**

3. アプリケーションコンパイラ(Matlabタブ「Apps」とボタンを開きます。
「アプリケーションコンパイラ」を開き、「eeglab.prj」ファイルを開きます。 十字板のコイルのためのパスを増加させるためのITとして、アプリケーション・コンパイラでプロジェクトを残さない。

4. クラスのエラーがある場合(そしてそこにある)、以下のコマンドを使用してください。 依存関係をチェックする際にはクラスエラーが発生しますが、EEGLABはとにかくコンパイルします。 コマンドラインで、タイプ

```matlab
setenv('MCC_USE_DEPFUN','1')
```

7. ファイルが EEGLAB_verbose に MATLAB の正しいバージョンがリストされていることを確認し、バージョン番号を変更します。

4. **Windows**. Macファイルを削除し、コマンドラインオプションを確認し、「パッケージ」を押して待機します(通常10分以上)

4. **MAC**. Windowsファイル(EEGBIDS.bat)を削除し、「パッケージ」を押して待つ(通常30分)

4. 成功すると、3つのフォルダが作成されます。 コンパイルされたテストをすることができます
"for_testing" フォルダ内のプログラムを実行して EEGLAB バージョン。

4. コンパイルされたバージョンをテストして、潜在的なランタイムエラーを確認します(メモを参照してください)
テスト
[詳しくはこちら](https://sccn.github.io/others/Compiled_EEGLAB.html#how-to-check-the-integrity-of-the-compiled-version)).
MacとOSXでは./run_eeglab.sh MATLAB_PATHを使用します。

> <span style="color: red">既知の問題: コンパイルされたバージョンのドキュメントをチェックする</span>

> <span style="color: red">既知のエラー: ANT プラグイン (ASR のテストファイルが存在する) に含まれていない mex ファイル</span>

4. 「再配布フォルダ」を配布

### 将来の包含のために選択したプラグイン

将来のインクルージョンを選択するが、テストが必要です。 プラグインがある場合
プラグインとテストを組み合わせて試してみてください。
コンパイルされた EEGLAB バージョンのプラグイン。 機能的であれば、電子メール
eeglab_at_sccn.ucsd.edu で、プラグインはプラグインに含まれています。
次のリリース。

新しいプラグインの追加

-   ダウンロードまたはクローンプラグイン
-   eeglab に追加します。 m 点
-   コンパイラ
-   このページを更新(リクエストのプルを作成する)

| プラグイン名 | コメント |
|-------------------|-------------------------------------------------------------------------------------------------------|
| バイオシグ | コンパイラのパス問題 フィールドトリップに含まれているバージョンを使用する |
| MFFMatlabIO | 実行時間にJARファイルを見つけることでの問題; 含める前に、よりデバッグが必要 |
| bids-matlab-tools | 未テスト |
