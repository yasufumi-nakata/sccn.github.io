---
layout: default
title: Tutorials
nav_title: "チュートリアル"
long_title: Tutorials and other documentation
has_children: true
has_toc: false
nav_order: 3
---
![EEGLABチュートリアル概要画像](/assets/images/tutorial_image.jpg)
# EEGLABチュートリアル

このチュートリアルでは、EEGLABを使用したEEGデータの解析手順を解説します。
EEGLABの動画プレゼンテーションは[オンラインEEGLABワークショップ](/workshops/Online_EEGLAB_Workshop.html)でも参照できます。

EEGLABチュートリアルは多くのセクションに分かれています。
概念ガイドでは、入力データ、MATLABおよびEEGLABのデータ構造など、より高度なトピックを紹介します。

### [EEGLABチュートリアル](/tutorials/)
{%- assign children_list = site.pages | where: "parent", page.title -%}
{% include toc_nav_recursive.html nav=children_list %}

MATLABについて
---------------
MATLABに初めて触れる方は、[MATLABチュートリアル](/tutorials/misc/tutorial_matlab.html)を参照してください。
