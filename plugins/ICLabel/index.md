---
layout: default
title: ICLabel
nav_title: "ICラベル"
long_title: ICLabel
parent: Plugins
render_with_liquid: false
nav_order: 0
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/ICLabel).

# ICラベル
EEGLAB用の自動EEG独立したコンポーネントのclassiferプラグイン。
詳しくは、 [ICLabelのウェブサイトチュートリアル](https://labeling.ucsd.edu/tutorial/about).

## 導入事例
ICLabel プラグインを取得する最も簡単な方法は、EEGLAB プラグインマネージャです。 

EEGLABプラグインマネージャではなくGitHubでプラグインをインストールする予定がある場合は、matconvnetがサブモジュールとして含まれていることに注意してください。 つまり、zip-fileのダウンロードには含まれません。 ダウンロードする必要があります [matconvnetの私のフォーク(バージョン)](https://github.com/lucapton/matconvnet) ICLabelフォルダにzipを抽出します。 また、コマンドラインでこのリポジトリをクローニングしている場合、サブモジュールをクローンする「---recusive」フラグを必ず含めてください。 必要なディレクトリにあると、正しいコマンドは次のようになります。

git clone --再帰的 https://github.com/lucapton/ICLabel.git

## 使用方法
### グラフィカルな使用法
![メニュー](ICLabel_menu.png)
ICLabelのインストールが完了したら、既にインストール済みの場合は、EEGデータセットをロードする必要があります。 ICLabel を実行するには、独立したコンポーネント分析を使用してデータセットが既に分解されている必要があります。

読み込まれたデータセットで、「ツール」->「ICLabel」をクリックして、EEGLABウィンドウを使用してICLabelを起動します。 MATLAB のコマンドウィンドウに ICLabel のパイプラインの進捗状況が表示されます。 ICLabel が終了すると、MATLAB のコマンドウィンドウに「完了」が表示され、利用可能な場合は、Viewprops プラグインが開きます。 「Viewprops」がインストールされていない場合は、画面に表示されません。

### コマンド・ライン 使用方法
ICA-decomposed EEG のデータセットを変数 EEG に保存したと仮定すると、MATLAB のコマンドウィンドウに次の入力で ICLabel を使うことができます。
```
EEG = iclabel(EEG)
```
### 結果の検索
ICLabel を使用する方法、EEGLAB ウィンドウまたは MATLAB のコマンドウィンドウから、IC の分類情報は、行列の EEG 構造に保存されます。
```
EEG.etc.ic_classification.ICLabel.classifications
```
ラベルは各行が対応するICのラベルベクトルである行列として保存されます。 ラベルベクターは、7つのICLabel ICカテゴリのいずれかにあるICの確率を表す7つの数字の列です。 例えば、5番目のICのラベルベクターを見つけるには、行目の行を参照します。
```
EEG.etc.ic_classification.ICLabel.classifications(5, :)
```
また、文字列のセル配列でクラスラベルを見つけることができます。
```
EEG.etc.ic_classification.ICLabel.classes
```
文字列のセル配列の各要素は、ラベルベクター内の対応する要素のカテゴリを示します。 例えば、ラベルベクターの3番目の要素のカテゴリを検索します。
```
EEG.etc.ic_classification.ICLabel.classes{3}
```
カテゴリーが「目」です。
## Viewprops プラグイン
![](Viewprops_eye.png)
ICLabel プラグインは、組み込みのプロットやビジュアライゼーションを提供していません。したがって、インストールすることも強くお勧めします。 [Viewprops プラグイン](https://sccn.ucsd.edu/wiki/Viewprops)お問い合わせ この記事の一番上に示したような数字を生成します。 詳細はこちら [導入事例](https://sccn.ucsd.edu/wiki/ICLabel#Installation) 取得方法に関するセクション [Viewprops プラグイン](https://sccn.ucsd.edu/wiki/Viewprops) 見る [wikiページ](https://sccn.ucsd.edu/wiki/Viewprops) 使用方法に関する情報

### フィールドトリップでICLabelを実行

まず EEGLAB をインストールします(デフォルトでは ICLabel プラグインを含みます)。 以下のスクリプトを使用します。

```matlab
cfg = [];
cfg.datafile = '~/data/matlab/eeglab/sample_data/eeglab_data.set';
cfg.headerfile = '~/data/matlab/eeglab/sample_data/eeglab_data.set';
my_ft_data = ft_preprocessing(cfg);

eeglab; close; % add paths to EEGLAB
EEG = fieldtrip2eeglab(my_ft_data, my_ft_data.trial);
EEG = eeg_checkset(EEG);
EEG = pop_runica(EEG, 'icatype', 'runica');
EEG = pop_icflag(EEG, [0 0;0 0; 0.001 1; 0 0; 0 0; 0 0; 0 0]); % see function help message
rejected_comps = find(EEG.reject.gcompreject > 0);
EEG = pop_subcomp(EEG, rejected_comps);
EEG = eeg_checkset(EEG);

curPath = pwd;
p = fileparts(which('ft_read_header'));
cd(fullfile(p, 'private'));
hdr = read_eeglabheader( EEG );
data = read_eeglabdata( EEG, 'header', hdr );
event = read_eeglabevent( EEG, 'header', hdr );
cd(curPath);
```

## バージョン履歴
Pending - シグナル処理ツールボックスが不在である場合、新しいメッセージ(そのような小さな変更のために新しいリリースが必要ではないと判断しました)

1.6 - バージョン1.5 1ヶ月前に導入された電極のオリエンテーションで問題を修正

1.5 - マイナーな微調整と優れた安定性(コミット履歴を参照してください)

1.4 - EEGLABの互換性のための可能な参照のリストに「平均」を追加

1.3 - 同じICAの分解と複数のデータセットを処理するとき、分類の確率が同一であることを確認してください

1.2.6 - 2016年の前にMaatlabのためのpop_iclabel.mで問題を修正し、まれなパスの問題を修正し、Autocorrelation長さで問題が発生します

1.2.5 - pop_iclabelでキャンセルを押すと問題を修正します。 m 点

1.2.4 - いくつかの依存関係を1.2.3に含めることを忘れて、それらを追加し、プロパティを表示するために問題を解決します

1.2.3 - 単一のデータセットのためのバグを修正

1.2.2 - STUDYの呼び出し形式を修正し、新しい関数eeg_icalabelstatを追加
