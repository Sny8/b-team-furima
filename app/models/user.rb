class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, :family_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/ }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
  has_one :destination
end
