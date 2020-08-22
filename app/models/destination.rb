class Destination < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name,           presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
  validates :post_code,                          presence: true
  validates :prefecture_code,                    presence: true
  validates :city,                               presence: true
  validates :block,                              presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture.find(name: prefecture_name).code
  end
end
