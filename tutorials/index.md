---
layout: default
title: Tutorials
long_title: Tutorials and other documentation
has_children: true
has_toc: false
nav_order: 3
---
![第17回EEGLABワークショップのマグカップ](/assets/images/tutorial_image.jpg)
# EEGLABチュートリアルへようこそ

このチュートリアルは、基本的なEEGLAB関数と処理入門です。 
参照することもできます。 [オンラインワークショップ](/workshops/Online_EEGLAB_Workshop.html) EEGLABを提示する動画のリストが含まれています。  

EEGLAB チュートリアルは 4 つの部分に分割され、その最後には
おすすめ商品 付録では、ユーザーはより高度に導入されます
入力データフォーマットやMATLABなどのEEGLABの技術的要素
データ構造。 これらのトピックはユーザーに完全に提示されます
EEGLABシステムのアーキテクチャ等について記述します。

ここでは、単一のサブジェクトレベルでEEGデータを処理するときに取ることができる最も一般的な手順は次のとおりです。

<h3><a href="/tutorials"><span style="color: black;">エッグラボ チュートリアル</span></a></h3>
{%- assign children_list = site.pages | where: "parent", page.title -%}
{% include toc_nav_recursive.html nav=children_list %}

<!--
### Importing your data and associated events and channel location information:
- [Load data in EEGLAB](/tutorials/single-subject/loading-data-in-EEGLAB)
- [Import or check events data]()
- [Importe channel location](/tutorials/single-subject/channel-locations)

### Pre-processing data
- [Re-referencing](/tutorials/single-subject/preprocessing-tools.html#re-referencing-the-data)
- [Re-sampling](/tutorials/single-subject/preprocessing-tools.html#changing-the-data-sampling-rate)
- [Filtering](/tutorials/single-subject/preprocessing-tools.html#filtering-the-data)

### Visually rejecting bad channels and portions of data
- [Visually rejecting bad portion of data](/tutorials/single-subject/loading-data-in-EEGLAB#rejecting-data)
- [Inspecting channel spectra and scalp maps](/tutorials/single-subject/plotting-channel-spectra-and-maps)

### Epoch data 
- [Extracting data epochs](/tutorials/single-subject/extracting-data-epochs) 
- [Rejecting artefactual epochs]()
- [Selecting and comparing epochs for a single dataset](/tutorials/single-subject/selecting-data-epochs-and-comparing)

### Visualize epoch data measures (for a single data set)
- [plot ERPs](/tutorials/single-subject/data-averaging)
- [plot ERP image](/tutorials/single-subject/plotting-erp-images)

### Working with ICA decomposition
- [Running ICA decomposition](/tutorials/single-subject/decomposing-data-using-ICA)
- [Visually inspecting and removing ICA components](/tutorials/single-subject/inspecting-ica-comp.html)
- [Plotting components contribution to EEG data](/tutorials/single-subject/working-with-ICA-components)

### Time-Frequency decomposition
- [Computing ERSP and ITC for channel and component data](/tutorials/single-subject/time-frequency-decomposition)
-->

MATLAB について 
---------------
MATLABに新しくなったり、リピーターが必要な場合は、素材のご相談はご遠慮ください。 [MATLABのページを立ち上げる](/tutorials/misc/tutorial_matlab.html)

