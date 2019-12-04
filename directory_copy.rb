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

# def print(students)
#     students.sort_by! { |student| student[:cohort] }
#     students.each do |student|
#         puts "Name: #{student[:name]}".center(25) + "Cohort: #{student[:cohort]}".center(25)
#     end
# end

def print_sorted(students)
    print "Chose a cohort to view: "
    answer = gets.chomp
    cohort_to_view = []
    print_header
    students.map {|student| cohort_to_view << student if student[:cohort] == answer.to_sym}
    cohort_to_view.each do |student|
        puts "Name: #{student[:name]}".center(25) + "Cohort: #{student[:cohort]}".center(25)
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students

#print(students)
print_sorted(students)
puts ""
print_footer(students)