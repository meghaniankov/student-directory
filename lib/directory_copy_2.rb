require "csv"
@students = []
@default_file = "students.csv"
@user_chosen_file = ""

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
        add_students(name, :november)
        puts "Now we have #{@students.count} students"
        name = STDIN.gets.chomp
    end
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
end

def chose_file
    puts "What file would you like to use?"
    @user_chosen_file = STDIN.gets.chomp
    if @user_chosen_file.nil? || !File.exists?(@user_chosen_file)
        puts "File does not exist, using file #{@default_file}"
        @user_chosen_file = @default_file
    end
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        chose_file
        save_students
        puts "Saved!"
    when "4"
        chose_file
        load_students
        puts "Loaded!"
    when "9"
        exit 
    else
        puts "I don't know what you meant, try again..."
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_student_list
    @students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def save_students
    CSV.open(@user_chosen_file, "w") do |file|
        @students.each do |student|
            file << [student[:name], student[:cohort]]
        end
    end
end

def load_students(filename = @user_chosen_file)
    CSV.foreach(filename) do |row|
        add_students(row[0], row[1])
    end
end

def try_load_students
    filename = ARGV.first
    if filename.nil?
        puts "No file supplied."
        filename = @default_file
    elsif !File.exists?(filename)
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
end

def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu