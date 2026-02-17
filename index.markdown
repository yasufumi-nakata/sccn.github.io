---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Welcome to the EEGLAB Wiki
nav_title: "EEGLAB Wikiへようこそ"
layout: home
nav_exclude: true
has_toc: true
---
![EEGLABのまとめ画像](/assets/images/tutorial_image.png)
<!-- <a href="https://eeglab.org/workshops/EEGLAB_2022_UCSD.html" style="color:red; font-size:30px">EEGLAB San Diego (Nov 2022) workshop registration open!</a>
-->

# EEGLAB Wikiへようこそ

2003年以来、EEGLAB([Delorme & Makeig, 2004](/others/EEGLAB_References.html))は、人間EEGや関連データ分析のために非常に広く使用される環境になりました。プログラマー、プラグインツールの作者、およびユーザーからの貢献に支えられています。この新しい(2021-) EEGLABドキュメント改訂版はGitHubでホストされ、使いやすさと更新のしやすさを高めています。ご意見は [eeglab@sccn.ucsd.edu](mailto:eeglab@sccn.ucsd.edu) までお寄せください。

### ダウンロード EEGLAB

-    [EEGLABハードウェアとソフトウェア推奨事項](/others/EEGLAB_hardware_and_software_recommendations.html)
-   [EEGLABをZIPファイルとしてダウンロード](/others/How_to_download_EEGLAB.html)
-    [GITからEEGLABをダウンロード](https://github.com/sccn/eeglab)
-    [EEGLABのコンパイル版をダウンロード](/others/Compiled_EEGLAB.html)
-    [EEGLABエクステンション/プラグイン](/others/EEGLAB_Extensions.html)
-    [EEGLABリビジョンの歴史](/others/EEGLAB_revision_history.html)

### EEGLABのドキュメントページ

EEGLABチュートリアルは、このページの次のセクションで利用可能です。
ドキュメントの他の種類は以下に記載されています。

-    [EEGLAB 参照記事 - お問い合わせ](/others/EEGLAB_References.html)
-    [速いICA コンポーネントの拒絶チュートリアル](/tutorials/misc/Quick_Tutorial_on_Rejection.html)
-    [EEGLABと商用EEGソフトウェアの使用](/others/EEGLAB_vs_Commercial_EEG_Software.html)
-    [EEGLABとFieldTripと連携](/others/EEGLAB_and_FieldTrip.html)
-    [オープンソースオクターブでEEGLABを使用する](/others/Running_EEGLAB_on_Octave.html)
-    [高性能コンピューティングリソースでEEGLABを活用](/others/EEGLAB_and_high_performance_computing.html)
-    [MATLAB と Python の EEGLAB](/others/EEGLAB_and_python.html)
-    [エッグラボ 歴史: 2001-2021年の最初の2年](/others/The_first_decade_of_EEGLAB.html)

### トラブルシューティング

-    [eeglablist@sccn.ucsd.edu に問い合わせてください。](/others/EEGLAB_mailing_lists.html)
-    [Googleを使用して - クエリに「eeglablist」または「EEGLAB」を追加](http://google.com)
-    [バグと提案](/others/EEGLAB_Bugs.html)
-    [Githubのバグ問題投稿](https://github.com/sccn/eeglab/issues)
-    [EEGLABテストケースをダウンロード](https://github.com/sccn/eeglab-testcases)
-    [その他のTIPSとFAQ](/others/TIPS_and_FAQ)
-    [EEGLABフィルターFAQ](/others/Firfilt_FAQ)

<h3><a href="/tutorials"><span style="color: black;">エッグラボ チュートリアル</span></a></h3>
{%- assign children_list = site.pages | where: "parent", "Tutorials" -%}
{% include toc_nav.html nav=children_list %}

<h3><a href="/workshops"><span style="color: black;">ワークショップ</span></a></h3>
{%- assign children_list = site.pages | where: "parent", "Workshops" -%}
{% include toc_nav.html nav=children_list %}
<hr>

<i><font size="-1">このチュートリアルは、 <a href="mailto:EEGLAB@sccn.ucsd.edu">アーノード
デルオルム</a> フィードバックと編集から <a href="mailto:EEGLAB@sccn.ucsd.edu">スコット・マディグ</a>お問い合わせ その他の重要なコントリビューターには、ダン・トゥルン、クレア・ブラボスツ、マコト・ミヤコシ、ラモン・マルティネス、デバプラティム・サルマ、デリック・ロック、ハイリット・セルビー、トービー・フェルンズラーなどがあります。</font><i>
