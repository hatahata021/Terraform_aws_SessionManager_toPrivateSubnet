# What is this
- プライベートサブネットにあるEC2インスタンスに対して、SSMセッションマネージャーが利用できるようになるTerraformコード

# 課題
- コードはベタ打ちなので、ディレクトリ構成をきれいにしたい

# 備忘録　その１
- .terraformディレクトリをpushしてしまうと大変面倒なことになる
- もししてしまったら、以下コマンドを実行してからpushしよう
    - git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch .terraform' -- --all
## 参考
https://zenn.dev/flyingbarbarian/articles/aaf59c07b71a34

# 備忘録　その2
- .gitignoreの記載内容の更新がされない時は、以下コマンドを実行してキャッシュを削除する
    - git rm -r --cached .
## 参考
https://qiita.com/fuwamaki/items/3ed021163e50beab7154