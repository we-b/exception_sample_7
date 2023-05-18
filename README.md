# このリポジトリについて

例外処理の挙動について、rakeタスクを通じて確かめるためのリポジトリです。


## 使い方
1. リポジトリをクローンする
2. `rails db:setup`
3. `rake distribute_ticket:increment`,  `rake distribute_ticket:transact`, `rake distribute_ticket:rescue`をそれぞれ試す

