require File.dirname(__FILE__) # ?
Sinatra::Application.config_file File.join(File.dirname(__FILE__),
                                           'config',
                                           "#{Sinatra::Application.settings.environment}_config.yml")
require_relative './boot'
run Application
