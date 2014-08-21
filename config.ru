require './app'
require 'rack/static'
require './lib/static_files'
# Experimental StatsD Emitter for ActiveRecord
# require 'napa/active_record_extensions/stats.rb'

# use Rack::Cors do
#   allow do
#     origins '*'
#     resource '*', headers: :any, methods: [:get, :post, :delete, :put, :options]
#   end
# end

#use Honeybadger::Rack
#use Napa::Middleware::Logger

use Napa::Middleware::AppMonitor
# use Napa::Middleware::Authentication
use ActiveRecord::ConnectionAdapters::ConnectionManagement
use Napa::Middleware::StaticFiles

run ApplicationApi
