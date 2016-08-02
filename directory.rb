def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    puts "Please enter the cohort of the student"
    cohort = gets.chomp
    puts "Please enter any hobbies of the student (separated by a comma)"
    hobbies = gets.chomp
    puts "Please enter the country of birth of the student"
    country_of_origin = gets.chomp
    puts "Please enter the height of the student in centimetres"
    height = gets.chomp
    if cohort.empty?
      cohort = "November"
    end
    if hobbies.empty?
      hobbies = "unknown"
    end
    if country_of_origin.empty?
      country_of_origin = "unknown"
    end
    if height.empty?
      height = "unknown"
    end
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_origin: country_of_origin, height: height}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  current_index = 0
  while students[current_index] != nil
    puts "#{current_index + 1}. #{students[current_index][:name]}, (#{students[current_index][:cohort]})"
    current_index +=1
  end
end

def print_students_starting_with(students, letter)
  students.each do |student|
    if student[:name].downcase.start_with?(letter)
    puts "#{student[:name]}, (#{student[:cohort]} cohort)"
    end
  end
end

def only_students_with_names_shorter_than (students, characters)
  students.each do |student|
    if student[:name].length < characters
    puts "#{student[:name]}, (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
