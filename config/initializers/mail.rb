require 'development_mail_interceptor'

# Use Gmail - environment variables GMAIL_DOMAIN, GMAIL_USER and GMAIL_PASS
# will be used as the account that sends the emails. APPHOST is the hostname
# of the app
ActionMailer::Base.smtp_settings = {
  :address              => ENV['SMTP_SERVER'] || ENV['POSTMARK_SMTP_SERVER'],
  :port                 => 25 || ENV['SMTP_PORT'],
  :domain               => ENV['SMTP_DOMAIN'] || ENV['APPHOST'],
  :user_name            => ENV['SMTP_USER'] || ENV['POSTMARK_API_TOKEN'],
  :password             => ENV['SMTP_PASSWORD'] || ENV['POSTMARK_API_TOKEN'],
  :authentication       => ENV['SMTP_AUTH'] ? ENV['SMTP_AUTH'].to_sym : :cram_md5,
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = ENV['APPHOST']
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

