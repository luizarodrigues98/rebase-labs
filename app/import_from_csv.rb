require 'csv'
require 'sinatra/activerecord'
require './app/models/exam'

rows = CSV.read("./data.csv", col_sep: ';')

columns = rows.shift

def get_db_column_name(name)
  case name
  when 'cpf'
    :cpf
  when 'nome paciente'  
    :patient_name
  when 'email paciente'  
    :patient_email
  when 'data nascimento paciente'  
    :patient_bithdate
  when 'endereço/rua paciente'  
    :patient_address
  when 'cidade paciente'  
    :patient_city
  when 'estado patiente'  
    :patient_state
  when 'crm médico'  
    :doctor_crm
  when 'crm médico estado'  
    :doctor_crm_state
  when 'nome médico'  
    :doctor_name
  when 'email médico'  
    :doctor_email
  when 'token resultado exame'  
    :result_token
  when 'data exame'  
    :exam_date
  when 'tipo exame'  
    :exam_type
  when 'limites tipo exame'  
    :exam_type_limit
  when 'resultado tipo exame'  
    :exam_type_result
  end
end

rows.map do |row|
  exam = row.each_with_object({}).with_index do |(cell, acc), idx|
    column = columns[idx]
    acc[get_db_column_name(column)] = cell
  end
  Exam.create(exam) unless Exam.where(exam).any?
end
