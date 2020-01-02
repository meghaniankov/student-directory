class Menu

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
`end


end