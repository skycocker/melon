require_relative './validators/content_type'
require_relative './validators/response_body'

require_relative './errors'

class HttpResponse
  module Validators
    class << self
      def validate!(content_type, body)
        ContentType.validate!(content_type)
        ResponseBody.validate!(body)
      end
    end
  end
end
