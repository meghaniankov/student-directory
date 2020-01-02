require_relative "directory_new"

class Menu

  def initialize
    @directory = Directory.new
    try_load_students
  end

  def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  private

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
  end

  def process(selection)
    case selection
    when "1"
      @directory.input_students
    when "2"
      @directory.show_students
    when "3"
      @directory.chose_file
      @directory.save_students
      puts "Saved!"
    when "4"
      @directory.chose_file
      @directory.load_students
      puts "Loaded!"
    when "9"
      exit 
    else
      puts "I don't know what you meant, try again..."
    end
  end

  def try_load_students
    @filename = ARGV.first
    if @filename.nil?
      file_nil
    elsif !File.exists?(@filename)
      puts "Sorry, #{@filename} doesn't exist."
      exit
    end
    load_students
  end

  def file_nil
    puts "No file supplied."
    @filename = @directory.file.default
  end

  def load_students
    @directory.load_students(@filename)
    puts "Loaded #{@directory.students.count} from #{@filename}"
  end

end
