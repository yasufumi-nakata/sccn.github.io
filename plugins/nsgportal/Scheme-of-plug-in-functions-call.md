---
layout: default
parent: NSGportal
grand_parent: Plugins
render_with_liquid: false

title: Scheme-of-plug-in-functions-call
long_title: Scheme-of-plug-in-functions-call
---
下の図は _nsgportal_ で関数呼び出しのスキームを示します。 プラグインには、2つのメインセット、レイヤー、プレフィックス _pop__ と _nsg___ によって指定された関数があります。 _pop__ 関数は、必要な引数よりも少ない引数で呼び出されたときにパラメータのエントリーウィンドウを開き、ウィンドウを開くことなく直接実行します。 nsgportal 関数の 2 番目のクラスは、MATLAB コマンドラインや MATLAB スクリプトや関数から直接呼び出すことができます。 これらの関数は pop_ 関数よりも低レベルの処理を実行します。 プラグイン関数 (_eegplugin_nsgportal_) は、メインの EEGLAB ウィンドウ メニューの nsgportal アイテムの包含と外観を管理します。 

<center>
<img src="https://github.com/sccn/nsgportal/blob/master/docs/img/nsgportal_scheme_call.png?raw=true" alt="drawing" width="1000"/>
</center>