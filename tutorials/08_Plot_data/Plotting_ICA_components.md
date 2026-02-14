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

ICA は ICA を 取除く/引き込みに使用します [アーティファクト](/tutorials/06_RejectArtifacts/RunICA.html)お問い合わせ ICAは脳情報源を見つけるためにも使用することができます。 チュートリアルのこのセクションでは、どのコンポーネントがデータに最も貢献しているかを評価します。

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

データエポックを抽出した後、チュートリアルデータセットをここで使用します。 選択する <span style="color: brown">ファイル → 既存のデータセットを読み込む</span> メニュー項目を選択し、EEGLABの「sample_data」フォルダにあるチュートリアルファイル「eeglab_data_epochs_ica.set」を選択します。 それから *Open*を押して下さい。

![画像:Pop_loadset2.png](/assets/images/Pop_loadset2.png)

どのコンポーネントが最も強く貢献しているかを見るのは関心です
データの頻度。 お問い合わせ <span style="color: brown">Plot → コンポーネントのスペクトラとマップ</span>. 
これは呼び出します [pop_spectopo.m は、](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_spectopo.m) 機能。

最初の入力はエポック時間の範囲です
お問い合わせ 4つ目の入力は、ランダムでサンプルするデータの割合です
(計算速度が小さく、割合が大きい)
より明確な)。 EEGデータセットがかなり小さいので、
*100*(=すべてのデータ)にこの値を変更します。 それから視覚化します
どのコンポーネントが10Hzで最も貢献し、*10*を入る
*スカルプマップ周波数*テキストボックス。 すべてのコンポーネントをスキャンしたいので、
デフォルトは *Components で検討します*。 プレス *Ok*.



![](/assets/images/Channelspectraedit.gif)



ふりがな [スペックトップm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) ウィンドウ (below) が表示されます。


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
 - チャンネル*27*(POz)でコンポーネントの貢献をプロットするために明示的に選択します。
*10*で最大出力が表示される *電極番号を使用してHz
分析...:*分野、 
- checkbox *\[checked\] コンポーネントのチェックを外す
スペック...*. 
- ※100*まで設定してください。
- ディスプレイ *6*
5(デフォルト)の代わりにコンポーネントマップ (すべてのコンポーネントのspectraを参照)
詳細はこちら) 
- 描画される最大周波数を設定します
*30* Hzは底パネルの*Plotting頻度範囲*の選択を使用して
(下). 
- *Ok*を押してください。


![](/assets/images/Channelspectraedit1.gif)



ふりがな [スペックトップm](http://sccn.ucsd.edu/eeglab/locatefile.php?file=spectopo.m) 図は(以下)表示されます。


![](/assets/images/I102spectopo.jpg)
ツイート



MATLABコマンドラインで次のテキストが表示されます。

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

*「Percent variance 」*(pvaf) はデータの分散を比較します
*minus* は、全データの分散に対する (バックプロジェクト) コンポーネントです。
したがって、すべてのデータに対して 1 つのコンポーネントのアカウントがある場合、データがマイナスされます。
コンポーネントのバックプロジェクションは0で、pvafは100%になります。
コンポーネントがゼロヴァリアンスを持っている場合、データなしのアカウント、pvaf =
0%. 
Pvaf は 100% より大きいかもしれません(意味: 「これを取除ければ
コンポーネント、スペクトル出力は、実際には大きくなり、小さくなります!) 
に従って
上記出力に占める分散、コンポーネント10アカウント以上
チャネルのPOZのための10のHzの力の50%以上。 注意: チャンネル番号は
ご入力いただくか、コンポーネントのコントリビューションを計算しません。

コンポーネントERPの貢献
------------------------------------
どのコンポーネントが利益の周波数帯に貢献しているかを見た後、
どのコンポーネントが最も貢献しているかを見ることは興味深いです
お問い合わせ
 
最初のステップはコンポーネントERPを視覚化することです。 PlotコンポーネントERPに、
選択する <span style="color: brown">Plot → コンポーネントERP → 長方形配列</span>, 呼び出し [pop_plotdata.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_plotdata.m) 機能。 それから
プレス *Ok*.

![](/assets/images/Rectarrayedit.gif)

ふりがな [pop_plotdata.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_plotdata.m) ポップアップするウィンドウ, 平均ERPを示す
すべての31コンポーネント。

![](/assets/images/I103pop_plotdata.jpg)

このトレースを新しいウィンドウにプロットするために、コンポーネント1トレースをクリックします。
(以下)


![](/assets/images/I103single_plotdata.jpg)

データERPへのコンポーネントERPの貢献をプロットするには、選択します
<span style="color: brown">Plot → Component ERPs → コンポーネントマップ</span>,
コールする [ポップ ミュージック](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_envtopo.m) 機能。 
プレス *7をプロットするOk*
データセットの平均ERPに最も貢献するコンポーネント。
実際のコンポーネントは、以前のデータからサブトラクトすることができます。
コンポーネントの *Indices を使用して ERP をプロットしてサブトラクトする...* 編集
ボックス。 プレス *Ok*.


![475](/assets/images/Pop_envtopo.gif)




お問い合わせ [ポップ ミュージック](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_envtopo.m) プロット(下)、厚い黒線
データ封筒(つまり、すべてのチャネルの最小値と最大値)を示します。
毎回ポイント)、そして着色されたショーは部品ERPを示します。


