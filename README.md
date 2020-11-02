# テーブル設計

## users テーブル
<!-- unique: true は、dbのマイグレーションファイルに記載 -->
| Column          | Type   | Options                   |
| --------------  | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false, unique: true |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_date      | date   | null: false               |
                          


### Association
- has_many :items
- has_many :order




## items テーブル

| Column                     | Type      | Options                          |
| -------------------------- | --------  | -------------------------------- |
| user                       | references| null: false, foreign_key: true   |
| name                       | string    | null: false                      |
| description                | text      | null: false                      |
| category_id                | integer   | null: false                      |
| status_id                  | integer   | null: false                      |
| shipping_charge_id         | integer   | null: false                      |
| prefecture_id              | integer   | null: false                      |
| estimated_shipping_date_id | integer   | null: false                      |
| price                      | integer   | null: false                      |



### Association
- belongs_to :user
- has_one :order


## ordersテーブル

|Column|Type        |Options                         |
|------|------------|--------------------------------|
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## addressesテーブル
<!-- unique: true は、dbのマイグレーションファイルに記載 -->
|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
| postal_number  | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    | 
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false,                   |
| order          | references | null: false, foreign_key: true |


### Association
- belongs_to :order
