module Routes
  class << self
    def public_token(_)
      notice = if ENV['PUBLIC_TOKEN'].nil? || ENV['PUBLIC_TOKEN'].empty?
                 "no token is required"
               else
                 "please confirm the token"
               end

      HttpResponse.respond_with(
        status: 200,
        content_type: :json,
        body: { notice: notice },
        headers: {
          "X-Public-Token" => ENV["PUBLIC_TOKEN"],
        }.reject { |k, v| v.nil? || v.empty? },
      )
    end
  end
end
