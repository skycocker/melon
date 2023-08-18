class PublicTokenTest < MelonRequestTest
  def test_public_token_without_token
    get '/public_token', {}

    assert last_response.ok?

    response = Oj.load(last_response.body)
    assert_equal(response['notice'], 'no token is required')
  end

  def test_public_token_with_token
    mock_env('PUBLIC_TOKEN' => 'xoxo') do
      get '/public_token', {}

      assert last_response.ok?

      response = Oj.load(last_response.body)
      assert_equal(response['notice'], 'please confirm the token')
    end
  end
end
