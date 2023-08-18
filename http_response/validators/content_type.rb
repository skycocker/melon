class HttpResponse
  module Validators
    module ContentType
      class << self
        def validate!(content_type)
          return if CONTENT_TYPES.key?(content_type)

          raise Errors::InvalidResponseContentType, content_type
        end
      end
    end
  end
end
