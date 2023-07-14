require 'dotenv'
require 'plenty_client'

Dotenv.load

# frozen_string_literal: true

config_hash = {
  'plenty_rest_url' => ENV['PLENTY_REST_URL'],
  'plenty_rest_api_user' => ENV['PLENTY_REST_API_USER'],
  'plenty_rest_api_password' => ENV['PLENTY_REST_API_PASSWORD'],
  'plenty_rest_log' => (ENV['PLENTY_MARKETS_LOGGING'] || false).to_s == 'true',
  'plenty_rest_plenty_id' => ENV['PLENTY_REST_PLENTY_ID']&.to_i
}

config_file = File.expand_path('config/plenty_config.yml', Rails.root)
config_hash.merge!(YAML.load(File.read(config_file))[Rails.env]) if File.exist?(config_file)

PlentyClient::Config.site_url     = config_hash.fetch('plenty_rest_url', 'https://www.exampe.com/rest')
PlentyClient::Config.api_user     = config_hash.fetch('plenty_rest_api_user', 'user')
PlentyClient::Config.api_password = config_hash.fetch('plenty_rest_api_password', 'password')
PlentyClient::Config.log          = config_hash.fetch('plenty_rest_log', false)
PlentyClient::Config.plenty_id    = config_hash.fetch('plenty_rest_plenty_id', 12345)