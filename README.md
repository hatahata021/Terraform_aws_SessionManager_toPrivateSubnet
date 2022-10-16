# What is this
- プライベートサブネットにあるEC2インスタンスに対して、SSMセッションマネージャーが利用できるようになるTerraformコード
# 課題
- コードはベタ打ちなので、ディレクトリ構成をきれいにしたい
# 備忘録
- .terraformディレクトリをpushしてしまうと大変面倒なことになる
- もししてしまったら、以下コマンドを実行してからpushしよう
    - git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch .terraform' -- --all
## 参考
https://zenn.dev/flyingbarbarian/articles/aaf59c07b71a34