require "spec_helper"
require './app/import_from_csv'

describe 'Server' do
  context "GET to /tests" do
    it 'e tem status 200' do
      get '/tests'
      expect(last_response.status).to eq 200
    end
    it 'e vê os campos' do
      extend ImportFromCsv

      import(test:true)
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
      expect(last_response.body).to include('exam_type_resul')
    end
    it 'e vê os dados' do
      extend ImportFromCsv

      import(test:true)
      get '/tests'
      expect(last_response.body).to include('048.973.170-88')
      expect(last_response.body).to include('Emilly Batista Neto')
    end
  end
end