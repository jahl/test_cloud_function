# frozen_string_literal: true

require 'functions_framework'
require 'dotenv'
require 'faraday'
require 'json'

Dotenv.load

def connection
  Faraday.new(url: ENV['BASE_URL']) do |faraday|
    faraday.headers['Authorization'] = "Bearer #{ENV['TOKEN']}"
    faraday.adapter Faraday.default_adapter
  end
end

def plenty_client_get(url, params={})
  response = connection.get url, params
  JSON.parse(response.body)
end

def plenty_client_delete(url)
  response = connection.delete url
  JSON.parse(response.body)
end

FunctionsFramework.http "delete_images" do |_request|
  item_id = 1365220
  url = "items/#{item_id}/images"
  delete_url = "images"
  images = plenty_client_get(url)

  images.each do |image|
    puts "id: #{image['id']}, url: #{image['url']}"
  end
end
