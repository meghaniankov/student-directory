require 'student'

describe Student do

  let(:new_student){Student.new("Meghan", "November")}

    it "sets value of :name key to name argument passed on creation" do
      expect(new_student.student[:name]).to eq "Meghan"
    end

    it "sets value of :cohort key to cohort argument passed on creation" do
      expect(new_student.student[:cohort]).to eq :November
    end

end
