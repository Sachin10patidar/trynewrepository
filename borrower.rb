module B
  class BorrowerInfo
   attr_accessor :borrowername, :cont_info
   def initialize(borrowername, cont_info)
     @borrowername = borrowername
     @cont_info = cont_info
   end
  end

  # this method call by manage boorwer for return a book index
  def bookIndex(booktitle, book)
    book.each_with_index do |book , index| 
     return index if book.booktitle == booktitle
    end
   return nil
  end

  #this method call by manage borrower for check given date is valid formate or note
  def date_validation(return_date)
    format = "%Y-%m-%d"
    DateTime.strptime(return_date,format)
    true
   rescue 
    false
  end
end