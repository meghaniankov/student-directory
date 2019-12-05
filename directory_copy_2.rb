@students = []
@default_file = "students.csv"

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
    puts "3. Save the list to #{@default_file}"
    puts "4. Load the list from #{@default_file}"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_students
        puts "Saved!"
    when "4"
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
    file = File.open(@default_file, "w")
    @students.each do |student|
        csv_line = [student[:name], student[:cohort]].join(",")
        file.puts csv_line
    end
    file.close
end

def load_students(filename = @default_file)
    file = File.open(@default_file, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        add_students(name, cohort)
    end
    file.close
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