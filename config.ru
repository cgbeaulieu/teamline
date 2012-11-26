# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Teamline::Application

Teamline::Application.config.middleware.use ExceptionNotifier,
  :email_prefix => "[Teamline]",
  :sender_address => %{"Ericka" <ericka.ward@flatironschool.com> },
  :exception_recipients => %w{kevin.curtin@flatironschool.com, david.baker@flatironschool.com, matt.salerno@flatironschool.com}