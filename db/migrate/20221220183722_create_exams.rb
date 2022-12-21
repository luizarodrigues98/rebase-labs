class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :cpf
      t.string :patient_name
      t.string :patient_email
      t.date :patient_bithdate
      t.string :patient_address
      t.string :patient_city
      t.string :patient_state
      t.string :doctor_crm
      t.string :doctor_crm_state
      t.string :doctor_name
      t.string :doctor_email
      t.string :result_token
      t.date :exam_date
      t.string :exam_type
      t.string :exam_type_limit
      t.string :exam_type_result
    end
  end
end
