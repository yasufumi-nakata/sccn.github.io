---
layout: default
title: EEGLAB Bugs
nav_title: "EEGLAB バグ"
long_title: EEGLAB Bugs
parent: Support
---
EEGLABのバグ
===
お問い合わせ

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

EEGLABのバグと提案に対処する
---

EEGLAB のバグは [Github EEGLAB] で管理されます。
課題:()https://github.com/sccn/eeglab/issues)。 古い [EEGLAB Bugzilla]
インターフェイス:()https://sccn.ucsd.edu/bugzilla/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&bug_status=ON%20HOLD&bug_status=CHECKDEV&f0=OP&f1=OP&f3=CP&f4=CP&list_id=549&query_format=advanced)
それでも潜在能力を追跡するために使用されているが、非推奨されている
改善。

EEGLABがMATLABで開発されているため、リスクが少ない
EEGLAB を使用して、マシンをクラッシュしたり、ファイルを消去したりします。
MATLAB自体がクラッシュしない限り、不注意。 これは1つの利点です
MATLABの利用

1000について [試験事例](https://sccn.ucsd.edu/wiki/EEGLAB_test_cases) EEGLABコードで毎日実行して、その完全性をテスト
    その機能が安定している。

 EEGLABはオープンソースプロジェクトです。 もっと詳しく知る方法
    どの信号処理も行なわれます。
    機能ソースファイル。 パフォーマンスを調整するには、編集する
    お問い合わせ 注意: うまくいけば、
    Githubのプルリクエストを発行します。 詳細情報を見る
    [コントリビュート]
    EEGLAB:(チュートリアル/コントリビュート/コントリビュート_to_EEGLAB)

バグを報告する方法
---
バグが発生した場合:
-  まず、MATLAB コマンドラインとエラーウィンドウのテキストを注意深くお読みください。
    直接問題を避けることができます。
-  次に、エラーかどうかをテストする
    EEGLABの現在のリリースで発生します。 もしそうなら[Github]をチェックしてください
    EEGLABの課題https://github.com/sccn/eeglab/issues) あなたのかどうかを確認する
    問題は既に報告されています:
    -   問題が報告されている場合は、バグについてコメントする場合があります。
    -   問題が報告されていない場合は、新しいバグを提出することができます。
        「新しい問題」ボタンを押すと、どのように案内されます
        バグを報告するために必要な情報の種類。

EEGLABのファイルエラー
---

EEGLAB自体には含まれていません
precompiled関数(mex関数とも呼ばれます)。 "mexファイルが見つからない場合"または関連するmexファイル
エラーは、EEGLABを非難しません。 しかし、
外部モジュールは、バイナリデータファイルや
ソースのローカリゼーションを実行します。 通常、エラーは、
事前にコンパイルされたファイルは、プラットフォームでは利用できません。
再コンパイルされるには、時々自分でできること - より
お問い合わせ メックスを使用するEEGLABには主に4つのモジュールがあります
ファイル。

-   FieldTrip機能: 一部の機能がエラーになる場合
    FieldTripフォルダが見つからない場合は、[FieldTrip]を参照してください。
    ドキュメントhttps://www.fieldtriptoolbox.org/faq/matlab_complains_about_a_missing_or_invalid_mex_file_what_should_i_do/)
    このような機能を再コンパイルする方法。

-   BIOSIG:BIOSIGのいくつかのリリースには、いくつかの更新されたmexファイルが含まれています
    BIOSIGの最新バージョンを持っているかどうかを確認したい場合があります。
    時々BIOSIGは後方互換性を維持しないので、
    BIOSIGを更新した後のデータを読むとき経験問題。

-   ANT プラグイン: ANT のプラグインは ANT の会社によって作られました。 お問い合わせ
    [ログイン](mailto:info@ant-neuro.com) 更新されたバージョンの
    コンパイルされたバイナリ。

-   ERPSS プラグイン: 単にrecompile decompresserpss.c (タイプ "mex"
    decompresserpss.c は、

いくつかの既知の EEGLAB バグと/または欠落した機能:
---

-   *POP_eegplot.m を使用したEpoch選択:* Epochsが選ばれる
    *eegplot*データスクロールによる拒否はEEGLABに保存されません。
    エポックが拒否されるまでの歴史。 つまり、
    EEGLAB セッションで自動で再現されることはありません。
    ただし、フィールドにラベルの付いたエポックが識別されます。
    データセットと一緒に保存されるEEG.reject.manualrej。 また、
    ラベル付きのエポックが拒否されると、
    EEGLABの歴史の中でこの操作は保存されます。

-   *POP_eegplot.m*を使用してズーム: ズームして選択するとき
    epochs は、データのみ (背景のエポックマークなし) をズームすることができます。

-   *Spectral分析(MATLAB信号処理ツールボックスなし): * 必須
    spec.m 関数は関数 psd.m をエミュレートしますが、機能しません
    お問い合わせ その結果、スペクトルのスケーリング(spectopo.m関数による)
    ※一部異なる場合がございます。 また、未知の理由からspec.m関数
    フィルタアウトした周波数を処理できず、返すことができない
    これらの周波数で誤って高出力。

-   *MATLABバージョンとOS:* MATLABバージョンは異なるバグがあります
    異なるOSとこれらのバグ - 通常、グラフィカルバグ - かもしれない
    EEGLABに影響します。 私たちが知っている最新のものは、MATLABが
    version 2018a (すべてのOS) は、EEGLAB が動作するパッチが必要です。

