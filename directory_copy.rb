def input_students
    students = []
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

    while true do
        puts "Enter name: "
        name = gets.strip
        if name.empty?
            name = "none"
        end

        puts "Cohort: "
        cohort = months[gets.capitalize.strip]
        while cohort == nil do
            puts "Try again..."
            puts "Cohort: "
            cohort = months[gets.capitalize.strip]
        end

        students << {name: name, cohort: cohort}

        if students.count == 1 && students[0][:name] == "none" && students[0][:cohort] == :none
            puts "There are no students"
        elsif students.count == 1
            puts "Now we have #{students.count} student"
        else
            puts "Now we have #{students.count} students"
        end

        puts "Enter another student?"
        answer = gets.downcase.strip
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

# def print(students)
#     students.sort_by! { |student| student[:cohort] }
#     students.each do |student|
#         puts "Name: #{student[:name]}".center(25) + "Cohort: #{student[:cohort]}".center(25)
#     end
# end

def print_sorted(students)
    if students.length == 1 && students[0][:name] == "none" && students[0][:cohort] == :none
        puts "No students to show"
    else
        print "Chose a cohort to view: "
        answer = gets.downcase.strip
        cohort_to_view = []
        print_header
        students.map {|student| cohort_to_view << student if student[:cohort] == answer.to_sym}
        cohort_to_view.each { |student| puts "Name: #{student[:name]}".center(25) + "Cohort: #{student[:cohort]}".center(25)}
        print_footer(students)
    end
end

def print_footer(students)
    if students.count == 1
        student_s = "student"
    else
        student_s = "students"
    end
    puts " "
    puts "Overall, we have #{students.count} great #{student_s}".center(50)
end

students = input_students
print_sorted(students)