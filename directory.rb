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
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = gets.strip

  while !name.empty? do
    puts "Please enter the cohort of the student"
    cohort = gets.strip
    puts "Please enter any hobbies of the student (separated by a comma)"
    hobbies = gets.strip
    puts "Please enter the country of birth of the student"
    country_of_origin = gets.strip
    puts "Please enter the height of the student in centimetres"
    height = gets.strip

    if cohort.empty?
      cohort = :november
    else
      cohort = cohort.downcase.to_sym
    end

    if hobbies.empty?
      hobbies = :unknown
    else
      hobbies = hobbies.to_sym
    end

    if country_of_origin.empty?
      country_of_origin = :unknown
    else
      country_of_origin = country_of_origin.to_sym
    end

    if height.empty?
      height = :unknown
    else
      height = height.to_sym
    end

    @students << {name: name, cohort: cohort, hobbies: hobbies, country_of_origin: country_of_origin, height: height}
    if @students.count == 1
    puts "Now we have #{@students.count} student"
    else
    puts "Now we have #{@students.count} students"
    end
    name = gets.strip
  end
end

def print_header
  puts "The students of Villains Academy".center(50) #depends on width of output space
  puts "-------------".center(50)
end

def print_students_list
  @students.each do |student|
    puts "#{@students.index(student) + 1}. #{student[:name]}, (#{student[:cohort]})"
  end
end

def print_students_starting_with(letter)
  @students.each do |student|
    if student[:name].downcase.start_with?(letter)
    puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(50)
    end
  end
end

def only_students_with_names_shorter_than (characters)
  @students.each do |student|
    if student[:name].length < characters
    puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(50)
    end
  end
end

def print_by_cohort
  cohorts = []
  @students.each do |student|
    cohorts << student[:cohort].to_s
  end
  cohorts = cohorts.uniq
  puts "Which cohort of students would you like to see?"
  puts "The options are:"
  puts cohorts
  requested_cohort = gets.strip
  @students.each do |student|
    if student[:cohort].to_s == requested_cohort.downcase
      puts "#{student[:name]}".center(50)
    end
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
