---
layout: default
title: Download EEGLAB MATLAB
long_title: Download MATLAB version of EEGLAB
parent: Download EEGLAB
nav_order: 1
---
ダウンロード EEGLAB
====

[EEGLABのダウンロード]に移動
ページ:()https://sccn.ucsd.edu/eeglab/download.php) EEGLABの最新バージョンをダウンロードします。 このページの残りの部分は、EEGLABの開発バージョンをダウンロードする方法を説明し、高度なEEGLABユーザーのみに推奨されます。 ビデオでは、EEGLABを実行するためのさまざまなオプションについて説明します。

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/NhKc0arEcbs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

EEGLAB ZIPファイルアーカイブをダウンロード
------------
ZIP形式のEEGLABのダウンロードは、【EEGLABダウンロード】でご利用いただけます。
ページ:()https://sccn.ucsd.edu/eeglab/download.php)。 これには、
最新のリリースと旧バージョン。 ふりがな [EEGLABリビジョン履歴ページ](/others/EEGLAB_revision_history.html) EEGLABのバージョンの変更について説明しています。

zipファイルをダウンロードしないでください [エッグラボ GitHubリポジトリ](https://github.com/sccn/eeglab.git) EEGLABコードベースに含まれていない重要なEEGLABプラグインが欠落しているため。 EEGLABの開発バージョンを使用する場合は、以下の説明としてサブモジュールをクローンし、含めます。

GitHubからEEGLABをクローニング
------------------
2014年以降、GITを利用して最新ダウンロードが可能
EEGLAB の開発バージョンは GitHub からいつでも - このバージョンは
上記ZIPよりも最新です。 開発スキームのため、
EEGLABの最新バージョンは通常最も安定しています。 お問い合わせ
使用方法 [ソース ツリー](https://www.sourcetreeapp.com/) ブランチを可視化する
[EEGLAB GitHub をクローンする]
リポジトリ(Repository)https://github.com/sccn/eeglab.git) どんなことでも
標準 git パッケージ。 クローニング時は必ずご使用ください。
*---recurse-submodule* オプション。 それ以外の場合、重要な EEGLAB プラグインはダウンロードされず、EEGLAB は完全に機能しません。

```
git clone --recurse-submodules https://github.com/sccn/eeglab.git
```

### 支店へのアクセス

マスターブランチは最新のZIPリリースのコピーです。 *デベロップ*
ブランチは更新とバグ修正で最新の安定したコードです。 ほとんどの場合、
*develop* ブランチはデフォルトでクローニングされたブランチです。

他のすべてのブランチは、EEGLABまたは不安定なコードの以前のバージョンを参照してください。
それは集中的な開発下にあります。 EEGLAB コードを更新するには
最新の開発ソース, 単に EEGLAB フォルダをクリックし、
*git pull* を選択します。

### EEGLABへのコード提供

EEGLABにコードを付与し、コードをフォークしてプルリクエストを作成する
以下に示す [サイトマップ](/tutorials/contribute/Contributing_to_EEGLAB.html#forking-the-eeglab-repository)お問い合わせ その他
[サイトマップ](/tutorials/contribute) 追加が含まれています
EEGLABへの貢献について

### リポジトリシステム

EEGLABはRCS(2002-2005)で初めて、CVS(2005-2010)の下、
GIT(2014-)への移行前のSVN(2010-2014)の下。 すべて
移行プロセスでコミットメッセージが保存されています。

