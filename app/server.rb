require 'byebug'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/cors'
require './app/jobs/import_job'
Dir["./app/models/*.rb"].each { |file| require file }

set :allow_origin, "*"
set :allow_methods, "GET"
set :allow_headers, "content-type"

get '/tests' do
  if params.has_key?('query')
    Exam.where("result_token ILIKE '#{params[:query]}%'").unique_by_token.to_json
  else
    Exam.unique_by_token.to_json
  end
end

get '/tests/:token' do
  if exam = Exam.find_by(result_token: params[:token])
    exam.attributes.merge(exams: Exam.where(result_token: exam.result_token).to_a).to_json
  else
    status 404
  end
end

post '/import' do
  file_data = params[:file][:tempfile].read.force_encoding("UTF-8")
  rows = CSV.parse(file_data, col_sep: ';')
  ImportJob.perform_async(rows.to_json)
  
  { message: 'Seus exames estão sendo importados' }.to_json
end
