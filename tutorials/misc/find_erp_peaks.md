---
layout: default
title: Find ERP peaks
long_title: How to find ERP peaks
parent: Reference Topics
grand_parent: Tutorials
---
ERPピークレイテンシーの検索
===
被験者またはグランド平均ERPにおける活動のピークは、部分的な相同期による複雑なプロセスから発生する可能性があります。 研究者がこの単純化措置を超えて行くように促します。 それにもかかわらず、このアプローチはコミュニティで人気が残っているため、このチュートリアルセクションが含まれています。

Matlabズームを用いたERPピーク特性
----

EEGLABは現在、自動的に検索するためのツールはありませんが、
ERPピーク振幅とレイテンシー、便利なMATLABを使用できます
ズーム機能により、正確な振幅とレイテンシを視覚的に判断
どのMATLAB図でもピーク。

たとえば、上の図では、**+**記号を持つ拡大眼鏡アイコンを選択します。 その後、下の図のように赤い曲線のピークにズームインします(左マウスボタンを押してズームアウトします)。 ピークレイテンシと振幅を軸スケールから任意の目的の精度に読みます。

![](/assets/images/Pop_comperp5.gif)

ERPLAB と EEGLAB の Bioelectromag プラグイン
---------------
EEGLABエクステンション(EEGLABエクステンション) [バイオエレクトロマー](https://sccn.ucsd.edu/eeglab/plugins/eeg_toolbox1.01.zip) そして、 [ERPラボ](https://github.com/lucklab/erplab/releases)は、より高度ERPのピークの検出を実行できます。 これらの拡張子は、EEGLAB拡張マネージャから入手できます。 <span style="color: brown">ファイル → EEGLAB 拡張機能の管理</span> メニュー項目。

以下は、EEGLABチュートリアルのeeglab_data_epochs_ica.setをロードした後に[bioelectromag]インターフェイスを示すプロットです。

![](/assets/images/bioelec.png)
