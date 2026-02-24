---
layout: default
---
wikiリリース前に行うため
====

進行状況

- グーグルトラッキングを追加

- EEGLAB: WindowsとMacでGUIのアスペクト比を再考する

- プラグイン:すべてのgithubリポジトリを更新する

- Clean_rawdata wiki に Makoto ASR のページを置く

- リプレース

EEGLAB図の印刷と編集
-----------------------------------

MATLABの図から保存した写真を編集し、それらをフォーマットする
出版物、私達は次のプロシージャを助言します:

-   MATLABの図(*myfigure*)をポストスクリプトイメージとしてエクスポートする
    MATLABコマンドラインで入力することで(*.epsc*形式)

``` matlab
       * >> print -depsc myfigure.eps*
       * >> print -dpdf -r300 myfigure.pdf`*

``` 

-   このようなエディタを使用して、結果の投稿スクリプトまたはPDFイメージファイルを編集する
    Adobe Illustrator として。
-   ベクター化した画像が未編集のビットマップとして表示されている場合
    ポストスクリプトエディタは、MATLABレンダラーを*画家*に変更します。
    MATLABのコマンドラインに入力することで図を保存します。
    数字,


``` matlab
        * >> set(gcf, 'renderer', 'painter') *

``` 

-   透明な地域に画像がある場合、それらをエクスポートします
    マトラボ
    [SVGの特長](http://www.mathworks.com/matlabcentral/fileexchange/7401)
    エクスポートツール(上記PDFは動作しません)
-   見ているイメージがイメージであることを確実にするため
    MATLABコマンドラインタイプに保存および印刷


``` matlab
       *>>set(gcf, 'paperpositionmode', 'auto');*

``` 
-   図内のすべての要素のフォントを変更するには、

```matlab 
       * >> setfont(gcf,'fontsize',16);*

``` 

残念ながら、MATLABの最近のバージョンでは、ベクター化を保存
数字の版が難しくなってきました(STUDY scalpのアーファクト)
トポグラフィ より良いソリューションを見つけるかどうかをお知らせください。

