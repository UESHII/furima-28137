class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :restriction, :pay_item, :purchase_address_params]
  before_action :restriction, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def restriction
    if @item.purchase || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def purchase_address_params
    @user = current_user
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :tel_number).merge(user_id: @user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_a850a65223b2dd3c0f32ca8f"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
