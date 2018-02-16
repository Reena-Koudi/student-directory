def input_name
  puts "please enter the name of the student"
  name = gets.chomp
  name == "" ? nil : name
end

def input_cohort
  while true do
    puts "Enter the month of the cohort(1 to 12)"
    cohort = gets.chomp.to_i
    cohort_months = {
     1 => :January,
     2 => :February,
     3 => :March,
     4 => :April,
     5 => :May,
     6 => :June,
     7 => :July,
     8 => :August,
     9 => :September,
     10 => :October,
     11 => :November,
     12 => :December
    }
    if cohort_months.has_key?(cohort)
      return cohort_months[cohort]
    end
   puts "Please enter a month between 1 to 12"
  end
end
def input_students
  students = []
  while true do
  name = input_name
  break if name == nil
  cohort = input_cohort
  students << {name: name, cohort: cohort}
end
puts "Now we have #{students.count} students"
  # return the array of students
  students
end
    
def print_header
puts "The students of Villains Academy"
puts "---------"
end
def print(students)
students.each do|student|
puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_by_cohort(students)
  cohorts = students.map { |student| student[:cohort] }.uniq
# determine membership of each cohort
  cohorts.each do |cohort|
    puts "Students in #{cohort} cohort:"
    students.each do |student|
    puts student[:name] if student[:cohort] == cohort
    end
   end
 end

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
print_by_cohort(students)