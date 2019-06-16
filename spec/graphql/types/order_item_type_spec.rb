describe Types::OrderItemType do

  it {is_expected.to have_field(:order).of_type("OrderType!")}
  it {is_expected.to have_field(:item).of_type("ItemType!")}
  it {is_expected.to have_field(:amount).of_type("Int!")}

end