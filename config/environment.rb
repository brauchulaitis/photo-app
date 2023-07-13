# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.localhost:3000",
   :port => 587,
   :domain => "localhost:3000",
   :authentication => :login,
   :user_name => "[username]",
   :password => "[password]"
 }
