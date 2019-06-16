RSpec.describe Item, type: :model do

  it "should create a new instance with valid attributes" do
    create(:item)
  end

  it "should require an item_code" do
    expect(build(:item, item_code: "")).to_not be_valid
  end

  it "should have an unique item_code" do
    item = create(:item)
    expect(build(:item, item_code: item.item_code)).to_not be_valid
  end

  it "should have order_items" do
    item = create(:item)
    order_item = create(:order_item, item: item)
    expect(item.order_items).to eq [order_item]
  end

  it "should have orders" do
    item = create(:item)
    order = create(:order)
    create(:order_item, order: order, item: item)
    expect(item.orders).to eq [order]
  end

end
