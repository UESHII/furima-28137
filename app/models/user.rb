class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: PASSWORD_REGEX, message: "is invalid. Input 6 characters at least, use both of letter and digit."}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
    validates :birthday
  end
end
