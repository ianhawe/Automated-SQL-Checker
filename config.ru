require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/cookies'
require 'pg'
require_relative './controller/sql_controller.rb'
require_relative './models/Question.rb'

use Rack::Reloader

use Rack::MethodOverride

run SqlController