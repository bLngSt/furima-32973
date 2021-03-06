class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day

  belongs_to :user
  has_one :item_history
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, :numericality => { with: /\A[0-9]+\z/ ,:only_interger => true, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}
    validates :user
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :burden_id
      validates :area_id
      validates :day_id
    end
  end
end