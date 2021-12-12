class ShoppingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @shopping_address = ShoppingAddress.new
    redirect_to '/' if @item.user.id == current_user.id || @item.shopping.present?
  end

  def create
    @shopping_address = ShoppingAddress.new(shopping_params)
    if @shopping_address.valid?
      pay_item
      @shopping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shopping_params
    params.require(:shopping_address).permit(:postal_code, :area_id, :municipalities, :house_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: shopping_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
