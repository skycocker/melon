class HenloTest < MelonRequestTest
  def app
    ::Melon.new
  end

  def test_henlo
    get '/henlo', {}

    assert last_response.ok?

    response = Oj.load(last_response.body)
    assert_equal(response['henlo'], 'world')
  end
end
