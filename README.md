# README

# Layouts of tables
---------------------------------------
## users Table
|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|nickname          |string|null: false, unique: true|
|email             |string|null: false, unique: true|
|password          |string|null: false              |
|family_name       |string|null: false              |
|first_name        |string|null: false              |
|kana_family_name  |string|null: false              |
|kana_first_name   |string|null: false              |
|birthday          |date  |null: false              |

### Association
* has_many :items
* has_many :purchases
---------------------------------------
---------------------------------------
## items Table
|Column      |Type     |Options                       |
|------------|---------|------------------------------|
|name        |string   |null: false                   |
|description |text     |null: false                   |
|category    |integer  |null: false                   |
|condition   |integer  |null: false                   |
|delivery_fee|integer  |null: false                   |
|prefecture  |integer  |null: false                   |
|lead_time   |integer  |null: false                   |
|price       |integer  |null: false                   |
|user_id     |reference|null: false, foreign_key: true|

### Association
* belongs_to :user
* has_one :purchase
* belongs_to_active_hash :category
* belongs_to_active_hash :condition
* belongs_to_active_hash :delivery_fee
* belongs_to_active_hash :prefecture
* belongs_to_active_hash :lead_time
---------------------------------------
---------------------------------------
## purchases Table
|Column    |Type     |Options                       |
|----------|---------|------------------------------|
|user_id   |reference|null: false, foreign_key: true|
|address_id|reference|null: false, foreign_key: true|

### Association
* belongs_to :user
* belongs_to :item
* has_one :address
---------------------------------------
---------------------------------------
## addresses Table
|Column       |Type     |Options                       |
|-------------|---------|------------------------------|
|postal_code  |string   |null: false                   |
|prefecture   |integer  |null: false                   |
|city         |string   |null: false                   |
|street_number|string   |null: false                   |
|building_name|string   |null: false                   |
|tel_number   |integer  |null: false                   |
|purchase_id  |reference|null: false, foreign_key: true|

### Association
* belongs_to :purchase
* belongs_to_active_hash :prefecture