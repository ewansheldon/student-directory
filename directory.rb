@students = []

def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I'm not sure which option you wanted! - please try again"
  end
end

def print_menu
  puts "Please select from the following menu options by entering the given number"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = gets.strip

  while !name.empty? do
    puts "Please enter the cohort of the student"
    cohort = gets.strip

    if cohort.empty?
      cohort = :november
    else
      cohort = cohort.downcase.to_sym
    end

    @students << {name: name, cohort: cohort}
    if @students.count == 1
    puts "Now we have #{@students.count} student - please enter another"
    else
    puts "Now we have #{@students.count} students - please enter another"
    end
    name = gets.strip
  end
end

def print_header
  puts "The students of Villains Academy".center(50) #depends on width of output space
  puts "-------------".center(50)
end

def print_student_list
  @students.each do |student|
    puts "#{@students.index(student) + 1}. #{student[:name]}, (#{student[:cohort]})"
  end
end


def print_footer
  if @students.count == 0
    puts ""
  elsif @students.count == 1
  puts "Overall, we have #{@students.count} great student".center(50)
  else
  puts "Overall, we have #{@students.count} great students".center(50)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
