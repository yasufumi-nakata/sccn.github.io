---
layout: default
parent: SIFT
grand_parent: Plugins
render_with_liquid: false

title: Chapter-5.5.-Connectivity-Estimation
long_title: Chapter-5.5.-Connectivity-Estimation
---
モデルが合っているので、いくつか計算したい
スペクトラム、コヒーレンス、および
悲しみの因果。 メニュー項目を選択することで、コネクティビティの推定GUIを立ち上げる 
ツール > SIFT > コネクティビティ** コマンド行から、単一のデータセット EEG を使用できます。

``` matlab
 EEG = pop_est_mvarConnectivity(EEG);
```

下の図に示す GUI が表示されます。 ここに、私達はできます
4.3セクションの表4にリストされているすべての措置(および多く)を計算します。 お問い合わせ
測定値を計算する周波数のリストを指定できます。複雑な対策やスペクトルの簡単な変換を行うことができます。
密度。


たとえば、直接DTFを計算してみましょう(フルキャサール付き)
正規化、denoted dTF08)、複雑な一貫性、部分的
一貫性、および頻度範囲上の複雑なスペクトル密度
2-50 Hz (1つのHzの決断と)。 あなたのオプションは、以下の図と表として設定する必要があります。

<table>
<tbody>
<tr class="odd">
<td><p>オプション</p></td>
<td><p>バリュー</p></td>
</tr>
<tr class="even">
<td><p><strong>接続方法の選択</strong></p></td>
<td><p><strong>直接DTF(フルキャナルノルム付き)</strong><br />
<strong>複雑なコヒーレンス(コー)</strong><br />
<strong>部分的な一貫性(pCoh)</strong><br />
<strong>複雑なスペクトル密度(S)</strong></p></td>
</tr>
<tr class="odd">
<td><p><strong>複雑な対策の正方形の広さを返す</strong></p></td>
<td><p><strong>チェックイン</strong></p></td>
</tr>
<tr class="even">
<td><p><strong>スペクトル密度をデシベルに変換する</strong></p></td>
<td><p><strong>チェックイン</strong></p></td>
</tr>
<tr class="odd">
<td><p><strong>頻度(Hz)</strong></p></td>
<td><p><strong>2:50</strong></p></td>
</tr>
</tbody>
</table>


![スクリーンショット 2023-08-25 に 5 02 27 PM](https://github.com/sccn/SIFT/assets/1872705/06297970-6826-420e-aede-7da9937fe095)

*充填キャプション。 コネクティビティ推定GUI生成
によって `pop_est_mvarConnectivity()`お問い合わせ ここでは、見積りに選ばれた
直接DTF(フルキャナル正規化付き; dDTF08)、コンプレックス
コヒーレンス(Coh)、部分的コヒーレンス(pCoh)、スペクトル密度
(S). * 必須


追加の対策を選択すると、マージンのみが増加します
計算時間、措置の数を倍増する一般的に
記憶要求を倍増して下さい。 [OK] をクリックして続行します。 今すぐ入手する
必要なメモリの量を通知するプロンプト(それぞれ)
条件)。 続けて十分なメモリがある場合、**OK**をクリックします。 ツイート
進捗バーが表示されます。, 接続のステータスを表示
各条件の推定。

GUI を使いたくない場合は、コマンドラインから以下のように実行できます。

```matlab
EEG = pop_est_mvarConnectivity( EEG, 'nogui', 'ConnectivityMeasures', ...
             {'dDTF08' 'Coh' 'pCoh' 'S'}, 'Frequencies', [2:50], 'VerbosityLevel', 1); 
```

