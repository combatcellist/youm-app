class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_3accb06e91c3e18fefc237dc"
    Payjp::Charge.create(
      amount: @item.params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end