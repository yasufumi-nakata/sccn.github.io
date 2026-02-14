### インストール手順
https://github.com/OpenNeuroOrg/openneuro/tree/master/packages/openneuro-cli

1. bashが使用されていることを確認してください(nemar-devのデフォルトではtcsh)、必要に応じて変更
```sh
echo $SHELL
chsh --shell /bin/bash <username>
```
2. nvmをインストールする 
```sh 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
```
3. nvmでnodejs@14をインストール
```sh
nvm install 14
```
4. openneuro-cliをインストール
```sh
npm install -g @openneuro/cli
```
5. フォロー**設定**ガイド [詳しくはこちら](https://github.com/OpenNeuroOrg/openneuro/tree/master/packages/openneuro-cli) ログインし、**Usage**を確認してください。


### トラブルシューティング
* "Error: モジュール 'react' が見つからない場合、手動で openneuro-cli が配置されている場所をローカルに反応します。
```sh
cd /home/<username>/.nvm/versions/node/<v#>/lib/node_modules/openneuro-cli
npm install react
```

* OpenNeuro クライアントを更新するには:
```sh
npm update -g @openneuro/cli
```
