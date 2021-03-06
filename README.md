# ios_github_client

## 開発環境

- Xcode 10.2.1
- Swift5.0
- インストール対象OS 12.2以上

## 前提

以下のツールがインストール済みであること

- [bundler](https://github.com/bundler/bundler)
- [mint](https://github.com/yonaskolb/Mint)

## セットアップ

1. fastlane/.env ファイルを用意する
2. fastlane/.env ファイルにキー`Github_API_ACCESS_TOKEN`を追記し、値として個人のGithubアカウントで生成したPersonalAccessToken(repo全体)を設定する
3. [OAuth Apps](https://github.com/settings/applications/new) で新規アプリーケーションを作成する
※コールバックURLのスキーム名は`github-oauth`としてください
4. 作成したGithub OAuth Appsを参考に、`config/secret.yml.template`をテンプレートとして、`config/secret.yml`を作成する
5. `make setup`コマンドを叩く
