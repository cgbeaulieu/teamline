OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'dc7f6a9b8f696bbe50f8', 'ded6e57d0547445c9a854d81f28e868f190ed4de'
end