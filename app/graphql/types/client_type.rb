module Types
  ClientType = GraphQL::ObjectType.define do

    name 'ClientType'
    description 'The Client type'

    field :client_code, !types.Int
    field :orders, !types[OrderType]

  end
end