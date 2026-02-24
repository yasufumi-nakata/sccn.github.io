---
layout: default
title: EEGLAB and Python
nav_title: "EEGLABとPython"
long_title: EEGLAB and Python
parent: Interoperability
---

EEGLABとPython
===================

EEGLAB は Python でネイティブで動作しません。EEGLAB が実行されているからです。
MATLAB(および、オープンソースオクターブでかなりの程度まで)
プラットフォーム) それにもかかわらず、 Python とリンクできるので、
詳しくはこちら

MATLABベースのツールやPythonベースのツールを使用する必要があります。
-----------------------------------------------------

ソフトウェアパッケージを使用する際の最も重要な機能は、使用とコミュニティです。
コミュニティが大きく、ソフトウェアが普及している場合は、より安全です。
これは多くの問題の人々が遭遇していることを保障するので選択
解決された - それはまたコードがおそらくより安定していることを意味します
バグが少ない。 

以下は独立した数字です [2024 記事](https://apertureneuro.org/article/116386-the-art-of-brainwaves-a-survey-on-event-related-potential-visualization-practices) すべてのソフトウェアパッケージの人気が表示されます。
![画像ライブラリ](https://github.com/sccn/sccn.github.io/assets/1872705/4a2de7bc-ee1d-450f-8314-48d3294d54f4)

このサードパーティーも参照 [2023 報告書](https://doi.org/10.1016/j.neuri.2023.100154) そして、 [2024報告書](https://www.preprints.org/manuscript/202411.0750/v1)EEGLAB 引用を他の EEG 解析ソフトウェアパッケージと比較する。 

MATLABとPythonの大きな違い
-------------------------------------------

脳イメージングを移行するためのイメージングツール開発の傾向があります
Python へのツール。 もちろん、Python(およびnumpy/scipy mathパッケージ)
Pythonで構築されたのは面白い(と無料)使い方の代替です
マトラボ しかし、Pythonの愛好家が何を主張する可能性があるかの見解は、
プログラミング言語のままのPythonは理想的ではない
プログラマーのために設計されている。 例えば、

-   **コードインデント** コードインデントは、Pythonの素晴らしい機能です。 しかし、このスタイル
    初心者プログラマに自然に来ない。 それはまた作ります
    ファイルソースとコマンドライン間でコードをコピーして貼り付ける
    インターフェイスの問題点(コードのスニペットが最も可能性が高いため)
    Python コマンドラインにコピーしたときに不要なインデント)。
-   **オブジェクト指向の表記。** Python は MATLAB よりもはるかにオブジェクト指向で、時々 要求する
    関数を呼び出すときにオブジェクト指向の概念を理解するユーザー。 たとえば、MNE は
    EEGのデータ構造にアクセスしましょう。 チャンネル座標などの情報にアクセスしたい場合、
    MNE コードを返す非ドキュメントメソッドを見つけることを望む必要があります。
    お問い合わせ 
-   **マトリクス・フォー・ダミーズ!** nサイズのベクトルがすべき初心者のために理解するのは困難です
    インデックス化、0 で始まり、n-1 で終わる (MATLAB と R のベクトルで)
    位置1で始まり、nで終わる。 Python でのマトリクス操作は MATLAB と同じくらい直感的ではありません。 お問い合わせ
    例えば、すでに非直観的な Python コードで配列を連結する
    <i>np.concatenate(np.array(\[1,_2\]),_\[5,_6\|1,2\],\[5,]
    6\]\), np.array(\[1, 2\]))</i> MATLABとは異なり、
    1-Dベクターは、デフォルトで2-Dマトリクスと互換性がありません。
    明示的な変換が必要です。 MATLABのシンプルな表記と比較 <i>\[
    \[1 2; 5 6\]; \[1 2\] \]</i> または <i>\[ \[1 2; 5 6\] \[1 2\]' \]</i>
    次元に従って連結して下さい。 MATLABコードは
    数学の訓練を持つ人のために読みやすくなります。
-   **バージョンが実行中ですか?** Python のバージョン 2 と 3 は
    完全に互換性のある -- と Python 2.7, もはやサポートされていません
    2020年1月1日以降は、数が多いためまだまだ広く使われています。
    Python 3 では Python ライブラリは利用できません。
    初心者を遅くできる予期しない問題の種類
    プログラマー 
-   **図書館はどこにありますか?** Pythonは通常、複数の外部をインストールするためにユーザーが必要
    ライブラリ; これは退屈であり、自然に来ない
    コメントはありません。 経験豊富なユーザーでも、時々自分の時間を得る時間を費やす
    ライブラリの設定は右にあります。 その他の技術的な問題もあります
    オペレーティングシステムとライブラリの互換性に関連する
    解決する時間か日(私達は経験から話します)。 プラットフォーム間でのPythonバージョンライブラリの安定性
    頭痛にもなる。時々、同じことを行うために複数のライブラリを持っている。
-   **しかし、Pythonは無料です。** なぜ私はMATLABのために支払う必要がありますか? よい行為で
    (open) 科学は、財務に関する議論を伝えるべきである。 お支払い
    Microsoft または Adobe ライセンスは、無料の代替品、さらには
    もしそれが存在すれば、私たちのニーズを満たしません。 コンパイルされたバージョンの
    EEGLAB では、MATLAB および EEGLAB コードを購入するユーザーを必要としません。
    また、オクターブで動作します。
- **Jupyterのノート。** Matlabの相互インターフェイスへの最も近い代わりはあります
ブラウザまたはVisual Studioコードで実行するJuppyter Notebook環境。 しかし、
Jupyterのノートブックのグラフィカルな機能が限られる(それはあります
時には数字を操作しにくい、ズームできない、など...)。
マトラブと試してみたところほとんどの人
ジュピターノートブックはジュピターノートブックとは異なります - その後、一緒に生きるために学ぶ
作業に必要な場合の制限。 対照的に、あまり人気 [スパイダーIDE](https://www.spyder-ide.org/) MATLABのグラフィカルインターフェイスとの違いは深刻です。 
-   **機能の欠如。** MATLABのMEEGソフトウェアパッケージは、主にEEGLAB、FieldTrip、および
    ブレインストーム。 Python上でMEEGソフトウェアは、EEGユーザーよりもMEGユーザーに合わせたMNEです。
    利用可能なソフトウェアのMATLABスイートは、現在よりも成熟しています
    MATLABに固執する正当な理由であるPython 1。 EEGLABには、自動アーティファクト拒否用の32プラグインがあります。 MNEは1つ(オートレジェクト)を持っています。
-   **いくつかの敬意を表します!** Pythonのnumpyライブラリは、22年前にリリースされたMATLABに部分的にマッピングされています。 numpy では、MATLAB のカウンターパートに関数の一部の名前をマッピングできます。また、引数の同じリストも取得できます。 これらは、リシェイプ、スクイーズ、メッシュグリッド、グリッドデータ、トランスポーズ、ドット、リンスペース、ログスペース、合計、平均、std、min、max、prod、diff、cumsum、cumprod、ゼロス、アイ、掘り出し、inv、svd、svd、eig、標準、トレース、det、fft、ifft、クロス、一意、ソートなどのような機能を含みます。 MATLAB と同様に、Python は多様で強力な解釈言語ですが、あなたの elders :- に敬意を表してください。

PythonからEEGLAB関数を呼び出す方法
----------------------------------------

### Oct2Pyの使用

Python から EEGLAB 関数を呼び出すか、または必要であれば、最善
ソリューションは、Python パッケージ Oct2py (pip install Oct2py) を使用することです。 お問い合わせ
インストールする必要があります オクターブも。 見る [this]
page:(/others/Running_EEGLAB_on_Octave.html) より詳細な情報
Octave で EEGLAB を実行します。 この Python ライブラリの仕組みは、
コンバーター Python のデータ構造を MATLAB/Octave のデータ構造に
逆に。 私達の研究に基づいて、それは最も簡単で、最も安定した方法です
Python で MATLAB 関数を実行し、ほとんどの EEGLAB 関数は
このメソッドを使用して Python 内で呼び出されます (xxx をコンピュータに EEGLAB をインストールした場所に変更します)。

``` Python
# import dataset from EEGLAB
from oct2py import octave as eeglab
path2eeglab = 'xxxxx'

eeglab.addpath(path2eeglab + '/functions/guifunc');
eeglab.addpath(path2eeglab + '/functions/popfunc');
eeglab.addpath(path2eeglab + '/functions/adminfunc');
eeglab.addpath(path2eeglab + '/functions/sigprocfunc');
eeglab.addpath(path2eeglab + '/functions/miscfunc');
eeglab.addpath(path2eeglab + '/plugins/dipfit');
EEG = eeglab.pop_loadset(path2eeglab + '/sample_data/eeglab_data_epochs_ica.set');

# plot first trial of channel 1
import matplotlib.pyplot as plt
plt.plot(EEG.data[0][0]);
plt.show()
```

スキャピー Pythonライブラリは、*.set*ファイルに生データが埋め込まれた場合、EEGLABファイルをインポートできます。

``` Python
import scipy.io as sio
EEG = sio.loadmat('eeglab_data_epochs_ica.set')
```

生データが別々の *.fdt* ファイルに格納されている場合、 *read_epochs_eeglab* MNE 関数は EEGLAB のデータファイルをインポートすることもできます。

``` Python
import mne
EEG = mne.io.read_epochs_eeglab('eeglab_data_epochs_ica.set')
```

**安定性の考慮:** Oct2pyインターフェイスは非常に安定しています。 EEGLAB 関数が Octave と完全に互換性がないとき、通常は問題が発生します(ほとんどの機能は ICLabel を含む互換性があります。ただし、EEGLAB は MATLAB で最適化されています。

**速度の考察:** このメソッドで EEGLAB を使うと、自動データ変換の遅延と Octave の最適化の欠如のために、MATLAB やネイティブ Python ライブラリで EEGLAB を使用すると比較して 2x 以上の減速が期待できます。

### Python または MATLAB コンパイルされた Python ライブラリで MATLAB のランタイムエンジンを使用する

MATLAB から Python に渡される EEGLAB のデータ構造は複雑すぎるため、これらのソリューションはアドバイスしません。 Python のコードを実行すると、「1xN と Nx1 char 配列のみが MATLAB から返すことができます」というエラーが表示されます(これは技術的に多く正しいわけではありません) [異なるデータタイプ](https://www.mathworks.com/help/matlab/matlab_external/handle-data-returned-from-matlab-to-python.html) お問い合わせ しかし、EEGLAB EEG構造は、イベントやチャネルの構成の配列を含み、処理されていない。 これは、視力で改善されたサポート無しで、2024年の4年以上のケースでした。 未サポートのデータタイプはこちら [サイトマップ](https://www.mathworks.com/help/matlab/matlab_external/handle-data-returned-from-matlab-to-python.html) (2024年の時点では、サポートされていないデータ型として「構造配列」と「セル配列」をリストします)。 上述の Oct2Py インターフェイスは、これらのデータ型をうまく処理することに注意してください。 

EEGLAB は Python でネイティブに実行されることはありませんか?
----------------------------------------

MATLABは、将来予測可能なプラットフォームを維持します。
EEGLABの開発・サポート MATLABは、便利なツールのパントを持っています
オープンソース環境ではまだマッチしていない(例えば、複雑ではない)
ライブラリをインストールするためのシステム, 異なるための優れたグラフィカルなサポート
プラットフォーム, 透明性、強力な3次元インタラクティブグラフィックス
デバッグツール、ネイティブJavaコードを実行する容量)、および豊富な
利用可能なMATLABツールボックスは便利で、よく知られてよくテストされています(例えば、
複数の比較を修正するための画像処理ツールボックス。
スペクトル分解のための信号処理ツールボックス、; 最適化
コードを最適化するためのツールボックス、バイオインフォマティクスツールボックス、EGGに有用
分類; リアルタイム3Dレンダリングのためのバーチャル リアリティのツールボックス、
EEG活動) 最後に、MATLABコンパイラが作成できるようにします。
ユーザがMATLABを持っていないEEGLABのコンパイルバージョン
-- MATLABスクリプトは[コンパイル]で実行できます
EEGLAB:(/others/Compiled_EEGLAB.html) インタラクティブセッション
サポートされていません。 
