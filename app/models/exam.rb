class Exam < ActiveRecord::Base
  scope :unique_by_token, -> { all.uniq{ |e| e[:result_token] } }
  # Ex:- scope :active, -> {where(:active => true)}
  validates :patient_name, :patient_email, :patient_address,
            :patient_city, :patient_state, :patient_bithdate,
            :doctor_crm, :doctor_crm_state, :doctor_email, 
            :doctor_name, :result_token, :exam_type,
             presence: true

end
