Rails.application.configure do
  
  
  config.action_mailer.default_url_options = { :host => 'localhost:3000', :protocol => 'http'}

  config.action_mailer.smtp_settings = {
     :address   => "smtp.gmail.com",
     :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
     :enable_starttls_auto => true, # detects and uses STARTTLS
     :user_name => "kevinrollins.com",
     :password  => "trixter8funny", # SMTP password is any valid API key
     :authentication => 'plain', # Mandrill supports 'plain' or 'login'
     :domain => 'localhost', # your domain to identify your server when connecting
   }
  config.action_mailer.perform_deliveries = true
  
end