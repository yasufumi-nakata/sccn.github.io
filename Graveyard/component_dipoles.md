---
layout: default
title: component dipole
grand_parent: Tutorials
---

私達のサンプル
このチュートリアルで使用される分解は、クリーンなEEGデータに基づいており、
いくつかの他の分解よりも少数の人工成分を持っている
データセット。 

脳関連コンポーネントを認識するための主な基準
彼らが持っていることです:

1.  ダイポールのようなスカルプマップ,
2.  典型的なEEG周波数でのスペクトルピークは(すなわち、EEGのような)
    スペクトル)および、
3.  正規ERP-imageプロット(コンポーネントが考慮されないことを意味する)
    いくつかの試験で発生する活動のため。

下のコンポーネントは、10 Hzと頭皮の近くの強いアルファ バンドピークを持っています
左のオクシタールの皮質脳の源と互換性がある地図の配分。

単一ダイポールまたはダイポールペアソースを使用してICAソースをローカライズするとき
ローカリゼーション。 'EEG-like' コンポーネントの多くは、非常に低いとフィットすることができます
残留分散(例えば、5%未満)。 

![325px]{{ site.baseurl }}/assets/images/I94component2_properties.jpg リリース
 


<img src="https://sccn.github.io/assets/images/Comp252.jpg">



EEGLABのv4.32 <a href="http://sccn.ucsd.edu/eeglab/locatefile.php?file=topoplot.m">topoplot.mの</a> 上記は独立したショーを示しています
二国間同等ダイポールモデルが2%残留しかなかった部品
全252の電極の位置の分散。 お問い合わせ <a href="http://sccn.ucsd.edu/eeglab/locatefile.php?file=binica.m">ログイン</a>
使用したPCAを分解し、700,000以上のデータポイントを160に削減
主要な次元(ICAの重量ごとの28時間のポイントの比率)。

</details>