class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :encrypted_password
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
    validates :birthday
  end
end
