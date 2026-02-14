---
layout: default
parent: NSGportal
grand_parent: Plugins
render_with_liquid: false

title: Creating-and-managing-a-job-from-pop_nsg-GUI
long_title: Creating-and-managing-a-job-from-pop_nsg-GUI
---
# pop_nsg GUI からジョブの作成と管理
このチュートリアルでは、プラグイン*nsgportal*を使用して、EEGLABからNSGジョブの作成と管理を処理します。 具体的には、チュートリアルでは、これらのタスクを pop_nsg GUI から実行することに焦点を当てます。
チュートリアル全体で、プラグインファイルで配布されたサンプルジョブを使用します。 以前はセクションで使われていました。 [※オープンEEGLABポータル利用*](https://github.com/sccn/nsgportal/wiki/Using-the-Open-EEGLAB-Portal).

チュートリアルを開始するには、**Tools> NSGツール>をクリックして、*pop_nsg* GUIを起動します。 NSGジョブの管理** 下の図のように:

<!-- EEGLAB GUI to launch pop_nsg-->

<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/eeglab_nsgtools_menus.jpg?raw=true" alt="drawing" width="400"/>
</center>


下記のGUIがポップアップ表示されます。 GUIは、*pop_nsg* を入力することでMATLABコマンドウィンドウから呼び出すこともできます。

<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/pop_nsgguineu.jpg?raw=true" alt="drawing" width="600"/>
</center>

## NSGにジョブを送信
pop_nsg GUI からジョブを送信するためには、GUI セクションに移動します**新しい NSG ジョブを省略し、ボタン**Browse...**をクリックします。 ウィンドウは、開くファイルの種類、zipファイル、フォルダを要求するポップアップ表示されます。 このチュートリアルに従うには、**Zipファイル**を選択し、フォルダ*.../nsgportal/demos/demo_jobs/*に移動し、zipファイル*TestingEEGLABNSG.zip*を選択します。 このデモではzipファイルオプションを使用しますが、ジョブファイルを含むフォルダは同様に選択できます。 'job' ファイルは、計算と MATLAB スクリプト (.m) で実行するデータから構成する必要があります。 MATLAB や EEGLAB に所属していない関数がスクリプトに使われている場合は、ファイルにも追加する必要があります。

 ジョブファイルを選択すると、ジョブzip ファイルの *.m* ファイルの一覧が、**Matlab スクリプトの実行リストに表示されます。 ここから、NSGで実行しなければならないファイルを選択します。 このチュートリアルでは、「run_ica_nsg.m」を選択します。 
編集のお知らせ ジョブIDがジョブに割り当てられたJob ID(デフォルトまたはカスタム)***。 このジョブ ID は、NSG に提供されている一意の ID です。 デフォルトのジョブ ID は、ジョブファイル名とランダム番号の組み合わせです。 ユーザーがこのフィールドを変更し、より有意義な名前を設定することをお勧めします。 リコールは一意のIDなので、以前使用していたIDは使用していません! このチュートリアルでは、*nsgtutorial* としてジョブを識別します。

追加オプションは、NSG で割り当てられた実行時間など、編集 **NSG 実行オプション** で定義できます。このチュートリアルでは、オプションを入力すると、実行時間 0.5 Hrs に設定します。
ジョブファイルへのパスの例外では、チュートリアルのこの時点でのGUIは以下のようになります。

 <!-- Defining JOB ID -->
<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/pop_nsg_job2send.jpg?raw=true" alt="drawing" width="600"/>
</center>

このボタンをクリックすると、NSG**でジョブをNSGに送信できます。 しかし、まだこれを行うことはありません! ジョブの投稿を前にテストしたいですか?

## ローカルで仕事をテストする
NSGに提出する前に、コンピュータ上でローカルでジョブをテストすることができます。 このためには、ジョブのダウンスケールバージョンを使用する必要があります(それ以外の場合は、HPCを使用する目的を欺きます)。 例えば、NSGジョブがループを複数回実行すると、ローカルテストではループの1つの反復のみを実行できます。 このテストの目的は、NSGで実行したいスクリプトをチェックすることです。 ダウンスケーリングは、実行するスクリプトの能力に影響を与えるべきではありません。 このチュートリアルでは、NSG で実行されるものと同様のスクリプト('*run_ica_nsg_downscaled.m*')を使用しますが、実際には ICA を計算することなく。 
 このためには、**を実行するために**Matlabスクリプトの下に'*run_ica_nsg_downscaled.m*'を選択し、ボタン**Testジョブをローカル**をクリックします。 スクリプトは問題なく実行するために数秒しかかかりません。 仕事の提出に必要な要件ではなく、仕事の自己評価のためのツールです。
 
 テストが完了すると、**Matlabスクリプトで選択したスクリプトを戻して、以前のセクションで定義されたスクリプトに**を実行し、NSGにジョブを送信できます。 ジョブの送信が成功すると、以前に割り当てられたジョブ ID は、NSG の資格情報の下にあるジョブのリストに表示されます。 同時に、ジョブのステータスが**NSGジョブステータス**に表示されます。
 
 <!-- Job submited -->
<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/pop_nsg_jobsubmitted.jpg?raw=true" alt="drawing" width="600"/>
</center>

## ジョブの状態を定期的に確認する
 ジョブが送信されると(**NSGジョブステータス**参照)、*pop_nsg* にリスト上のジョブのステータスを定期的に確認することができます。 そのためには、チェックボックス**Auto-refreshジョブリスト**を確認してください。 MATLABコマンドウィンドウでジョブステータスのメッセージが発行されます。 必要に応じて、このオプションをチェックアウトできない場合があります。

## 仕事情報の取得: 中間メッセージ、ファイル、エラーログ
NSG MATLABセッションで発行された中間メッセージは、*pop_nsg*から確認できます。 この情報を取得するには、ボタン**Matlabの出力ログ**をクリックします。 MATLABブラウザで情報が表示されます。 同じボタンは、*pop_nsg* で選択したジョブの処理に対応する MATLAB ログを取得するために、処理の終了時に使用できます。
ジョブの処理中にエラーが起こった場合、ジョブリストのジョブのフォントの色が変更されます(MatlabエラーやNSGエラーのオレンジの場合)。ボタン**Matlabエラーログ**が有効になります。

## 結果の取得と読み込み
完了したら、ボタンをクリックすることで結果をダウンロードしてください**仕事の結果をダウンロードしてください。 コマンドウィンドウに以下のようなメッセージが表示されます。 ダウンロードした結果ファイルの一覧は、行2〜12で見ることができます。 提出されたファイルと結果は両方ともダウンロードしたファイルです。 *pop_nsginfo* で定義されたパスに保存されます。

```
1  >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-87B63F47681545A482D010776408F82D/output/33777" on NSG..../TestingEEGLABNSG/
2  >> ./TestingEEGLABNSG/IC_scalp_maps.jpg
3  >> ./TestingEEGLABNSG/eeglab_data_epochs_ica.set
4  >> ./TestingEEGLABNSG/run_ica_nsg.m
5  >> ./TestingEEGLABNSG/eeglab_data_ICA_output.set
6  >> ./TestingEEGLABNSG/run_ica_jader_nsg.m
7  >> ./TestingEEGLABNSG/eeglab_data_ICA_output.fdt
8  >> ./TestingEEGLABNSG/eeglab_data_epochs_ica.fdt
9  >> ./scheduler_stderr.txt
10  >> ./scheduler_stdout.txt
11  >> ./stderr.txt
12  >> ./stdout.txt
13  >> Done.
14  >> File downloaded and decompressed in the
15  >> output folder specified in the settings
16  >> 1  >> Accessing job: "https://nsgr.sdsc.edu:8443/cipresrest/v1/job/ramonmc/NGBW-JOB-EEGLAB_TG-87B63F47681545A482D010776408F82D" on NSG...Done.
17  >> Accessing jobs on NSG...Done
```
*pop_nsg* GUI から、NSG ジョブの結果として生成される、EEG ファイルと広範囲の画像フォーマットを読み込みます。 ボタンでクリックします**Load/plot結果**。 次のファイルエクスプローラは、選択したジョブ結果がダウンロードされたものである現在のパスでポップアップ表示されます。

 <!-- Job submited -->
<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/result_explorer1.jpg?raw=true" alt="drawing" width="700"/>
</center>

このファイルエクスプローラから、(クリックして)フォルダに移動します *TestingEEGLABNSG* 結果ファイルをacces.
その後、ファイル*IC_scalp_maps.jpg*を選択し、ボタン**Load/plot**をクリックします。 下の図がポップアップ表示されます。 この図は、実際にNSG ジョブ結果の一部として生成された (スクリプト *run_ica_nsg.m* を参照)。

<!-- topos -->
<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/results_topos.jpg?raw=true" alt="drawing" width="400"/>
</center>

同様に、*.set* ファイルがこのインターフェイスから選択して読み込むことができます。

## 仕事の削除
結果を取得すると、ジョブリストのジョブを選択し、ボタンをクリックすることでジョブを削除してください**このNSGジョブを削除**。 その後、ジョブIDはインターフェイスから削除されます。