describe Types::ItemType do

  it {is_expected.to have_field(:item_code).of_type("Int!")}
  it {is_expected.to have_field(:order_items).of_type("[OrderItemType]!")}
  it {is_expected.to have_field(:orders).of_type("[OrderType]!")}

end