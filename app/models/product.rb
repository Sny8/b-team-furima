class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :user
belongs_to_active_hash :condition
has_many :product_images, dependent: :destroy
accepts_nested_attributes_for product_images
end
