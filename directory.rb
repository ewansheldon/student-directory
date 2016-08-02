def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

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

    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_origin: country_of_origin, height: height}
    if students.count == 1
    puts "Now we have #{students.count} student"
    else
    puts "Now we have #{students.count} students"
    end
    name = gets.strip
  end

  students
end

def print_header
  puts "The students of Villains Academy".center(50) #depends on width of output space
  puts "-------------".center(50)
end

def print(students)
  current_index = 0
  while students[current_index] != nil
    puts "#{current_index + 1}. #{students[current_index][:name]}, (#{students[current_index][:cohort]})".center(50)
    current_index +=1
  end
end

def print_students_starting_with(students, letter)
  students.each do |student|
    if student[:name].downcase.start_with?(letter)
    puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(50)
    end
  end
end

def only_students_with_names_shorter_than (students, characters)
  students.each do |student|
    if student[:name].length < characters
    puts "#{student[:name]}, (#{student[:cohort]} cohort)".center(50)
    end
  end
end

def print_by_cohort
  cohorts = []
  students.each do |student|
    cohorts << student[:cohort].to_s
  end
  cohorts = cohorts.uniq
  puts "Which cohort of students would you like to see?"
  puts "The options are:"
  puts cohorts
  requested_cohort = gets.strip
  students.each do |student|
    if student[:cohort].to_s == requested_cohort.downcase
      puts "#{student[:name]}".center(50)
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student".center(50) if students.count == 1
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)