![375](/assets/images/Envtopo.gif)



上の写真はメッシーに見えるので、再び呼び出します [ポップ ミュージック](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_envtopo.m) 
*200* msから*500* msまでの時間範囲の窓そしてズームレンズ
以下に示すようにポスト刺激。


![475](/assets/images/Pop_envtopo2.gif)



400 ms コンポーネント 1 近くが最も貢献する (below) を見ることができます。
ERPに強くなります。


![375](/assets/images/Envtopo2.gif)




コマンドラインでは、関数はパーセントの分散を返します。
各コンポーネントのアカウント

    IC4 pvaf: 31.10%
    IC2 pvaf: 25.02%
    IC3 pvaf: 16.92%
    ...



コンポーネント ERP-image
----------------------------

コンポーネントの活性化のためのERP-image図をプロットするには、選択します
<span style="color: brown">Plot → コンポーネントERPイメージ</span> 
(電話) [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) 関数)。 

この関数は、私たちが使用したものと同じ機能です。
チャンネルERPイメージをプロットするだけでなく、アクティビティを視覚化する代わりに
1つの電極は、ここに1つのコンポーネントの活性化をプロットする機能です。

インタラクティブウィンドウ内のパラメータをコピーして試用をソートします
10のHzおよび0のmsの段階によって、イメージの反作用の時間、力および
Inter-Trial Coherence (チャンネル参照) [ERPイメージチュートリアル](/tutorials/08_Plot_data/Plotting_ERP_images.html) 詳しくはこちら
インフォメーション

![](/assets/images/Componenterpedit.gif)


以下に示すコンポーネント6については、 [pop_erpimage.m は](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_erpimage.m) プロフィール
解析周波数(9Hz〜11Hz)でのフェーズが均等に分散
時ウィンドウ -300 への 0 ms (底の跡によって示されるように)
相互trialコヒーレンス(ITC)またはフェーズロック因子を示す。 
お問い合わせ
10 Hz の EEG パワーの多くのためのコンポーネントのアカウントが、少しなら
平均ERPのいずれか。
 全体的に、分析周波数での平均電力
時間(中間の青の跡)および段階のまわりで大いに変更しません
分析の頻度は刺激(底青い跡)によって再調節されません。
ここに再び、青色に覆われた地域は、非重要な地域を示しています。

![](/assets/images/I105erpimage.jpg)


ICAでスケールと極性情報が配布されていることに注意してください。
投影重量間の分解(*not*失われた!)(のコラム)
逆の重量のマトリックス、*EEG.icawinv*)および部品の列
活発化のマトリックス(*EEG.icaact*)、絶対広さおよび極性
コンポーネントのアクティベーションが無意味であり、アクティベーションは無意味です。
測定単位(ただし、*proportional to* microvolt)。 
1つに占める活動の絶対値と極性を回復するため
与えられたチャネルでまたはより多くのコンポーネントは、バックプロジェクションをイメージします
そのチャネルでコンポーネントの活性化:
- 前のERP-imageウィンドウに戻る
- 同じパラメータを使用する 
- *プロジェクトをチャンネル\#*から27に設定する

ERPが極性で逆転していることに注意してください
パワーユニットが変更されました。

![](/assets/images/I105erpimage2.jpg)

