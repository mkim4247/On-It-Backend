class ApplicationController < ActionController::API

    def secret_key
      Rails.application.credentials.secret_key_base
    end

    def encode(payload)
      JWT.encode(payload, secret_key)
    end

    def decode(token)
      JWT.decode(token, secret_key, true)[0]
    end

end
