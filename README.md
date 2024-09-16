# README

|Column|Type|Options|

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| name_id            | string              | null: false, unique: true | 
| email              | string              | null: false, unique: true |
| encrypted_password | text                | null: false               |
| first_name         | string              | null: false               |
| given_name         | string              | null: false               |
| birth_date         | integer             | null: false               |
| given_name_reading | string              | null: false               |
| first_name_reading | string              | null: false               |


has_many :products
has_many :orders

## product table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user_id            | references          | null: false               |
| name_id            | string              | null: false               |
| description_id     | text                | null: false               |
| price_id           | string              | null: false               |
| category_id        | integer             | null: false               |
| charge_id          | integer             | null: false               |
| delivery_region_id | integer             | null: false               |
| condition_id       | integer             | null: false               |
| Shipping_days_id   | integer             | null: false               |


## Association

* belongs_to :user
* belongs_to :category_id

## order table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| user               | references          | null: false, unique: true |
| product            | references          | null: false, unique: true |

### Association

* belongs_to :user

## category table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| id                 | string              | null: false               |
| name               | string              | null: false               |
| parent_category    | references          | null: false               |

### Association

- belongs_to :product

## address table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| address_id         | string              | null: false               |
| postcode           | string              | null: false               |
| prefectures        | string              | null: false               |
| city               | string              | null: false               |
| street_address     | string              | null: false               |
| building_name      | string              | null: false               |
| phone_number       | string              | null: false               |
| purchase_id        | references          | null: false               |

### Association

- has_one :user
 
（ここに追記していく）