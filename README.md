## [子育てマッチング]
[![Image from Gyazo](https://i.gyazo.com/b4a5b5902b4ddf28315b5549f7a600d3.png)](https://gyazo.com/b4a5b5902b4ddf28315b5549f7a600d3)
## サービス概要
子育てしているパパ・ママが、他のパパ・ママ達と子育てに関することを分かち合ったり、労り合ったりでき気軽に子育て仲間を作成できるコミュニティプラットフォームです。

|マッチング| 投稿カテゴリ検索 | チャンネル |
| :---         |     :---:      | :--- |
| 画像 | 画像     | 画像    |
| 全ユーザーの投稿の中からランダムで投稿内容が１０問出題されます。共感/共感しないボタンで回答。いちばん共感が多かった投稿ユーザー名が表示される。     | 投稿のカテゴリ検索      | 投稿内容ごとにチャンネル差となっておりリアルタイム通信でメッセージのやりとりができる      |
| **アルバム** | **共感ポイント** |  |
| 画像|   画像    |           |
| 画像クリックで詳細が見れる   | 共感した数を数値化して表示    |     |



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