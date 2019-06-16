class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :amount, presence: true
  validates :order_id, uniqueness: {:scope => :item_id}
end
