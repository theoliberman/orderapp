class OrderConsumer < Racecar::Consumer
  require 'json'

  subscribes_to "order"

  def commit_to_db(client_code, order_id, date, order_items, item_key, amount_key)

    client = Client.find_by_client_code(client_code.to_i) || Client.create(client_code: client_code.to_i)
    order = Order.find_by_order_id(order_id.to_i) || Order.create(order_id: order_id.to_i, date: date, client: client)
    order_items = order_items

    order_items.each do |order_item|
      item = Item.find_by_item_code(order_item[item_key].to_i) || Item.create(item_code: order_item[item_key].to_i)
      OrderItem.create(order: order, item: item, amount: order_item[amount_key].to_i)
    end

  end

  def process(message)

    message_json = JSON.parse(message.value)

    type = message_json["type"]
    data = message_json["data"]


    if type == ".json"

      commit_to_db(data["client_id"],
                   data["transaction_id"],
                   data["date"],
                   data["items"],
                   0,
                   1
      )

    elsif type == ".xml"

      data = data["order"]

      commit_to_db(data["buyer"]["clientcode"],
                   data["transactionid"],
                   data["date"],
                   data["items"]["item"],
                   "itemcode",
                   "itemcount"
      )

    elsif type == ".yml"

      data = data["transaction"]

      commit_to_db(data["client"]["id"],
                   data["id"],
                   data["date"],
                   data["items"],
                   "sku",
                   "amount"
      )

    else
      puts "WRONG FILE TYPE !"
    end

  end
end
