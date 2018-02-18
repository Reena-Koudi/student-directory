@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

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
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def input_name
   puts "please enter the name of the student"
    puts "To finish, just hit return twice"
   name = STDIN.gets.chomp
   name == "" ? nil : name
end

def input_cohort
   while true do
     puts "please enter the cohort(number of the month) of the students"
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
 
def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "You are in 1. 'Input the students'"
  while true do
    name = input_name
    break if name == nil
    cohort = input_cohort
    add_students(name, cohort)
  end
    puts "Now we have #{@students.count} students"
end

def show_students
  puts "You are in '2. Show the students'"
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "You are now in '3. Save the list to students.csv'"
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "You are now in '4. Load the list from students.csv'" 
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first.nil? ? 'students.csv' : ARGV.first
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu