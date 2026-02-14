---
layout: default
title: Viewprops
nav_title: "ビュープロップ"
long_title: Viewprops
parent: Plugins
render_with_liquid: false
nav_order: 1
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/viewprops).

![](Viewprops_eye.png)

# Viewprops EEGLABプラグイン
スクロールICアクティビティビューア、(PVAF)、ダイポールプロット(利用可能な場合)、およびコンポーネントラベル(利用可能な場合)のために考慮されるパーセントチャネルの分散を追加して、元のEEGLAB pop_prop()機能と同じ情報を表示します。 このプラグインは、ICLabel EEGLAB プラグイン** と同等です。

## 使用方法
### 導入事例
Viewpropsがインストールされていない場合は、EEGLABプラグインマネージャからインストールしてください。 「ファイル」→「EEGLAB拡張子の管理」→「データ処理拡張」の下のEEGLABウィンドウでこれを見つけることができます。 新しいウィンドウが開くと、プラグインのリストから「Viewprops」プラグインを見つけ、「Install」という列の左にあるチェックボックスをマークします。 プラグインの一覧で「Next page」ボタンを使ってViewpropsを見つける必要があります。 選択したプラグインをダウンロードするには、「OK」をクリックします。 一度だけこれを行う必要があります。

### グラフィカルな使用法
インストールが完了したら Viewpropsは、既にインストールしている場合は、EEGデータセットをロードする必要があります。 読み込まれたデータセットで、EEGLABウィンドウを使用してビュープロップを開き、「Plot」-> 「拡張[チャンネル/コンポーネント]プロパティを表示」 右側に表示された新しいウィンドウが表示され、いくつかの設定を指定できるように表示されます。

![](Viewprops_menu.png)
![](Viewprops_settings.png)

**\[チャンネル/コンポーネント\] プロットするインデックス**

チャンネルやコンポーネントがプロットする数字の配列。

**スペクトルオプション**

spectopo() に渡されるキー/値のペアのセル配列。

**到着オプション**

erpimage() に渡されるキー/値のペアのセル配列。

**イベントをスクロールする\[channel/component\]アクティビティを描画する**

スクロール\[channel/component\]アクティビティの上部にあるイベントの時間とタイプをオーバーレイするかどうかを示すチェックボックス。

**ICの分類器【必須】* * 必須

利用可能なIC分類をリストするドロップダウンメニュー。 選択した分類器 IC の分類がプロットされます。

設定に満足している場合は、「Ok」というラベルの付いたボタンをクリックし、チャンネルまたは指定されたコンポーネントのグリッドをプロットします。 各チャンネルまたはコンポーネントは、上のボタンでスカルプトポグラフィによってグリッドで表され、利用可能な分類のコンポーネントの場合、最も可能性が高いICカテゴリ。 ボタンをクリックすると、この記事の上部にある画像で拡張されたプロパティビューアショーが開きます。

![](Pop_viewprops.png)

### コマンド・ライン 使用方法
ICA-decomposed EEG のデータセットを変数 EEG に保存したと仮定すると、MATLAB のコマンドウィンドウに次の入力で Viewprops のグリッドウィンドウ設定を開くことができます。
```
pop_viewprops(EEG, 0) % for component properties
pop_viewprops(EEG, 1) % for channel properties
```
必要なコンポーネントと設定を知りたい場合は、次のコマンドをMATLABのコマンドウィンドウに入力することでグリッドを直接プロットできます。
```
pop_viewprops(EEG, 0, component_array, spectopo_options, erpimage_options, scroll_event, classifier_name) % for component properties
pop_viewprops(EEG, 1, component_array, spectopo_options, erpimage_options, scroll_event, classifier_name) % for channel properties
```
component_array は整数の配列で、 spectopo_options は spectopo() のオプションのキー/値のペアのセル配列です。 erpimage_options は、 erpimage() のオプションのキー/値のペアのセル配列です。 scroll_event は、スクロールプロットにイベントインジケータをプロットするかどうかを示す 0 または 1 です。 classifier は、 erpimage() の置換をしたい場合、 erpimage() のオプションの classifier の名前です。 これらのすべての変数に入力する必要はありませんが、任意のオプションを省略した場合は、次のすべてのオプションを省略する必要があります。 例えば、spectopo_options の後のすべてのデフォルト値で OK なら、次の値を MATLAB のコマンドウィンドウに入力するだけです。
```
pop_viewprops(EEG, 0, component_array, spectopo_options) % for component properties
pop_viewprops(EEG, 1, component_array, spectopo_options) % for channel properties
```
拡張プロパティ設定ウィンドウに直接アクセスしたい場合は、次のコマンドをMATLABのコマンドウィンドウに入力してください。
```
pop_prop_extended(EEG, 0) % for component properties
pop_prop_extended(EEG, 1) % for channel properties
```
繰り返しますが、必要なコンポーネントと設定を知りたい場合は、MATLABのコマンドウィンドウに次の項目を入力することで、拡張プロパティウィンドウを直接プロットすることができます。
```
pop_prop_extended(EEG, 0, component_array, NaN, spectopo_options, erpimage_options, scroll_event, classifier_name) % for component properties
pop_prop_extended(EEG, 1, component_array, NaN, spectopo_options, erpimage_options, scroll_event, classifier_name) % for channel properties
```
### 追加の能力
**警告: このセクションは、EEGLABが他の場合、予期しない変更がEEGLABに既に行われている可能性があるため、上級ユーザーのみです。 メニュー

Viewprops プラグインは、オリジナルの pop_prop() 関数のドロップイン置換を可能にするために書かれています。 そのため、「ツール」-> を使用したときに拡張プロパティウィンドウを生成したい場合 "ICA"-> "マップでコンポーネントを注入" は、単に "pop_prop_extended" に "pop_prop" を "pop_prop_extended" に変更するために、関数 pop_selectcomps() のコードを開きます。
