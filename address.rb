FILE_PATH = "./store.txt"
require "./addresspull.rb"

class Address
  attr_accessor :name, :address, :phone_number, :email



  def initialize (name, address, phone_number, email)
    @name = name
    @address = address
    @phone_number = phone_number
    @email = email
    
  end
  def getAddress 
    {
      "name" => @name,
      "address" => @address,
      "phone_number" => @phone_number,
      "email" => @email
    }
  end
end

class AddressBook < Address
  def initialize
    @contacts = []
  end

   def add
     puts "write no of addresses to be added"
     no_of_addresses = gets.chomp.to_i
     no_of_addresses.times do
       puts "Enter name"
       name = gets.chomp
       puts "Enter address"
       address = gets.chomp
       puts "Enter phone number"
       phone_number = gets.chomp
       puts "Enter email"
       email = gets.chomp
       addr = Address.new(name, address, phone_number, email)
       new_addr = addr.getAddress
       @contacts << new_addr
       puts @contacts
      end
      address = Addresspull.new
      address.add_file(@contacts)
      
    end

    def delete
      puts "Write the name to be deleted..."
      name_to_delete = gets.chomp
      address = Addresspull.new
      address.delete_file(name_to_delete)
    end

    def update
      puts "Write the name of person you are updating to"
      name_to_update = gets.chomp
      puts "Enter new address"
      new_address = gets.chomp
      puts "Enter new phone number"
      new_phone_number = gets.chomp
      puts "Enter new email"
      new_email = gets.chomp
      address = Addresspull.new
      address.update_file(name_to_update, new_address, new_phone_number, new_email)
      
    end
    

    def display
      puts "*********************************** your records **************************************"
      records = File.open(FILE_PATH, 'r').readlines(&:chomp)
      puts "Name           Address          Phone Number            email"
      records.each do |record|
        rec = eval(record)
        puts " #{rec['name']}               #{rec['address']}                   #{rec['phone_number']}                    #{rec['email']}"
      end
      
    end
end




# address = AddressBook.new
# address.add
# address.delete
