class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create, :edit_restriction, :pay_item, :purchase_address_params]
  before_action :move_to_index, :edit_restriction

  def index
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    binding.pry
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

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def edit_restriction
    if current_user.id == @item.user_id
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
