$LOAD_PATH.unshift('./')

require 'sequel'
# require 'application'
require 'dotenv'

# Dotenv.load

environment = ENV["RACK_ENV"] || "development"

connection_string = ENV["DATABASE_URL"] || ENV["DATABASE_URL_#{environment.upcase}"]

# connection_string = "adapter: :postgres,
#   database: 'sinatra_seq_dev',
#   host: 'localhost',
#   password: 'password',
#   user: 'sinatra_admin',
#   max_connections: 10 "
  # logger: Logger.new('log/db.log') }

DB = Sequel.connect(connection_string)
