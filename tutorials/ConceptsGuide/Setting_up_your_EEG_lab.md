---
layout: default
title: Setting up your lab
long_title: Setting up your lab
parent: Concepts guide
grand_parent: Tutorials
nav_order: 1
---

このセクションでは、EEGラボをセットアップする方法を記述し、良好なEEG高密度データ品質を取得することに重点を置いています。 

![スクリーンショット 2023-10-05 に 5 02 02 02 PM](https://github.com/sccn/sccn.github.io/assets/1872705/9245aecd-dd9b-4b14-a551-0c4e89051248)

EEGの研究ではデータ品質が重要である。 研究者は、脳機能と行動に関する有効な結論を描画するために、クリーンで精密なデータに依存します。
収集したEEGデータにアーティファクトやノイズが含まれている場合は、誤差や誤った結果の無効化につながるエラーやバイアスを紹介します。 
EEGの録音は筋肉活動、目の点滅、環境の干渉および電極のインピーダンス問題を含むさまざまなアーティファクトに敏感です。 これらのアーティファクトは、関心の真の脳信号を隠蔽したり、隠蔽したりする要因を紹介します。 高品質のデータは、観察された脳活動の精度を高め、混乱を減らす、アーティファクトの存在を最小限に抑えます。

悪いデータをクリーンアップしたり、アーティファクトを削除したりすることは、時間がかかります。複雑な作業です。 貧困データ品質は、研究者のワークロードを増加させ、重要な時間と努力を費やす必要があるため、不要な信号を識別し、除去します。 重要なことに、非常に頻繁に、EEGデータからアーティファクトを削除し、そうすることができます [統計力低下](https://www.nature.com/articles/s41598-023-27528-0)お問い合わせ 高品質なデータを最初から確保することで、分析プロセスがより効率的になり、時間とリソースを節約します。 

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

# EEGシステムを使用する

EEG(electroencephalography)は、市場で入手可能ないくつかの評判の良い研究システムがあります。 何十年にもわたって存在している会社がほとんど作られています。 

* 頭脳プロダクト: さまざまなアンプオプションとソフトウェアソリューションを提供しています。 LED付きキャップのインピーダンスを確認する便利な方法を提供します。

* バイオセミ: 同社は、優れた信号品質、低雑音を提供し、その使いやすさのために知られています単一のアクティブ電極システムを提供しています。 この会社は1つのシステムだけを提供し、分析ソフトウェアを提供しないので、他のソリューションよりも安いです。 CMS/DRLノイズリダクション(以下参照)で知られていますが、他の企業も使用しています。 また、一部の研究者(正当な理由)を迷惑にする電極インピーダンス(カスタムオフセット)を直接測定しないために知られています。

* CompumedicsによるNeuroscan: これは、臨床研究に焦点を合わせ、Brainampsに匹敵する最も古い会社です。

* g.tec:g.tekは、神経フィードバックおよび脳コンピュータインタフェース(BCI)アプリケーション用に設計されたワイヤレスおよびモバイルEEGシステムを提供します。 

* ANTの神経: 会社は2年以上前に作成しました。 

* EGI/Magstim(旧Philips Neuro):水系電極システム(ゲルベースと比較して)で知られるこの会社は、数回手を交換しました。 ハードウェアは固体であり、ゲルキャップは業界で最高のものと考えられています。 創業10年を経ち、手が2回変化して以来、イノベーションを続けてきました。 しかし、BIOSEMIは同じアンプを使っています。 EEGは、その速度を進化させません。

これらは、EEG研究の主要企業であり、個人的にはこれらのシステムすべてと連携しています。 EEGデータの増幅はロケット科学ではなく、データの品質は、数十年にわたる技術を使用するEEGアンプよりもキャップにリンクされています。

消費者向けEEGシステムについて、例えば:

* 感情: 例えば、Epoc + 16チャンネルのコンシューマーグレードEEGシステムは、より手頃な価格でアクセス可能なオプションを提供しています。 基本的な脳活動の監視のために適しています、ゲームおよび催し物の適用で頻繁に使用されます。 水系システムです。 EEGアンプは、おそらくOKです(シーケンスの各チャネルをスキャンする1つのアンプがありますが、上記の研究グレードシステムと比較して、電極あたり1つのアンプがあります)、スポーニー電極から来る信号の品質は低いです(ちょうど悪いEEG)。 本システムでは研究をお勧めしておりません。 

* ミューズ:ミューズは異なるヘッドセットを提供していますが、それらのすべてが低いチャンネル数を持っています(5未満)。 ドライシステムと見なされますが、当社は水で濡れた電極を指示し、信号の品質を向上します。 BIOSEMIと同様に、CMS/DRLの補正を使用します。

* OpenBCI:低予算のためのオープンソースの設計を販売します。 同じ備考は、Emotivソリューションに適用されます。

**Consumer-grade EEG** の主な問題は、スカルプ(皮膚(額)に直接録音するとき、信号品質が研究グレードシステムに匹敵する可能性が高い低信号品質です。 主な理由は、スカルプの信号品質がゲルベースの電極システム(これらの消費者システムが使用したくない)を使用することに依存していることです。

*clinical EEGシステムについて**(Nihon_Kohdenなど) これらのシステムは、技術がしばしば古いが、研究システムとして同様の信号品質を提供します(例えば、アクティブ電極を使用しないでください)。 このようなシステムの問題は、低密度の記録(32チャンネル未満)に限られており、EEGと同期した実験的なイベントを記録することが困難であるということです。

私たちは、ここでの研究レベルの**ドライ電極システム**(上記の企業の中には、ドライ電極システムソリューションがあります)について言及していないし、その専門会社(Cognionics、Quasar、ウェアラブルセンシングなど)があります。 ゲルシステム(以下参照)でデータ品質が解析されているとは信じませんので、そのようなシステムを推奨しません。

これは、排気リストを意味しず、利用可能な他の多くの評判可能なEEGシステムがあります。

## アクティブ対パッシブ電極

アクティブおよびパッシブ EEG 電極は、脳活動を測定するために、電気脳図(EEG)で使用される2種類の電極です。 アクティブとパッシブ EEG 電極の重要な違いは次のとおりです。

* デザイン。 活動的な電極: これらの電極は、脳から受け取る弱い電気信号をEEGの記録システムに送信する前に増幅回路を内蔵しています。 受動の電極: これらの電極は、増幅回路を内蔵し、直接脳からEEG記録システムに低電圧電気信号を送信していません。

* 騒音低減。 活動的な電極: 内蔵の増幅回路により、アクティブ電極は、頭皮に近い弱い脳信号を増幅し、騒音や干渉の影響を最小限に抑えることができます。 受動の電極: 増幅回路が不足しているため、パッシブ電極は、録画したEEG信号の品質に影響を与えることができるより多くの騒音と干渉を拾うのに脆弱です。

* 入力インピーダンス。 活動的な電極: 通常、非常に高い入力インピーダンスを持っています。つまり、それらはスキャルプから非常に少し電流を描画し、電極とスキャルプ間の接触インピーダンスを減らします。 受動の電極: これらの電極は、増幅回路を持っていないため、多くの場合、より高い接触インピーダンスを持っています。 これはより高い接触のインピーダンスおよび潜在的に信号のゆがみをもたらすことができます。

* 信号の質。 活動的な電極: 内蔵の増幅回路と低騒音特性で、アクティブ電極は、パッシブ電極と比較して、より高い信号品質とより良い信号対ノイズ比を提供する傾向があります。 受動の電極: 騒音や干渉の影響を受けやすいため、パッシブ電極は信号品質を低下させ、ノイズ比を下げる可能性があります。

* 複雑さとコスト。 活動的な電極: アクティブ電極は通常、信号増幅のための追加の回路を必要とするため、より複雑で洗練されたです。 この複雑性は、より高い製造コストにつながることができます。 受動の電極: パッシブ電極は、設計がシンプルで、追加の増幅回路を必要としないため、複雑で安価で製造できます。

* Scalpの準備。 活動的な電極: アクティブ電極は、より高い入力インピーダンスを持っているので、通常、良好な電気接触を保証するために、導電ゲルのクリーニングやアプリケーションなどのより少ないスキャルプの準備が必要です。 受動の電極: 潜在的な高接触インピーダンスのために、パッシブ電極は、最適な電気接触を達成するために、洗浄およびゲルアプリケーションを含むより徹底的なスキャルプ準備を必要とする場合があります。

概要では、アクティブ電極は増幅回路を内蔵しており、ノイズ低減、高信号品質を提供し、パッシブ電極と比較してより高い入力インピーダンスを持っています。 しかし、より複雑で高価です。 パッシブ電極は、一方、内蔵の増幅回路が欠如し、より騒音と干渉を拾うことができるため、信号品質が低下します。 よりシンプルで安価ですが、より徹底的なスキャルプ準備が必要です。

実際には、過去10年間で、ほとんどのEEGメーカーは、ほとんどのアプリケーションに好まれる有効な電極システムを販売しています。 しかしながら、パッシブシステムによる信号品質の違いは小さい(あなたが持っている場合は、パッシブシステムを使用して続行する必要があります)。

## CMS/DRL補正とは?

CMS/DRL補正は、一般的なモード感覚/差分モード感覚指向の参照レベル補正のスタンドです。 記録された脳信号に共通モードノイズの影響を減らすために使用される技術です。

EEG信号は、一般的なモードノイズを含むさまざまなタイプのノイズに敏感であり、アクティブ電極(頭皮の電極の記録)と参照電極の両方に存在するノイズを指します。 この一般的な騒音は、脳活動の正確な測定を妨げることができます。

CMS/DRL補正は、一般的なモードと差異モード信号を測定するために、被写体(またはスカルプ)に配置された追加の電極を使用して関与します。 共通のモード信号は活動的なおよび参照の電極に存在する騒音を表します、相違モード信号は興味の実際の脳信号を表します。

これらの余分な電極を利用することにより、CMS/DRL補正技術は、主に脳活動を残して、記録されたEEG信号から共通のモードノイズを効果的に引き下げます。 この補正は、信号の品質を改善し、外部干渉やノイズソースの影響を削減することにより、EEG分析の精度を高めることができます。

全体的に、CMS/DRL補正は、信号対ノイズ比を強化し、より信頼性の高いEEG測定を得るための貴重な方法です。 Biosemi社は、他の会社(マウスシステムも使用している)でも、このシステムで知られています。 EEG信号がfaradayケージに記録されると、このタイプの補正は必要ありません。 

## ドライ対ウェット電極

ドライ電極対「ウェット」キャップ対「水性」キャップ。 乾式電極と「湿式」キャップは、脳活性を測定するために電気脳波(EEG)で使用される電極の2種類です。 しかしながら、頭皮と導電材料の使用と接触の面では異なります。

* 乾燥した電極: ドライ電極は、導電ゲルやクリームの使用を必要としません。スカルプとの接触を確立します。 それらはカーボンか金属から普通成り、伝導性を改善するために電極内で造られるシステムがあります。 *Advantages:* 湿式電極と比較して使いやすく、メッシーが少ない。 導電ゲルを適用する必要性がないのでより速いセットアップの時間。 *欠点:* 一般的には、頭皮との接触を低下させるため、信号品質が低下します。 時には硬く、重い。 環境騒音や動きのアーティファクトの影響を受けやすくなります。 長時間にわたる信号安定性を低減。 被験頭痛につながることができる接触を維持するために増加した圧力

* "Wet"キャップ(ゲル電極とも呼ばれる): "Wet"キャップは導電ゲルまたはクリームを使用して、電極と頭皮間の良好な電気接続を確立します。 これらのキャップは、フレキシブルキャップまたはヘッドギアに埋め込まれた複数の電極で構成されています。 *Advantages:* 頭皮とのよりよい接触は、より高い信号の質および減らされた騒音に終ります。 より安定した信号。 *欠点:* セットアップ時間(約30分～1時間) 被験者は自分の髪にゲルを持ち、実験の最後に髪を洗う必要があります。 時間のかかる洗浄プロセスが必要です。

* 「水ベースの」キャップ(例、EGIまたはエモチベーション会社):導電ゲルやクリームの代わりに「水ベースの」キャップを使用して、電極と頭皮間の電気接続を確立します。 これらのキャップは、フレキシブルキャップまたはヘッドギアに埋め込まれた複数の電極で構成されています。 *Advantages:* 速い組み立ての時間。 被験者は実験の終わりに少し濡れた髪を持っているかもしれませんが、すぐに髪を洗う必要はありません。 *割引:* ウォーターブリッジは、データ分析中に後続の問題を作成することができる(2つのチャネル間の直接接続)を形成することができます。 高密度系(128チャンネル以上)は特に問題です。 電極を乾燥させ、20分ごとに再溶接する必要があります。

一般的には、データ品質が不可欠であるため、ウェットゲルベースのシステムで研究を行う必要があります。 その後、これが不可能な場合には、水ベースのシステムは2番目の最良の選択です(例えば、臨床アプリケーションやキャップを調整する30分を費やすことができない子供とのアプリケーション)。 ドライ電極は、オーディオヘッドセット、VRシステム、またはイヤホンに埋め込まれたときにそれらを使用するという意味になりますが、最後の選択です。 


# EEGデータの品質を最大化 - ヒントと祖母のレシピ

## 環境騒音

Faraday ケージの EEG データを録画すると、適切に実行したときに、より良い信号品質とラインノイズが発生しません。 実際には、ほとんどのEEG実験(>80%)は、ファラデーケージの外で行われます。 しかしながら、ファラデーケージの外で録音する場合、録画チャンバーの環境騒音を最小限に抑えることは極めて重要です(これはファラデーケージ内でも重要なことです)。

* 一部の研究者は、建物内の地上信号の品質を阻害しています。 EEG実験のために、電気技師が2番目の地面を作った信号分析で、少なくとも1人のEEG研究者の専門家を知っています。 これは電池で動かないEEGシステムのために特に関連し、壁に差し込まれます。 

* 被写体と実験者は別の部屋で隔離されるべきです。 インターコムと通信する場合、インターホンが被写体から遠く離れていることを確認してください。 信号を送信するために電気回路に依存するインターコムを使用しないでください。

* 被写体(または非常に近い)に触れる金属オブジェクトを削除します。 例えば、被写体は金属の椅子に座ってはいけません。 被写体が刺激に反応する必要がある場合は、ボタンプレスまたはマウスパッドが非金属であることを確認してください。

* 保護されていない電池かバックアップ力を取除いて下さい。 非保護された電池は壁に差し込まれるとき非常に大きい騒音のアーティファクト、特に作成できます。 ノートパソコンは、被写体から遠ざけばOKです。 ノートパソコンは、録画室に被写体を提示した場合、壁に差し込まれて電池で実行しないでください。

* おそらく彼の体にアンテナとして使用できるものを取除くという主題のための良い考えです(例えば、金属製の時計)。 

* コンピュータ画面と光は、EEGの50Hzノイズの主要なソースです。 被写体からできるだけ遠くに置く必要があります。 50Hzの騒音の低減は非常に重要で、実際には50Hzの騒音が低く、騒音が他の周波数で低い。 私たちが使用した1つの技術は、棒に1つの電極を持ち、騒音(出口、スクリーンなど)の源を検出しようとする部屋の周りに行くことです。 EMF のディテクタはおそらくまた使用することができます。 

## ゲルの適用

ゲルで満たされた注射器を使用して、電極をよく押し下げます(従ってゲルは帽子の他の部分に広がりません)、そしてあなたが皮に達するまで針が付いている参加者の毛を分けて下さい。 ゲルを少量ずつ絞っていきます。 被写体が痛みを及ぼすのではなく、しっかりとプレスしてください。 そうでなければ、ゲルは、複数の異なるEEG信号を1つに結合し、頭皮を渡る電極の井戸間で広がります。

被写体の頭皮をわずかに刺激し、5分間髪を磨くように依頼すると、電極のインピーダンスが減少し、信号の品質が増加する可能性があります。 

## インピーダンスの確認

電極インピーダンスの減少とデータ品質の最大化(アクティブ電極を用いた高インピーダンスシステムでも)が重要である。 各電極が良好な接続が重要であることを確認してください。 また、参照電極が可能な限り最善であることを保証することは重要です。 この電極にノイズがあると、他のすべての電極に反映されます。 

## 走査の電極の位置

電極の位置をスキャンするのは簡単です(スマートフォンとアプリは3Dモデルを詳細に構築することができます)、ソースの場所を改善することができます(被写体MRIがない場合であっても)。 あなたがその情報を使用するつもりがない場合でも、体系的に行われるべきです(これを参照してください) [サイトマップ](https://github.com/sccn/get_chanlocs/wiki) 詳しくはこちら 

## EEG同期

実験的なイベントで EEG を同期することは重要であり、ミリ秒の精度で実行する必要があります(心理学では、反応時間の 10 ミリ秒の差が大きいと見なされます)。 ここではいくつかのヒントがあります。

* ビジュアル刺激を使用している場合は、使用している画面を確認してください。 低レイテンシ、高周波数(200Hz以上)のゲーミング画面を使用する可能性があります。 60 Hzの標準的な液晶画面には、見知らぬ動作のすべての種類があります。例えば、画面は4つのハードウェアに分割され、画面の4つのセクションは、目の見えないが網膜や視覚システムに見えない)。 ほとんどの心理物理ソフトウェアは、刺激的なプレゼンテーションのレイテンシーを確認することができます。 しかしながら、研究者は、実験的なイベント信号(実験的なコンピュータから出て、EEGイベントボックスに入った)と視覚刺激が同期していることをフォトダイオードで確認する必要があります。

* ワイヤレスEEGシステムはバッファリングの対象であり、これは考慮に入れる必要があります。 ラボストリーミングレイヤー(LSL)のようなシステムによって部分的に処理されます。

* EEGシステムに直接送信された実験イベント信号のみに依存します。 たとえば、LSLイベントストリームは、EEG(イベントが正確に時間を費やす必要はありません)のサブスタンダードと見なす、いくつかのミリ秒の精度のみを提供します。 LSL を使用している場合でも、EEG (またはシステムに応じて EEG と直接ログオン) の追加のチャネルとして、被写体応答が記録されていることを確認してください。 イベント関連の研究では、EEGは、その理由の少なくとも1Khzサンプリングレートで常に記録されるべきです(それ以外の場合は、1kHz精度でイベントを記録しません)。 

*注意:このページはArnaud Delormeの個人的な意見だけを反映しています*

<!--
# Pre-registration

Once your study has been funded, you might want to preregister it).

Preregistration in science refers to the practice of specifying the details of a scientific study (e.g., research question, methods, data analysis plan) before the data is collected or analyzed. This approach has several advantages:

1. Reduces biases: Preregistration helps prevent the problem of "HARKing" (Hypothesizing After Results are Known) and other forms of bias. By declaring research plans in advance, researchers reduce the temptation to selectively report or analyze only the results that support their hypotheses, which ensures greater transparency and integrity in scientific research. It does not mean that you cannot conduct exploratory analyses, only that you will need to indicate so in your paper.

2. Reproducibility: Preregistration enhances research reproducibility by providing a clear record of the original study plan. 

3. Eliminates p-hacking and data dredging: Preregistration discourages the practice of p-hacking, which involves selectively analyzing or reporting data until a desired statistically significant result is achieved. It also prevents data dredging or "fishing" for statistically significant patterns by exploring multiple hypotheses or variables without clear a priori reasoning.

4. Methodological transparency: Preregistration promotes transparency by requiring researchers to disclose detailed information about the study design, sample size, data collection procedures, and analysis plans. This transparency allows readers to better evaluate the quality and reliability of the conducted research, reducing the chance of publishing erroneous or misleading findings.

5. Improves study design: The process of preregistration encourages researchers to carefully plan and justify their study aims, methods, and statistical analyses in advance. Often, you will see small things that could be improved in your design as you lay down all the details. This leads to a more thoughtful and robust study design and reduces the likelihood of post hoc changes that might compromise the validity of the results.

6. Reduces publication bias: Preregistration helps combat publication bias, where studies with significant or exciting results tend to be published more often than those with nonsignificant or less interesting findings. By preregistering studies, researchers can diminish this bias, as journals are more open to publishing studies with preregistration records regardless of the obtained results.

Overall, preregistration in science promotes transparency, reduces biases, enhances reproducibility, and improves the overall quality of research, contributing to the advancement of knowledge and scientific progress. There are also now 100 journals that publish study protocols before the manuscript is published (see the bottom of this [page](https://hsls.libguides.com/scholarly-communication/where-should-i-publish) for more information). 

The added advantage of pre-registration is **decreased stress** for the researcher. You have already planned everything, and most journals (including prestigious ones) will publish negative results (especially if they published your protocol). -->
