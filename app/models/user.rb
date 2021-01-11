class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

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