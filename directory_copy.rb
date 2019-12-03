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
    while !name.empty? do

        students << {name: name, hobby: hobby, country: country, cohort: :november}
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
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    student_count = 0
    until student_count == students.length do
        puts "#{students[student_count][:name]} Hobby: #{students[student_count][:hobby]} Country: #{students[student_count][:country]} (#{students[student_count][:cohort]} cohort)"
        student_count += 1
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)