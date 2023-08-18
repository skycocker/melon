require 'minitest/autorun'
require 'rack/test'

$LOAD_PATH.unshift 'router'

def mock_env(partial_env_hash)
  old = ENV.to_hash
  ENV.update partial_env_hash
  begin
    yield
  ensure
    ENV.replace old
  end
end
