require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/cookies'
require 'pg'
require 'pp'
require_relative './controller/sql_controller.rb'
require_relative './models/Question.rb'

use Rack::Reloader

use Rack::MethodOverride

run SqlController