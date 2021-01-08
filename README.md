# テーブル設計
## users テーブル
| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| email               | string     | unique: false ,null:false |メール
| encrypted_password  | string     | null: false               |パスワード
| nick_name           | string     | null: false               |ニックネーム
| first_name          | string     | null: false               |苗字
| last_name           | string     | null: false               |名前
| katakana_first_name | string     | null: false               |苗字カナ
| katakana_Last_name  | string     | null: false               |名前カナ
| birthday            | date       | null: false               |誕生日
### Association
- has_many :items
- has_many :item_histories
## items テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |商品名
| explanation | text       | null: false                    |商品の説明
| category_id | integer    | null: false                    |カテゴリー
| state_id    | integer    | null: false                    |商品の状態
| burden_id   | integer    | null: false                    |配送負担
| area_id     | integer    | null: false                    |地域
| day_id      | integer    | null: false                    |日数
| price       | integer    | null: false                    |価格
| user        | references | null: false ,foreign_key: true |ユーザー
### Association
- belongs_to :user
- has_one :item_history
## item_histories テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false ,foreign_key: true |ユーザー
| item   | references | null: false ,foreign_key: true |商品
### Association
- belongs_to :user
- belongs_to :item
- has_one :user_detail
## user_details テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal       | string     | null: false |郵便番号
| area_id      | integer    | null: false |地域
| city         | string     | null: false |市
| address      | string     | null: false |番地
| building     | string     |             |建物
| phone        | string     | null: false |電話番号
| item_history | references | null: false |商品購入
### Association
- belongs_to :item_history