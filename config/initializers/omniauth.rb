OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1765946963632477", "27f5f82329eda81947b99f6b52c4d13b"
end