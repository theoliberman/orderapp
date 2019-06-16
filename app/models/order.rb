class Order < ApplicationRecord
  belongs_to :client

  has_many :order_items
  has_many :items, through: :order_items

  iso8601_regex = /\A([+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24:?00)([.,]\d+(?!:))?)?(\17[0-5]\d([.,]\d+)?)?([zZ]|([+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?/m

  validates :order_id, presence: true, uniqueness: true
  validates :date, presence: true, format: {with: iso8601_regex}
end
