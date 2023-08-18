require 'oj'
Oj.mimic_JSON

require_relative './http_response/validators'

class HttpResponse
  CONTENT_TYPES = {
    json: "application/json",
  }.freeze

  attr_reader :status, :content_type, :body, :headers

  class << self
    def respond_with(status: 200, content_type: :json, body:, headers: {})
      new(status, content_type, body, headers).respond
    end

    def head(status, headers = {})
      [status, headers, Rack::BodyProxy.new([]) {}]
    end
  end

  def initialize(status, content_type, body, headers = {})
    @status = status
    @content_type = content_type
    @body = body
    @headers = headers

    validate!
  end

  def validate!
    Validators.validate!(content_type, body)
  end

  def respond
    [status, response_headers, [body.to_json]]
  end

  private def response_headers
    headers.merge(
      "Content-Type" => CONTENT_TYPES[content_type],
    ).freeze
  end

end
