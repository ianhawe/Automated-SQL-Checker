require 'sinatra'
require 'pg'
require_relative './controller/sql_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run SqlController