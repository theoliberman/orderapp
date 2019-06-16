class Client < ApplicationRecord
  has_many :orders

  validates :client_code, presence: true, uniqueness: true
end
