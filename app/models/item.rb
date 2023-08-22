class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_cost
  belongs_to :shipping_origin
  belongs_to :days_to_ship

  validates :category_id, :item_condition_id, :shipping_cost_id, :shipping_origin_id, :days_to_ship_id, presence: true, numericality: { other_than: 1 }
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :item_description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999999 }
  validates :image, presence: true
end
