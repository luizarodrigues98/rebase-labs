RSpec.describe Exam, type: :model do
  describe "presence" do
    it "returns total exams" do
      Exam.create(patient_name: 'Luiza')

      expect(Exam.count).to eq 1
    end
    it "returns 0 if no have exams" do

      expect(Exam.count).to eq 0
    end
  end
end