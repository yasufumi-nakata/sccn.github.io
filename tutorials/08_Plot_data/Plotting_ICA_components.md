---
layout: default
title: e. ICA components
long_title: e. ICA components
parent: 8. Plot data
grand_parent: Tutorials
---
ICAコンポーネントのプロット
================================
お問い合わせ

ICA は ICA から ICA へ [アーティファクト](/tutorials/06_RejectArtifacts/RunICA.html)このサイトは、Cyber のサイトです。 交通アクセス

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>


コンポーネントのスペクトルの貢献
-----------------------------------

データエポックを抽出した後、チュートリアルデータセットをここで使用します。 選択する <span style="color: brown">ファイル → 既存のデータセットを読み込む</span> メニューの項目は、Eeglab_data_epochs_ica.set です。

![サイトマップ](/assets/images/Pop_loadset2.png)

どのコンポーネントが最も強く貢献しているかを見るのは関心です
データの頻度。 お問い合わせ <span style="color: brown">コンポーネントのスペクトラとマップ</span>. 
これは呼び出します [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m) 機能。

最初の入力はエポック時間の範囲です
お問い合わせ 4つ目の入力は、ランダムでサンプルするデータの割合です
(計算速度が小さく、割合が大きい)
より EEGデータセットは、
*100*(=すべてのデータ)にこの値を変更します。 それから視覚化します
※10*を入力する
*スカルプマップ周波数*テキストボックス。 すべてのコンポーネントをスキャンしたいので、
デフォルトは *Components で動作します*。 プレス *Ok*.



![](/assets/images/Channelspectraedit.gif)



ふりがな [お問い合わせ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) ウィンドウ (below)


![](/assets/images/Spectopocomps.gif)



前のウィンドウでは、各コンポーネントのスペクトルをプロットしました。
 
もっと詳しく
正確な戦略は、データ信号をプロットすることです
コンポーネントのアクティビティをマイナスし、パワーの減少を推定
1つのチャネルで元の信号と比較して-それはまた可能です
すべてのチャンネルでこれを行いますが、スペクトルを計算する必要があります
各チャネルで各コンポーネントのプロジェクションを計算する
インテンシブ。 

そのためには、以前のインタラクティブウィンドウに戻ります。
 - 弊社では、お客様のご都合により、お客様のご要望にお応えいたします。
*10*最大入力 *電極番号 Hz
分析...:*分野、 
- コンポーネントのチェックを外す
スペック...*. 
- ※100*まで設定してください。
- ディスプレイ *6*
5(デフォルト)のコンポーネントマップ
詳細はこちら) 
- 描画される最大周波数を設定します
*30* Hz は、サイドパネルの*Plotting 周波数範囲*オプションです。
(下). 
- *Ok*は、


![](/assets/images/Channelspectraedit1.gif)



ふりがな [お問い合わせ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) 図は(以下)表示されます。


![](/assets/images/I102spectopo.jpg)
ツイート



MATLABでは、次の手順を実行します。

```matlab
    Component 1 percent variance accounted for: 3.07
    Component 2 percent variance accounted for: 3.60
    Component 3 percent variance accounted for: -0.05
    Component 4 percent variance accounted for: 5.97
    Component 5 percent variance accounted for: 28.24
    Component 6 percent variance accounted for: 6.15
    Component 7 percent variance accounted for: 12.68
    Component 8 percent variance accounted for: -0.03
    Component 9 percent variance accounted for: 5.04
    Component 10 percent variance accounted for: 52.08
    Component 11 percent variance accounted for: 0.79
    ....
```

*「Percent variance」*(pvaf) は、
*minus* は、全體制品(バックプロジェクト)です。
したがって、すべてのデータに対して 1 つのコンポーネントのアカウントがある場合、データがマイナスされます。
コンポーネントのバックプロジェクションは0 で、pvaf は100% です。
コンポーネントは ゼロヴァリアンス のアカウント、pvaf =
0%. 
Pvaf は、100% より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より より 大きい より より より より より より より より より より より より
コンポーネント、スペクトル出力は、実際には大きくなり、小さくなります!) 
に従って
上記出力に占める分散、コンポーネント10アカウント以上
チャンネル番号は、
ご入力いただくか、コンポーネントのコントリビューションを計算しません。

