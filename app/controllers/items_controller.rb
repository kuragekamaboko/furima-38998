class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:update,:destroy]
  before_action :find_item,only:[:show,:edit,:update,:destroy]
  def index
    @items = Item.all.order(created_at: "DESC")
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
  end

  def edit
    if @item.user.id != current_user.id
      redirect_to root_path
    end
    # if @item.purchase
    #   redirect_to root_path
    # end
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def destroy

    if @item.user.id == current_user.id && @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item)
    .permit(:image, :name,:info,:category_id,:sales_status_id,:shipping_fee_status_id,:prefecture_id,:price,:scheduled_delivery_id)
    .merge(user_id: current_user.id)
  end

  private 
  def find_item
    @item = Item.find(params[:id])
  end
end
