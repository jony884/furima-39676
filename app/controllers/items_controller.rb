class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.all.order(created_at: :desc)
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
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end 

  def destroy
    if current_user.id == @item.user_id 
      @item.destroy
    end
      redirect_to root_path
  end
  

  def edit
    if @item.sold_out?
      redirect_to root_path, alert: "売却済みの商品は編集できません。"
    elsif current_user != @item.user
      redirect_to root_path, alert: "他のユーザーの商品は編集できません。"
    end
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity

    end
  end
  
  

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :price, :category_id, :item_condition_id, :shipping_cost_id, :shipping_origin_id, :days_to_ship_id, :image)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end


