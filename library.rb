class Library
  attr_reader :book, :user
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
      puts book.title + book.borrower.name if book.status == "checked_out"
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
    # will change book status from available to checked_out
    
    if user.borrowed_books_count >= 2
      return "You may not check out more than 2 books at a time."
    end

    if book.status == "available" 
      puts "checked_out"
      book.status = "checked_out"
      book.borrower = user
      user.borrowed_books << book 
      puts "#{user.name} checked out #{book.title}."
    else
      puts "Sorry that book is already checked out."
    end
  end

  def check_in(book)
    if book.status == "checked_out"
      book.status = "available"
      book.borrower.borrowed_books.delete(book)
      book.borrower = nil
    end
  end
end

class Borrower
  # gives reader access to name
  attr_reader :name

  def initialize(name)
    # sets instance for name at initialize
    @name = name
    @books = []
    puts "Added #{@name} as a borrower."
  end

  def borrowed_books
    @books
  end

  def borrowed_books_count
    # will count how many books borrower has borrowed
    @books.length
  end

  def borrowed_books_list
    @books.each do |book|
      puts book.title
    end
  end
end

class Book
  # gives reader status to title and author, and reader+writer status to status
  attr_reader :title, :author
  attr_accessor :status, :borrower

  def initialize(title, author)
    # sets instances and variables at initialize
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end
end
