## [子育てマッチング]
[![Image from Gyazo](https://i.gyazo.com/b4a5b5902b4ddf28315b5549f7a600d3.png)](https://gyazo.com/b4a5b5902b4ddf28315b5549f7a600d3)
## サービス概要
子育てしているパパ・ママが、他のパパ・ママ達と子育てに関することを分かち合ったり、労り合ったりでき気軽に子育て仲間を作成できるコミュニティプラットフォームです。
## サービスURL
https://kosodate-mind-check.com

## このサービスを開発しようとも思った理由
子育てをして辛くなる時や悩み、不安を身近に打ち明けれる人がいなく溜め込んでしまうこともあると思います。そこで悩みなどを気軽に話ができる子育て仲間作りのプラットフォームを考案しました。
自分が子育てをしていて辛くなった時、コロナ禍もあり地域の子育てコミュニセンターなども閉鎖されて子育てママさんたちとの交流もできず、身近にも子育ての悩みや不安を気軽に打ち明けることができない時期がありました。そんな中、情報番組で子育てに関するトピックで同じ悩みを持っている方もいたり、虐待してしまったケースもあることを知りました。そこで、気軽に打ち明けれる場として抱えている悩みや不安などが少しでも楽になれるような環境を作りたいと思いました。

## メイン機能
|マッチング | 投稿カテゴリ検索 | チャンネル |
| :---         |     :---:      | :--- |
| [![Image from Gyazo](https://i.gyazo.com/5f3bb16cda41ef986effe4fa5a450f11.gif)](https://gyazo.com/5f3bb16cda41ef986effe4fa5a450f11) |[![Image from Gyazo](https://i.gyazo.com/e14689d83354f5336365463a288edc7c.gif)](https://gyazo.com/e14689d83354f5336365463a288edc7c)   | [![Image from Gyazo](https://i.gyazo.com/6a39c547b80a576e5e77b2e87b659dfc.gif)](https://gyazo.com/6a39c547b80a576e5e77b2e87b659dfc)    |
| 全ユーザーの投稿の中からランダムで投稿内容が１０問出題されます。共感/共感しないボタンで回答。いちばん共感が多かった投稿ユーザー名が表示されます。     | 投稿のカテゴリ検索できます。      | 投稿内容ごとにチャンネルとなっておりリアルタイム通信でメッセージのやりとりができます。      |


| アルバム | 共感ポイント |  
| ---- | ---- |
| [![Image from Gyazo](https://i.gyazo.com/f6202c59cee5898b2e1c5b1d331caac6.png)](https://gyazo.com/f6202c59cee5898b2e1c5b1d331caac6)|   [![Image from Gyazo](https://i.gyazo.com/e815f53bebb2e50ab43e7a3db4d8f6f3.png)](https://gyazo.com/e815f53bebb2e50ab43e7a3db4d8f6f3)   |           
| 画像クリックで詳細が見れます。   | 共感した数を数値化して表示してます。    |     



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
[![Image from Gyazo](https://i.gyazo.com/82d236ac310bbdcda3262e6fe23169c6.png)](https://gyazo.com/82d236ac310bbdcda3262e6fe23169c6)
