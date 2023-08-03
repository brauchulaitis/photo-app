# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.photo-app-9cgh.onrender.com.",
   :port => 10000,
   :domain => "photo-app-9cgh.onrender.com.",
   :authentication => :login,
   :user_name => "[username]",
   :password => "[password]"
 }
