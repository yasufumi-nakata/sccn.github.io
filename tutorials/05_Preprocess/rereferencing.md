---
layout: default
title: b. Re-referencing
nav_title: "b. 再参照"
long_title: b. Re-referencing
parent: 5. Preprocess data
grand_parent: Tutorials
---
データを再参照する
======
EEG環境再参照してください。 [アレンデックス](/tutorials/ConceptsGuide/rereferencing_background.html)EEGLAB では、 リファレンスの指定方法と、(オプション) で参照してください。

EEGLAB をロードする
-------------------------

メニュー項目を選択 <span style="color: brown">ファイル</span> サブメニュー項目を押します
<span style="color: brown">既存のデータセットをロードする</span>「eeglab_data.set」の使い方
EEGLABの「sample_data」フォルダにあるツールボックスです。

![こちら](/assets/images/Pop_loadset.png)

平均参照の計算
-------------------------

ソースのローカリゼーションに平均的な参照を計算することをお勧めします。

選択する <span style="color: brown">ツール → データを再参照する</span>
データセットを平均参照に変換するには [pop_reref](https://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_reref.m) 関数を使用します。 このメニュー項目を呼び出した場合
指定したデータセットで、次のウィンドウがポップアップ表示されます。

![スクリーンショット 2025-03-19 に 14 32 56](https://github.com/user-attachments/assets/8f1644a9-95a8-46b6-aada-b80698946556)

上記(サンプル)データをマストイド参照で記録しました。
この参照チャンネルを含まない(データに必要)
パープル参照でも、*Add current はクリックします。
データ*チェックボックスの参照チャネル。

*Ok*を押します。前のステップと同様に、EEGLABは新しいデータセット名を尋ねるダイアログを表示します。

データが平均参照された後、
<span style="color: brown">ツール → データを再参照する</span> メニュー
データをチャネルまたはチャネルのグループ(または)に再参照できます。
平均的な参照変換を解除する -- 選択した限り
変換時にデータ内の初期参照チャンネルを含める
平均参照)。

Huber et al.の方法では、マイクロボルトで測定されたしきい値と、二乗根で処理する際の偏差が異なります。詳細は [pop_reref](https://sccn.ucsd.edu/eeglab/locatefile.php?file=pop_reref.m) のドキュメントを参照してください。

pop_reref関数は、保存された参照チャンネル情報も再参照に使用できます。
ICAの重みとスカルプマップ

参照チャネルの保持
-------------------------

データを再参照することは、より複雑になります。 例えば、
Cz に 参照文献 を投稿する
Cz をデータに追加する。
平均参照仮定(すべての平均値の仮定)
電極は 0 です。 最初のステップは平均参照を計算することです。
チャネルの追加

この例では、 [TEST.CNT](https://sccn.ucsd.edu/eeglab/download/TEST.CNT) データセットを使用します。メニュー <span style="color: brown">File → Import data → Using EEGLAB functions and plugins → From Neuroscan .CNT file</span> からインポートします。
 
Czを参照電極として追加するには、<span style="color: brown">Edit → Channel locations</span> メニュー項目を開き、最後の行に移動します。
*Append*ボタンで空のチャンネルが作成されます。
*Channel label* の 編集ボックスの 読み込み中 “Cz” )
それ チャンネル チャンネル X、Y、Z の場所、*XYZ - → ポーラ&
Sph.* は 3 D のデカルトを極端の球面に動かします
座標。 チャネルで
エディタ、参照はすべてのデータ チャネルの後で置かれます(それに注意して下さい
チェックボックス *Channel は、
この電極位置に関連した実際のデータチャネルではありません。

電極の位置がない場合は、単に電極の位置がない場合
*Look up locs* ボタンを自動で表示します。
10-20チャンネルのラベル(これはすべての場所を見上げることに注意してください)
電極)。

![こちら](/assets/images/Pop_reref3.png)

詳細は、http://www.pressbutton.com/
Cz("Cz") は、Cz("Cz") で、Cz("Cz") で、Cz("Cz") のチャンネルは、
手動で入力する必要があります。

![こちら](/assets/images/Pop_reref5.png)

詳細は、こちらでご確認ください。

メニュー項目を使用してインターフェイスを再参照するようになりました <span style="color: brown">ツール → データを再参照する</span>*Retainer(Retainer) ボタンをつけて、 Cz 電極。

![こちら](/assets/images/Pop_reref6.png)

再会議は、以下のとおりです。

![こちら](/assets/images/Pop_reref7.png)

参照チャネルには場所があり、チャンネルエディタで宣言されているため、他のチャネルと一緒にプロットすることができます。

データを別の参照(リンクされたマストイドなど)に再参照したい場合は、 <span style="color: brown">ツール → データを再参照する</span>  メニュー項目は再び。 

複数の電極への再搬送
-------------------------
参照M1(マストイド)で、処理をしている
参照してください。
フォロー:
-   チャンネルで見る
    計算のパーキープ *電極M1*の中間(方法)
    参照チャンネルは、前のチャンネルにも記述されている
    セクション)
-   M2を参照として追加する（または削除したチャンネルを使用）

インフィニティでのリリファレンス
-------------------------
REST(Reference Electrode Standardization) は、Constructions から、Constructions へ直接アクセスする。 [REST](https://github.com/sccn/REST) EEGLABプラグインはデフォルトでインストールされています。 <span style="color: brown">EEGLABの機能拡張</span> メニュー項目。
