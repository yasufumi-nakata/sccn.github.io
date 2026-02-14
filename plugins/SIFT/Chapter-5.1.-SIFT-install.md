---
layout: default
parent: SIFT
grand_parent: Plugins
render_with_liquid: false

title: Chapter-5.1.-SIFT-install
long_title: Chapter-5.1.-SIFT-install
---
※Matlab® 2008a** 以降、シグナルをお持ちのお客様
ツールボックス、統計ツールボックス、
[エッグラボ](http://sccn.ucsd.edu/eeglab/) そして、
[シャフト](http://sccn.ucsd.edu/wiki/SIFT#SIFT_Downloads) ツールボックス。 SIFT は EEGLAB (10 以降) のすべてのバージョンで動作します。 EEGLAB 2023.1でチュートリアルのこのバージョンがテストされました。

*get が起動しました**, これらの手順に従ってください:

1円 MATLABを起動する

2\) [ダウンロード EEGLAB](https://sccn.ucsd.edu/eeglab/download.php)お問い合わせ パスに EEGLAB ルートフォルダーを追加します。 (**File -\> Set Path; Add
フォルダ**

3円 タイプ: `eeglab` コマンドプロンプトで

4円 EEGLABメニュー項目「拡張の管理」でSIFTを選択し、インストールします。

5円 オプション: ARfit を使う場合
モデルフィットアルゴリズム。 手動でインストールする必要があります
次のようにします。 無料のARfitパッケージをダウンロード
<https://climate-dynamics.org/software/#arfit>お問い合わせ ダウンロード後
ARfitパッケージを解凍し、**/arfit/**フォルダを
**SIFT-path/external/** **SIFT-path** が完全なパスである場合
SIFTルートディレクトリ。

6円 EEGLABメインGUIが見えると、行くのは良い! お問い合わせ
EEGLABメニューでSIFTを見つけます。 **Tools-\>SIFT**. SIFTは
EEGLABを起動すると自動的にアクセス可能になります。

**SIFT GUIの重要な注意:** 残念ながら、SIFT GUI は、Mathworks (MATLAB のメーカー) がそれをサポートする機能を変更しました(パラメーターの一部を変更すると、機能がクラッシュしたり、エラーを返すことがあります)。 例えばMACのMATLAB 2023aではGUI編集ボックスは使用できません。 そのため、コマンドラインを使用して異なるオプションを設定することは、場合によっては好ましいです。 このチュートリアルでは、GUIと同等のコマンドライン呼び出しが含まれています。

