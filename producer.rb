require "kafka"
require 'json'
require 'nokogiri'
require 'yaml'

kafka = Kafka.new(["kafka:29092"], client_id: "orderapp")

topic = "order"

producer = kafka.producer

begin
  File.open(ARGV[0]) do |file|
    type = File.extname(file)

    msg = {type: type, data: ""}

    if type == ".json"
      msg[:data] = JSON.parse(File.read(file))
    elsif type == '.xml'
      msg[:data] = Nokogiri::XML(file)
    elsif type == '.yml'
      msg[:data] = YAML.load_file(file).inspect
    else
      puts "WRONG FILE TYPE !"
    end

    if msg[:data] != ""
      producer.produce(msg, topic: topic)
      producer.deliver_messages
    end

  end
ensure
  producer.shutdown
end
