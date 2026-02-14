---
layout: default
title: a. ERPs
long_title: a. Event Related Potentials
parent: 8. Plot data
grand_parent: Tutorials
---
プロットイベント関連ポテンシャル
==================
お問い合わせ

EEGLABにはいくつかの機能が含まれています
プロット 1-D ERP データセットの試験の平均値(例、epochs)。 EEGLABも
EEG ダイナミクスを単一で表現する学習機能
トライアル 大きい部分は2次元(時間)によって視覚化されるかもしれません
実験によるシリーズ)ERPイメージは、チュートリアルの次のセクションで詳細として、単一trial epochs(a.k.a.、epochedデータ)のデータセットのデータを変換します。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

単一軸にERPデータをスカルプマップでプロットする
-------------------------------------------------------- 

チュートリアルデータセットをそのまま使用しました。 [データエポック抽出](/tutorials/07_Extract_epochs/Extracting_Data_Epochs.html)お問い合わせ メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>お問い合わせ EEGLABの「sample_data」フォルダにある「eeglab_data_epochs_ica.set」のチュートリアルファイルを選択します。 それから *Open*を押して下さい。

![画像:Pop_loadset.png](/assets/images/Pop_loadset2.png)

### すべてのチャネルをプロット 採用情報

すべてのデータセットのEPOCの平均ERPをプロットするには、ERPスカルプマップを
選択したレイテンシー、選択 <span style="color: brown">Plot → チャネルERP → スカルプマップ付き</span>お問い合わせ サンプルを使ったシンプルなイラストとして
dataset は、結果のデフォルト設定を保持します。 [pop_timtopo.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_timtopo.m) 下のウィンドウ、および
プレス *Ok*.


![画像:Pop_timtopo.png](/assets/images/Pop_timtopo.png)


図(下)が表示されます。 各トレースはプロットします
1つのチャネルで平均ERP。 scalpの地図は地理的を示しています
430 msで平均的な潜在能力の分布(最大遅延)
ERPデータ分散 あるいは1つ以上の正確なスカルプマップ
上記のポップアップウィンドウでレイテンシーを指定できます。


![画像:Erpplot1.png](/assets/images/Erpplot1.png)


