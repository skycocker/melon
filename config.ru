#!/usr/bin/env ruby

require 'rack'
require_relative './melon'

# so we don't have to restart the server
# each time something changes
use Rack::Reloader, 0

run Melon.new
