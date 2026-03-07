---
layout: default
title: Setting up your lab
nav_title: "ラボの設定"
long_title: Setting up your lab
parent: Concepts guide
grand_parent: Tutorials
nav_order: 1
---

このサイトでは、EyGLab が機能する機能を利用しています。 

![2023-10-05 に 5 02 02 02 02 02](https://github.com/sccn/sccn.github.io/assets/1872705/9245aecd-dd9b-4b14-a551-0c4e89051248)

EEG研究成果が重要である。 脳機能と行動に関する研究は、脳機能と脳機能と脳機能の融合を捉えています。
筋活動、眼球運動、環境ノイズ、電極インピーダンスの問題など、アーティファクトを含むデータ品質の低いEEGデータは、解析結果に誤差やバイアスをもたらす可能性があります。高品質なデータを最初から取得することが、事後的なアーティファクト除去よりもはるかに重要です。

事後的なアーティファクト除去は時間がかかり、複雑であり、[統計力の低下](https://www.nature.com/articles/s41598-023-27528-0)につながる可能性があります。高品質なデータを最初から確保することで、分析プロセスがより効率的になり、時間とリソースを節約できます。

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>

# EEGシステム

EEG（脳波計測）は、さまざまなメーカーの研究用システムを使用して行われます。主な研究用EEGシステムは以下のとおりです。

* Brain Products：LED付きキャップによるインピーダンスチェック機能を備えたアンプを提供しています。

* BioSemi：優れた信号品質と低ノイズで知られるアクティブ電極システムです。CMS/DRLノイズ低減方式（以下参照）を使用しており、インピーダンスを直接測定することも可能です。

* Neuroscan（Compumedics）：臨床研究に特化した、最も歴史のあるEEG企業の一つです。

* g.tec：ワイヤレスおよびモバイルシステムを専門とし、ニューロフィードバックやブレイン・コンピュータ・インターフェースの分野で実績があります。

* ANT Neuro：20年以上の歴史を持つEEGメーカーです。

* EGI/Magstim（旧Philips Neuro）：水系電極システムで知られ、高品質なゲルキャップも製造しています。

これらはEEG研究における主要なメーカーです。データ品質はアンプよりも電極キャップに大きく依存します。アンプの技術は十分に確立されているためです。

コンシューマー向けEEGシステム：

* Emotiv：Epoc+などの16チャンネルのコンシューマーEEGシステムを提供しており、より多くのチャンネルオプションもあります。基本的な脳研究や教育目的に使用されています。

* Muse：瞑想やウェルネス向けのヘッドバンド型EEGデバイスです。少数のチャンネルを使用しています。

* OpenBCI：オープンソースのEEGハードウェアおよびソフトウェアプラットフォームです。

**コンシューマーグレードEEG** の主な問題は、頭皮との接触品質とチャンネル数の少なさです。研究グレードのシステムと比較すると、信号品質が低い場合があります。

**臨床用EEGシステム**（日本光電等）は、臨床診断用に設計されたシステムであり、研究用途としてはチャンネル数が限られている場合があります。

ゲルベースのシステムでは、電極と頭皮の接触を確保するためにゲルが使用されます（以下の「ドライ対ウェット電極」セクションを参照）。

上記はEEGシステムの一般的なリストです。

## アクティブ対パッシブ電極

EEG電極にはアクティブ電極とパッシブ電極の2種類があります。それぞれの特徴は以下のとおりです。

* ノイズ低減：アクティブ電極は内蔵のプリアンプにより、伝送中のノイズを低減します。パッシブ電極はノイズの影響を受けやすくなります。

* 内蔵プリアンプ：アクティブ電極には内蔵の増幅回路があり、電極の近くで信号を増幅するため、電磁干渉の影響を低減します。パッシブ電極にはこの回路がありません。

* 入力インピーダンス。 活動的な電極: 通常、非常に高い入力インピーダンスを持っています。つまり、それらはスキャルプから非常に少し電流を描画し、電極とスキャルプ間の接触インピーダンスを減らします。 受動の電極: これらの電極は、増幅回路を持っていないため、多くの場合、より高い接触インピーダンスを持っています。 これはより高い接触のインピーダンスおよび潜在的に信号のゆがみをもたらすことができます。

* 信号の質。 活動的な電極: 内蔵の増幅回路と低騒音特性で、アクティブ電極は、パッシブ電極と比較して、より高い信号品質とより良い信号対ノイズ比を提供する傾向があります。 受動の電極: 騒音や干渉の影響を受けやすいため、パッシブ電極は信号品質を低下させ、ノイズ比を下げる可能性があります。

* 複雑さとコスト。 活動的な電極: アクティブ電極は通常、信号増幅のための追加の回路を必要とするため、より複雑で洗練されたです。 この複雑性は、より高い製造コストにつながることができます。 受動の電極: パッシブ電極は、設計がシンプルで、追加の増幅回路を必要としないため、複雑で安価で製造できます。

* 頭皮の準備：アクティブ電極は高入力インピーダンスを持つため、頭皮の準備が少なくて済む場合があります。パッシブ電極は良好な接触のために、より徹底した頭皮の準備が必要です。

概要では、アクティブ電極は増幅回路を内蔵しており、ノイズ低減、高信号品質を提供し、パッシブ電極と比較してより高い入力インピーダンスを持っています。 しかし、より複雑で高価です。 パッシブ電極は、一方、内蔵の増幅回路が欠如し、より騒音と干渉を拾うことができるため、信号品質が低下します。 よりシンプルで安価ですが、より徹底的なスキャルプ準備が必要です。

過去にはアクティブ電極が高価でしたが、現在では価格差は小さくなっています。研究目的では、アクティブ電極の使用が推奨されます。

## CMS/DRLとは?

CMS/DRL（Common Mode Sense / Driven Right Leg）は、BioSemiシステムで使用されるノイズ低減方式です。

EEGでは、各電極が脳からの電気信号を記録します。これらの信号は脳活動の電位変化を反映しています。

CMS/DRLシステムでは、共通モードの信号をアクティブに除去することで、環境ノイズの影響を低減します。従来のグランド電極に比べてノイズ除去性能が優れています。

CMSはすべての電極からの共通信号を測定し、DRLはこの共通信号を被験者の体に戻すことでノイズをキャンセルします。この方式により、従来のグランド参照方式と比べてより効果的にノイズを低減できます。

BioSemiはCMS/DRLシステムを使用する代表的なメーカーです。

## ドライ対ウェット電極

電極の種類には、ドライ電極とウェット電極があります。それぞれに利点と欠点があります。

* ドライ電極：導電性ゲルを使用せずに頭皮に直接接触します。*利点:* 準備が簡単で、ゲルの煩わしさがありません。*注意:* インピーダンスが高くなる傾向があり、信号品質がウェット電極より低い場合があります。

* ウェット電極（ゲル電極）：導電性ゲルまたはクリームを使用して電極と頭皮の電気的接続を確保します。*利点:* 低インピーダンスを実現し、優れた信号品質を提供します。準備時間は通常30分〜1時間です。

* 水系電極（スポンジ電極）：導電性の水溶液を含んだスポンジを使用します。*利点:* ゲル電極と比較して準備が容易です。*欠点:* ゲル電極ほど低いインピーダンスは得られない場合があります。

一般的に、研究目的ではウェット（ゲル）電極が最も高い信号品質を提供します。ドライ電極は利便性に優れていますが、信号品質に妥協が必要な場合があります。研究の目的と要件に応じて適切な電極タイプを選択してください。


# EEGデータレシピ

## 環境騒音

EEG記録において環境ノイズは重要な問題です。理想的にはファラデーケージの中で記録を行うのが最善ですが、ファラデーケージの外でも適切な対策を取ることで良好な記録環境を確保できます。

* EEG記録室は、電気機器から離れた場所に設置してください。特に、壁に取り付けられた電気配線やコンセントには注意が必要です。

* 被写体と実験者は別の部屋で隔離されるべきです。 インターコムと通信する場合、インターホンが被写体から遠く離れていることを確認してください。 信号を送信するために電気回路に依存するインターコムを使用しないでください。

* 被写体(または非常に近い)に触れる金属オブジェクトを削除します。 例えば、被写体は金属の椅子に座ってはいけません。 被写体が刺激に反応する必要がある場合は、ボタンプレスまたはマウスパッドが非金属であることを確認してください。

* モニターやノートパソコンは被験者から離して設置してください。刺激提示用のノートパソコンを使用する場合は、バッテリー駆動で実行することでノイズを低減できます。

* おそらく彼の体にアンテナとして使用できるものを取除くという主題のための良い考えです(例えば、金属製の時計)。 

* 刺激提示用の画面は被験者から少なくとも50cm以上離して設置してください。CRTモニターは電磁干渉の原因となるため、LCDモニターの使用を推奨します。

## ゲルの適用

導電性ゲルを各電極の下に注入し、ゲルが頭皮に到達するまで注入してください。被験者が痛みを感じないように注意しながら、先の丸いアプリケーターで頭皮を軽くこすってインピーダンスを下げます。

被写体の頭皮をわずかに刺激し、5分間髪を磨くように依頼すると、電極のインピーダンスが減少し、信号の品質が増加する可能性があります。 

## インピーダンスの確認

電極インピーダンスの減少とデータ品質の最大化(アクティブ電極を用いた高インピーダンスシステムでも)が重要である。 各電極が良好な接続が重要であることを確認してください。 また、参照電極が可能な限り最善であることを保証することは重要です。 この電極にノイズがあると、他のすべての電極に反映されます。 

## 走査の電極の位置

電極の位置をスキャンすることで、正確なソースローカリゼーションが可能になります。3Dスキャナーやデジタイザーを使用して電極位置を記録できます。詳しくは[こちら](https://github.com/sccn/get_chanlocs/wiki)を参照してください。

## EEGの同期

EEGデータにおけるイベントの同期は、ミリ秒単位の精度が求められます。EEGシステムと刺激提示システムの同期方法にはいくつかの選択肢があります。

* パラレルポートまたはシリアルポートを使用してイベントマーカーを送信するのが最も一般的な方法です。ほとんどのEEGシステムはこの方式をサポートしており、ミリ秒以下の精度を確保できます。

* ワイヤレスEEGシステムでは、イベントマーカーの送信にLSL（Lab Streaming Layer）が使用されます。

* LSL（Lab Streaming Layer）は、EEGシステムと刺激提示ソフトウェア間のデータストリーム同期に使用できます。イベント関連研究では、EEGは1kHz以上のサンプリングレートで記録することが推奨されます。

*注意：このページはArnaud Delormeの個人的な意見に基づいています*

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
