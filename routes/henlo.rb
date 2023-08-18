module Routes
  class << self
    def henlo(_)
      HttpResponse.respond_with(
        status: 200,
        content_type: :json,
        body: { henlo: 'world' },
      )
    end
  end
end
