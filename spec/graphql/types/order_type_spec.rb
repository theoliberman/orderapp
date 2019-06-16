describe Types::OrderType do

  it {is_expected.to have_field(:order_id).of_type("Int!")}
  it {is_expected.to have_field(:date).of_type("String!")}
  it {is_expected.to have_field(:client).of_type("ClientType!")}
  it {is_expected.to have_field(:order_items).of_type("[OrderItemType]!")}
  it {is_expected.to have_field(:items).of_type("[ItemType]!")}

end