class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
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
  def edit
    @item = Item.find(params[:id])
    if user_signed_in?
      if current_user.id == @item.user_id
      else
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:price,:user,:category_id,:state_id,:burden_id,:area_id,:day_id).merge(user_id: current_user.id)
  end

end
