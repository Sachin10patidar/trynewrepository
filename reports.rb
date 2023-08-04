class Reports
  def reports(lib)
   puts "1. Available Books"
   puts "2. Borrowed Books"
   puts "3. Borrowers Borrowing History"
   print "Please Enter your choice:"
   choice = gets.chomp.to_i
    case choice
    when 1
     available_books(lib.book)
    when 2
     borrowed_books(lib.borrowed_book)
    when 3
     borrowers_borrowing_history(lib.overdue)
    else 
     puts "invalid choice"
    end
  end
   
  def borrowers_borrowing_history(overdue)
   history = overdue.select{|value| value}
    if history.empty?
     puts "No book issue"
    else
     puts "Borrowers Borrowing History:"
     history.each do |historys|
        puts "Title: #{historys.title}\nBorrower: #{historys.name}\nReturn Date: #{historys.return_date}"
     end
    end
  end
   
  def borrowed_books(borrowed)
    borrowedBook = borrowed.select{|val| val}
    if borrowedBook.empty?
      puts "books are not borrowed"
    else
      puts "Borrowed Books:"
      borrowedBook.each do |boook|
        puts "title: #{boook.title}"
      end
    end
  end
   
  def available_books(book)
    available_book = book.select{|available| available}
    if available_book.empty?
      puts "books are not available"
    else
      puts "Available books:"
      available_book.each do |books|
        puts "title: #{books.booktitle}\nauthor: #{books.author}\npublication year: #{books.publication_year}"
      end
    end
  end
end