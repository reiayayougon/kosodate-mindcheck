## [子育てマッチング]
[![Image from Gyazo](https://i.gyazo.com/b4a5b5902b4ddf28315b5549f7a600d3.png)](https://gyazo.com/b4a5b5902b4ddf28315b5549f7a600d3)
## サービス概要
子育てしているパパ・ママが、他のパパ・ママ達と子育てに関することを分かち合ったり、労り合ったりでき気軽に子育て仲間を作成できるコミュニティプラットフォームです。

## メイン機能
|マッチング | 投稿カテゴリ検索 | チャンネル |
| :---         |     :---:      | :--- |
| [![Image from Gyazo](https://i.gyazo.com/5f3bb16cda41ef986effe4fa5a450f11.gif)](https://gyazo.com/5f3bb16cda41ef986effe4fa5a450f11) |[![Image from Gyazo](https://i.gyazo.com/e14689d83354f5336365463a288edc7c.gif)](https://gyazo.com/e14689d83354f5336365463a288edc7c)   | [![Image from Gyazo](https://i.gyazo.com/6a39c547b80a576e5e77b2e87b659dfc.gif)](https://gyazo.com/6a39c547b80a576e5e77b2e87b659dfc)    |
| 全ユーザーの投稿の中からランダムで投稿内容が１０問出題されます。共感/共感しないボタンで回答。いちばん共感が多かった投稿ユーザー名が表示される。     | 投稿のカテゴリ検索      | 投稿内容ごとにチャンネルとなっておりリアルタイム通信でメッセージのやりとりができる      |


| アルバム | 共感ポイント |  
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/f6202c59cee5898b2e1c5b1d331caac6.png)](https://gyazo.com/f6202c59cee5898b2e1c5b1d331caac6)|   [![Image from Gyazo](https://i.gyazo.com/e815f53bebb2e50ab43e7a3db4d8f6f3.png)](https://gyazo.com/e815f53bebb2e50ab43e7a3db4d8f6f3)   |           
| 画像クリックで詳細が見れる   | 共感した数を数値化して表示    |     



## その他機能

* 認証ログイン(google)
* プロフィール編集(プロフィール画像登録,自己紹介)
* 投稿一覧/作成/編集/削除
* イイネ機能




## 使用技術
### バックエンド

- Ruby 3.1.2
- Ruby on Rails 7.0.7.2
- PostgreSQL

gem
- ransack
- kaminari
- omniauth-google-oauth2
- omniauth-rails_csrf_protection
- carrierwave
- mini_magick
- cloudinary
- swiper-rails
- ActionCable

API
- Google OAuth 2.0 API


### フロントエンド
- Tailwind CSS
- Preline UI
- Hotwire(Turbo, Stimulus)

### インフラ
- Heroku

### 画面遷移図
[figmaリンク](
https://www.figma.com/file/W9TzEtTSjZHImhk9m26ZNy/%E7%84%A1%E9%A1%8C?type=design&node-id=0%3A1&mode=design&t=6JEHAV6tACUO0X2E-1)

## ER図 ##
[![Image from Gyazo](https://i.gyazo.com/9dc8c506bec2a988435060f93d8448c2.png)](https://gyazo.com/9dc8c506bec2a988435060f93d8448c2)