コンポーネント
------------------------------------
どのコンポーネントが利益の周波数帯に貢献しているかを見た後、
どのコンポーネントが最も貢献しているかを見ることは興味深いです
お問い合わせ
 
コンポーネント コンポーネント コンポーネント Plot コンポーネント
選択する <span style="color: brown">コンポーネント ERP → アセンブリ</span>, 呼び出し [pop_plotdata.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_plotdata.m) 機能。 それから
プレス *Ok*.

![](/assets/images/Rectarrayedit.gif)

ふりがな [pop_plotdata.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_plotdata.m) ウィンドウ, パープル
すべての31コンポーネント。

![](/assets/images/I103pop_plotdata.jpg)

このトレースを新しいウィンドウにプロットするために、コンポーネント1トレースをクリックします。
(以下)


![](/assets/images/I103single_plotdata.jpg)

弊社では、以下の項目を、以下の項目に入力し、
<span style="color: brown">Plot → コンポーネントERP → コンポーネントマップ</span>,
コールする [ポップ ミュージック](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_envtopo.m) 機能。 
プレス *7 をプロットする お問い合わせ
データセットERPへ
実際のコンポーネントは、以前のデータからサブトラクトすることができます。
コンポーネントの *Indices は、ERP をプロットしてサブディレクトリへ...* 編集
プレス *Ok*


![475](/assets/images/Pop_envtopo.gif)




お問い合わせ [ポップ ミュージック](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_envtopo.m) プロット(下)、厚い黒線
データ封筒(つまり、すべてのチャネルの最小値と最大値)を示します。
とりあえず、 は、 とりあえず、 とりあえず、 とりあえず、 とりあえず、 とりあえず、 とりあえず。


![375](/assets/images/Envtopo.gif)



上の写真はメッシーに見えるので、再び呼び出します [ポップ ミュージック](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_envtopo.m) 
*200* ms から *500* ms までの時間範囲 ウィンドウズ で囲む
以下に示すようにポスト刺激。


![475](/assets/images/Pop_envtopo2.gif)



400 ms コンポーネント 1 近く する
お問い合わせ


![375](/assets/images/Envtopo2.gif)




コマンドラインでは、関数はパーセントの分散を返します。
各コンポーネントのアカウント

    IC4 pvaf: 31.10%
    IC2 pvaf: 25.02%
    IC3 pvaf: 16.92%
    ...



コンポーネント ERP-image
----------------------------

コンポーネントの代わりにERP-image図をプロットに、
<span style="color: brown">コンポーネント 研究開発</span> 
(電話) [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) 関数)。 

この関数は、私たちが使用したものと同じ機能です。
クラウドサービス
1つの電極は、ここに1つのコンポーネントの活性化をプロットする機能です。

インタラクティブウィンドウ内のパラメータをコピーして試用をソートします
10 の Hz0 の ms の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の s の の s の s の s の s の の s の の s の s の の の の s の s s の の の の の の s の の の の の の s s の の の の の の の の の の の の s の の の の の の の の の s s s の の s の の の s の の の の s の の の の の の
Inter-Trial Coherence (チャンネル参照) [チュートリアル](/tutorials/08_Plot_data/Plotting_ERP_images.html) 詳しくはこちら
インフォメーション

![](/assets/images/Componenterpedit.gif)


以下に示すコンポーネント6については、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) プロフィール
解析周波数(9Hz〜11Hz)
時ウィンドウ -300 へ 0 ms (底の跡によって)
相互にトリルコヒーレンス(ITC) または 宇宙飛行士 
お問い合わせ
10 Hz の EEG のコンポーネントのアカウントは、
パーキープ
 全体的に、分析周波数での平均電力
