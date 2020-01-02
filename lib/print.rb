class Print

  def header
    puts "The students of Villains Academy"
    puts "-------------"
  end

  def student_list(students)
    students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
  end

  def footer(student_count)
    puts "Overall, we have #{student_count} great students"
  end

  def all(students)
    header
    student_list(students)
    footer(students.count)
  end

end
