---
layout: default
title: get_chanlocs
long_title: get_chanlocs
parent: Plugins
render_with_liquid: false
has_children: true
nav_order: 32
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/get_chanlocs).

![スクリーンショット 2024-07-25 に 14 57 29](https://github.com/user-attachments/assets/fc3850a2-09d2-4341-aecf-a41fc39e0758)

# get_chanlocs EEGLABプラグイン
get_chanlocs EEGLAB プラグインは、FieldTrip で 3 D の電極の位置を 3 D のスキャンされたヘッド イメージから見つけられます。 ロバートOostenveld、FieldTripツールボックスの創始者であるRobert Oostenveldは、2017年にNijmegenの生徒がFieldTripに機能を追加し、3Dカメラの記録された3D画像からスカルプ電極の計算位置を計算しました。この構造スキャナーはApple iPadに搭載しました。 (HomölleとOostenveld (2019) と、組み込みのFieldTrip関数のメモを読みます)。 SCCN では、EEGLAB プラグイン拡張、get_chanlocs を作成し、3D から電極の位置をデジタル化し、EEG に入力します。 メカニックは、電極位置情報を必要とする他のEEGLAB(plotting and source localization)機能で使用するためのデータ構造を割り当てます。

詳細はこちら [get_chanlocs ウィキ](https://github.com/sccn/get_chanlocs/wiki) EEGLABのウェブサイト上にある場合、その他のサブメニューをこのプラグインに使用してください。
