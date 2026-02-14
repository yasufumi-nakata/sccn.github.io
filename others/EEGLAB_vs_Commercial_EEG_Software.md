---
layout: default
title: EEGLAB vs. commercial soft.
summary: EEGLAB vs. Commercial EEG Software
parent: Interoperability
---
EEGLABと商用EEGソフトウェアパッケージ 
====

<blockquote>
<i>計算に応じて新しい論文の結果を信頼できます
非公開ソースコードで独自のソフトウェアによって実行されるか?</i> <a href="http://www.nature.com/nphys/journal/v12/n7/full/nphys3815.html?WT.feed_name=subjects_physical-sciences">M. Buchanan、自然物理学、2016年</a>
</blockquote>

EEGLAB の許認可により、商用企業が EEGLAB のコード(MATLAB またはコンパイルフォーム)を自社製品で使用できるようになります。 これは、例えば、例えば、 [NeuroField(ニューロフィエルド)](https://neurofield.org/software) C-Sharp コンパイル版 EEGLAB を .NET ライブラリとして使用しているソフトウェア(2023) の後半。 EEGLABのライセンス条件の一部であるEEGLABの使用を認め、バグ報告を提出することにより、事業会社が開発に貢献します。

下の表は、EEGLABの機能を比較します。, 業界で現在最高のものの最も一般的な機能のいくつか.

<table>
<th></th>
<th>エッグラボ</th>
<th>EEG商用ソフトウェア</th>
<tbody>
<tr>
	<td>バイナリファイルインポート</td>
	<td style="background-color:lightgreen">EEGLABは、ファイルインポート機能の包括的なライブラリを提供しています。 3つの異なる方法でほとんどのデータフォーマットをインポートできます。</td>
	<td style="background-color:#FFAAAA">ファイルのインポートとエクスポートは通常、いくつかのフォーマットに限定されています。</td>
</tr>
<tr>
	<td>記憶条件</td>
	<td style="background-color:#FFAAAA">EEGLABは、単一のデータセットでメモリを保持できる必要があります。 複数のデータセットを処理する場合、ディスクに滞在する場合があります。</td>
	<td style="background-color:lightgreen">ほとんどの商用ソフトウェアは、比較的小さなメモリを使用して大きなデータセットの処理を可能にするように設計されています。</td>
</tr>
<tr>
	<td>特徴:</td>
	<td style="background-color:lightgreen">EEGLABは、現在の商用ソフトウェアよりも多くの機能を備えています。 一般的なEEGLABでは、より広範囲な加工選択をユーザーに提供します。</td>
	<td style="background-color:#FFAAAA">主要な(多くの場合、高価な)商用ソフトウェアは、EEGLABツールで利用可能なよりも、ソースローカリゼーションのためのより多くの方法を提供するかもしれません。</td>
</tr>
<tr>
	<td>新しい機能の可用性</td>
	<td style="background-color:lightgreen">EEGLABは、科学コミュニティが実施するツールから恩恵を受けています。 2021年と同様に、120 EEGLABプラグインが利用可能です。</td>
	<td style="background-color:#FFAAAA">商用ソフトウェア開発の大きな部分は、Windows OSに準拠したソフトウェアをサポートしています。 EEGLABと専用の商用ソフトウェアの開発は、オープンソースと研究コミュニティによって駆動されます。新しい方法を採用しているため、商用ソフトウェアは最終的にそれらを実装します。 EEGLABは、市販のソフトウェアパッケージではまだ使用できない、比較的新しいツールをテストすることができます。</td>
</tr>
<tr>
	<td>グラフィックインターフェイス</td>
	<td style="background-color:#FFAAAA">EEGLABのグラフィックインターフェイスは商用ソフトウェアのように洗練されたものではないかもしれません。 EEGLAB のグラフィックユーザーインターフェイスは、このような処理を自動化するための便利な方法です。</td>
	<td style="background-color:lightgreen">商用ソフトウェア開発者は通常、実装されたツールのパントの費用で、グラフィックインターフェイスを完成させます。</td>
</tr>
<tr>
	<td>ドキュメント</td>
	<td style="background-color:lightgreen">EEGLABは、チュートリアル文書の300ページ以上を持っています。 ユーザーは、EEGLAB コードにアクセスして、どのような処理が行われているかを正確に確認することもできます。 また、各機能には独自のドキュメントがあります。</td>
	<td style="background-color:#FFAAAA">ドキュメントは通常、商用ソフトウェアの最優先ではなく、ソースコードは利用できません。</td>
</tr>
<tr>
	<td>コード安定性</td>
	<td style="background-color:#FFAAAA">EEGLABは定数開発中なので、開発バージョンのコード安定性は商用ソフトウェアとしては最適ではありません。 EEGLAB のコードは、業界標準や認証を厳格に検証するものではありません。 EEGLABは、定期的な臨床使用のために承認されず、そのような目的のために使用すべきではないことに注意してください。</td>
	<td style="background-color:lightgreen">最も信頼できる商用コードはより安定しているかもしれませんが、これは必ずしもすべての商用コードでは当てはまりません。</td>
</tr>
<tr>
	<td>スクリプト機能</td>
	<td style="background-color:lightgreen">EEGLAB スクリプト言語は MATLAB です。 商用コードは、MATLABと競合できない範囲、柔軟性、および利用可能なコードの量 - MATLABからの購入と、研究コミュニティから自由に利用できます。</td>
	<td style="background-color:#FFAAAA">スクリプト機能は通常、独自の言語に依存します。 一部の商用ソフトウェアでは、スクリプト内でMATLABコードを実行できます。ただし、グラフィック出力が制限されているため、MATLAB自体を実行しませんか?</td>
</tr>
<tr>
	<td>出版のための図の作成</td>
	<td style="background-color:lightgreen">EEGLABとMATLABは、パネルで複雑な図を作成することができます。 ほとんどの EEGLAB 関数はパネルと互換性があり、ユーザーは EEGLAB 関数を使用して独自のパネル結果を生成できます。 図のフォーマットは、コマンドラインからまたはMATLAB GUIから直接MATLABの下に編集することができます。 ビットマップを含む複雑な図でさえ、さらに詳細な編集のために、ポストスクリプトファイルとして保存することができます。 MATLABは、約10種類のフォーマットで図と映画を保存することもできます。</td>
	<td style="background-color:#FFAAAA">数種類のフォーマットでのみ保存できます。 ソフトウェア内の複雑な数値をビルドする機能が不在です。</td>
</tr>
<tr>
	<td>専用ユーザーサポートチーム</td>
	<td style="background-color:#FFAAAA">エッグラボ Bugzilla データベースは EEGLAB のバグを追跡するのに役立ちます。 最良の場合のシナリオでは、バグは24時間以内に修正され、自動的に一晩発行された新しいリリース。 しかしながら、EEGLABチームは、サポートするユーザーに対しては専任の人材を負い、他の研究プロジェクトの可用性と進歩に依存する助けを借りることはできません。</td>
	<td style="background-color:lightgreen">サポート担当者は、通常、ユーザーを支援するためにより容易に利用できるようになり、高度な専門知識を持つことができます。 これはすべての商用ソフトウェアの真ではありません。</td>
</tr>
<tr>
	<td>販売価格</td>
	<td style="background-color:lightgreen">最小限のMATLABインストールは、ほとんどの研究予算内または研究および大学の設定の他の目的のために既に利用可能である可能性があります。 EEGLABのコンパイルされたバージョンは、スクリプト機能がより制限されているにもかかわらず、MATLABを必要としません。</td>
	<td style="background-color:#FFAAAA">価格は$ 5000から$ 30000の範囲</td>
</tr>
</tbody>
</table>
