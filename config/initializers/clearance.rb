Clearance.configure do |config|
  config.mailer_sender = "TODO@TODO.com"
  config.rotate_csrf_on_sign_in = true
  config.secure_cookie = Rails.env.production?
  config.signed_cookie = true
end

Rails.application.config.middleware.use Clearance::BackDoor if Rails.env.test?
