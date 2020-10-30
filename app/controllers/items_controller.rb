class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       current_user == @item.user
       redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
       @item.destroy
       redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :estimated_shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
