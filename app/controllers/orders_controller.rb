class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    if !@order_shipping_address.valid?
      return render :index
    end

    if pay_item && @order_shipping_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :addresses,:phone_number, :building).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])

  end

  def order_params
    params.merge(item_id: params[:item_id],user_id:current_user.id)
  end

  def pay_item
    print ENV["PAYJP_SECRET_KEY"]

    Payjp.api_key = 'sk_test_1e68f35e94d10b2b00aa4b2c'  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
