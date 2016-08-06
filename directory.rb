@students = []

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
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
    puts "Please enter the name of the file that you'd like to load"
    filename = gets.chomp
    load_students(filename)
  when "5"
    print_source_code
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
  puts "3. Save the current list of students"
  puts "4. Load a previously saved list of students"
  puts "5. Print source code"
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

  name = STDIN.gets.chomp

  while !name.empty? do
    puts "Please enter the cohort of the student"
    cohort = STDIN.gets.chomp

    if cohort.empty?
      cohort = :november
    else
      cohort = cohort.downcase
    end

    add_students_to_array(name, cohort)
    if @students.count == 1
    puts "Now we have #{@students.count} student - please enter another"
    else
    puts "Now we have #{@students.count} students - please enter another"
    end
    name = STDIN.gets.chomp
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
  puts "What would you like to call this file?"
  filename = gets.chomp
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "\n Student list successfully saved \n\n"
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students_to_array(name, cohort)
    end
  end
  puts "\nLoaded #{@students.count} students from #{filename}\n\n"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  elsif File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def add_students_to_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_source_code
  puts "\nCurrent file: #{__FILE__}\n\n"
end

try_load_students
interactive_menu
