def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
#create an empty array
students = []
#get the first name
name = gets.chomp
#while the name is not empty, repeat this code
while !name.empty? do
    puts "Enter hobby"
    hobby = gets.chomp
    puts "Enter Country of Birth"
    country_of_birth = gets.chomp
    puts "Enter height"
    height = gets.chomp.to_i
#add student details hash to the array
students << {name: name, hobby: hobby, country_of_birth: country_of_birth, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
end
  # return the array of students
  students
end
    
def print_header
puts "The students of Villains Academy"
puts "---------"
end
def print(students)
students.each do|student|
puts "#{student[:name]} #{student[:hobby]} #{student[:country_of_birth]} #{student[:height]} (#{student[:cohort]} cohort)"
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