時間(中間の青の跡)および段階のまわりで大いに変更しません
分析の頻度は刺激(底青い跡)によって再調節されません。
ここに再び、青色に覆われた地域は、非重要な地域を示しています。

![](/assets/images/I105erpimage.jpg)


ICA では、極性性を兼ね備えています。
* * * * * * の の の の の の
逆 * * *
有利化のメリット(*EEG.icaact*)
コンポーネントのアクティベーションが無意味であり、アクティベーションは無意味です。
測定単位(注)、*proportional to* microvolt。 
1つに占める活動の絶対値と極性を回復するため
与えられたチャネルでまたはより多くのコンポーネントは、バックプロジェクションをイメージします
そのチャネルでコンポーネントの活性化:
- 前のページへ
- 同じパラメータを使用する 
- *プロジェクトをチャンネル\#*から27に設定する

ERPが極性で逆転する
パワーユニットが変更されました。

![](/assets/images/I105erpimage2.jpg)

次の記事では、EEGLABが実行してみることにしました。
独立した時間/頻度分解
コンポーネントの活性化。

コンポーネント時間/周波数変換
-----------------------------------------------

コンテンツの構成要素は、直接1頭脳科学研究所の構成要素である。

コンポーネントの時間周波数変換をプロットするには、 <span style="color: brown">コンポーネントの頻度</span> 
(電話) [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) 関数) それから:
- *コンポーネント番号* に *1* を入力してください
- *Bootstrap のリリース よくある質問 
- お問い合わせ

注意: [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) FFTの分解
波形よりも低い周波数の計算。
窓ごとの1つの周期として低い、波紋方法が固定を使用するように
各周波数のサイクル数(デフォルト3)。


![](/assets/images/newtimef_comp1.png)

以下について [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) ウィンドウが表示されます。 

![](/assets/images/newtimef_comp2.png)

ITC(*より)
. . . .
(*upper Panel*)は4から6Hzおよび 
12〜18Hzのパワー消費量、4〜6Hzのパワー消費量。 

コンポーネントヘッドプロット
---------------
使用時 [ICAが特定するかどうかを調べる](/tutorials/06_RejectArtifacts/RunICA.html)2Dコンポーネントのスカルプマップをメニューにプロットしました。 <span style="color: brown">コンポーネントマップ → 2Dで</span>.

コンポーネントの3Dヘッドプロットをプロットする
選択によるトポグラフィ <span style="color: brown">コンポーネントマップ → で
3次元</span>お問い合わせ これは呼び出します [pop_headplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_headplot.m) 機能。 関数は
ERPをプロットする
3-Dsカルプマップ コンポーネントを選択 4,4,4,5,4,5,4,5,4,5,4,5,4,5,3,4,5,4,4,5,4,5,4,5,4,5,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4


![](/assets/images/3Dcomponentedit.gif)


ふりがな [pop_headplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_headplot.m) 下のウィンドウが表示されます。 ご使用の際には
MATELLABは3Dオプションを回転させ、ヘッドプロットを回転させます。
ウィンドウを閉じる *view* は、


![](/assets/images/93ICA_3D.jpg)

このインターフェイスおよび実行方法の詳細については、
コア コア コア コア コア
3-D](/tutorials/08_Plot_data/Data_Averaging.html)。

次のステップ
----------------------------------

 この のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ のみ 今後の展望 各 の マップ マップ マップ マップ マップ マップ マップ マップ マップ の の の の の の の の の の の を を を を を 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。 。

さらなる質問はより重要であるかもしれません: アクティベーションの方法は?
主に独立したコンポーネントの相互関連のペア? どうすればよいですか?
関係は、時折進化し、条件全体で変化するのか? お問い合わせ
関連する その その その EEGLABグループの分析ツールは、
脳の動的について、両方のために [シングルサブジェクト](/tutorials/10_Group_analysis/study_statistics.html#single-subject-statistics) そしてのために [被写体のグループ](/tutorials/10_Group_analysis/).