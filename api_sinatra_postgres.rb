require 'sinatra'
require 'sinatra/base'
require 'sequel'
require 'sequel/extensions/seed'
# require 'sequel/plugins/serialization'
require 'sinatra/namespace'

require 'pg'

require 'json'
require 'multi_json'
# require 'haml'


DB = Sequel.connect(
  adapter: :postgres,
  database: 'sinatra_seq_dev',
  host: 'localhost',
  password: 'password',
  user: 'sinatra_admin',
  max_connections: 10,
  # logger: Logger.new('log/db.log')
  )

# Sequel::Seed.setup :development # Set the environment
# Sequel.extension :seed # Load the extension
# Sequel::Seeder.apply(DB, './seeds') # Apply the seeds/fixtures


# config.sequel.after_connect = proc do
#   Sequel::Model.db.extension :pagination
#   Sequel::Model.db.extension :pg_hstore
#   Sequel::Model.db.extension :pg_array
#   Sequel::Model.plugin :active_model
#   Sequel::Model.plugin :validation_helpers
#   Sequel::Model.plugin :dirty
#   Sequel::Model.plugin :association_proxies
#   Sequel::Model.plugin :timestamps, update_on_create: true
# end
# Sinatra::Application.register Sinatra::RespondTo

%w{controllers models routes}.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

# Endpoints format setup
before do
  content_type 'application/json' # Uncomment - To see perfectly in POSTMAN - in tab Pretty
end

get '/' do
  # system 'rake --tasks'
  "Hi! I am IN api_sinatra_postgres!\n\n"
  # haml :index, :layout => :my_layout
end


# configure :development do
#   disable :show_exceptions
# end

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

def collection_to_api(collection) # For Array
  # puts "In collection_to_api: collection = #{collection.inspect}"
  a = MultiJson.dump(collection.map { |s| s.to_api })# if collection.is_a?(Array)
  puts "In collection_to_api: a = #{a.inspect}"
  a
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


# TODO: create and load Jobs seed
# crwate API for Jobs" POST DELETE ..  - as from Mongo
# create API calls for Companies - Comp/jpbs
# "