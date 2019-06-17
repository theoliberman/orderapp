class OrderConsumer < Racecar::Consumer
  subscribes_to "order"

  def process(message)
    order = (message.value)
    puts "RECEIVED MESSAGE : "
    puts order
  end
end
