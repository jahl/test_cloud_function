# frozen_string_literal: true

require 'active_record'
require 'functions_framework'
require 'dotenv'
Dotenv.load

require_relative './lib/plenty_client'
require_relative './config/database'


FunctionsFramework.http "delete_images" do |_request|
  client = PlentyClient.new
  item_id = 1365220
  url = "items/#{item_id}/images"
  delete_url = "images"
  images = client.get(url)

  images.each do |image|
    puts "id: #{image['id']}, url: #{image['url']}"
  end
end
