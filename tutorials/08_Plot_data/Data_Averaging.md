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

EEGLABの特長
プロット1-D ERPの試験セットの試験結果(例、epochs)。 EEGLABも
EEG ダイナミクスを学習する
トライアル 大きい部分は2次元(時間)によって視覚化されるかもしれません
チュートリアルの次の記事では、チュートリアルの次の記事が作成されます。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

両軸にERPカルプマップ
-------------------------------------------------------- 

チュートリアルデータセットをそのまま使用しました。 [データエポック抽出](/tutorials/07_Extract_epochs/Extracting_Data_Epochs.html)お問い合わせ メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>EEGLABの「sample_data」フォルダにある「eeglab_data_epochs_ica.set」のチュートリアルファイルです。

![サイトマップ](/assets/images/Pop_loadset2.png)

### すべてのチャネルをプロット 採用情報

EPOCEANERP は、EPSカルプマップ を、
選択したレイテンシー、選択 <span style="color: brown">パロット → ERP → スカルプマップ</span>お問い合わせ サンプルを使ったシンプルなイラストとして
dataset は、デフォルトで設定されます。 [pop_timtopo.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_timtopo.m) 下のウィンドウ、および
プレス *Ok*.


![サイトマップ](/assets/images/Pop_timtopo.png)


図(下)が表示されます。 各トレースはプロットします
scalp の地図は、地理的
430 ms で パープル潜在能力 の分布(最大値)
ERPデータ分散 または1つに分ける
上記のポップアップウィンドウでレイテンシーを指定できます。


![サイトマップ](/assets/images/Erpplot1.png)


