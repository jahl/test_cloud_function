# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'functions_framework'
require 'active_record'
require 'faraday'
require 'json'

require_relative '../lib/plenty_client'
require_relative './database'