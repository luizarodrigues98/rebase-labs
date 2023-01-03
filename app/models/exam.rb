class Exam < ActiveRecord::Base
  scope :unique_by_token, -> { all.uniq{ |e| e[:result_token] } }
  # Ex:- scope :active, -> {where(:active => true)}
end