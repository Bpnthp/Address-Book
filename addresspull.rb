require "./address.rb"
require 'json'



class  Addresspull 
  def add_file contacts
    file = File.open(FILE_PATH, "a+")
    contacts.each do |contact|
        file.puts(contact)
    end
    file.close
  end

  def delete_file name_to_delete
    lines = []
      File.open(FILE_PATH, "r") do |f|
        f.each_line do |line|
          lines << line.strip
        end
      end
      filtered_lines = lines.reject do |line|
        begin 
          entry = eval(line)
          entry["name"] == name_to_delete 
        rescue
          false
        end
      end
      File.open(FILE_PATH, "w") do |f|
        filtered_lines.each do |line|
          f.puts (line)
        end
      end
  end
  
  
  
  def update_file (name_to_update,new_address, new_phone_number, new_email)
    lines = File.open(FILE_PATH, "r").readlines(&:chomp)
    updated_lines = lines.map do |line|
      entry = eval(line)
      # puts entry['name']
      # puts entry.class
      puts new_address + ' ' + new_phone_number + ' ' + new_email 
      puts entry['name'] == name_to_update
      if entry["name"] == name_to_update
        
        entry["address"] = new_address
        entry["phone_number"] = new_phone_number
        entry["email"] = new_email
        # entry.to_a.map { |k,v| "#{k}=>\"#{v}\"" }.join(",")
        # puts entry
        entry
      else
        line
      end
    end
    puts updated_lines
    file = File.open(FILE_PATH, 'w')
    updated_lines.each do |line|
      file.puts(line)
    end
    file.close
  end

  

end

