describe Types::ClientType do

  it {is_expected.to have_field(:client_code).of_type("Int!")}
  it {is_expected.to have_field(:orders).of_type("[OrderType]!")}

end