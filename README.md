# README

# Layouts of tables
---------------------------------------
## users Table
|Column          |Type   |Options    |
|----------------|-------|-----------|
|nickname        |strings|null: false|
|email           |strings|null: false|
|password        |strings|null: false|
|family_name     |strings|null: false|
|first_name      |strings|null: false|
|kana_family_name|strings|null: false|
|kana_first_name |strings|null: false|
|birth_year      |integer|null: false|
|birth_month     |integer|null: false|
|birth_day       |integer|null: false|

### Association
* has_many :items
* has_many :orders
---------------------------------------
---------------------------------------
## items Table
|Column         |Type   |Options    |
|---------------|-------|-----------|
|name           |strings|null: false|
|description    |strings|null: false|
|category       |strings|null: false|
|condition      |strings|null: false|
|delivery_fee   |integer|null: false|
|shipment_source|strings|null: false|
|lead_time      |strings|null: false|
|price          |integer|null: false|
|user_id        |integer|null: false|

### Association
* belongs_to :user
* has_one :order
---------------------------------------
---------------------------------------
## orders Table
|Column         |Type   |Options    |
|---------------|-------|-----------|
|price          |integer|null: false|
|postal_code    |strings|null: false|
|prefecture     |strings|null: false|
|city           |strings|null: false|
|street_number  |strings|null: false|
|shipment_source|strings|null :false|
|tel_number     |strings|null: false|
|user_id        |integer|null: false|
|item_id        |integer|null: false|

### Association
* belongs_to :user
* has_one :item

---------------------------------------