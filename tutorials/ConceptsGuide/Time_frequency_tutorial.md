---
layout: default
title: Spectral analysis
long_title: Spectral analysis and time-frequency decompositions
parent: Concepts guide
grand_parent: Tutorials
---
EEG信号のスペクトル解析
============================

EEG信号の分光解析は、EEGデータ解析の中央部です。 お問い合わせ
このセクションでは、EEG スペクトル解析の基礎的な概念を見直します。 EEGの研究でスペクトル分析の完全な導入のために、あなたはこのシリーズの短いビデオを見ることができます。 右上のアイコンをクリックして、プレイリスト内の動画のリストにアクセスします。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLXc9qfVbMMN2TAoLHVW5NvNmJtwiHurzw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></center>

一般的なEEG脳波
-----

人間のEEGの周波数の標準的な範囲があります
以下に示すように、特定の名前を使用して指定された。

![center\|alt テキスト](/assets/images/Freqs.jpg)

これらの周波数は、実際のEEGの副鼻腔として存在しません
データ。 代わりに、私たちはほとんどの場合、そのような混合物を常に観察します
頻度。

![center\|alt テキスト](/assets/images/Freqs2.jpg)

EEGスペクトル分解
-----
実際のEEG信号は、異なる周波数の混合物として見ることができる。 お問い合わせ
2Hz、10Hzおよび20Hz信号を、複雑な信号混合するとき、次示しました
観察する場合があります。

![center\|alt テキスト](/assets/images/Timefreq1.jpg)

このデータに単純なFourier変換を実行すると、2、10、20Hzで同じ振幅の3つのピークを観察します。

![center\|alt テキスト](/assets/images/Timefreq2.jpg)

これで、実際の EEG 信号を取りましょう。 このような信号を異なる周波数と相(水平オフセット)で副産物に分解することができます。 これらの副鼻腔をまとめると、元の信号を回復することがあります。 これは、ナッツシェルのFourier theoremです。

![center\|alt テキスト](/assets/images/Timefreq3.jpg)
