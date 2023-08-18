class HttpResponse
  module Validators
    module ResponseBody
      class << self
        def validate!(body)
          return if body.is_a?(Hash) || body.is_a?(String)

          raise Errors::InvalidResponseBody, body
        end
      end
    end
  end
end
