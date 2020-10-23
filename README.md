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
| birth_bate      | date   | null: false               |
                          


### Association
- has_many :items
- has_many :purchases




## items テーブル

| Column           | Type      | Options                          |
| ---------------- | --------  | -------------------------------- |
| user             | references| null: false, foreign_key: true   |
| name             | string    | null: false                      |
| description      | text      | null: false                      |
| images_id        | integer   | null: false                      |
| category_id      | integer   | null: false                      |
| condition_id     | integer   | null: false                      |
| postage_payer_id | integer   | null: false                      |
| prefecture_id    | integer   | null: false                      |
| handling_time_id | integer   | null: false                      |
| price            | integer   | null: false                      |



### Association
- has_many :images
- belongs_to :user
- belongs_to :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :handling_time
- belongs_to_active_hash :prefecture




## imagesテーブル

|Column | Type       | Options                        |             
|-------|------------|--------------------------------|
| image | string     | null: false                    |
| item  | references | null: false, foreign_key: true |


### Association
- belongs_to :item


## categoryテーブル(active_hash)

| Column   | Type   | Options     |   
|----------|--------|-------------|
| category | string | null: false |


### Association
（ここに追記していく）

## conditionテーブル(active_hash)

| Column   | Type   | Options     |   
|----------|--------|-------------|
| condition| string | null: false |


### Association
（ここに追記していく）

## handling_timeテーブル(active_hash)

| Column        | Type   | Options     |   
|---------------|--------|-------------|
| handling_time | string | null: false |


### Association
（ここに追記していく）

## postage_payerテーブル(active_hash)

| Column        | Type   | Options     |   
|---------------|--------|-------------|
| postage_payer | string | null: false |


### Association
（ここに追記していく）

## prefectureテーブル(active_hash)

| Column        | Type   | Options     |   
|---------------|--------|-------------|
| prefecture    | string | null: false |


### Association
（ここに追記していく）


## ordersテーブル

|Column|Type        |Options                         |
|------|------------|--------------------------------|
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |


### Association
- has_one :item
- belongs_to :user
- has_one :address


## addressesテーブル
<!-- unique: true は、dbのマイグレーションファイルに記載 -->
|Column          |Type        |Options                         |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false, foreign_key: true |
| city           | string     | null: false                    | 
| building_name  | string     |                                |
| phone_number   | string     | null: false, : unique: true    |
| order          | references | null: false, foreign_key: true |


### Association
- belongs_to :order
- belongs_to_active_hash :prefecture