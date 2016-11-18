class Person
  attr_accessor :name, :phone_number, :address, :position, :salary, :slack_acct, :github_acct
end

class TIYdatabase
  def initialize
    @people = [] # instance variables hold data It's a container
  end

  def add # def do things
    # create a Person
    person = Person.new

    puts "What is the name?"
    person.name = gets.chomp.capitalize

    puts "What is the position?"
    person.position = gets.chomp

    puts "What is the address?"
    person.address = gets.chomp

    puts "What is the phone number?"
    person.phone_number = gets.chomp

    puts "What is the salary?"
    person.salary = gets.chomp

    puts "What is the slack account?"
    person.slack_acct = gets.chomp

    puts "What is the github_acct?"
    person.github_acct = gets.chomp

    # add the person to people
    @people << person
  end

  def banner
    puts "-" * 50
  end

  def print_all_attr(person) # where is person coming from?? to use as a method it needs an argument for this to work
    banner
    puts person.name
    banner
    puts "Position: #{person.position}"
    puts ""
    puts "Address: #{person.address}"
    puts ""
    puts "Phone number: #{person.phone_number}"
    puts ""
    puts "Salary: #{person.salary}"
    puts ""
    puts "Slack account: #{person.slack_acct}"
    puts ""
    puts "Github: #{person.github_acct}"
    puts ""
  end

  def search
    puts "What name do you want to search?"
    search_name = gets.chomp.capitalize
    index = 0
    loop do
      if index >= @people.length
        puts "Sorry, the name doesn't exist"
        break
        end

      person = @people[index]

      if person.name == search_name
        print_all_attr(person)
        break
      end
      index += 1
    end
  end

  def delete
    puts "What name do you want to delete from the list"
    delete_person = gets.chomp.capitalize
    index = 0
    loop do
      if index >= @people.length
        puts "Sorry, the name doesn't exist"
        break
      end

      person = @people[index]

      if person.name == delete_person
        @people.delete(person)
        puts "#{person.name} is deleted from the list!"
        break
       end
      index += 1
    end
  end
  # eventually remove a person from @people

  def print_list
    puts "Here is the list"
    index = 0
    loop do
      if index >= @people.length # always need something to break the loop. It's not going to stop automatically
        break # just because you have limited number of index
        end
      person = @people[index]
      print_all_attr(person)
      index += 1
    end
  end

  def menu
    loop do
      puts "What do you want to do? (A)dd (S)earch (D)elete? (P)rint list (E)xit"
      action = gets.chomp.upcase
      case action
      when "A"
        add

        when "D"
          delete

        when "S"
          search

        when "P"
          print_list

        when "E"
          break

        else
          break

      end
    end
  end
end

database = TIYdatabase.new
database.menu
