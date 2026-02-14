---
layout: default
parent: NSGportal
grand_parent: Plugins
render_with_liquid: false

title: Creating-and-managing-an-NSG-job-using-pop_nsg-from-the-command-line
long_title: Creating-and-managing-an-NSG-job-using-pop_nsg-from-the-command-line
---
このチュートリアルでは、_pop_nsg_ のコマンドラインオプションを使用してジョブの送信と管理のプロセスについて説明します。 

チュートリアルに従う前に、プラグインをインストールし、NSGの資格情報を設定する必要があります。 もしそうしなかったら、 [このセクション](https://github.com/sccn/nsgportal/wiki/Setting-up-the-plug-in) 指示のため。

セクションで作成した同じジョブを使用します。 [ファイルを準備してジョブを提出する](https://github.com/nucleuscub/pop_nsg_wiki/wiki/Preparing-your-files-to-submit-a-job) そして使用されて [デモ1](https://github.com/nucleuscub/pop_nsg_wiki/wiki/Demo-1:-Creating-and-managing-a-job-form-pop_nsg-GUI)お問い合わせ チュートリアルスクリプトをダウンロードできます [詳しくはこちら](https://github.com/sccn/nsgportal/blob/master/demos/demo_command_line_tools.m) お問い合わせ

## _pop_nsg_ コマンドの概要
**_pop_nsg_** コマンドは引数無しで呼び出すことができます。この場合、GUI インターフェイスが現れます(参照) [デモ1](https://github.com/sccn/nsgportal/wiki/Creating-and-managing-a-job-from-pop_nsg-GUI))。 Else、_pop_nsg_ の最初の引数は、次のアクションを指定する必要があります。
* 'test': ローカルコンピューターでテスト実行を実行します。 [argument: ジョブ .zip ファイルまたはフォルダー]
* 'run': ジョブを NSG で実行するには [argument: ジョブ .zip ファイルまたはフォルダー]
* 'output': ジョブ出力ファイルの取得 [argument: ジョブ識別子またはNSG ジョブ構造]
* 'delete': NSGアカウントからジョブレコードを削除する [引数:ジョブ識別子またはNSGジョブ構造]

## コマンドラインからNSGジョブを実行する
この例では、ジョブのzipファイルやフォルダへのパスを変数に割り当てますが、一般的に、パスは関数に文字列として直接渡すことができます。
```
path2zip = '/Users/amon-ra/program_files/eeglab/plugins/nsgportal/demos/demo_jobs/TestingEEGLABNSG.zip';
```
デフォルトオプションを使用してジョブを実行するには:
```
[currentjob, alljobs] = pop_nsg('run',path2zip,'filename', 'run_ica_nsg.m');
```
ここに2つ目のパラメーターが使われていたことに注意しましょう。```'filename', 'run_ica_nsg.m'```)。 ジョブを実行するには、NSG が実行するスクリプトを指定するには、_'run'_ オプションを使用する必要があります。 したがって、オプション _'run'_ を使うと 'filename' が必須です。

デフォルトオプションは、ランダムに生成されたIDをジョブに割り当て、デフォルトのジョブパラメータを使用してNSGで実行するジョブを送信します。 

また、Key-Value ペア引数を関数呼び出しに提供することで、ジョブパラメータを指定することもできます。 オプションの引数には:
* 'jobid' : クライアントジョブ ID 文字列 [デフォルト値は、 randon 生成された番号 eg: _jobname_1234_] によって追跡されるジョブ名になります。
* 'outfile' : 結果ファイル名文字列 [デフォルト: ['nsgresults_', '_jobid_']]
* 'runtime' : NSGでジョブを実行するための最大時間(時間) [デフォルト:0.5]
* 'subdirname': スクリプトファイルを含むサブディレクトリの名前(スクリプトファイルがトップレベルのフォルダーにない場合) [デフォルト:なし]

指定されたオプション引数で 'run' コマンドの例:
```
[NSGjobstruct, alljobs] = pop_nsg('run', path2zip, 'filename', 'run_ica_nsg.m', 'jobid', 'runica_testing', 'runtime', 0.3); 
```

この関数は、送信されたジョブ(_currentjob1_)のMATLAB NSGジョブ構造と、NSGクレデンシャル(_alljobs_)の全てのジョブに関する情報を含む構造を返します。

## ジョブの状態を定期的に確認する
応募後、NSGサーバが処理されます。 ジョブのステータスは、_nsg_recurspoll_ という関数を呼び出して、ジョブ ID、ジョブ URL、ジョブ構造、および(オプション) のポーリング間隔を秒単位で確認することができます。 ここで、jobidは最初の引数として使用されます。
```
NSGjobstruct = nsg_recurspoll('runica_testing','pollinterval', 30);
```

_pollinterval_ は 30 秒以上でなければなりません。 NSGの過負荷を避けるために可能な限り、ポーリング間隔を保って下さい。

_nsg_recurspoll_ [argument:jobid] は指定されたジョブのステータスを含む構造を返します。 ジョブが完了したら、 _pop_nsg_ を使用して結果を取得できます。

ジョブ結果は、ジョブ完了後に取得できます。 _nsg_recurspoll_ を使用して、結果にアクセスしようとする前にジョブが終了することを確認します。

## ジョブ結果の取得
_jobid_、ジョブURL、ジョブ構造を _pop_nsg_ に提供するジョブ結果にアクセスします。
```
[NSGjobstruct, alljobs] = pop_nsg('output', NSGjobstruct); 
```
入力 _NSGjobstruct_ から結果を取得したいジョブのNSGジョブ構造が含まれています。 出力 _NSGjobstruct_ には、ジョブの出力ステータスも含まれています。 出力変数 _alljobs_ には、ユーザ認証に関連するすべての NSG ジョブの現在のステータス情報が含まれています。

## NSGジョブの削除
ユーザ NSG のクレデンシャルに関連付けられている NSG レコードからジョブを削除するには、_jobid_、ジョブ URL またはジョブ構造を 2 番目の引数として指定します。
```
[NSGjobstruct, alljobs] = pop_nsg('delete',NSGjobstruct); 
```
出力は、上記のように、変更されたNSGジョブ構造とユーザー認証に関連するすべてのNSGジョブの情報です。 このコマンドを実行すると、NSG のアカウントからジョブが削除されます。 出力で返された構造 _NSGjobstruct_ は削除されたジョブの参照です(フィールドに見られるように) ```NSGjobstruct.jobStage``` 'DELETED' に設定され、もう使用してジョブにアクセスできません。








