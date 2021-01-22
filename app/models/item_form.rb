class ItemForm
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal, :city, :address, :phone, :area_id, :building

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :phone,  format: {with: /\A\d{10,11}\z/}
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :token
    with_options numericality: { other_than: 1 } do
      validates :area_id
    end
  end

  def save
    item_history = ItemHistory.create(item_id: item_id, user_id: user_id)
    UserDetail.create(postal:postal, city:city, address:address, phone:phone, item_history_id:item_history.id, area_id:area_id)
  end
end