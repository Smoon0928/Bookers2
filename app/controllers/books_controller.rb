class BooksController < ApplicationController
   def new
      @book= Book.new
   end
      
      
   def create
     @books=Book.all
     @user=User.find(current_user.id)
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book)
     else
       render :index
     end
   end
    
    def show
     @book = Book.find(params[:id])
     @user=@book.user
     @books = Book.all
     @book_new=Book.new
    end
    
    def index
    @user = User.find(current_user.id)
     @books = Book.all
     @book = Book.new
    end
    
    def update
    
     @book = Book.find(params[:id])
     if @book.update(book_params)
         flash[:notice]="You have updated book successfully."
        redirect_to book_path(@book.id)
     else
        @user = User.find(current_user.id)
        @books = Book.all
        render :edit
     end
    end
    
    
    def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
    end
    
    def edit 
    @book = Book.find(params[:id])
     user_id = @book.user.id
     unless user_id == current_user.id
      redirect_to books_path
     end
     
     
    end

    private

      def book_params
        params.require(:book).permit(:title, :body)
      end
      
      
end
