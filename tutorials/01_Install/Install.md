---
layout: default
title: 1. Installing EEGLAB
long_title: 1. Installing EEGLAB
categories: tutorial
parent: Tutorials
nav_order: 1
---

EEGLABのインストールと開始
==============================

ダウンロード [エッグラボ](https://sccn.ucsd.edu/eeglab/download.php),  
EEGLAB分布の_sample_data_ subfolderにチュートリアルデータセットが含まれています。  
EEGLABを解凍すると、「eeglabxxxx」というフォルダが取得されます。  
(注:現在のバージョン番号 'xxxx' は異なります)。

Windows では、MATLAB は通常推奨しますが、ツールボックスを置く必要はありません。  
*Application/MATLABRxxxx/toolbox/* フォルダ (注: この名前は、  
MATLABバージョン 'xxxx' と異なる。 Linux では、MATLAB ツールボックス  
フォルダは通常、 */usr/local/pkgs/MATLAB-rxxxx/toolbox/* にあります。 **macOS** では、*/Applications/MATLAB_Rxxxx/* にあります。 また、あなたのパスに他の場所でフォルダを配置することもできます。

MATLAB と EEGLAB を始めます。

MATLABを起動する
------------

- **Windows**: スタートに移動し、MATLABを見つけて実行します。  
- **macOS**: Dock または Application フォルダ内の MATLAB アイコンから起動します。  
- **Linux**:ターミナルウィンドウを開き、*matlab*と入力し、[Enter]を押します。

EEGLABディレクトリへの切り替え
------------------------------

画面右上の「*」のボタンをクリックすることで、ディレクトリを閲覧できます。

![](/assets/images/MATLAB_main_screen.png)

下のウィンドウを開きます。 ディレクトリをダブルクリックして入力します。  
フォルダリストの ".." をダブルクリックすると、1 つのレベルが上がります。 フォルダやディレクトリを見つけたら、*OK*を押します。  
あるいは、コマンドラインから、*cd*(変更ディレクトリ)を使用して、目的のディレクトリに移動します。

EEGLABを始める
------------

MATLAB コマンドラインで *eeglab* を入力して Enter を押します。 EEGLABは  
MATLABパスに自動的に追加します。

![](/assets/images/MATLAB_Command_Line.png)

下の青いメインEEGLABウィンドウがポップアップし、7つのメニューで  
見出し: <span style="color:brown">ファイル、編集、ツール、プロット、スタディ、データセット、ヘルプ</span> 典型的な(左から右)の注文で配置。

![](/assets/images/Eeglab20191.png)

EEGLABをMATLABパスに追加
--------------------------------

EEGLABフォルダをMATLAB検索パスに追加したいので、  
MATLABを起動すると、EEGLABを直接開くことができます。

グラフィカルなインターフェースでMATLABを始めると、  
<span style="color: brown">ファイル</span> メニュー項目および選択 <span style="color: brown">セットパス</span>お問い合わせ 以下の画面を開きます。

![MATLABセットパス gui](/assets/images/MATLAB_set_path_gui_2.png)

または、コマンドラインからMATLABを実行している場合は、コマンドラインで*pathtool*を入力  
Enterを押すと、このウィンドウも呼び出します。

*Add Folder*のボタンをクリックし、フォルダを選択します。  
"eeglabxxxx" を押して、*OK* (EEGLAB は、その追加を処理します)  
サブフォルダ自体)。

*pathtool*ウィンドウで*Save*を押します。 EEGLABのコールアップを行います  
機能 *eeglab*は将来のMATLABセッションで利用できます。 お問い合わせ  
EEGLABの最新バージョンをインストールしています。  
MATLABパスから古いバージョンを削除(選択してからヒット)  
*Remove*)は、古いルーチンを呼び出しる可能性を回避します。 お問い合わせ  
*eeglab* パスを手動でサブフォルダに追加するために好ましい ****  
EEGLAB はパスを管理します(EEGLAB を起動すると、自動的にパスを追加します。  
必要なパス。
