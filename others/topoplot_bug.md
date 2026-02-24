EEGLAB 2024.0 では、Octave の互換性の topoplot 関数を変更しました。そこで、メッシュグリッド関数はプリコンプトポイント座標に使われていました(これは [コード変更](https://github.com/sccn/eeglab/commit/fb2b77e1db70c025b7898f18af895e59aba7bbc1) 問題を解決するため)。 これは、Octave のグリッドデータ関数は、MATLAB の 1 ほど強力ではないため、この追加のステップが必要です。

しかし、この座標は逆転し、下のバグを引き起こしました。 これは、イメージが対角線に沿って反転する微妙なミラーリングの問題です。

![scalp_topo(スカルプ)](https://github.com/sccn/sccn.github.io/assets/1872705/0e9003b5-203e-431c-ada5-6bf1c31a2051)

残念ながら、この問題はEEGLAB 2024.0で実行されるすべてのtopoplotに影響を与えます。
