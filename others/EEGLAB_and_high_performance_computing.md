---
layout: default
title: EEGLAB and HPC
nav_title: "EEGLABとHPC"
long_title: EEGLAB and High Performance Computing
parent: Interoperability
---
EEGLABと高性能コンピューティング
====
お問い合わせ

<details open markdown="block">
  <summary>
    コンテンツの表
  </summary>
  お問い合わせ
- トピックス
お問い合わせ
</details>

EEGLABと神経科学ゲートウェイ
---
NEuroscience Gateway(NSG)を経由して、サンディエゴのスーパーコンピューターにEEGLABを稼働させるプロジェクトを募りました。 アカデミアは、世界中のアカデミアを無料で提供しています。 NSGでEEGLABを使用するドキュメントは、 [NSGportal GitHub ウィキ](https://github.com/sccn/nsgportal/wiki).


ディープラーニングとEEGLAB
----
ディープラーニングは、EEGデータに応用した普及・深層学習が急激に増加しています。 EEGLABでは、ディープラーニングや機械学習のためのデータの準備をおすすめします。 EEGLAB のデータ epochs は MATLAB または Python (EEGLAB のデータセットは、*scipy* ライブラリの *loadmat* 関数を使用して Python で読み込まれ、ディープラーニングネットワークの入力として使用されます。 MATLAB では、複数のデータセットを EEGLAB に同じ数のチャンネルと同じ数の epochs あたりのサンプルの同じ数で読み込み、タイプ:

```matlab
X = cat(3, ALLEEG.data); % concatenate trials
X = permute(X, [3 1 2]);
X = reshape(X, size(X,1), size(X,2)*size(X,3));
```

今では、Xには、ディープラーニングや機械学習アプリケーションに使用できる機能のベクトル(EEGデータエポックあたり1列)が含まれています。

GPUでEGLABを実行(グラフィック処理ユニット)
---

### 導入事例

GPU ベースの処理は MATLAB で有望です。
GPU(グラフィカル処理ユニット)の使用に関する最近の熱意
計算能力は私達を自由に利用できるGPUを試みるために導きました
MATLABのソリューション GPUは通常、GPUを使用して計算するだけを含む
変数を再キャストし、MATLABスクリプトへのマイナーな変更が必要
関数。

当社のサーバーの一つは、Quad Core IntelTM Xeon W3550 3.0GHz、8M L3、
4.8GT/s、ターボおよび1つのnVidia GTXのタイタン(2688 CUDAの中心)があります、
MATLAB がすべての CUDA コアを使用するかどうかは不明ですが(ベース)
MATLABのメッセージは以下のとおりです。 このページ上のすべてのテストは、中央値と比較して
GPUユニットを搭載したプロセッサ。 MATLAB に "gpuDevice" を入力するとき
コマンドライン、次のメッセージが表示されます。

``` matlab
gpuDevice

ans =

  CUDADevice with properties:

                      Name: 'GeForce GTX TITAN'
                     Index: 1
         ComputeCapability: '3.5'
            SupportsDouble: 1
             DriverVersion: 10.2000
            ToolkitVersion: 10
        MaxThreadsPerBlock: 1024
          MaxShmemPerBlock: 49152
        MaxThreadBlockSize: [1024 1024 64]
               MaxGridSize: [2.1475e+09 65535 65535]
                 SIMDWidth: 32
               TotalMemory: 6.3787e+09
           AvailableMemory: 5.3827e+09
       MultiprocessorCount: 14
              ClockRateKHz: 875500
               ComputeMode: 'Default'
      GPUOverlapsTransfers: 1
    KernelExecutionTimeout: 0
          CanMapHostMemory: 1
           DeviceSupported: 1
            DeviceSelected: 1
```

### GPUを用いた基本的な行列計算は、大きなスピードアップを提供

``` matlab
GPUstart;

EEG = pop_loadset('sample_data/eeglab_data_epochs_ica.set');
data = [EEG.data(:,:)];
data = [data data data data data data ];
data = [data data data data data data ];
data2 = gpuArray(data);

tic; tmp = power(complex(data2), complex(1.3,0)); toc
Elapsed time is 0.000393 seconds

tic; tmp = data.^1.3; toc
Elapsed time is 0.689292 seconds
```

EEGデータ行列の各値をフラクショナルパワー(1.3)に上げる
中央プロセッサではなくGPUを使用して2000xの速度を生成
増加。

### GPUで非パラメトリックな統計を実行して、処理を50回スピードアップ

GPU対応(MATLAB GPU機能はすべて下部で利用可能)
サイトマップ

``` matlab
c = { single(rand(400,800,100)) single(rand(400,800,100)); ...
          single(rand(400,800,100)) single(rand(400,800,100))};
tic; [FC FR FI dfc dfr dfi] = anova2_cell(c); toc
Elapsed time is 0.24665 seconds.

c = { gpuArray(single(rand(400,800,100))) gpuArray(single(rand(400,800,100))); ...
      gpuArray(single(rand(400,800,100))) gpuArray(single(rand(400,800,100)))};
tic; [FC FR FI dfc dfr dfi] = anova2_cell_gpu(c); GPUsync; toc
Elapsed time is 0.005052 seconds.
```

GPUの計算は、使用時に約50倍速くなるように見えました
メインCPU。 より小さい行列の場合、GPUとCPUコードの実装の違い
小さいかもしれません。

### 時間の頻度分解のためのGPUを使用して10xのスピードアップを提供します

``` matlab
EEG = pop_loadset('sample_data/eeglab_data_epochs_ica.set');
data2 = EEG.data;
tic; timefreq(data2, EEG.srate, 'cycles', 0); toc
Elapsed time is 0.3517511 seconds.

data = gpuArray([EEG.data(:,:)]);
tic; timefreq_gpu(data, EEG.srate, 'cycles', 0); toc
Elapsed time is 0.038354 seconds.
```

ここでは、10倍のスピードアップを時間頻度で実行して観察しました
CPU ではなく GPU でデコンポジションを解除します。 実行する
各関数は複数回、メモリ割り当ては結果に影響を与えません(GPUの最初の反復は時々遅くなります)。 注意する
上記のコードは、自動的に並列を使用するFFT関数を使用します。
主要なプロセッサ(4つの中心がある)の計算、従って利点
シングルコアCPUと比較して約40倍になる可能性があるGPUを使用する。

### GPUに関する結論 MATLABでの計算

2010年に最初のテストを走ったとき、市場で3つの選択肢がありました。
GPUmat(無料)、ジャケット(コマーシャル)、パラレルコンピューティングツールボックス
MATLAB(コマーシャル) 全体的に、性能改善に不備があった。

2020年以降(これらのテストが実行された日付)、GPUソリューションが大幅に最適化され、弊社では
すべてのソリューションの大きなスピードアップを観察できるようになりました。 GPU が
二重精度の数値と互換性がありますが、テストされていない
ソリューション

EEGLAB 互換 GPU 機能をテストしました。
[詳しくはこちら](https://github.com/sccn/eeglab_gpu_func)お問い合わせ これらの関数は
完全に機能しない(条件の限られたセットの下でのみ動作します)
上記のようにテストされ、従ってexploratoryのためにだけ利用できます
テスト目的。

MATLABが私のコンピューティングリソースで利用できない場合
--------------------------------------------

スーパーコンピュータやSingularity、MATLAB、非常に効率的ですが、
利用できない場合があります(ローカルスーパーコンピューターでご確認ください)。 2019年(EEGLAB 2019)現在、スーパーコンピューティングのオクターブ(v4.4.0)のサポートをしています。
アプリケーション。 ご参照ください。 
お問い合わせ [サイトマップ](/others/Running_EEGLAB_on_Octave) 使用方法
オクターブのEEGLAB。 短期的には、Octave は EEGLAB の機能を使用する最も簡単な方法であり、実際に有用な結果を得ることができます。

HadoopでEEGLABを使う
------------------------
Hadoop Mapreduceは、大規模な計算を行うためのフレームワークです
コンピュータのクラスター。 Mapreduceの仕事には2つのステップがあります:マッピング
多数の労働者(コンピュータ)が多数の数で働いた仕事
データラインの1つのワーカープールで、マッピング結果をすべて1つのステップを削減します。 このセクションは2013年に作成され、2021年に更新されました。

以下は、AmazonでElastic Mapreduceを使用するためのガイドラインを提供します。
クラウド。 Elastic Mapreduce は大きく処理するために合わせられます
ログテキストファイルとバイナリデータの量。 条件のゲイン
このようなソリューションの実行コストと比較して処理速度が残ります
コンピューターのローカルクラスターを持っている場合は、不明です。 要するに、あなたはかもしれない
ソリューションをプログラミングし、より多くの時間を費やすことができる
ローカルで実行していたよりも、帯域幅とストレージの用語。 お問い合わせ
あなたが従うべきステップです。 エキスパート
コンピュータサイエンスの推奨事項

-   Hadoopコマンドラインインターフェイスをインストールします。 まず、[コマンド] をインストールします。
    ライン インターフェイス:(http://aws.amazon.com/developertools/2264) へ
    伸縮性があるMapreduce。 これにより、ジョブの設定と実行ができます。
    Amazonクラウド。 [AWS] を作成する必要があります。
    ログインhttp://aws.amazon.com/)。 Hadoopは実行する必要があります
    ストリーミングモード、データが単に実行可能にストリーミングされる場所。
    ネイティブJavaモードでHadoopを実行することも可能です。
    Java ビルダーを使用して MATLAB のコードをコンパイルします(これは
    ストリーミングモードよりも複雑です。

-   データをAmazonストレージクラウドに転送(Amazonストレージクラウド)
    S3と名付けます。 あなたのデータ
    文字の文字列でフォーマットする必要があります。 <b>お問い合わせ
    未加工EEGデータを処理する、テキストでそれをシリアライズする必要があります</b>,
    テキストの1列を表す各チャネル(Hadoopはバイナリデータを処理することもありますが、その機能を試してみました)。 ありません
    テキストの行の長さに制限します。 しかし、覚えなければならない
    信号処理と帯域幅の両面のオーバーヘッド
    処理テキストに関連した。 128 チャンネルと 100 がある場合
    データファイルでは、Hadoopの処理手順12,800に対応しています。 お問い合わせ
    タスクに1,000人の労働者を割り当てることができます。これはそれぞれを意味します
    ワーカーは、約13チャンネルを処理します, 約の潜在的なスピードアップ
    タスクで1,000円 帯域幅のオーバーヘッドを最小限に抑えるには、
    圧縮されたバイナリデータをS3に転送し、ローカルamazonを持っています
    EC2 amazon ノードはそれを解凍し、それを S3 に戻します(これは、
    S3のEC2ノードの帯域幅は無料です。

-   ソリューション1(実装が最も簡単です) EEGLABコマンドライン
    コードは互換性があります
    [オタク](/others/Running_EEGLAB_on_Octave)お問い合わせ オクターブは
    ノードの各ノードに比較的簡単にインストール
    boottrappingメソッド(ソフトウェアを自動的にインストールする方法)
    各ノード。 Octave を自動的にインストールするコマンド
    EC2 Amazon ノードは *sudo yum –y は octave --enablerepo=epel* をインストールします。

    HadoopはSTDINとSTDOUTパイプを介して労働者と通信します。 メインのMATLABスクリプトでは、次の追加が必要
    メインスクリプトの先頭で。 これは実行可能になり、
    STDINでデータを処理できるようにします。 可能です。
    *printf* または *disp* MATLAB を使用してデータ処理の出力を書きます
    コマンド。 

    ``` matlab
    #!/usr/bin/octave -qf
    Q = fread(stdin); %Standard Octave / MATLAB code from here on
    ```

-   ソリューション2、MATLABコードのコンパイル MATLABコードのコンパイルが最も多く
    MATLABのコンパイルコードとして効率的なソリューションは、多くの場合2〜4回
    Octaveコードよりも速く、コンパイルされたコードはMATLABを必要としません
    ライセンス ローカルのUnixワークステーションでMATLABコードをコンパイルすると、
    Amazon AMI(仮想マシン)を必ず使用する必要があります。
    image) ライブラリの同じセットで、コードが実行できるように
    その機械。 互換性のあるAMIを選ぶ必要があります。
    ハドープも。 また、MATLABには簡単な機構はありません。
    STDINから読み込むことができます。 最も簡単な解決策は、サードパーティのコンパイルされたMexファイルを使用して行うことです(例えば、参照してください
    [ログイン](http://www.mathworks.com/matlabcentral/fileexchange/13851-popen-read-and-write)).
    別のソリューションは、ディスクにSTDINを書くシェルコマンドを持つことです。
    MATLAB実行可能(ただし、これは不公平である可能性があります)
    パフォーマンス)。

-   ステップを減らす:すべての労働者が何をすべきかを計算したら
    計算(例の分光力)は、ステップを減らすことはそれを書くかもしれません
    S3 Amazonのストレージをバックアップ(さらに処理を行う)
    同じに属するバックチャネルをグループ化することなど
    トピック

-   Hadoop を実行: AWS コマンド ライン インターフェイスを使用して、何かをタイプして下さい
    以下のような。

    ``` matlab
    elastic-mapreduce --create --stream --input s3n://Arno/myEEGserializedtextfiles/ \
    --mapper s3://Arno/process_octave \
    --reducer s3://Arno/reducer.py \
    --output s3n://Arno/output --debug --verbose \
    --log-uri s3n://Arno/logs --enable-debugging \
    --bootstrap-action s3n://Arno/install_octave
    ```

- 任意のプログラミング言語でステップを減らすことができます
STDINからデータを取り、STDOUTに書き込む。 減らされたステップは通常通ります
EEGLABコマンドを実行する必要はありません。 データをプールするだけでは、
労働者を要約し、それを要約します。 このケースでは、Python のカスタム
プログラムですが、オクターブ/MATLAB もあるので
作業者のそれぞれにオクターブをインストールします。 あなたの正確なコンテンツ
コードは、やりたいタスクに依存します。

上記の解決策は、対処するときにのみ試すべきです
ローカルプロセッサやクラスターが処理できない大量のデータ。
 ですから
ブートストラップデータが必要な場合に最適(計算ロット)
小さなデータ)。 ご意見・ご要望等ございましたら、お気軽にお問い合わせください。 <eeglab@sccn.ucsd.edu>.

