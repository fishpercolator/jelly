# Force all email to be sent to ENV['DEV_EMAIL'] in dev mode
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = ENV['DEV_EMAIL']
  end
end

