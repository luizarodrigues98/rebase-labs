require "spec_helper"
require './app/import_from_csv'
require './app/server.rb'
describe 'Server' do
  
  context "GET to /tests" do
    before :each do
      extend ImportFromCsv
      rows = CSV.read("./data.csv", col_sep: ';')
      import(rows, test: true)
    end

    it 'e tem status 200' do
      get '/tests'
      
      expect(last_response.status).to eq 200
    end

    it 'e vê os campos' do
      get '/tests'

      expect(last_response.body).to include('048.973.170-88')
      expect(last_response.body).to include('Emilly Batista Neto')
      expect(last_response.body).to include('patient_name')
      expect(last_response.body).to include('patient_email')
      expect(last_response.body).to include('patient_bithdate')
      expect(last_response.body).to include('patient_address')
      expect(last_response.body).to include('patient_city')
      expect(last_response.body).to include('patient_state')
      expect(last_response.body).to include('doctor_crm')
      expect(last_response.body).to include('doctor_crm_state')
      expect(last_response.body).to include('doctor_name')
      expect(last_response.body).to include('doctor_email')
      expect(last_response.body).to include('result_token')
      expect(last_response.body).to include('exam_date')
      expect(last_response.body).to include('exam_type')
      expect(last_response.body).to include('exam_type_limit')
      expect(last_response.body).to include('exam_type_result')
    end

    it 'e vê os dados' do
      get '/tests'

      expect(last_response.body).to include('048.973.170-88')
      expect(last_response.body).to include('Emilly Batista Neto')
    end
    
    it 'e vê a quantidade de exams no arq csv' do
      get '/tests'

      expect(JSON.parse(last_response.body).count).to eq 3
    end
  end
end