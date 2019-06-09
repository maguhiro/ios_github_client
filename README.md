# ios_github_client

## セットアップ

1. fastlane/.env ファイルを用意する
2. fastlane/.env ファイルにキー`Github_API_ACCESS_TOKEN`を追記し、値として個人のGithubアカウントで生成したPersonalAccessToken(repo全体)を設定する
3. [Github Apps](https://github.com/settings/apps) で新規アプリーケーションを作成する
4. 作成したGithubアプリケーションを参考に、`config/secret.yml.template`をテンプレートとして、`config/secret.yml`を作成する
