class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  # before_action :move_to_index, except: [:index]

  def index
    @item = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :carriage_id, :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   @item = Item.find(params[:id])
  #   unless current_user.id == @item.user_id
  #     redirect_to action: :index
  #   end
  # end

end
