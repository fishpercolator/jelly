require 'development_mail_interceptor'

# Use Gmail - environment variables GMAIL_DOMAIN, GMAIL_USER and GMAIL_PASS
# will be used as the account that sends the emails. APPHOST is the hostname
# of the app
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => ENV['GMAIL_DOMAIN'],
  :user_name            => ENV['GMAIL_USER'],
  :password             => ENV['GMAIL_PASS'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = ENV['APPHOST']
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

