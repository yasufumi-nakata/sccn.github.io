---
layout: default
title: fMRIb
nav_title: "ログイン ツイート"
long_title: fMRIb
parent: Plugins
render_with_liquid: false
nav_order: 14
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/fMRIb).

このリポジトリは、メインテナーのためにロックされています。 このツールを利用する場合、コンダクタはそれを使用します。

# fMRIb EEGLABプラグイン

最適なベースセットを使用してEEGデータからFMRI環境アーティファクトの除去。 EEGLAB 用のこのプラグインは 'Tools' でメニュー項目を追加します。
'FMRIB の FMRIで収集したEEGデータを作成するツールです。

## インストール

EEGLABプラグインマネージャを使用して、またはフォルダfmribX.X(X.Xはバージョンに依存します)を内部に配置します 
EEGLABの'plugins'フォルダ。 EEGLABを実行すると、プラグインは 
検出され、取付けられて。 Matlabのメッセージは以下のとおりです。 
'eeglab: プラグイン "fmrib1.0b" を追加 (参照 >> ヘルプ eegplugin_fmrib) お問い合わせ
EEGLABを始めるとき。

## ツール
1. FASTR(fmriアーティファクトスライステンプレート除去): このツールのみ 
各FMRIスライスのタイミングイベントを持つEEGLABのEEGデータが必要 
買収。 この情報は、グラデーションを堅牢に引き下げるために使用します。 
アーティファクト。 使用されるアルゴリズムの詳細については、 
プラグインのドキュメント。

2. QRSの検出。 このツールは、心臓のビート/QRSの検出を可能にします 
複雑化(その後、リス関連アーティファクトを除去するために使用される) 
ECGデータの単一チャネルで、結果がEEGLABのイベントとして保存されます。 
イベント構造 非常に悪いECGでも非常に堅く働いています。 再び、プラグインにドキュメントとリファレンスが含まれている。

3. 脈拍のアーティファクトの取り外し。 (2)からパルスを除去するためにイベントを使用する 
アーティファクトのテンプレートを作成するさまざまな方法を使用してアーティファクト。 

Rami K. Niazy, FMRIB Centre, オックスフォード大学 rami@fmrib.ox.ac.uk

FMRIB プラグインは EEGLAB に含まれており、2005 年に Rami Niazi によって開発されました。 しかし、もうサポートしていません。

# 参考文献

Niazy RK, Beckmann CF, Iannetti GD, Brady JM, スミサ SM. 神経画像. 2005, 28(3):720-737.

# お問い合わせ

* 3-T fMRIで同時に記録された聴覚イベント関連の潜在能力の質を改善しました:弾道のアーティファクトの除去。 Debener S, Strobel A, Sorger B, Peters J, Kranczioch C, Engel AK, Goebel R. Neuroimage. 2007, 34(2)587-97.

* FMRIB以外、BERGENはfMRI-EEG用の非常に素晴らしいEEGLABプラグインです。 ヘッドの動きの効果を減らすのに役立つ機能をサポートしています。

* 同時EEG-fMRI記録のための再アライメントパラメータ非公式アーファクト補正。 Moosmann M, Schönfelder VH, Specht K, Scheeringa R, Nordby H, Hugdahl K. Neuroimage. 2009, 45(4):1144-50. http://sccn.ucsd.edu/wiki/EEGLAB_Plugins http://fmri.uib.no/tools/bergen_plugin.htm

* この目的のために別の推奨アプリケーションは、SPM用のプラグインであるFASSTですが、EEGLABにデータをインポートすることができます。 これは、文字通り高速で機能し、BCG拒絶のための最も洗練されたソリューションの1つであるBCG拒絶のための禁忌のICAが装備されています。

* 機能磁気共鳴イメージング(fMRI)で記録された連続電気脳図(EEG)時間シリーズからのパルス関連アーティファクト(PRA)のレジェクション。 Leclercq Y, Balteau E, Dang-Vu T, Schabus M, Luxen A, Maquet P, Phillips C. Neuroimage. 2009, 44(3):679-91.

* [fMRIアーファクト拒絶反応と睡眠スコアリングツールボックス](http://www.montefiore.ulg.ac.be/~phillips/FASST.html)

# バージョン履歴

* V2.0 -- 仕様 最後の勾配の脈拍の順序がEEGの端の近くで余りにあるとき
録音、FASTRは正しく警告を生成しますが、クラッシュします。 2) 平らな場合
参照チャネルはデータセット、FASTRの適応ノイズキャンセレーションオプションにあります
それを修正しようとします。, NaNs になります。. 3) 脈拍のアーティファクトの昇華機能
クラッシュをもたらすフラットリファレンスチャンネルを修正しようとします。 4) 脈拍のartifact
指示されていないにもかかわらず、ECGチャネルを修正しようとする減算機能
お問い合わせ 5) FASTRの適応ノイズキャンセルオプションは、ECGチャネルを修正しようとします
そうしないと言われているにもかかわらず。 お問い合わせ https://sccn.ucsd.edu/bugzilla/show_bug.cgi?id=1520

* V2.1 -- - - - - - - - - EEGLABでバージョン表示の問題を修正し、他の変更はありません。

