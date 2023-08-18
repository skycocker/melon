class NotFoundTest < MelonRequestTest
  def app
    ::Melon.new
  end

  def test_henlox
    get '/henlox', {}

    assert !last_response.ok?
    assert_equal(last_response.body, "")
  end
end
