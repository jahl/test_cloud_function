# frozen_string_literal: true

module Buddy
  class Base < ActiveResource::Base
    self.site = ENV['BUDDY_URL']
  end
end
