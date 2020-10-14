class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  # belongs_to_active_hash :category
  # belongs_to_active_hash :condition
  # belongs_to_active_hash :delivery_fee
  # belongs_to_active_hash :prefecture
  # belongs_to_active_hash :lead_time
  has_one_attached :item

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :lead_time_id
    validates :price
    validates :user
    validates :item
  end
end
