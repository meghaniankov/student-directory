require 'print'

describe Print do

  let(:name) { double :name }
  let(:cohort) { double :cohort }
  let(:students) { [{name: name, cohort: cohort}] }

  describe '#header' do
    it 'outputs header text' do
      msg = "The students of Villains Academy\n-------------\n"
      expect { subject.header }.to output(msg).to_stdout
    end
  end

  describe '#student_list' do
    it 'outputs list of students names and cohort' do
      msg = "#{students[0][:name]} (#{students[0][:cohort]} cohort)\n"
      expect { subject.student_list(students) }.to output(msg).to_stdout
    end
  end

  describe '#footer' do
    it 'outputs footer text with student count' do
      msg = "Overall, we have #{students.count} great students\n"
      expect { subject.footer(students.count) }.to output(msg).to_stdout
    end
  end

  describe '#all' do
    it 'outputs header, student_list, and footer texts' do
      msg = "The students of Villains Academy\n-------------\n#{students[0][:name]} (#{students[0][:cohort]} cohort)\nOverall, we have #{students.count} great students\n"
      expect { subject.all(students) }.to output(msg).to_stdout
    end
  end

end
