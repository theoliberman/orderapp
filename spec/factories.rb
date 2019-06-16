FactoryBot.define do

  sequence :uniq_client_code do |n|
    n
  end
  sequence :uniq_item_code do |n|
    n
  end
  sequence :uniq_order_id do |n|
    n
  end

  factory :client do
    client_code {generate(:uniq_client_code)}
  end

  factory :item do
    item_code {generate(:uniq_item_code)}
  end

  factory :order do
    order_id {generate(:uniq_order_id)}
    date {Time.now.iso8601.to_s}
    client
  end

  factory :order_item do
    order
    item
    amount {1}
  end

end