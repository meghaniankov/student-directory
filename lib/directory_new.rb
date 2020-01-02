require "csv"
require_relative "student"
require_relative "print"
require_relative "file"

class Directory

  attr_reader :students, :file

  def initialize
    @students = []
    @print = Print.new
    @file = StudentsFile.new
  end

  def input_students
    input_text
    while !@name.empty? do
        add_students(Student.new(@name, :november))
        puts "Now we have #{@students.count} students"
        enter_name
    end
  end

  def show_students
    @print.all(@students)
  end

  def save_students
    CSV.open(@file.file, "w") do |file|
        @students.each do |student|
            file << [student[:name], student[:cohort]]
        end
    end
  end

  def load_students(filename = @file.file)
    CSV.foreach(filename) do |row|
      add_students(Student.new(row[0], row[1]))
    end
  end

  def chose_file
    @file.chose
  end

  private

  def input_text
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    enter_name
  end

  def enter_name
    @name = STDIN.gets.chomp
  end

  def add_students(new_student)
    @students << new_student.student
  end

end
