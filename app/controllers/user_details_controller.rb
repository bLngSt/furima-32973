class UserDetailsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item
  before_action :check_item, only: [:index, :create]
  def index
      @item_form = ItemForm.new
  end
 
  def create
    @item_form = ItemForm.new(user_detail_params)
      if @item_form.valid?
        pay_item
        @item_form.save
        return redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def user_detail_params
   params.require(:item_form).permit(:postal, :area_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: user_detail_params[:token],
        currency: 'jpy'
      )
  end
  def check_item
    if current_user.id== @item.user_id || @item.item_history.present?
      redirect_to root_path
    end
  end
end


