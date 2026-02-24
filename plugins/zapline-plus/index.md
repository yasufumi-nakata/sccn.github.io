---
layout: default
title: Zapline-Plus
nav_title: "Zaplineプラス"
long_title: Zapline-Plus
parent: Plugins
render_with_liquid: false
nav_order: 10
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/sccn/zapline-plus).

# Zaplineプラス
EEG/MEGデータからラインノイズを除去するZapLine関数の改善。 削除するコンポーネントの数の自動検出を追加し、非ステーションのアカウントにデータをセグメントにチャンクします。

ノイズツールの依存性は、アライン・デ・チェヴェーニャの許可を得て提供されます。 オリジナルのレポジトリをご覧ください。 [http://audition.ens.fr/adc/NoiseTools/](http://audition.ens.fr/adc/NoiseTools/)

# クイックスタート
```matlab
cleanedData = clean_data_with_zapline_plus(data,srate);
```

EEGlabの宇宙に住んでいる場合:
```matlab
EEG = clean_data_with_zapline_plus_eeglab_wrapper(EEG,struct('noisefreqs',[50])) % specifying the config is optional
```

# お問い合わせ

オリジナルのザップライン紙:チェヴェーニョ、アライン・デ・2020。 「ZapLine:電力線アーティファクトを除去するシンプルで効果的な方法」 NeuroImage 207(2月):116356。 [https://www.sciencedirect.com/science/article/pii/S1053811919309474](https://www.sciencedirect.com/science/article/pii/S1053811919309474).

Zapline-plusのペーパー:Klug、M。およびN. A. Kloosterman。2021。 「Zapline-plus: M/EEGにおける周波数特異ノイズアーティファクトの自動および適応除去のためのZapline拡張」 バイオRxiv。 [https://www.biorxiv.org/content/10.1101/2021.10.18.464805.abstract](https://www.biorxiv.org/content/10.1101/2021.10.18.464805.abstract).

# バージョン

- v1.0、初期バージョン
