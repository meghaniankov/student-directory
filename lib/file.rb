require "csv"

class StudentsFile

  attr_reader :default, :file
  
  def initialize(default = "students.csv")
    @default = default
    @file = @default
  end

  def chose
    puts "What file would you like to use?"
    @file = STDIN.gets.chomp
    if @file.nil? || !File.exists?(@file)
        puts "File does not exist, using file #{@default}"
        @file = @default
    end
  end

end
