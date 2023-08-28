class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])

    if @item.sold_out?
      redirect_to root_path, alert: "売却済みの商品は購入できません。"
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @order_form = OrderForm.new
    end
  end

  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new(order_params)

    if @order_form.valid?
      pay_item
      @order_form.save(params,current_user.id)
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end
      
  private
    def order_params
      params.require(:order_form).permit(:postal_code, :shipping_origin_id, :city, :street_address, :building_address, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def pay_item
      @item = Item.find(@order_form.item_id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
