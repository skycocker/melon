# frozen_string_literal: true

# the only right ruby debugger
require 'pry'

require_relative './router'
require_relative './http_response'

class Melon
  def call(env)
    Router.dispatch(env["PATH_INFO"], env)
  rescue Router::Errors::InvalidRoute => e
    HttpResponse.head(404)
  end
end