ふりがな [pop_timtopo.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_timtopo.m) 関数は相対的な時間のコースをプロットします
PereP、Soulppotenシャルの「ギフト」
PerpleerPtimesコースでは、以下のとおりです。 クライアントは、Simpカルトポグラが、Simpカルトポグラの1つを、Simpカルトポグラの1つ、Simpカルトポグラの1つ、Simpカルトポグラの1つ、Simpカルトポグラの1つ、Simpカルトポグラの1つ、Simpカルトポグラの1つ、Simpカルトポグラの1つ、Simpカルトポグラの1つ、Sepカルトポグラの1つ、Sepカルトポグラの1つ、 
*all* レイテンシーでERPのスカルプマップへ。
ERP映画(例えば、ScalpuのERPの再生)、
関数 [eegmovie。 m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=eegmovie.m) コマンドラインから記述されている [チュートリアルのスクリプトセクション](/tutorials/11_Scripting/EEG_scalp_measures.html#using-the-eegmovie-function-to-make-2-d-scalp-topography-animations).


### サイトマップ

EpochedデータセットのERPは、
2Dトポグラフィの配置は、トレースで行います。 
選択する <span style="color: brown">パロット → ERP → scalp 配列/rect で . 配列</span>Ok* では、デフォルトウィンドウで設定できます。


![サイトマップ](/assets/images/Pop_plottopo.png)


以下を生成します。 [pop_timtopo.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_timtopo.m) プロフィール


![サイトマップ](/assets/images/Erpplot2.png)


特定のチャンネルタイムコースを視覚化できます。
トレース(平均)をクリックし、ポップアップサブ軸ビューを作成します。 お問い合わせ
例: *POz* (above) マーク ERP トレース,
このトレースのフルサイズのビュー(以下)。


![サイトマップ](/assets/images/Zoom1.png)


ルーチンをプロットする [axcopy. m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=axcopy.m) サブ軸プロットウィンドウをいつでもポップアップする
メインプロットウィンドウをクリックします。 サブ軸窓は
ありません [axcopy. m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=axcopy.m) 有効で、ユーザーが使用できるようにします
標準規格MATLAB マウス「トランスアウト」機能。


### ERP をプロットする


2連載中のPerpleERPデータトレース
メニュー項目を選択 <span style="color: brown"> パロット → ERP → scalp/rect で。配列</span>デフォルト設定 Rect. array 'Plot' をリクエストします。
サイトマップ *Ok*。


![サイトマップ](/assets/images/Pop_topoplotrectarray.png)


その結果 [pop_plottopo.m の](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_plottopo.m) 図(下)が表示されます。


![サイトマップ](/assets/images/Erpplot3.png)


前のプロットと同様に、上のトレースをクリックしてフルポップアップします
ウィンドウサブ軸ビュー。

2次元ERPSカルプマップ
----------------------------------------
製品のERPデータプロット
選択した一連のトライアルレイテンシーで潜在的な分布。
選択する <span style="color: brown"> Plot → ERPMapシリーズ → 2Dで</span>お問い合わせ お問い合わせ
結果のトップテキストボックス [pop_topoplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_topoplot.m) ウィンドウ
(below)、ERPsカルプマップのエポックレイテンシー。 

この場合、またはその他の数値テキストエントリボックスに入力してください。
例:MATLAB.com
400 500*の試み*0:100:500*。 より複雑な表現も、
例 *-6000+3\*(0:20:120)*は正しく解釈されます。

![投稿ナビゲーション](/assets/images/641pop_topoplot.png)

ウィンドウ (below) ERPについて
指定されたレイテンシーのスカルプマップ。 ここでは、プロットグリッドは3を持っています
*Plot の ジオメトリ は、*Plot の ジオメトリ は、*Plot の ジオメトリ の GUI ウィンドウで指定します。

![サイトマップ](/assets/images/2dscalpmap.png)


3次元ERPSカルプマップ
----------------------------------------

Dsカルプマップのシリーズをプロットに、
<span style="color: brown">Plot → ERPMapシリーズ → 3Dで</span>お問い合わせ クエリ
ウィンドウ(下) は、新しい3D と ウィンドウ (下) は ウィンドウ (下)
ヘッドマップ *3-D スプラインファイル* このサイトについて
*Ok* は、この手順を説明します。

![投稿ナビゲーション](/assets/images/3Dscalpmessage.png)

下のウィンドウがポップアップ表示されます。 テンプレートの電極の位置を使うので、 
3Dヘッドプロット(*Talairach-model変換行*エントリ) の変換は、次のようになります。 次の 次の 次の 次の 次の

トライアルレイテンシーを入力する
整形 (*0:100:500* 未満のレイテンシー *0,100,200,300,400,*)
*500* ms と *Ok* は、

![](/assets/images/pop_headplot1.png)

3Dプロット機能 [pop_headplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_headplot.m)、作成します
3D チャンネル パス プ ライン ファイル。 進行バー が サブ
3Dspline ファイルの読み込み
生成されると、次のプロットが表示されます。

![](/assets/images/pop_headplot_res2.png)

通常通り、ヘッドプロットをクリックしてサブ軸にポップアップします
マウスで回転できるウィンドウ。 選択する注意
(他の目的のために) 頭のプロットまたは図の他のオブジェクト
お問い合わせ [axcopy. m 点](http://sccn.ucsd.edu/eeglab/locatefile.php?file=axcopy.m) ポップアップ機能を有効にして、それをクリックし、
結果ポップアップウィンドウを削除します。

指定された角度で頭をプロットするには、再度選択します <span style="color: brown"> Plot → ERPMapシリーズ → 3Dで</span> メニュー項目。 によって
デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは、 デフォルトでは デフォルトでは、 デフォルトでは、 デフォルトでは デフォルトでは、 デフォルトでは デフォルトでは、 デフォルトでは デフォルトでは エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー エラー
上記。 表示されるレイテンシーと表示されます。 [ヘッドプロットム](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m)
'view' のオプション (例), *Ok* 詳しくはこちら

![](/assets/images/pop_headplot_view.png)


ふりがな [ヘッドプロットム](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) ウィンドウ(下)が現れます。 可能です。
また、マウスを使用して個々の頭を回転させます。 これはしばしば
説明された空間分布を示すために必要です。

![](/assets/images/pop_headplot_res1.png)

別のヘッドテンプレートを使うこともできます。 例えば、再び使う <span style="color: brown"> Plot → ERPMapシリーズ → 3Dで</span> メニューの項目は必須項目です。*Browse other*ボタンは3Dモデルです。* 再び テン
プロット(0:100:500)とプレス*Ok*。 結果は、次のモデルにプロットする。

![](/assets/images/pop_headplot_res3.png)


### ヘッドモデルとチャネルの位置の共同登録

再び選択する <span style="color: brown"> Plot → ERPMapシリーズ → 3Dで</span> メニュー項目。 既にこのチャンネルの位置構造のスプラインファイルを生成する場合、
最初の編集ボックスにここに入力することができます(最初に*使用をクリックしてください)
既存のスプラインファイルまたは構造*は編集ボックスをアクティブにし、その後、
データファイルの閲覧 そのようなファイルを持っていない場合は、必要な
生成する。

ただし、最初に、チャンネルの場所を共同登録する必要があります。
3Dヘッドの使い方
ユーザ名 ユーザ名 ユーザ名 ユーザ名

チャネル・ツー・ヘッド・モデルを簡潔に記述します。
共同登録プロセス。 データセットにチャネルが含まれている場合
場所、例えば、測定した場所を
Polhemus のシステム 経験者 , , , , , ,
3Dプロットフォーレ [ヘッドプロットム](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) 必須
まず、電極の位置を相対的に決定します。
テンプレートヘッド面。 一般的な変換は実行できません
電極位置システムにおける原点(\[0 0\])は
テンプレートヘッドの中央に必ずしも対応しない(例えば、
課外ポイントの交差点: 吐出と前方
ポイント) [ヘッドプロットム](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m)お問い合わせ この場合も、
ヘッドは異なる形状なので、スキャンした電極の位置が異なる
ヘッド テンプレート で

共同登録画面が開きます。 ラベルチェックボックス *または
名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名 名
coreg.* を 実行方法 ウィンドウを 実行する
共同登録。


![](/assets/images/Coregister.gif)


※Ok*と、共同登録画面が開きます。


![](/assets/images/Coregister2.gif)


上記のウィンドウでは、赤い電極は、ネイティブに関連付けられている
テンプレートヘッドメッシュを使って。 あなたの直接整列よりもむしろ
電極の位置(緑色で表示)、ヘッドメッシュ、モンタージュ
関連する電極の位置をテンプレートに整列する
同じ被写体の頭部のスキャンによるヘッドメッシュ(赤)。
サンプルデータセットの場合、このアライメントは既に実行されています。
(*Labels on* プッシュボタン、ラベル)

Ok* と A の 共同作業
9チャンネルのA値表(シフト3D、回転)の
3D, scaling, 3-Dで, ユーザ名*Talairach-model変換行*フィールドにコピーする [ヘッドプロットム](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) ウィンドウ。 チャンネルの共同登録の詳細については、を参照してください。 [ソース再構築チュートリアル](/tutorials/09_source/DIPFIT.html).

可能であり、比較的簡単に、カスタムを生成する [ヘッドプロットム](http://sccn.ucsd.edu/eeglab/locatefile.php?file=headplot.m) ヘッドメッシュ。 フリーサーファー か、 [フィールドトリップ](https://www.fieldtriptoolbox.org/tutorial/headmodel_eeg_bem/).

異なる条件を比較し、統計を実行
---------------------------

条件ERPの比較は、 [グループレベルの分析](/tutorials/10_Group_analysis/) ※1件のみです。 条件をクリアする [単一の被験者のための試験全体で統計を計算する](/tutorials/10_Group_analysis/study_statistics.html#single-subject-statistics). 

