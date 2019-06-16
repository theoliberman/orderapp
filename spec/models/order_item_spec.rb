require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  it "should create a new instance with valid attributes" do
    create(:order_item)
  end

  it "should have an order" do
    expect(build(:order_item, order: nil)).to_not be_valid
  end

  it "should have an item" do
    expect(build(:order_item, item: nil)).to_not be_valid
  end

  it "should have an amount" do
    expect(build(:order_item, amount: "")).to_not be_valid
  end

  it "should have an unique (order, item)" do
    order_item = create(:order_item)
    expect(build(:order_item, order: order_item.order, item: order_item.item)).to_not be_valid
    expect(build(:order_item, order: order_item.order)).to be_valid
    expect(build(:order_item, item: order_item.item)).to be_valid
  end

end
