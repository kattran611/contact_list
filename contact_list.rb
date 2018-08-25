@contact_list = [
  {name: "Tracy", phone_number: "801-984-5434", address: "2210 Eagle Street", location: "Seattle"},
  {name: "Annie", phone_number: "801-655-7536", address: "356 Brownie Drive", location: "California"},
  {name: "Susan", phone_number: "801-857-4364", address: "2385 Treasure Cove", location: "Utah"},
  {name: "Kendall", phone_number: "801-734-4330", address: "985 Cherry Circle", location: "Maine"}
]

@menu_options = [
  "Print contact list",
  "Edit contacts",
  "Erase contact",
  "Leave Yellow Pages"
]

def menu_options(number)
  case number
  when 1
    print_list
    puts "What would you like to do?"
    print_menu
  when 2
    edit_name_menu
  when 3
    erase
  else
    puts "Have a nice day!"
    exit
  end
end

def greeting
  puts "Welcome to the Yellow Pages"
  puts "What would you like to do?"
  print_menu
end

def print_menu
  puts "Please make a selection"
  @menu_options.each_with_index { |single, index|
    puts "#{index+1}) #{single}"
  }
  answer = gets.chomp.to_i
  menu_options(answer)
end

def print_list
  @contact_list.each_with_index do |person, index|
    puts "#{index+1} ---> #{person[:name]},"
    puts "Who is from #{person[:location]}, and can be reached at #{person[:phone_number]}"
  end
end



def edit_name_menu
  print_list
  puts "Which contact would you like to edit?"
  answer = gets.chomp.to_i
  legit_edit(answer)
end

def legit_edit(answer)
  # if the user types 1, we need to find the element in the array at 0
  puts "#{@contact_list[answer-1][:name]}, "
  puts "#{@contact_list[answer-1][:address]},"
  puts "#{@contact_list[answer-1][:phone_number]}"
  puts "What do you want to edit?"
  puts "1) name"
  puts "2) address"
  puts "3) phone number"
  puts "4) location"
  response = gets.chomp.to_i
  if response == 1
    puts "Ok, what should the name be?"
    n = gets.chomp
    @contact_list[answer-1][:name] = n
  elsif response == 2
    puts "What is their correct address?"
    a = gets.chomp
    @contact_list[answer-1][:address] = a
  elsif response == 3
    puts "What is their new numbers?"
    phone_change = gets.chomp
    @contact_list[answer-1][:phone_number] = phone_change
  elsif response == 4
    puts "What is the new location?"
    location_change = gets.chomp
    @contact_list[answer-1][:location] = location_change
  else
    puts "Sorry, try again..."
    edit_name_menu
  end
  puts "Nice work, you updated new information to the person."
  puts "Their contact information is now..."
  puts "#{@contact_list[answer-1][:name]}, "
  puts "#{@contact_list[answer-1][:address]},"
  puts "#{@contact_list[answer-1][:phone_number]}"
  puts "#{@contact_list[answer-1][:location]}"
  print_menu
end

def erase
  puts "Who would you like to delete?"
  print_list
  answer = gets.chomp.to_i
  puts "Goodbye #{@contact_list[answer-1][:name]}"
  @contact_list.delete_at(answer-1)
  puts "Here is your updated contact list"
  print_list
  print_menu
end

greeting
