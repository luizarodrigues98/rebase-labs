require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/cors'
Dir["./app/models/*.rb"].each { |file| require file }

set :allow_origin, "*"

get '/tests' do
  Exam.all.to_json
end

get '/hello' do
  'Hello world!'
end
