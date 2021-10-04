class ItemsController < ApplicationController

  def index
    @item = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :carriage_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end

end
