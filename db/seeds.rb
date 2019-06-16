require 'faker'

Faker::UniqueGenerator.clear

5.times do
  Client.create client_code: Faker::Number.unique.number(4)
end

50.times do
  Item.create item_code: Faker::Number.unique.number(8)
end

10.times do
  Order.create order_id: Faker::Number.unique.between(1, 10),
               date: Faker::Time.unique.backward(100).iso8601,
               client_id: Faker::Number.between(1, 5)
end

25.times do
  OrderItem.create order_id: Faker::Number.between(1, 10),
                   item_id: Faker::Number.between(1, 50),
                   amount: Faker::Number.between(1, 10)
end