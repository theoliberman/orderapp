module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :orders, [OrderType], null: false

    def orders
      Order.all
    end

    field :orders_between, [OrderType], null: false do
      argument :start, String, required: true
      argument :finish, String, required: true
    end

    def orders_between(start:, finish:)
      Order.where(date: DateTime.iso8601(start)..DateTime.iso8601(finish))
    end

    field :order, OrderType, null: false do
      argument :order_id, Int, required: true
    end

    def order(order_id:)
      Order.find_by_order_id(order_id)
    end

    field :clients, [ClientType], null: false

    def clients
      Client.all
    end

    field :client, ClientType, null: false do
      argument :client_code, Int, required: true
    end

    def client(client_code:)
      Client.find_by_client_code(client_code)
    end

    field :items, [ItemType], null: false

    def items
      Item.all
    end

    field :item, ItemType, null: false do
      argument :item_code, Int, required: true
    end

    def item(item_code:)
      Item.find_by_item_code(item_code)
    end

  end
end
