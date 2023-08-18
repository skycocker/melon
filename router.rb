require_relative './router/errors'
require_relative './routes'

class Router
  attr_accessor :current_route, :raw_route, :env

  class << self
    def dispatch(raw_route, env = nil)
      new(raw_route, env).dispatch
    end
  end

  def initialize(raw_route, env = nil)
    @raw_route = raw_route
    @current_route = parse
    @env = env

    validate!
  end

  def dispatch
    Routes.public_send(current_route, env)
  end

  private def parse
    raw_route.split("/").reject(&:empty?).join("_").to_sym
  end

  private def validate!
    return if Routes.methods(false).include?(current_route)

    raise Errors::InvalidRoute, raw_route
  end
end
