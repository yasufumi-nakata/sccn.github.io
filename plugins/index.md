---
layout: default
title: Plugins
nav_title: "プラグイン"
has_children: true
has_toc: true
nav_order: 7
---
# EEGLABプラグインのドキュメント

以下はGitHubからコピーされたドキュメントを持つプラグインのリストです。 EEGLABのプラグインは、すべてのプラグインのドキュメントは、EEGLABのウェブサイト上の視覚化と検索機能と互換性があるので、これはすべてのEEGLABプラグインの小さなサブセットです。 プラグインの完全なリストが見つかります [詳しくはこちら](https://sccn.ucsd.edu/eeglab/plugin_uploader/plugin_list_all.php).

## インポート
* [EEG-BIDS](/plugins/EEG-BIDS): EEGデータのBIDS形式へのインポート/エクスポート
* [NWB-io](/plugins/NWB-io): NWB形式へのインポート/エクスポート
* [BVA-io](/plugins/BVA-io): BrainVision Analyzer形式の入出力
* [MFF-matlab-io](/plugins/MFF-matlab-io): EGI MFF形式の入出力
* [Neuroscan-io](/plugins/Neuroscan-io): Neuroscan形式の入出力
* [CTFimport](/plugins/CTFimport): CTF形式のインポート
* [get_chanlocs](/plugins/get_chanlocs): スキャンされたチャネル位置のインポート

## プロセス
* [ICLabel](/plugins/ICLabel): EEGデータの独立成分を自動分類
* [Viewprops](/plugins/Viewprops): ICLabelのICAコンポーネントプロパティ表示
* [DIPFIT](/plugins/DIPFIT): EEGデータの独立成分のソースローカリゼーション
* [ROIconnect](/plugins/ROIconnect): 関心領域（ROI）間の接続解析
* [AMICA](/plugins/AMICA): Adaptive Mixture ICA（独立成分分析）の計算
* [clean_rawdata](/plugins/Clean_rawdata): ASRを使用したチャネルおよびデータ区間のアーティファクト除去
* [LIMO](/plugins/LIMO): EEGデータの線形モデリング
* [SIFT](/plugins/SIFT): ICAコンポーネント間の接続解析
* [groupSIFT](/plugins/groupSIFT): グループレベルのSIFT解析
* [BrainBeats](/plugins/BrainBeats): EEGと心拍の同時解析
* [Zapline-Plus](/plugins/Zapline-Plus): ラインノイズの除去
* [CleanLine](/plugins/CleanLine): ラインノイズの除去（周波数ベース）
* [EEGstats](/plugins/EEGstats): EEG統計量（パワー、アルファピーク、非対称性）の計算
* [trimOutlier](/plugins/trimOutlier): EEGの外れ値を除去
* [fMRIb](/plugins/fMRIb): EEGからfMRIアーティファクトを除去
* [IMAT](/plugins/IMAT): EEGデータの独立モジュレータの検出
* [NIMA](/plugins/NIMA): 測定投影を用いたICAコンポーネントのクラスタリング
* [PACT](/plugins/PACT): ECoGの位相振幅カップリング計算
* [NFT](/plugins/NFT): Neuroelectromagnetic Forward Head Modelingを用いたICのソースローカリゼーション
* [PACTools](/plugins/PACTools): 複数の手法による位相振幅カップリング計算
* [ARfitStudio](/plugins/ARfitStudio): EEGの多変量自己回帰モデルのフィッティング
* [PowPowCAT](/plugins/PowPowCAT): ICの交差周波数パワーカップリング計算
* [RELICA](/plugins/RELICA): BootstrapによるICA信頼性解析
* [std_dipoleDensity](/plugins/std_dipoleDensity): ICAコンポーネントのダイポール密度を計算
* [FirFilt](/plugins/FirFilt): EEGデータのFIRフィルタリング
* [NSGportal](/plugins/NSGportal): Neuroscience Gateway（NSG）での計算実行

