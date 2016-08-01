def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "No we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{students.index(student) + 1}. #{student[:name]}, (#{student[:cohort]} cohort)"
  end
end

def print_students_starting_with(students, letter)
  students.each do |student|
    if student[:name].downcase.start_with?(letter)
    puts "#{students.index(student) + 1}. #{student[:name]}, (#{student[:cohort]} cohort)"
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
