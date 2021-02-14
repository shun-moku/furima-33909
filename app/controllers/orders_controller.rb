class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :set_order, only:[:index,:create]
  before_action :move_to_index_for_seller, only: :index
  before_action :move_to_index_for_soldout, only: [:index, :edit]
  def index
    @order_address = OrderAddress.new
    # @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    # @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    # params.permit(:price).merge(user_id: current_user.id)
    params.require(:order_address).permit(:zip_code, :region_id, :city, :street_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end


  def move_to_index_for_seller
    # @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
  end

  def move_to_index_for_soldout
    redirect_to root_path if @item.order != nil
  end



end
