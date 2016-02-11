
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1191674127529296", "de94c29fb2101a443791dd91b614dd61"
  provider :google_oauth2, "registr-1218" , "295635398434 "
  provider :twitter, "ii9IqwWo7thEGlFAXVFaBkrkd", "AxP6vRN2VHCeWfPCdsBQd1WgdKHCoP5VrHmjOfPRdcrwcbX4f5"

end

