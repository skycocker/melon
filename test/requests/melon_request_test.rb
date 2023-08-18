require File.expand_path '../../helper.rb', __FILE__
require File.expand_path '../../../melon.rb', __FILE__
require 'rack'

class MelonRequestTest < Minitest::Test
  include Rack::Test::Methods

  def app
    ::Melon.new
  end
end
