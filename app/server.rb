require 'sinatra'
require 'sinatra/activerecord'
Dir["./app/models/*.rb"].each { |file| require file }

get '/tests' do
  Exam.all.to_json
end

get '/hello' do
  'Hello world!'
end
