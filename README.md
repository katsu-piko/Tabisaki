# Tabisaki

Tabisakiは、旅行先を探しながら、実際に旅行へ行った方のアドバイスを閲覧できるSNSサービスです。
スポット名、スポット写真、エリア、コメント、アドバイスを入力して投稿します。
旅行先の選定に、旅行前の情報収集に、旅行後のアルバムとして活用してみてください。


![Tabisaki＿top](https://user-images.githubusercontent.com/72494053/100333790-59446380-3016-11eb-93a7-dc882595ca12.jpg)

# URL

URL: http://52.192.40.232/

### テスト用アカウント

- ユーザー名　　：たびさき
- メールアドレス：tabi@gmail.com
- パスワード　　：tabisaki

### 利用方法

ログイン/新規登録　→　NewTweetから投稿フォームへ　→　投稿内容を記載（写真、スポット名、コメント、アドバイス、エリア）
→　投稿ボタンをクリック　→　投稿完了（トップページより投稿を確認できます。）


# 制作背景

コロナウイルスの影響で旅行にいく機会が減ったかと思います。
しかし、GoToキャンペーン等で少しずつ観光産業も回復し、また、規制が緩和されれば旅行にいく機会も増えると思います。
そんなアフターコロナの中で、旅行の思い出や口コミを共有し、ユーザー同士で観光業界を盛り上げられるアプリを作りたいと思い、 __Tabisaki__ を制作しました。

# Tabisakiのいいところ

1. 他のユーザーが投稿した、旅行先へのコメントやアドバイスを見ながら、旅行先の選定に活用できる。
2. ユーザー視点の情報なので、情報サイトやガイドブックとは違った情報が発見できる。
3. 旅行のアルバムとして活用できる。


# 実装した機能

### ユーザー管理機能

- ユーザー新規登録・ログイン（devise）
- ユーザーマイページに投稿を一覧で表示

### 投稿機能

- スポットの投稿、編集、削除
- 投稿の一覧表示、詳細表示


# 実装予定の機能

### いいね機能

- 投稿にいいね付
- いいね数による表示順の変更

### フォロー機能

- ユーザーのフォロー・フォロー解除
- フォローしたユーザー、フォロワーの一覧表示

### エリア毎の表示機能

- 指定したエリアのみの表示
- 検索機能

# 開発環境

### フロントエンド

- HTML
- CSS

### バックエンド

- Ruby 2.6.5
- Rails 6.0.0

### データベース

- MySQL

### テスト

- RSpec
- FactoryBot
- Faker

### 本番環境

- AWS (EC2,S3)
- Nginx、Unicorn、MariaDB


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :tweets
- has_many :likes

## tweets テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| spot    | string     | null: false                    |
| area_id | integer    | null: false                    |
| comment | text       | null: false                    |
| advice  | text       | null: false                    |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :likes
- belongs_to_active_hash :area

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| tweet  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet
