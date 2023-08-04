module A
  class Book
		attr_accessor :booktitle, :author, :publication_year
		def initialize(booktitle, author, publication_year)
			@booktitle = booktitle
			@author = author
			@publication_year = publication_year
	 end
  end
  # check if given sting is not empty
  def string_validation(text)
    begin
      print text
      value = gets.chomp.strip
      puts "invalid input" if value.empty? == true
    end while value.empty?
   value
  end
  # check given year is between1900 and 2023
  def integer_validation(text)
    begin
     ist = true
     print text
     num = gets.chomp.to_i
      if num.between?(1900, 2023)
       ist = false
       return num
      else
        puts "Invalid year"
      end
    end while ist
  end       
end