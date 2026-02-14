---
layout: default
parent: NSGportal
grand_parent: Plugins
render_with_liquid: false

title: nsgportal-command-line-tools
long_title: nsgportal-command-line-tools
---
他の多くの EEGLAB 機能と同様に、ユーザーは *nsgportal* とグラフィックユーザーインターフェイスまたはコマンドラインツールを使用して対話できます。 コマンドラインツールは、ユーザーが分析を大幅自動化し、プロセスを簡単に再現できるようにします。 このセクションでは、NSG に *nsgportal* コマンドラインツールを導入しています。

# EEGLAB コマンドラインツールを NSG に使用
EEGLABのNSGへのコマンドラインアクセスは、主に2つの機能で行われます。*pop_nsginfo()*と*pop_nsg()*。 *pop_nsg* は NSG のクレデンシャルをセットアップするために、最初の関数(*pop_nsginfo*)が使用されます。 これらの機能は、次のセクションで詳細に導入されます。

## 資格情報の設定 - *pop_nsginfo*
関数 *pop_nsginfo* を使用して、NSG の認証情報を指定します。 関数はキー値のペアの入力を受け付けます。これにより、ユーザーはNSGユーザ名(option***'nsgusername'***)、ユーザパスワード(option***'nsgpassword'***)、NSGデータがダウンロードされるフォルダ(option***'outputfolder'***)にパスします。 NSGのキーおよびNSGのurlは受諾可能なキーですが、変更しないで下さい。 *pop_nsginfo* コマンドラインコールの例では、以下のコードスニペットを参照してください。  
```
pop_nsginfo('nsgusername', 'your_username', 'nsgpassword', 'your_password', 'outputfolder', '/path/to/output/folder');
```
引数なしで*pop_nsginfo*を実行すると、GUIインターフェイスが現れます。

## NSGジョブの管理 - *pop_nsg*
関数 *pop_nsg* は、EEGLAB コマンドラインツールを NSG に動かすものです。 関数を呼び出す別の方法は、次のことができます。

1. NSGジョブの作成と実行(*pop_nsg*オプション***'run'***)
2. ローカルコンピューター(*pop_nsg*オプション***'test'***)でジョブをテストする
3. 結果を取得する (*pop_nsg* オプション) 'output'***' の入力
4. ジョブを削除 (*pop_nsg* オプション) ***「削除」***

一般的に、これらのオプションで *pop_nsg* を呼び出すと、スキームに従って行う必要があります。

```
[NSGJobStructure, AllNSGJobStructure] = pop_nsg('option_name', 'option_value');
```
オプション*'run'*** または ***'test'*** を使用する場合、2番目の引数のミュートは、投稿またはテストされるジョブを含む zip ファイルまたはフォルダーへのパスを常に行います。 これらのオプションを使用して、スクリプト(.m)を定義する2番目の引数を、テストまたはNSG実行(オプション***'filename'***)で実行する必要があります。 例えば:

```
[NSGJobStructure, AllNSGJobStructure] = pop_nsg('test', 'path/to/my/job/folder', 'filename', 'my_job_script.m');
```

*pop_nsg* の2つの出力は (1) *NSGJobStructure*: 提出されたジョブのすべての関連情報を含む NSG のジョブ構造(オプションでは利用できません。***)と(2) *AllNSGJobStructure*: 口座内のすべての NSG ジョブの配列(すべての *pop_nsg* オプションから利用可能)。
 
*pop_nsg* をオプションで呼び出すには***'output'*** または ***'delete'*** は単にジョブ ID (ID は、ジョブの送信中にユーザが割り当てることができます)、NSG ジョブ構造 (上記参照) またはジョブ URL (unique NSG の識別子) を渡すだけです。 *NSGJobStructure.jobstatus.selfUri.url*を参照してください。 例えば:

```
[NSGJobStructure, AllNSGJobStructure] = pop_nsg('output', 'My_Job_ID'); % Using job id
[NSGJobStructure, AllNSGJobStructure] = pop_nsg('output', NSGJobStructure.jobstatus.selfUri.url); % Using job URL
[NSGJobStructure, AllNSGJobStructure] = pop_nsg('output', NSGJobStructure); % Using job structure
```
*pop_nsg* をオプションで実行するには、*'output'*** または ***'delete'*** 、NSG に優先的に提出する必要があります。 ***'output'*** の使用は、既に完了したジョブに制限されます。

任意の引数なしで*pop_nsg*を実行すると、グラフィックインターフェイスが表示されます。

## その他の便利な機能
ここでは、NSG に他の有用な EEGLAB コマンドラインツールのリストを示します。

### NSGジョブのリクエスト一覧 - *nsg_jobs*
あなたの資格情報の下ですべてのNSGジョブのセル配列を返します。

使用例:

```
alljobs = nsg_jobs;
```

### ジョブステータスの再帰チェック - *nsg_recurspoll* の
NSGで稼働しているジョブのステータスに関する再帰チェック。 単一のジョブ ID、NSG のジョブ構造、ジョブ URL に必須の最初の引数が必要です。 パラメータ('pollinterval', time_in_seconds)のペアを追加して、poll間の時間を指定できます。

使用例:

```
NSGJobStructure = nsg_recurspoll('My_Job_ID', 'pollinterval', 120 );
```

# ニュース
この記事では、EEGLABプラグインのコマンドラインツールをNSGに紹介しました。 EEGLABをNSGコマンドラインツールに使用する方法の詳細な説明と例については、チェックアウト [このチュートリアル](https://github.com/sccn/nsgportal/wiki/Creating-and-managing-an-NSG-job-using-pop_nsg-from-the-command-line).
 EEGLAB プラグインを NSG に使用している関数は、「ヘルプ *function_name*」と入力して、完全なドキュメントを読み込みます。 ドキュメンテーションは、関数が何であるかを説明する素晴らしいソースです, 使い方の例, どのような入力が許可されています, そして、それが生成する出力. 関数の使用方法がわからない場合は、常にあなたのgo-toでなければなりません。