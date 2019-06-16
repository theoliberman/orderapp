class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  validates :item_code, presence: true, uniqueness: true
end
