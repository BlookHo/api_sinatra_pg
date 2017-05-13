# require File.dirname(__FILE__)

root = File.expand_path File.dirname(__FILE__)
require File.join( root , '/src/api_sinatra_mongo.rb' )
run Sinatra::Application
