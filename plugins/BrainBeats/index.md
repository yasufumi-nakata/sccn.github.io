---
layout: default
title: BrainBeats
long_title: BrainBeats
parent: Plugins
render_with_liquid: false
nav_order: 9
---
プラグインソースコードを表示するには、プラグインのコードをご覧ください [GitHubリポジトリ](https://github.com/amisepa/BrainBeats).

<!-- <p align="center"> -->
# ブラインビート
<!-- </p> -->

<p align="center" width="100%">
  <img width="30%"alt="BrainBeatsロゴ"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/brainbeats_logo2.png">
</p>


BrainBeatsツールボックスは、EEGLABプラグインとして実装され、脳心臓のインタープレイ研究のためのEEGおよび心臓血管信号(ECGおよびPPG)の共同処理と分析を可能にします。 一般的なユーザーインターフェイス(GUI)とコマンドラインの両方がサポートされています(チュートリアルを参照してください)。 BrainBeatsは現在サポートしています: 1)ハートビートが進化する潜在能力(HEP)と振動(HEO); 2) EEGおよびHRVの特徴の抽出; 3) EEG信号からの心アーティファクトの抽出; 4) 脳中心の凝集。

 
## 4つの方法利用できる

<p align="center" width="100%">
  <img width="50%"alt="BrainBeats 図"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/diagram.png">
</p>


1) EEG データを ECG や PPG 信号を用いたハートビートの潜在能力(HEP)解析に処理します。 ステップには、EEGおよび心血管信号の信号処理、RピークマーカーをEEGデータに差し込み、Rピーク周辺のセグメント化、最適なウィンドウ長、および時間頻度分解が含まれます。


<p align="center">
    被写体レベルでのHEPの例は、同時EEG-ECG信号(心臓フィールドアーティファクトはイラスト用に保存されました)から得られたものです。
</p>
<p align="center" width="100%">
  <imgの幅="50%"alt="BrainBeats fig11"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/fig11.png">
</p>

<p align="center">
    被験者レベルのHEPの例では、同時EEG-PPG信号から得られる(PPGでは、電気および機械式心臓イベント間の遅延が正しいため、推定心拍時間はECGのRピークに相当する;～200-400 ms)。
</p>
<p align="center" width="100%">
  <imgの幅="50%"alt="BrainBeats fig17"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/fig17.png">
</p>

2) EEG および HRV を、時間、頻度および非線形ドメインの連続的なデータから抽出して下さい。 
    - HRVの時間ドメイン:SDNN、RMSSD、pNN50。
    - HRVの頻度ドメイン:VLF力、ULF力、LF力、HF力、LF:HFの比率、合計力。 
    - HRV 非線形ドメイン: ポーンケア、ファジーエントロピー、フラクタルディメンション、PRSA。 
    
    - EEG周波数ドメイン:平均帯域電力(デルタ、テタ、アルファ、ベータ、ガンマ)、個々のアルファ周波数(IAF)、アルファ非対称。
    - EEG非線形ドメイン: 不潔なエントロピー、僅かな次元


<p align="center">
    HRVおよびEEGデータから推定される電力スペクトル密度(PSD)の例
</p>
<p align="center" width="100%">
  <img 幅="50%"alt="BrainBeats fig21"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/fig21.png">
</p>

<p align="center">
    サンプルデータセットから抽出されたEEG機能の例
</p>
<p align="center" width="100%">
  <imgの幅="50%"alt="BrainBeats fig22"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/fig22.png">
</p>

3) ICAおよびICLabelを使用してEEG信号から中心の部品を取除いて下さい。
   
<p align="center">
    EEG信号からの心血管成分の抽出例
</p>
<p align="center" width="100%">
  <imgの幅="50%"alt="BrainBeats fig27"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/fig27.png">
</p>

4) 計算の脳中心の一貫性(ベータ版、テストし、フィードバックを与えて下さい)
   
<p align="center">
    同時EEGおよびECG信号からBrainBeatsと計算される複数の脳心臓のコヒーレンス対策の例
</p>
<p align="center" width="100%">
  <img 幅="50%"alt="BrainBeats coh_all"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/coherence_allfreqs.png">
</p>

<p align="center">
    各周波数帯域のECG信号と共存するスカルプ地域を示すスカルプトポグラフィ
</p>
<p align="center" width="100%">
  <img 幅="50%"alt="BrainBeats coh_topo"
       ログインhttps://raw.githubusercontent.com/amisepa/BrainBeats/main/figures/coherence_topo.png">
</p>


## よくある質問

