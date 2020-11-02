class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :check_if_it_is_a_ordered_item, only: [:index, :create]
  before_action :whether_the_seller_and_the_buyer_are_equal, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_if_it_is_a_ordered_item
    redirect_to root_path unless @item.order.nil?
  end

  def whether_the_seller_and_the_buyer_are_equal
    redirect_to root_path if current_user.id == @item.user_id
  end

  def order_params
    params.require(:order_address).permit(:prefecture_id, :postal_number, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
