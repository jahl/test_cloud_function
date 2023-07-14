# frozen_string_literal: true

module Buddy
  class Article < Base
    self.prefix = '/api/v1/'
    self.headers['Authorization'] = "Token token=\"#{ENV['BUDDY_TOKEN']}\""
  end
end
