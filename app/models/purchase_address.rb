class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_number, :building_name, :tel_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :street_number
    validates :building_name
    validates :tel_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input is invalid. Input half-width numbers without hyphen."}
    # validates :token
  end

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, tel_number: tel_number, purchase_id: @purchase.id)
  end
end