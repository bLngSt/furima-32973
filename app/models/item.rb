class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price
    validates :user
  end

  belongs_to :user
end
