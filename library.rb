class Library
  
  def initialize
    # creates an empty array for books in the library
    @books = []
    puts "Added #{@books} to the library."
  end

  def books
   
  end

  def list_books
    #iterates over books in library and prints title and status
    @books.each do |book|
      print book.title + ' - ' + book.status
      puts ''
    end 
  end

  def borrowed_books
    #iterates over books in library and prints if book is checked out
    @books.each do |book|
      puts book.title + book.borrower if book.status == "checked_out"
    end
  end

  def available_books
    #iterates over books in library and prints if book is available
    @books.each do |book|
      puts book.title if book.status == "available"
    end
  end

  def add_book(book)
    # shovels new instances of book into the books array in our library
    @books << book
  end

  def check_out(user, book)
    @user = user
    @book = book
  end

  def check_in(book)

  end
end

class Borrower
  # gives reader access to name
  attr_reader :name

  def initialize(name)
    # sets instance for name at initialize
    @name = name
    puts "Added #{@name} as a borrower."
  end

  def borrowed_books
  end

  def name
  end

  def borrowed_books_count

  end

  def borrowed_books_list
  end
end

class Book
  # gives reader status to title and author, and reader+writer status to status
  attr_reader :title, :author
  attr_accessor :status

  def initialize(title, author)
    # sets instances and variables at initialize
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end
end
