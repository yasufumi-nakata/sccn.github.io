---
layout: default
title: 7. Extract Data Epochs
long_title: 7. Extract Data Epochs
parent: Tutorials
nav_order: 7
---
Epochsを抽出する
========================
お問い合わせ

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

EEGLAB をロードする
---------

選択する <span style="color: brown">ファイル</span> メニュー項目および出版物 
<span style="color: brown">既存のデータセットをロードする</span> サブメニュー EEGLABの「sample_data」フォルダに「eeglab_data.set」があります。

![サイトマップ](/assets/images/Pop_loadset.png)

データのエポック抽出
---------

記録 記録 を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を を
関心 イベント に に に に に に に
の 1 の 1 の 1 の 1 の 1 の 1 の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の に の の の の の の の の の に の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の の
stimuli 選択する <span style="color: brown"> ツール → 抽出エポック</span>
EEGLAB スタッフ

![投稿ナビゲーション](/assets/images/I51pop_epoch.png)


右上のボタンをクリックし、*"..."* をマークします。 [人気カテゴリー](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_epoch.m) ブラウザボックスのリストを呼び出すウィンドウ
利用可能なイベントタイプ。


![投稿ナビゲーション](/assets/images/I51pop_epoch_event.png)


正方形 正方形  *
Ok* 選択項目に入力してください。
イベントタイプは、上部のテキストボックスに直接 [人気カテゴリー](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_epoch.m) ウィンドウ。


![投稿ナビゲーション](/assets/images/I51pop_epoch2.png)


ここでは、デフォルトのエポック制限を保持します(1秒から2秒まで)
タイムロックイベント終了後 ご希望の場合は、記述名を入力してください。
新しいデータセット。 *Ok * ウィンドウが開きます。
データセット名を変更したり、データセットを保存したりする別のチャンス
リソース Ok* は、

別のウィンドウがポップアップして、無意味の除去を容易にします
この操作は、次の操作で行われます。
セクション。
この例では、stimulus-locked window は3秒です。 お問い合わせ
多くの場合、長いデータエポックを抽出する方が良いです。
10Hz以下で時間の頻度で
頻度。

ベースライン値の削除
---------

各エポックからの平均ベースライン値を削除することは、ベースライン時に便利です
データエポックの違い(例えば、低周波数から生じるもの)
ドリフトやアーティファクトがプレゼントされます。 これらは意味的ではありません
通訳可能ですが、データに残った場合、データ解析をスカウトできます。
しかし、ハイパスフィルタリングデータもベースライン補正の形態です。
任意現在のステップをレンダリングして下さい。 それを覚えておくことも不可欠です
ベースライン補正は、各チャネルでランダムなオフセットを導入し、何か 
ICAとソースは、
ベースライン補正は、したがって、注意と短いベースラインで使用する必要があります
窓(100ミリ秒の注文)は、可能であれば避けます。

データが更新された後、次のウィンドウがポップアップ表示されます。
自動的に。 選択することで直接呼び出しも可能
お問い合わせ <span style="color: brown">ツール → ベースラインを削除</span> メニュー項目。


![サイトマップ](/assets/images/Pop_removebase.png)

ベースラインは、各エポック(ms)のベースラインを指しています。
各エポックのレイテンシウィンドウで、その意味を計算する
翻訳済みepochedデータセットはデフォルトでoverwrittenです
ベースライン削除されたデータセット。 注意: 'optimum' メソッドは、
ベースライン期間またはベースライン値のいずれかを選択します。 使用方法
前刺激期間における平均値( [pop_rmbase.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_rmbase.m) デフォルト)は、分析の目的が一致する場合、多くのデータセットに有効です
データを次のデータで発生する変換を定義する
タイムロックイベント。
デフォルトでは、ベースライン除去は全てのチャネルに適用します。
ただし、特定のチャンネルをタイプ別に選ぶこともできます(可能)
チャンネル編集時に指定された
情報)、または手動で
選択します。 '...'を押してボタンを押して、リストが表示されます
選択のための利用できるタイプ/チャネル。
*Ok* コマンドラインベース(または*Cancel* ) をサブトラクト
ベースライン)。

データセット名を変更したり、データセットを保存したりするために、新しいウィンドウがポップアップ表示されます。
リソース Ok* は、

サブエポック抽出
---------
データエポックを抽出した後でも、時間を短縮したサブエポックを抽出することができます。 これは関数を使って行われます [選択する](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_select.m) 選択によって呼ばれる <span style="color: brown">編集 → データの選択</span>1000 ms から ms まで . 

![投稿ナビゲーション](/assets/images/pop_select_reepoch.png)

データエポックの選択
---------

データエポックのサブセットを選択するための本当の理由はありません。
条件を比較するとき -- コントラストを作成することによって実行される
STUDY(略称解析)、STUDY(略称)、STUDY(略称解析)、STUDY(略称)、STUDY(略称)、STUDY(略称略称)、STUDY(略称:STUDY)、STUDY(略称:STUDY)

それにもかかわらず、あなたが削除したいかもしれない場合もある
特定のアーティファクチュアルまたは無関係のデータエポック。 

### データのサブセットを選択

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>EEGLABの「sample_data」フォルダにある「eeglab_data_epochs_ica.set」のチュートリアルファイルです。

データのエポックを除去する最も簡単な方法は、エポックインデックスを選択することによってです。 
これは関数を使って行われます [選択する](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_select.m) 選択によって呼ばれる <span style="color: brown">編集 → データの選択</span>MATLABの名称は、1、2、3、4、5、6、7、8、9、10です。

![投稿ナビゲーション](/assets/images/pop_select_epochs.png)

また、epoch の編集ボックスに隣接するチェックボックスに、epochs 1 から 10 へ削除されます。 

### イベント情報に基づくデータエポックのサブセットを選択
EEGLABは、その1位と1位をとって、
この投稿では、すべてのページに投稿します。 チュートリアルでは、eeglab_data_epochs_ica.set にインストールします。

選択する <span style="color: brown">編集 → エポックやイベントを選択</span>お問い合わせ ふりがな [pop_selectevent.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_selectevent.m) このページではjavascriptを使用しています。 * プレス *Ok*

![サイトマップ](/assets/images/pop_select_epoch.png)

注意: *Cancel* ボタンを上回るオプション * epochs 削除
選択したイベント*では参照されません。 このチェックボックスがリセットされていない場合
チェックボックス *選択したイベントのみをキープし、他のイベントをすべて削除
event* は、
これらのイベントを含まないエポックを削除しないでください。

プレス *Ok*

![サイトマップ](/assets/images/confirm_epoch.png)

これから [pop_newset.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newset.m) 新規登録 この新しいデータセット「Square, Position 1」と入力し、*Ok* を入力してください。

