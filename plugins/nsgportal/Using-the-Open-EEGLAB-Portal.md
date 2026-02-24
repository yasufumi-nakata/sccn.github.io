---
layout: default
parent: NSGportal
grand_parent: Plugins
render_with_liquid: false

title: Using-the-Open-EEGLAB-Portal
nav_title: "使い方-Open-EEGLAB-Portal"
long_title: Using-the-Open-EEGLAB-Portal
---
Open EEGLAB Portal を使用するには、NSG Web インターフェイスを介して 2 つのアプローチがあります。http://www.NSGportal.org)、またはNSGコマンドラインRESTfulインターフェイス(NSG-R)の使用によって。 このセクションでは、Webインターフェイスの使用について説明します。

NSGポータルにログインします。 ログインすると、EEGLABスクリプトが呼び出される1*を含む**zipファイル**を、名前で1つまたは複数のデータファイルをアップロードできます(スクリプトと同じフォルダにある必要があります)。 次に、「データ」タブをクリックし、「データをアップロード」を選択し、スクリプトとデータを含むファイルをアップロードします。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG3.png?raw=true" alt="drawing" width="500"/>
</center>

3.5-MBのサンプルzipファイル(EEGデータとサンプルスクリプトを含む)をダウンロードできます。 [お問い合わせ](https://sccn.ucsd.edu/mediawiki/images/7/7c/Testingeeglabonnsg.zip)お問い合わせ 以下は、コンテンツのリストです。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/200px-NSG32.png?raw=true" alt="drawing" width="200"/>
</center>

このアップロードファイルの EEGLAB スクリプト (test.m) は以下のとおりです(テスト目的でマイナーな変更を試してください)

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG33.png?raw=true" alt="drawing" width="500"/>
</center>

新しいNSGタスクを作成します。 これを行うには、「タスク」タブをクリックし、「新しいタスクを作成」を選択します。 入力データを選択し、アップロードしたzipファイルを選択します。 「ツールを選択」をクリックし、「EEGLAB」を選択します。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG4.png?raw=true" alt="drawing" width="500"/>
</center>

次に「パラメータの選択」をクリックします。 スクリプトの名前を入力します。 このスクリプトは、zipアーカイブのルート(トップ)フォルダにある必要があります。 また、このページの他のNSG設定を変更することもできます。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG5.png?raw=true" alt="drawing" width="500"/>
</center>

最後に「保存パラメータ」を押します。 前画面に戻ります。 タスクをコメットキューに入れる「タスクを保存し、実行する」を押してください。 下の画像のように警告が表示されます。 クリックするだけでOK。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/300px-NSG6_add.png?raw=true" alt="drawing" width="350"/>
</center>

タスクが実行されると、NSG からのメールが届きます(下記のテストジョブのメールを参照してください)。


<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG6_3.png?raw=true" alt="drawing" width="500"/>
</center>

このメッセージを受信すると、NSG インターフェイスに戻り、下図のようにタスクのリストから実行したタスクを選択します。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG6.png?raw=true" alt="drawing" width="500"/>
</center>

見出し "Output" の後に "View" を選択します。以下に出力が表示されます。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG7.png?raw=true" alt="drawing" width="500"/>
</center>

タスクの出力、タスクの結果を含むzipファイルをダウンロードできるようになりました。 出力ファイル(以下のリストを参照)には、タスクのMaatlabログとエラーログが含まれます。 スクリプトがデータファイルを保存すると、そこに表示されます。 たとえば、上記のzipファイルとスクリプトを使用する場合、以下(左)は、未入力の出力アーカイブが含まれているものです。 以下の図(右)は、test.mスクリプトで作成した.jpgイメージです。 Matlab .fig 形式の出力画像を保存(.jpg ではなく)、Maatlab に読み込むことができます。 注意: 図内の数値データを .fig ファイル構造から読み込むこともできます。 また、ポストスクリプト(.epsc など)で図を保存することで、それらをIllustratorで編集することができます。

Note: 不要な転送時間と労力を節約するために、アップロードされたデータファイル自体は、新しい名前で明示的に保存しない限り、出力で返されません。 将来的には、アップロードされたデータを一時的に保存して再利用することもできます。

<center>
<img src="https://github.com/nucleuscub/pop_nsg_wiki/blob/master/docs/img/500px-NSG8.png?raw=true" alt="drawing" width="500"/>
</center>

### コマンドラインインターフェイスNSG-RとNSG EEGLABプラグインの生成によるNSGとの相互作用
このページの冒頭で述べたように、コマンド・ラインRESTFULインターフェイスNSG-R(RESTインターフェイス用R)を介して、NSG(オープンEEGLABポータル)とユーザーと相互作用することもできます。 NSG-R. NSG-R の NSG に登録すると、同一の認証情報を利用することができます。これにより、ユーザーはブラウザウィンドウから離れ、計算された作業をプログラム的に実行できます。 しかし、NSG-Rと直接やりとりするには、ほとんどの人があまり慣れていないWebサービスと適切なネットワークツールやライブラリ(例えばcurlコマンド)の知識が必要です。 そのため、EEGLAB プラグインはプロセスを簡素化し、EEGLAB ユーザーが MATLAB 環境で NSG とやり取りできるようにしました。 wikiの次のセクションでは、EEGLABプラグインをNSGに記述し、実践的なチュートリアルを提供します。 NSG-Rの好奇心旺盛な方には、こちらでもっと読むことができます。 [サイトマップ](https://www.nsgportal.org/guide.html).