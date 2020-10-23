class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :lead_time

  belongs_to :user
  has_one_attached :image
  has_one :purchase
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :delivery_fee
    validates :prefecture
    validates :lead_time
    validates :user
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10000000,
      message: "is invalid. Input a price from 300 to 9999999 in half-width numbers."},
      format: { with: /\A[0-9]+\z/,
      message: "is invalid. Input a price from 300 to 9999999 in half-width numbers."
    }
  end
end
