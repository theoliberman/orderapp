RSpec.describe Client, type: :model do

  it "should create a new instance with valid attributes" do
    create(:client)
  end

  it "should require a client_code" do
    expect(build(:client, client_code: "")).to_not be_valid
  end

  it "should have an unique client_code" do
    client = create(:client)
    expect(build(:client, client_code: client.client_code)).to_not be_valid
  end

  it "should have orders" do
    client = create(:client)
    order = create(:order, client: client)
    expect(client.orders).to eq [order]
  end

end
