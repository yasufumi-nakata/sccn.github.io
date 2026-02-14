---
layout: default
title: 1. Installing EEGLAB
long_title: 1. Installing EEGLAB
categories: tutorial
parent: Tutorials
nav_order: 1
---

EEGLAB のインストールと起動
==============================

まず、[EEGLAB](https://sccn.ucsd.edu/eeglab/download.php) をダウンロードします。  
EEGLAB 配布物の `_sample_data_` サブフォルダには、チュートリアル用データセットが含まれています。  
EEGLAB を展開すると、`eeglabxxxx` という名前のフォルダが作成されます。  
（注: `xxxx` はバージョン番号により異なります。）

Windows では、MATLAB は通常、ツールボックスを *Application/MATLABRxxxx/toolbox/* に置くことを推奨します（必須ではありません）。  
（注: このパス中の `xxxx` は MATLAB のバージョンにより異なります。）  
Linux の場合、MATLAB のツールボックスフォルダは一般に */usr/local/pkgs/MATLAB-rxxxx/toolbox/* にあります。  
**macOS** の場合は */Applications/MATLAB_Rxxxx/* です。  
このほか、MATLAB パス上の任意の場所にフォルダを配置しても構いません。

それでは MATLAB と EEGLAB を起動します。

MATLAB を起動する
------------

- **Windows**: スタートメニューから MATLAB を見つけて起動します。  
- **macOS**: Dock または Applications フォルダの MATLAB アイコンから起動します。  
- **Linux**: ターミナルを開き、`matlab` と入力して Enter を押します。

EEGLAB のディレクトリへ移動する
------------------------------

画面右上にある *「…」* ボタンをクリックすると、ディレクトリを参照できます。

![](/assets/images/MATLAB_main_screen.png)

以下のウィンドウが開きます。フォルダをダブルクリックすると、そのフォルダに入れます。  
フォルダ一覧の `..` をダブルクリックすると、1 つ上の階層に移動できます。  
目的のフォルダに移動したら *OK* を押してください。  
また、コマンドラインで *cd*（change directory）を使って移動しても構いません。

EEGLAB を起動する
------------

MATLAB のコマンドラインで *eeglab* と入力し、Enter を押します。  
EEGLAB は自身を MATLAB パスに自動で追加します。

![](/assets/images/MATLAB_Command_Line.png)

下図の青い EEGLAB メインウィンドウが表示され、7 つのメニュー  
<span style="color:brown">File, Edit, Tools, Plot, Study, Datasets, Help</span>  
が一般的な使用順（左から右）に並びます。

![](/assets/images/Eeglab20191.png)

EEGLAB を MATLAB パスへ追加する
--------------------------------

EEGLAB フォルダを MATLAB の検索パスに追加しておくと、  
次回 MATLAB 起動時に EEGLAB を直接開けるようになります。

GUI から MATLAB を起動している場合は、  
<span style="color: brown">File</span> メニューから <span style="color: brown">Set Path</span> を選択します。  
以下のウィンドウが開きます。

![MATLAB set path gui](/assets/images/MATLAB_set_path_gui_2.png)

コマンドラインから MATLAB を使っている場合は、  
コマンドラインで *pathtool* と入力して Enter を押してください。  
同じウィンドウが開きます。

*Add Folder* ボタンを押して `eeglabxxxx` フォルダを選択し、  
*OK* を押します（サブフォルダの追加は EEGLAB が自動で行います）。

*pathtool* ウィンドウで *Save* を押すと、以後の MATLAB セッションで  
*eeglab* 関数を呼び出せるようになります。  
新しい EEGLAB バージョンを入れる場合は、古いバージョンのパスを MATLAB から削除し  
（対象を選択して *Remove*）、古いルーチンが呼ばれるのを防ぐことを推奨します。  
*eeglab* のパスやサブフォルダを手動で追加するのではなく、  
EEGLAB にパス管理を任せることを推奨します（起動時に必要なパスを自動追加します）。
