require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList
  #new list show search
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  case ARGV[0]
  
  when nil 
    puts "Here is a list of avaiable commands:"
    puts "new : create a new contact"
    puts "show : show a contact"
    puts "search: search a contact"
  
  when "new"
    puts "Please enter full name"
    fullname = STDIN.gets.chomp
    puts "Please enter email"
    email = STDIN.gets.chomp
    puts "New contact with id #{Contact.create(fullname,email)} created successfully!"

  when "list"
     #do |results|
    #   results.each do |contact|
    #     puts contact.inspect
    #   end
    # end
    puts "id" + "\t" + "name" + "\t\t" + "e-mail"
    Contact.all.each  do |contact|
        puts contact["id"] + "\t" + contact["name"] + "\t" + contact["email"] 
    end
  
  when "show"
    id = ARGV[1]
    puts "id" + "\t" + "name" + "\t" + "email"
    found =  Contact.find(id)
    puts found !=nil ? found["id"] + "\t" + found["name"] + "\t" + found["email"] : "Contact with id not found"

  when "search"
    term = ARGV[1]
    records = 0
    puts "id" + "\t" + "name" + "\t\t" + "e-mail"
    Contact.search(term).each  do |contact|
      records +=1
      puts contact["id"] + "\t" + contact["name"] + "\t" + contact["email"] 
    end
    puts "------------------------"
    puts "#{records} records total"  

  when "update"
    id = ARGV[1]
    found =  Contact.find(id)
    if found != nil
      puts "Please enter full name"
      fullname = STDIN.gets.chomp
      puts "Please enter email"
      email = STDIN.gets.chomp
      puts "contact with id #{Contact.save(id,fullname,email)} updated successfully!"
    else
      puts  "Contact with id not found"   
    end

  when "destroy"
    id = ARGV[1]
    found =  Contact.find(id)
    if found != nil
      puts "contact with id #{Contact.destroy(id)} deleted successfully!"
    else
      puts  "Contact with id not found"   
    end

  else
    puts "No valid option entered"  

  end #case end

end #class end

