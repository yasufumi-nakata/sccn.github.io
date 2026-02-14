---
layout: default
title: BVA-io
long_title: BVA-io
parent: Plugins
render_with_liquid: false
nav_order: 28
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/bva-io).

# BVA-io for Brain Vision Analyzer フォーマット

このリポジトリは、EEGLABがインポート/エクスポートするプラグインです。
Brain Vision Analyzer EEGのデータファイル。

# バージョン履歴
v1.73 - MULTIPLEXED形式のデータを新しいオプションとして書き込む; VMRKファイルが欠落しているときに警告を表示する

v1.72 - イベントファイルが存在しないときにクラッシュを避ける

v1.71 - .ahdrファイルをインポートすることができます

v1.7 - VMRK と EEG ファイルの非一貫性のwitht ヘッダー VHDR ファイルのより良い処理; 空のマーカー情報セクションを許可; truncated バイナリファイルをインポートする
