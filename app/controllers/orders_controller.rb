class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :sample, only: [:index, :create, :buy]
  before_action :buy

  def index
    @order_history = OrderHistory.new
  end

  def new
    @order_history = OrderHistory.new
  end

  def create
    @order_history = OrderHistory.new(order_params)
    if @order_history.valid?
      pay_item
      @order_history.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_history).permit(:post_code, :prefecture_id, :city, :block, :building, :phone, :price).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sample
    @item = Item.find(params[:item_id])
  end


  def buy
    if @item.history.present? || current_user.id = @item.history.user_id
      redirect_to root_path
    end
  end
  
end
