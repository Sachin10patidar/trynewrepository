require_relative 'library.rb'
require_relative "reports.rb"

class Main
  def start
   lib = Library.new
   rep = Reports.new
    istrue = true
    while istrue
      puts "\n............Library Management System............"
      puts
      puts '.....Main Menu......'
      puts '1. Add Book'
      puts '2. Add Borrower'
      puts '3. Search Book'
      puts '4. Manage Borrowing'
      puts '5. Overdue Books'
      puts '6. Reports'
      puts "7. Exit\n"
      print 'Please Enter Your Choice:'
      choice = gets.chomp.to_i
      case choice
      when 1
        lib.add_book
      when 2
        lib.add_borrower
      when 3
        lib.search_book
      when 4
        lib.manage_borrower
      when 5
        lib.overdue_info
      when 6
        rep.reports(lib)
      when 7
        puts "Exiting......."
        istrue = false 
      else
        puts "Invalid choice"
      end
    end
  end
end
Main.new.start