require 'rails_helper'

RSpec.describe Order, type: :model do

  it "should create a new instance with valid attributes" do
    create(:order)
  end

  it "should require an order_id" do
    expect(build(:order, order_id: "")).to_not be_valid
  end

  it "should have an unique order_id" do
    @order = create(:order)
    expect(build(:order, order_id: @order.order_id)).to_not be_valid
  end

  it "should require a date" do
    expect(build(:order, date: "")).to_not be_valid
  end

  it "should have a date in ISO8601 format" do
    expect(build(:order, date: Time.now.rfc822.to_s)).to_not be_valid
  end

  it "should have a client" do
    expect(build(:order, client: nil)).to_not be_valid
  end

  it "should have order_items" do
    order = create(:order)
    order_item = create(:order_item, order: order)
    expect(order.order_items).to eq [order_item]
  end

  it "should have items" do
    order = create(:order)
    item = create(:item)
    create(:order_item, order: order, item: item)
    expect(order.items).to eq [item]
  end

end
