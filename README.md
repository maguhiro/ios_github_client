# ios_github_client

## 前提

以下のツールがインストール済みであること

- [bundler](https://github.com/bundler/bundler)
- [mint](https://github.com/yonaskolb/Mint)

## セットアップ

1. fastlane/.env ファイルを用意する
2. fastlane/.env ファイルにキー`Github_API_ACCESS_TOKEN`を追記し、値として個人のGithubアカウントで生成したPersonalAccessToken(repo全体)を設定する
3. [Github Apps](https://github.com/settings/apps) で新規アプリーケーションを作成する
※コールバックURLのスキーム名は`github-oauth`としてください
4. 作成したGithubアプリケーションを参考に、`config/secret.yml.template`をテンプレートとして、`config/secret.yml`を作成する
5. `make config`コマンドを叩き自動生成ファイルを作成
6. `make setup`コマンドを叩く
