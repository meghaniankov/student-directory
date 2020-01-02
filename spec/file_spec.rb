require 'file'

describe StudentsFile do

  before { file = subject.file }

  describe '#initialize' do
    it 'has default file' do
      expect(subject.default).to eq 'students.csv'
    end
  end

  describe '#chose' do
    it 'if user input given and file exists, sets file to user input' do
      allow(STDIN).to receive(:gets).and_return('students.csv')
      file = $stdin.gets.chomp
      expect(file).to eq('students.csv')
    end

    it 'if user input given and file does not exist, keeps file set to default' do
      allow(STDIN).to receive(:gets).and_return('x')
      file = $stdin.gets.chomp
      expect(subject.file).to eq(subject.default)
    end

    it 'if no user input given, keeps file set to default' do
      allow(STDIN).to receive(:gets).and_return(nil)
      expect(subject.file).to eq(subject.default)
    end
  end

end