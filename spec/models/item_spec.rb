require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it "画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格が存在していれば登録できる" do
        expect(@item).to be_valid
      end
      it "画像があれば登録できる" do
        @item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        expect(@item).to be_valid
      end
      it "商品名があれば登録できる" do
        @item.name = "sample item"
        expect(@item).to be_valid
      end
      it "商品説明が選択されていれば登録できる" do
        @item.description = "sample description"
        expect(@item).to be_valid
      end
      it "カテゴリーが選択されていれば登録できる" do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it "商品の状態が選択されていれば登録できる" do
        @item.condition_id = 1
        expect(@item).to be_valid
      end
      it "配送料の負担が選択されていれば登録できる" do
        @item.delivery_fee_id = 1
        expect(@item).to be_valid
      end
      it "発送元の地域が選択されていれば登録できる" do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it "発送までの日数が選択されていれば登録できる" do
        @item.lead_time_id = 1
        expect(@item).to be_valid
      end
      it "価格が入力されており、かつ¥300~¥9,999,999の間であれば登録できる" do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "画像がなければ登録ができない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がなければ登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が選択されていなければ登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーが選択されていなければ登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が選択されていなければ登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が選択されていなければ登録できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "発送元の地域が選択されていなければ登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が選択されていなければ登録できない" do
        @item.lead_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Lead time can't be blank")
      end
      it "価格が入力されていなければ登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include(
          "Price can't be blank",
          "Price is invalid. Input a price from 300 to 9999999 in half-width numbers.",
          "Price is invalid. Input a price from 300 to 9999999 in half-width numbers."
        )
      end
      it "価格は半角でなければ登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input a price from 300 to 9999999 in half-width numbers.")
      end
      it "価格が￥¥300~¥9,999,999の間でなければ登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input a price from 300 to 9999999 in half-width numbers.")
      end
    end
  end
end
