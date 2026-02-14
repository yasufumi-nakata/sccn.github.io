---
layout: default
title: EEGLAB on Octave
long_title: EEGLAB on Octave
parent: Interoperability
---
OctaveでEEGLABを実行する
====
非常に効率的ですが、MATLABは高価です。 2021年と同様に、Octave MATLABに対応したオープンソース環境(コマンドラインコールとグラフィックインターフェイスの両方)をサポートしています。 OctaveでEEGLABを稼働させるための動画をご覧ください。

<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/NhKc0arEcbs?start=206" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

# OctaveでEEGLABを実行する

オクターブのEEGLABは、マトラブのEEGLABとして安定していません。 MatlabのEEGLABは、あなたの最初の選択肢でなければなりません。 あなたの2番目の選択肢は、EEGLABのコンパイルされたバージョンであり、3番目の最後の選択は、OctaveのEEGLABであるべきです。

OctaveとEEGLABをインストールする
-------------------------

Octaveの最新バージョンをダウンロード
ページ:()https://www.gnu.org/software/octave/download.html)。 EEGLABは
WindowsでOctave 6.1を使用してテストされたが、後で実行されるかもしれない
バージョンやその他のプラットフォーム。 すべてのツールボックス(信号処理、統計など)がプリインストールされているWindows用のOctaveインストーラをお勧めします。 
### オプションのオクターブ設定

避ける Octave は、常に警告メッセージを表示し、起動オプションを変更し、「---traditional --brainless --quiet」(Windows では、Octave アイコンのプロパティを選択し、*Target* フィールドに次のオプションを追加します)。

### 非窓 Octaveリリース

Linux または macOS で Octave を実行している場合、Octave に加えて、Octave シグナルをインストールする必要があります。
処理および統計パッケージ。 Macの場合、オクターブパッケージを解凍するためにgnu-tarをインストールすることもできます(brew install gnu-tar)。 Octave コマンドラインで、タイプ:

```
pkg install -forge control
pkg install -forge signal
pkg load signal
pkg install -forge io
pkg install -forge statistics
pkg load statistics
```

最後のコマンドを実行する必要があることに注意してください <em>pkg負荷信号</em> そして、 <em>pkg荷重統計</em>
Octaveを始めるたびに。

### EEGLABをインストールする

EEGLAB(エグラボ) Octaveは進行中です。 EEGLAB 2021.0 では、開発バージョンの使い方をおすすめします。 [GitHubでEEGLABを](https://github.com/sccn/eeglab)お問い合わせ EEGLABの公式バージョンでは、EEGLABの公式リリースを使用できます。

EEGLABの開発バージョンをインストールするには、インストールします [窓のためのGit](https://git-scm.com/download/win) リポジトリをサブモジュールでクローンします。 オクターブに問題が発生した場合は、問題の提出をお願いします。 [GitHubで](https://github.com/sccn/eeglab/issues).

EEGLABとOctaveグラフィックスの互換性に関する既知の問題
----------------------------------------------------------

すべての EEGLAB 信号処理機能は、Octave 上で実行する必要があります。 しかし、
オクターブは完全に互換性があります
MATLAB、オクタブ
グラフィックレンダリングエンジンは、EEGLABのすべてのグラフィックスの繊細さをレンダリングできないことがあります。 特に、以下に遭遇しました。
問題:

-   グラフィック図の更新はバグです。 ユーザーはマウスをマルチパネルの数字に更新する必要があります。 あるいは、図自体が正しく表示されているか、またはサイズを変更する必要があります。 例えば、*eegplot.m* インタラクティブなデータ
    スクロール機能が完全に機能しない:連続データ領域を選択すると、マウスクリック間で10秒待っています。
-   速度:処理データはオクターブで約2倍遅くなります。
-   プラグインは手動でインストールする必要があります(zipファイルとしてダウンロードし、
    EEGLABプラグインフォルダに非圧縮)。 ほとんどのプラグイン(を含む)
    SIFT および LIMO はオクターブでテストされなかったし、そうではない
    機能。 彼らはおそらく彼らの機能によって作ることができる
    開発者または意欲的なユーザーによる
-   Octave 8.4(ICLabelコードの一部を変更した後、ICLabelに保存されていない)でICLabelを実行できるようになりました。 しかしながら、そのコードは暗黙的です(MATLABの10秒と比較してオクターブで実行するのに15時間かかります)。 これは、オクタブが配列のスライスを取るときに新しいメモリの場所を予約しているためです。 ICLabel を実行する必要がある場合は、コンパイルされたバージョンの EEGLAB を使用します。

それにもかかわらず、最も複雑な EEGLAB のプロットのいくつかは Octave でレンダリングできます - 例えば、MATLAB のダイポールプロット (左)
そしてオクターブ(右)は完全に一致します。

 ![マットラボとオクターブのダイポール](/assets/images/Eeglab_dipoles_matlab_octave.png)

インタラクティブな EEGLAB を変更した場合
その目的のために機能し、他の人があなたの変更から利益を得るために望む,
コードをフォークし、リクエストをプルとして作成します。
ページ](/tutorials/contribute/Contributing_to_EEGLAB.html#forking-the-eeglab-repository) [その他] 
page:(/tutorials/contribute/) は追加
EEGLABへの貢献について

Octave と Matlab の EEGLAB 出力の比較
----------------------------------------------
以下は、オクターブ4.4によってプロットされた時間頻度分解です
EEGLAB/MATLABコードによるEEGLABチュートリアルデータセット

``` matlab
% cd xxxxx/eeglab        % move to the proper directory/folder
% octave --traditional   % start Octave

eeglab; % call EEGLAB
EEG = pop_loadset('sample_data/eeglab_data_epochs_ica.set');  % load an EEGLAB dataset
newtimef(EEG.data(1,:,:), EEG.pnts, [-1000 2000], EEG.srate, [3 0.5]); % compute and plot a trial-average ERSP
```

![](/assets/images/Octave2.png)

比較では、以下は、MATLABで実行する*newtimef.m*のグラフィック出力です。

![600px\|EEGLAB ニュータイムF出力](/assets/images/Eeglab_newtimef2.png)

