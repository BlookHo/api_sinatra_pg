require 'sinatra'
require 'sinatra/base'
require 'sinatra/namespace'

require 'mongoid'
require 'json'
require 'multi_json'
require 'haml'

# Sinatra::Application.register Sinatra::RespondTo

Dir['./models/*.rb'].each {|file| require file }
Dir['./controllers/*.rb'].each {|file| require file }
# Dir['./views/*.haml'].each {|file| require file }

Mongoid.load! 'mongoid.config'

# db = Connection.new.db('learning-mongo');
# notes = db.collection('notes')

# Endpoints
before do
  content_type 'application/json' # Uncomment - To see perfectly in POSTMAN - in tab Pretty
end

get '/' do
  "Hi! I am api_sinatra_mongo!\n\n"
  haml :index, :layout => :layout
end


# class HelloWorldApp < Sinatra::Base
#   get '/:name' do
#     "Hello, #{params[:name] ? params[:name] : 'world'}!"
#   end
# end


configure :development do
  disable :show_exceptions
end

# configure :test do
#   disable :show_exceptions
# end
#
# configure :production do
#   disable :show_exceptions
# end

configure do
  # set :haml, :format => :html5

  # set :dump_errors, false
  # Don't log them. We'll do that ourself
  # :dump_errors option (defaulting to enabled except in "test") can be used to control
  # whether stack traces should be included in the error output.

  set :raise_errors, false
  # Don't capture any errors. Throw them up the stack
  # :raise_errors defaults to true in the "test" environment
  # and to false on other environments.

  # set :show_exceptions, false
  # Disable internal middleware for presenting errors
  # as useful HTML pages
  # :show_exceptions value defaults to true in the "development" environment
  # and to false on other environments
end

error RuntimeError do #< StandardError do
  puts "Env.: #{request.env['sinatra.error'].message}"
  @error = env['sinatra.error']
  haml :'500', :layout => :layout
end

error StandardError do
  puts "Env.: #{request.env['sinatra.error'].message}"
  @error = env['sinatra.error']
  haml :'500', :layout => :layout
end

# error 0..600 do
#   boom = @env['sinatra.error']
#   status = response.status
#   case
#     when boom != nil
#       puts 'exception: ' + boom
#     when status != 200
#       puts 'error: ' + status
#   end
# end

# class ExceptionHandling
#   def initialize(app)
#     @app = app
#   end
#
#   def call(env)
#     begin
#       @app.call env
#     rescue => ex
#       env['rack.errors'].puts ex
#       env['rack.errors'].puts ex.backtrace.join("\n")
#       env['rack.errors'].flush
#
#       hash = { :message => ex.to_s }
#       hash[:backtrace] = ex.backtrace if RACK_ENV['development']
#
#       [500, {'Content-Type' => 'application/json'}, [MultiJson.dump(hash)]]
#     end
#   end
# end
#
# use ExceptionHandling
#