ふりがな [pop_timtopo.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_timtopo.m) 関数は相対的な時間のコースをプロットします
すべてのチャネルで平均ERP、スキャルプポテンシャルの「スナップショット」
平均ERP時間コース中に様々な瞬間に分布します。 上記のトレースの1つをクリックすると、対応するレイテンシでスカルプトポグラフィをプロットします。 
*all* レイテンシーでERPのスカルプマップを可視化することに注意してください。
ERP映画(例えば、スカルプのERPの再生を表示する)、使用
関数 [eegmovie。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegmovie.m) コマンドラインから記述されている [チュートリアルのスクリプトセクション](/tutorials/11_Scripting/EEG_scalp_measures.html#using-the-eegmovie-function-to-make-2-d-scalp-topography-animations).


### 地図でERPをプロットする

ここでは、epochedデータセットのERPを単一チャネルとしてプロットします
2Dトポグラフィの配置でトレースします。 
選択する <span style="color: brown">Plot → チャネルERP → scalp配列/rect で。配列</span>お問い合わせ デフォルト設定を使用して、下のウィンドウで*Ok*を押します。


![画像:Pop_plottopo.png](/assets/images/Pop_plottopo.png)


以下を生成します。 [pop_timtopo.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_timtopo.m) プロフィール


![画像:Erpplot2.png](/assets/images/Erpplot2.png)


特定のチャンネルタイムコースを視覚化できます。
トレース(平均)をクリックし、ポップアップサブ軸ビューを作成します。 お問い合わせ
例: *POz* (above) マークされている ERP トレースをクリックして、
このトレースのフルサイズのビュー(以下)。


![画像:Zoom1.png](/assets/images/Zoom1.png)


ルーチンをプロットする多くのEEGLABはツールボックス機能を使用します [axcopy. m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=axcopy.m) サブ軸プロットウィンドウをいつでもポップアップする
メインプロットウィンドウをクリックします。 サブ軸窓は
ありません [axcopy. m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=axcopy.m) 有効で、ユーザーが使用できるようにします
標準MATLABマウス「ズームイン/アウト」機能。


### 列配列でERPをプロットする


2列配列で平均ERPデータトレースをプロットする
メニュー項目を選択 <span style="color: brown"> Plot → チャネルERP → scalp/rect で。配列</span>お問い合わせ 結果のウィンドウでデフォルト設定を使用するには、「Rect. array のPlot」をチェックします。
チェックボックスとプレス *Ok*.


![画像:Pop_topoplotrectarray.png](/assets/images/Pop_topoplotrectarray.png)


その結果 [pop_plottopo.m の](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_plottopo.m) 図(下)が表示されます。


![画像:Erpplot3.png](/assets/images/Erpplot3.png)


前のプロットと同様に、上のトレースをクリックしてフルポップアップします
ウィンドウサブ軸ビュー。

2次元ERPスカルプマップのシリーズをプロット
----------------------------------------
ここでは、2次元スカルプマップのシリーズのERPデータをプロットします。
選択した一連のトライアルレイテンシーで潜在的な分布。
選択する <span style="color: brown"> Plot → ERPマップシリーズ → 2Dで</span>お問い合わせ お問い合わせ
結果のトップテキストボックス [pop_topoplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_topoplot.m) ウィンドウ
(below)、目的のERPスカルプマップのepochレイテンシーを入力します。 

この場合、またはその他の数値テキストエントリボックスに入力してください。
任意の数値MATLAB式。 例えば、*0 100 200 300の代わりに
400 500*の試み*0:100:500*。 より複雑な表現も、
例 *-6000+3\*(0:20:120)*は正しく解釈されます。

![画像:641pop_topoplot.png](/assets/images/641pop_topoplot.png)

ウィンドウ (below) が表示され、ERP を含む
指定されたレイテンシーのスカルプマップ。 ここでは、プロットグリッドは3を持っています
列と2列。他のプロットのジオメトリは、*Plotのジオメトリ*テキストボックスを介して上記のGUIウィンドウで指定できます。

![画像:2dscalpmap.png](/assets/images/2dscalpmap.png)


3次元ERPスカルプマップのシリーズをプロット
----------------------------------------

ERPデータを3Dスカルプマップのシリーズとしてプロットするには、メニューに移動します
<span style="color: brown">Plot → ERPマップシリーズ → 3Dで</span>お問い合わせ クエリ
ウィンドウ(下)がポップアップし、新しい3Dを作成して保存するように要求します
ヘッドマップ *3-D スプラインファイル* このプロセスは、一度だけ行わなければならない
すべてのモンタージュ。 *Ok*をクリックすると、このプロセスが開始されます。

![画像:3dscalpmessage.png](/assets/images/3Dscalpmessage.png)

下のウィンドウがポップアップ表示されます。 テンプレートの電極の位置を使うので、 
チャネル位置と3Dヘッドプロット座標(*Talairach-model変換行列*エントリ)間の変換が自動的に入力されます。 この場合、電極座標系に3Dヘッドプロットを合わせる次のセクションを参照してください。

トライアルレイテンシーを入力する
整形 (*0:100:500* 未満のレイテンシー *0,100,200,300,400,*)
*500* ms と *Ok* を押します。

![](/assets/images/pop_headplot1.png)

今、3Dプロット機能 [pop_headplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_headplot.m)、作成します
3Dチャンネルの場所スプラインファイル。 進行バーがポップアップ表示されます
このプロセスが終了すると示します。 3Dスプラインファイルの場合
生成されると、次のプロットが表示されます。

![](/assets/images/pop_headplot_res2.png)

通常通り、ヘッドプロットをクリックしてサブ軸にポップアップします
マウスで回転できるウィンドウ。 選択する注意
(他の目的のために) 頭のプロットまたは図の他のオブジェクト
お問い合わせ [axcopy. m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=axcopy.m) ポップアップ機能を有効にして、それをクリックし、
結果ポップアップウィンドウを削除します。

指定された角度で頭をプロットするには、再度選択します <span style="color: brown"> Plot → ERPマップシリーズ → 3Dで</span> メニュー項目。 によって
デフォルトでは、生成した3Dスプラインファイルを使用します。
上記。 表示されるレイテンシーと表示されます。 [ヘッドプロットm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m)
'view' オプション (例として)、 *Ok* を押します。

![](/assets/images/pop_headplot_view.png)


ふりがな [ヘッドプロットm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) ウィンドウ(下)が現れます。 可能です。
また、マウスを使用して個々の頭を回転させます。 これはしばしば
説明された空間分布を示すために必要です。

![](/assets/images/pop_headplot_res1.png)

別のヘッドテンプレートを使うこともできます。 例えば、再び使う <span style="color: brown"> Plot → ERPマップシリーズ → 3Dで</span> メニュー項目を選択し、*3-Dメッシュファイル*リストボックスの2番目のテンプレートモデル*Colin27headmesh.mat*を選択します(*Browse other*ボタンを使用して3Dメッシュファイルを閲覧することもできます)。 再びレイテンシーを選択
プロット(0:100:500)とプレス*Ok*。 結果は異なるヘッドモデルにプロットされています。

![](/assets/images/pop_headplot_res3.png)


### ヘッドモデルとチャネルの位置の共同登録

再び選択する <span style="color: brown"> Plot → ERPマップシリーズ → 3Dで</span> メニュー項目。 既にこのチャンネルの位置構造のスプラインファイルを生成する場合、
最初の編集ボックスにここに入力することができます(最初に*使用をクリックしてください)
既存のスプラインファイルまたは構造*は編集ボックスをアクティブにし、その後、
データファイルの閲覧 そのようなファイルを持っていない場合は、必要な
生成する。

ただし、最初に、チャンネルの場所を共同登録する必要があります。
3-Dヘッドテンプレートをプロットする。 ※1つご利用の場合
テンプレートのチャンネル位置ファイルとテンプレートヘッドメッシュの1つ、*Talairach-model変換行列*フィールド(チャネルアライメント情報を含む)は、前のセクションのケースだったため、自動的に入力されます。

チャネル・ツー・ヘッド・モデルを簡潔に記述します。
共同登録プロセス。 データセットにチャネルが含まれている場合
場所、例えば、測定した場所を
Polhemusシステムを使用して被験者の頭部, そして、あなたはこれらの使用したい
3Dプロットのための電極の場所, [ヘッドプロットm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) 必須
まず、電極の位置を相対的に決定します。
テンプレートヘッド面。 一般的な変換は実行できません
電極位置システムにおける原点(\[0 0\])は
テンプレートヘッドの中央に必ずしも対応しない(例えば、
課外ポイントの交差点: 吐出と前方
ポイント) [ヘッドプロットm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m)お問い合わせ この場合も、
ヘッドは異なる形状なので、スキャンした電極の位置が異なる
テンプレートヘッドメッシュに合わせて3Dでスケールまたは警告する必要があります。

共同登録画面が始まります。 ラベル付きのチェックボックスを設定します *Or
名前付き新しいスプラインファイルをrecomputeし、*Manualをクリックします。
coreg.* 押しボタン。 実行方法を説明するウィンドウが表示されます
共同登録。


![](/assets/images/Coregister.gif)


※Ok*を押すと、以下の共同登録画面が開きます。


![](/assets/images/Coregister2.gif)


上記のウィンドウでは、赤い電極は、ネイティブに関連付けられている
テンプレートヘッドメッシュを使って。 あなたの直接整列よりもむしろ
電極の位置(緑色で表示)、ヘッドメッシュ、モンタージュ
関連する電極の位置をテンプレートに整列する
同じ被写体の頭部のスキャンによるヘッドメッシュ(赤)。
サンプルデータセットの場合、このアライメントは既に実行されています。
(*Labels on* pushボタンをクリックすると、電極ラベルが表示されます)

共同登録が完了したら、*Ok* と A をクリックします。
9チャンネルアライメント値(シフト、3D、回転)のベクトル
3-D; scaling、3-Dで)は、インタラクティブな*Talairach-model変換行列*フィールドにコピーされます [ヘッドプロットm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) ウィンドウ。 チャンネルの共同登録の詳細については、を参照してください。 [ソース再構築チュートリアル](/tutorials/09_source/DIPFIT.html).

可能であり、比較的簡単に、カスタムを生成する [ヘッドプロットm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) ヘッドメッシュ。 Freesurfer を使うか、 [フィールドトリップ](https://www.fieldtriptoolbox.org/tutorial/headmodel_eeg_bem/).

異なる条件を比較し、統計を実行
---------------------------

条件間のERPの比較は、 [グループレベルの分析](/tutorials/10_Group_analysis/) ※1件のみが1件あります。 これは、グループレベルの分析インターフェイスが異なる条件のERPを選択およびプロットする豊富なオプションを持っているので、 [単一の被験者のための試験全体で統計を計算する](/tutorials/10_Group_analysis/study_statistics.html#single-subject-statistics). 

