Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1096620245007-0qjobnfluq3fl7kh26tsg0n5joeogqkd.apps.googleusercontent.com', 'CKRgXgbZZkqAXWxqCOMZwQR6'
end