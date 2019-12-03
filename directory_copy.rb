def input_students
    puts "Please enter the following info"
    puts "To finish, just hit return twice"
    students = []
    puts "Enter name: "
    name = gets.chomp
    puts "Hobby: "
    hobby = gets.chomp
    puts "Country: "
    country = gets.chomp
    puts "Cohort: "
    cohort = gets.chomp
    while !name.empty? do

        students << {name: name, hobby: hobby, country: country, cohort: cohort.default = :november}
        puts "Now we have #{students.count} students"

        puts "Name: "
        name = gets.chomp
        if !name.empty? 
            puts "Hobby: "
            hobby = gets.chomp
            puts "Country: "
            country = gets.chomp
        end
    end
    students
end

def print_header
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
end

def print(students)
    student_count = 0
    puts "Name"
    until student_count == students.length do
        puts "Name: #{students[student_count][:name]}".center(25) + "Hobby: #{students[student_count][:hobby]}".center(25) + "Country: #{students[student_count][:country]}".center(25) + "Cohort: #{students[student_count][:cohort]}".center(25)
        student_count += 1
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students".center(100)
end

students = input_students
print_header
print(students)
puts ""
print_footer(students)