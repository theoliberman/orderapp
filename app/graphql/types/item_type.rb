module Types
  ItemType = GraphQL::ObjectType.define do

    name 'ItemType'
    description 'The Item type'

    field :item_code, !types.Int
    field :order_items, !types[OrderItemType]
    field :orders, !types[OrderType]

  end
end