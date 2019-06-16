module Types
  OrderItemType = GraphQL::ObjectType.define do

    name 'OrderItemType'
    description 'The OrderItem type'

    field :order, !OrderType
    field :item, !ItemType
    field :amount, !types.Int

  end
end