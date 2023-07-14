# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'functions_framework'
require 'active_record'
require 'faraday'
require 'json'
require 'activeresource'

# TODO: Look for a better way to load files into the path
require_relative '../lib/plenty_client'
require_relative '../lib/buddy/base'
require_relative '../lib/buddy/article'
require_relative './database'