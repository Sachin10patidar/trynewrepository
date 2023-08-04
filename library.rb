require 'date'
require_relative "book.rb"
require_relative "borrower.rb"
require_relative "overdue.rb"

class Library
  attr_accessor :book , :borrowed_book , :borrower, :overdue
  include A
  include B
  def initialize
   @borrowed_book = []
   @borrower=[]
   @overdue = []
   @book = []
  end 

  def add_book
    booktitle = string_validation("\nEnter book title:")
    author = string_validation('Enter author name:')
    publication_year = integer_validation('Enter publication year:')

    @book.push(Book.new(booktitle, author, publication_year))
    puts "\nBook Added Successfully!"
  end

  def search_book
   search = string_validation("\nEnter title or author name: ")
    result = @book.select { |book| book.booktitle.include?(search) || book.author.include?(search) }
    if result.empty?
     puts "Book Not Found"
    else
     puts 'Search Results:'
      result.each do |book|
       puts "title: #{book.booktitle}\nauthor: #{book.author}\npublication_year: #{book.publication_year}"
      end
   end
 end

  def add_borrower
    borrowername = string_validation("\nEnter borrower name:")
    print 'Enter Contact Information:'
    cont_info = gets.chomp
    puts "Borrower Added Successfully!"

    @borrower.push(BorrowerInfo.new(borrowername, cont_info))
  end

  def overdue_info
    overdue =  @overdue.select{|value| value}
    if overdue.empty?
      puts "Not Any Book Are Overdue"
   else
     puts "Overdue Books:"
      overdue.each do |overdues|   
       puts "Title: #{overdues.title}\nBorrower: #{overdues.name}\nReturn Date: #{overdues.return_date}"
      end
   end
 end

  def manage_borrower
    booktitle = string_validation("\nEnter book title:")
     indx = bookIndex(booktitle,@book)
    if indx == nil
      puts "Book Not Found"
    else
      borrowername = string_validation("Enter borrower name:")
      result = @borrower.select{ |borrower| borrower.borrowername.include?(borrowername)}
      if result.empty?
        puts"Borrower Name Not Found"
      else
        print "Enter Return Date(DD-MM-YYYY):"
        return_date = gets.chomp
        if date_validation(return_date)
         puts "Book checked out successfully!"
          @overdue.push(OverdueInfo.new(booktitle,borrowername,return_date)) 
           @borrowed_book.push(OverdueInfo.new(booktitle,borrowername,return_date))
            @book.delete_at(indx)
       else
         puts "Please Enter Valid Date Format"
       end
     end
   end
 end
end
