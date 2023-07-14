# frozen_string_literal: true
require_relative './config/init'

FunctionsFramework.http "delete_images" do |_request|
  article_no = "M9-R51400"
  client = PlentyClient.new

  article = Buddy::Article.find(:first, params: {article_no: article_no})
  raise "Article #{article_no}" if article.nil?

  pm_item_id = article.plenty_mapping.pm_item_id
  puts "Found article: #{article_no} with PM item id of: #{pm_item_id}"

  images = client.get("items/#{pm_item_id}/images")
  images.each do |image|
    puts "id: #{image['id']}, url: #{image['url']}"
  end
end