次のセクションでは、EEGLABが実行して視覚化する方法を紹介します。
独立した時間/頻度分解
コンポーネントの活性化。

コンポーネント時間/周波数変換
-----------------------------------------------

いくつかの独立したコンポーネントは直接1頭脳EEGのソース活動にインデックスを付ける可能性があるので、チャネル活動の周波数分解よりも、コンポーネントの有効化の時間の頻度分解を調べることは、チャネル活動は、脳のボリューム汚染された異なる部分を要約します。

コンポーネントの時間周波数変換をプロットするには、 <span style="color: brown">Plot → コンポーネントの時間頻度</span> 
(電話) [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) 関数) それから:
- *コンポーネント番号* に *1* を入力してください
- *Bootstrapの重要なレベル*の*.05*およびFalse Discovery率方法を使用して複数の比較のために正しい*のチェックボックスを点検して下さい 
- 再び、私達は*Ok*を押します

注意: [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) FFTを用いた分解が可能
波形よりも低い周波数の計算。
窓ごとの1つの周期として低い、波紋方法が固定を使用するように
各周波数のサイクル数(デフォルト3)。


![](/assets/images/newtimef_comp1.png)

以下について [pop_newtimef.m の使い方](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_newtimef.m) ウィンドウが表示されます。 

![](/assets/images/newtimef_comp2.png)

ITCイメージ(*より低い)
パネル*)は重要な効果を示しません。 ERSPイメージ
(*upper Panel*)は4から6Hzおよび 
12〜18Hzの電力増加、その後4〜6Hzの電力増加。 

コンポーネントヘッドプロット
---------------
使用時 [ICAがアーティファクトを削除/抽出する](/tutorials/06_RejectArtifacts/RunICA.html)2Dコンポーネントのスカルプマップをメニュー項目にプロットしました。 <span style="color: brown">Plot → コンポーネントマップ → 2Dで</span>.

EEGLABを使うと、コンポーネントの3Dヘッドプロットをプロットすることもできます。
選択によるトポグラフィ <span style="color: brown">Plot → コンポーネントマップ → In
3次元</span>お問い合わせ これは呼び出します [pop_headplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_headplot.m) 機能。 関数は
ERPをプロットするときに生成したスプラインファイルを自動的に使用
3-Dスカルプマップ コンポーネントを選択 *1,2,3,4,5,4,5,4,5,3,4,5,4,5,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,5,3,4,4,5,4,4,5,4,4,4,5,4,4,4,4,5,4,4,4,4,4,5,4,4,4,5,4,4,4,4,5,4,4,4,4,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3,4,4,4,4,4,4,4,4,3,4,4,4,4,4,4,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,


![](/assets/images/3Dcomponentedit.gif)


ふりがな [pop_headplot.m ディレクティブ](http://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_headplot.m) 下のウィンドウが表示されます。 ご使用の際には
MATLABは3Dオプションを回転させ、ヘッドプロットを回転させます。 エルス,
上記ウィンドウに異なる *view* 角度を入力します。


![](/assets/images/93ICA_3D.jpg)

このインターフェイスおよび実行方法の詳細については、
電極とヘッドモデル間のコアギストレーションは、[ERPデータのプロット]を参照してください。
3-D](/tutorials/08_Plot_data/Data_Averaging.html)。

次のステップ
----------------------------------

このチュートリアルでは、単一の致命的および平均的なEEGまたは他の電気生理学的データを処理するためのEEGLABのユーティリティのラフなアイデアのみを提供します。 ここで提示されたサンプルデータセットの分析は、決定的な方法はありません。 一つは、各独立したコンポーネントのアクティビティとスキャルプマップを慎重に調べるべきであり、その動体とその行動と他のコンポーネント活動との関係を指摘して、その役割と可能な生物学的機能を理解し始めるべきです。

さらなる質問はより重要であるかもしれません: アクティベーションの方法は?
主に独立したコンポーネントの相互関連のペア? どうすればよいですか?
関係は、時折進化し、条件全体で変化するのか? お問い合わせ
関連する異なる被験者の独立したコンポーネント、およびその場合、どのように? EEGLABグループ分析ツールは、これらや他の質問を調べるのに適した環境
脳の動的について、両方のために [シングルサブジェクト](/tutorials/10_Group_analysis/study_statistics.html#single-subject-statistics) そしてのために [被写体のグループ](/tutorials/10_Group_analysis/).