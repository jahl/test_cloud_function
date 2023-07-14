# frozen_string_literal: true

class PlentyClient
  def get(url, params={})
    response = connection.get url, params
    JSON.parse(response.body)
  end

  def delete(url)
    response = connection.delete url
    JSON.parse(response.body)
  end

  private

  def connection
    Faraday.new(url: ENV['PLENTY_REST_URL']) do |faraday|
      faraday.headers['Authorization'] = "Bearer #{token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def unauthenticated_connection
    Faraday.new(url: ENV['PLENTY_REST_URL']) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def token
    @token ||= get_plenty_markets_token
  end

  def get_plenty_markets_token
    params =  { username: ENV["PLENTY_REST_API_USER"], password: ENV['PLENTY_REST_API_PASSWORD'] }.to_json
    response = unauthenticated_connection.post 'login' do |request|
      request.headers['Content-Type'] = 'application/json'
      request.body = params
    end

    JSON.parse(response.body)["access_token"]
  end
end