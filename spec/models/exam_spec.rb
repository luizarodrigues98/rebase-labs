require './app/server.rb'
RSpec.describe Exam, type: :model do
  describe "presence" do
    it "returns total exams" do
      exam = Exam.create(cpf: '123.456.789.11', patient_name: 'Luiza', patient_email: 'teste@teste.com', patient_bithdate: '1998-04-01', patient_address:'street t',
        patient_city: 'Fortal', patient_state: 'CE', doctor_crm: '021.555.666.7',
        doctor_crm_state:'CE', doctor_name: 'MARIA JOSÉ', doctor_email:'teste@12.com',
        result_token: 'ABC123', exam_date:'2022-04-01', exam_type:'leucocitos', 
        exam_type_limit:'98-200', exam_type_result:'100')
      
      expect(Exam.count).to eq 1
    end

    it "returns 0 if no have exams" do

      expect(Exam.count).to eq 0
    end
  end
  describe "#valid?" do
    
    it 'deve ter cpf' do
      exam = Exam.new(cpf: nil, patient_name: 'Luiza', patient_email: 'teste@teste.com', patient_bithdate: '1998-04-01', patient_address:'street t',
        patient_city: 'Fortal', patient_state: 'CE', doctor_crm: '021.555.666.7',
        doctor_crm_state:'CE', doctor_name: 'MARIA JOSÉ', doctor_email:'teste@12.com',
        result_token: 'ABC123', exam_date:'2022-04-01', exam_type:'leucocitos', 
        exam_type_limit:'98-200', exam_type_result:'100')
      
      expect(exam.valid?).to eq false  
      expect(exam.cpf).to eq nil  
    end

    it 'deve ter dados do paciente' do
      exam = Exam.new(cpf: '123.456.789.11', patient_name: nil, patient_email: nil, patient_bithdate: nil, patient_address:nil,
        patient_city: nil, patient_state: nil, doctor_crm: '021.555.666.7',
        doctor_crm_state:'CE', doctor_name: 'MARIA JOSÉ', doctor_email:'teste@12.com',
        result_token: 'ABC123', exam_date:'2022-04-01', exam_type:'leucocitos', 
        exam_type_limit:'98-200', exam_type_result:'100')
      
      expect(exam.valid?).to eq false
      expect(exam.patient_name).to eq nil  
      expect(exam.patient_email).to eq nil  
      expect(exam.patient_bithdate).to eq nil  
      expect(exam.patient_city).to eq nil  
      expect(exam.patient_address).to eq nil  
      expect(exam.patient_state).to eq nil  

    end
    it 'deve ter dados do médico responsável' do
      exam = Exam.new(cpf: '123.456.789-11', patient_name: 'Luiza', patient_email: 'teste@teste.com', patient_bithdate: '1998-04-01', patient_address:'street t',
        patient_city: 'Fortal', patient_state: 'CE', doctor_crm: nil,
        doctor_crm_state: nil, doctor_name: nil, doctor_email:nil,
        result_token: 'ABC123', exam_date:'2022-04-01', exam_type:'leucocitos', 
        exam_type_limit:'98-200', exam_type_result:'100')
      
        expect(exam.valid?).to eq false  
      expect(exam.doctor_name).to eq nil  
      expect(exam.doctor_email).to eq nil  
      expect(exam.doctor_crm).to eq nil  
      expect(exam.doctor_crm_state).to eq nil  

    end
  end
   
end