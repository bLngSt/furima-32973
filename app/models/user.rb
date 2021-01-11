class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence: true do
    validates :nick_name
    validates :first_name
    validates :last_name
    validates :birthday
    with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/} do
      validates :katakana_first_name
      validates :katakana_Last_name
    end
  end
end