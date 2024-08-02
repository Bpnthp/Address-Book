
require "./address.rb"


loop do
  puts "***************************************   MENU   *******************************************"
  puts "1 - Add Contacts"
  puts "2 - Delete Contacts"
  puts "3 - Update Contacts"
  puts "4 - Display Contacts"
  puts "5 - Exit"

  puts "Enter your Heavenly Choice:"
  choice = gets.chomp.to_i

  addressbook = AddressBook.new


  case choice
  when 1
    addressbook.add
  when 2
    addressbook.delete
  when 3
    addressbook.update
  when 4
    addressbook.display
  when 5
    break
  else
    puts "Invalid Choice"
  end
  
  break if choice == 6
end