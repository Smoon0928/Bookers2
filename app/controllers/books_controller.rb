class BooksController < ApplicationController
    def index
      @books = Book.all
    end
    
    def new
      @book= Book.new
    end
      
      
    def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to book_path
    end
    
    
    
    #投稿のストロングパラメータ
　　private
　　
　　def book_params
　　  params.require(:book).permit(:title, :body)
　　end
    
end
