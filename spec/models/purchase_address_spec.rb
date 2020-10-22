require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能 購入できる場合' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@purchase_address).to be_valid
    end
    it '建物名は入力されていなくても購入できること' do
      @purchase_address.building_name = ""
      expect(@purchase_address).to be_valid
    end
  end

  describe '商品購入機能 購入できない場合' do
    it '郵便番号にハイフンがないと購入できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Input numbers include hyphen(-).")
    end
    it '電話番号にハイフンがあると購入できないこと' do
      @purchase_address.tel_number = '090-1234-5678'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Tel number is invalid. Input half-width numbers without hyphens(-).")
    end
    it '都道府県を選択していないと購入できないこと' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村が入力されていないと購入できないこと' do
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が入力されていないと購入できないこと' do
      @purchase_address.street_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
    end
    it 'クレジットカード情報が正しくないと購入できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token is invalid. Input correct card informations.")
    end
  end
end