- MATLAB インストール (https://www.mathworks.com/downloads)
- EEGLAB インストール (https://github.com/sccn/eeglab)
- 同じファイル内のEGGおよび心血管信号(ECGまたはPPG)を含む一部のデータ(同時に記録される)。
  「sample_data」フォルダにあるこのリポジトリで提供されるチュートリアルデータセットを使用します。 ソース: サブ-32 で https://nemar.org/dataexplorer/detail?dataset_id=ds003838

## ステップバイステップチュートリアル

サンプルデータセットを使用してステップバイステップチュートリアルの出版物を参照してください。 https://www.jove.com/t/65829/brainbeats-as-an-open-source-eeglab-plugin-to-jointly-analyze-eeg

フルテキストのプレプリント: https://www.biorxiv.org/content/10.1101/2023.06.01.543272v3.full

## バージョン履歴

v1.5 (5/2/2024) - METHOD 4(脳心凝集)追加

v1.4 (4/1/2024) - 出版物 ジョーブ(方法1、2、3)

## BrainBeats を使用する場合は、cite を使用してください。

Cannard、C.、Wahbeh、H.、&Delorme、A.(2024)。 BrainBeats はオープンソースの EEGLAB プラグインとして、EEG と心血管シグナルを共同解析します。 視覚化実験ジャーナル:JoVE, (206).


## BrainBeats が使用して引用しました:

Carbone、F.、Silva、M.、Leemann、B.、Hund-Georgiadis、M.、およびHediger、K. (2025)。 登録報告ステージI: 最小限の意識状態にある患者のための動物支援治療の神経質および生理学的効果: ランダム化、制御されたクロスオーバー研究。 神経科学。

Balasubramanian, K. ら. (2025). 生物医学的信号分析における複雑性対策:EEG、ECG、慣性圧力、およびPhotoplethysmogramモダリティを横断した臨床的に囲まれた調査。 IEEEアクセス

パーク, S. ら. (2025). モーターイメージベースの脳コンピューターインターフェースにおけるハートビートの潜在能力の影響を考慮して、エラー関連のポテンシャルの単一trial検出を改善します。 生物学と医学のコンピュータ、195、110563。

Abdullah, J. ら. (2025). 異なるオルガン間の相関の数学的解読 活動:レビュー。 フラクタール。

Carbone、F. ら。 (2025). 登録報告ステージI: 最小限の意識状態にある患者のための動物支援治療の神経質および生理学的効果: ランダム化、制御されたクロスオーバー研究。 神経科学。

Remiszewski、M. (2025)。 長期エアロビクス運動は、身体的に不活性な若い成人におけるうつ病および不安の症状を緩和し、免疫制御試験を強化します。 スポーツと運動の心理学、102939。

Chowdhury, ら. (2025). 神経信号、機械学習、内面音声認識の未来。 1637174年 人間神経科学のフロンティア

Naaz, R., & アーマド, S. (2025). ECGとは マシンラーニングを用いたアラヒスミアの検出のためのデータマイニングアプローチ。 デバイスインテリジェンス、コンピューティング、通信技術(DICCT)に関する第3回国際会議(pp.52-57) お問い合わせ

Cheng、X。、 Maess、B、Schirmer、A. (2025)。 持続するプレジャー: 長時間の優しいストロークで、コンバージェントニューラルプロセスのアンダーピン快適性。 皮質。

Georgaras、E.、Vourvopoulos、A. (2025)。 脳の生理学的評価, 心血管, そして、マルチモーダルモーター画像脳コンピュータインタフェーストレーニングの呼吸器変化. 生物医学工学および技術の研究、12(1)、2471680。

公園、S.、 ハ, J., & キム, L. (2025). モーターイメージベースの脳コンピューターインターフェースにおけるハートビートの潜在能力の影響を考慮して、エラー関連のポテンシャルの単一trial検出を改善します。 生物学と医学のコンピュータ、195、110563。

ペレス, T. M., ドレイク, E., & Sullivan, S. (2024). 中枢神経系および末梢神経系を健康成人の人口における安静および不快な条件で機能する評価: 実現可能性調査 オーストラリアのカイロプラクティックジャーナル(オンライン)、51(1)、1-32。

Akuthota, S., Rajkumar, K., & Janapati, R. (2024). モーターImageryBCIのインテリジェントなEEGアーティファクト除去:FCIF、FCFBCSPの統合とSNR、PSD、およびスペクトルコヒーレンス評価でDNNを変更。 2024年 国際サーキット、システム、通信に関する国際会議(ICCSC)IEEE

Ingolfsson ら. (2024). Brainfusenet: eeg-ppg-accelerometerセンサーの融合と効率的なエッジの展開によるウェアラブルなシズレ検出を強化。 バイオメディカル回路およびシステムに関するIEEE取引

フィールド、C.、ら。 (2024)。 空間的に区切られたリビングシステム間の絡み合いを検索: 実験設計、結果、学習したレッスン。 Biophysica、4(2)、168-181。

Cannard、C.、Delorme、A.、およびWahbeh、H.(2024)。 超短・ポータブル・低コスト測定で、HRVとEEGの相関を識別します。 バイオRxiv、2024-02。

Arao, H., Suwazono, S., 木村, A., 浅野, H., & Suzuki, H. (2023). 外部耳の運河で聴講イベント関連の潜在的な測定: 新しい電極とエラーフィードバックパラダイムを用いた実証実験。 欧州神経科学ジャーナル, 58(11), 4310-4327.

Goodwin, A. J., ら. (2023). 真実ヘルツ—集中ケアユニットで記録された生理学的な波形と脳波の信号の同期。 生理学的測定、44(8)、085002。
