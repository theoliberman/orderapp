module Types
  OrderType = GraphQL::ObjectType.define do

    name 'OrderType'
    description 'The Order type'

    field :order_id, !types.Int
    field :date, !types.String
    field :client, !ClientType
    field :order_items, !types[OrderItemType]
    field :items, !types[ItemType]

  end
end