---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Welcome to the EEGLAB Wiki
nav_title: "EEGLAB Wikiへようこそ"
layout: home
nav_exclude: true
has_toc: true
---
![EEGLAB概要画像](/assets/images/tutorial_image.png)

# EEGLAB Wikiへようこそ

2003年以来、EEGLAB（[Delorme & Makeig, 2004](/others/EEGLAB_References.html)）は、ヒトEEGおよび関連データの解析のために広く使用される環境となっています。プログラマー、プラグイン開発者、およびユーザーからの貢献に支えられています。この新しい（2021年〜）EEGLABドキュメント改訂版はGitHubでホストされ、使いやすさと更新のしやすさを高めています。ご意見は [eeglab@sccn.ucsd.edu](mailto:eeglab@sccn.ucsd.edu) までお寄せください。

### EEGLABのダウンロード

-    [ハードウェアとソフトウェアの推奨事項](/others/EEGLAB_hardware_and_software_recommendations.html)
-    [EEGLABをZIPファイルとしてダウンロード](/others/How_to_download_EEGLAB.html)
-    [GitからEEGLABをダウンロード](https://github.com/sccn/eeglab)
-    [コンパイル版EEGLABをダウンロード](/others/Compiled_EEGLAB.html)
-    [EEGLABエクステンション／プラグイン](/others/EEGLAB_Extensions.html)
-    [EEGLABリビジョン履歴](/others/EEGLAB_revision_history.html)

### EEGLABドキュメント

EEGLABチュートリアルは、このページの下部セクションで参照できます。
その他のドキュメントは以下の通りです。

-    [EEGLAB参照文献](/others/EEGLAB_References.html)
-    [ICAコンポーネント除去クイックチュートリアル](/tutorials/misc/Quick_Tutorial_on_Rejection.html)
-    [EEGLABと商用EEGソフトウェアの比較](/others/EEGLAB_vs_Commercial_EEG_Software.html)
-    [EEGLABとFieldTripの連携](/others/EEGLAB_and_FieldTrip.html)
-    [オープンソースのOctaveでEEGLABを使用する](/others/Running_EEGLAB_on_Octave.html)
-    [高性能コンピューティング環境でのEEGLAB活用](/others/EEGLAB_and_high_performance_computing.html)
-    [MATLABとPythonでのEEGLAB](/others/EEGLAB_and_python.html)
-    [EEGLABの歴史: 最初の20年（2001-2021）](/others/The_first_decade_of_EEGLAB.html)

### トラブルシューティング

-    [EEGLABメーリングリスト](/others/EEGLAB_mailing_lists.html)
-    [Googleで検索（クエリに「eeglablist」や「EEGLAB」を追加）](http://google.com)
-    [バグ報告と提案](/others/EEGLAB_Bugs.html)
-    [GitHubでバグを報告する](https://github.com/sccn/eeglab/issues)
-    [EEGLABテストケースのダウンロード](https://github.com/sccn/eeglab-testcases)
-    [TIPSとFAQ](/others/TIPS_and_FAQ)
-    [EEGLABフィルターFAQ](/others/Firfilt_FAQ)

<h3><a href="/tutorials"><span style="color: black;">EEGLAB チュートリアル</span></a></h3>
{%- assign children_list = site.pages | where: "parent", "Tutorials" -%}
{% include toc_nav.html nav=children_list %}

<h3><a href="/workshops"><span style="color: black;">ワークショップ</span></a></h3>
{%- assign children_list = site.pages | where: "parent", "Workshops" -%}
{% include toc_nav.html nav=children_list %}
<hr>

<i><font size="-1">このチュートリアルは <a href="mailto:EEGLAB@sccn.ucsd.edu">Arnaud Delorme</a> が執筆し、<a href="mailto:EEGLAB@sccn.ucsd.edu">Scott Makeig</a> がフィードバックと編集を担当しました。その他の重要な貢献者には、Dung Truong、Claire Braboszcz、Makoto Miyakoshi、Ramon Martinez、Devapratim Sarma、Derrick Lock、Hilit Serby、Toby Fernslerなどがいます。</font></i>
