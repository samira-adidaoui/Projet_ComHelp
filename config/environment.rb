# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'monsite.fr',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}