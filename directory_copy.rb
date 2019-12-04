def input_students
    months = {
        "" => :none,
        "January" => :january,
        "February" => :february,
        "March" => :march,
        "April" => :april,
        "May" => :may,
        "June" => :june,
        "July" => :july,
        "August" => :august,
        "September" => :september,
        "October" => :october,
        "November" => :november,
        "December" => :december,
    }
    students = []
    while true do
        puts "Enter name: "
        name = gets.chomp
        if name.empty?
            name = "none"
        end
        puts "Cohort: "
        cohort = months[gets.capitalize.chomp]
        while cohort == nil do
            puts "Try again..."
            puts "Cohort: "
            cohort = months[gets.capitalize.chomp]
        end
        students << {name: name, cohort: cohort}
        puts "Now we have #{students.count} students"
        puts "Enter another student?"
        answer = gets.downcase.chomp
        if answer != "yes"
            break
        end
    end
    students
end

def print_header
    puts "The students of Villains Academy".center(50)
    puts "-------------".center(50)
end

def print(students)
    student_count = 0
    until student_count == students.length do
        puts "Name: #{students[student_count][:name]}".center(25) + "Cohort: #{students[student_count][:cohort]}".center(25)
        student_count += 1
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
print_header
print(students)
puts ""
print_footer(students)