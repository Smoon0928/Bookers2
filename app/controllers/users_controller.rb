class UsersController < ApplicationController
    def show
     @user = User.find(params[:id])
    end
    
    def edit
     @user = User.find(params[:id])
    end  
    
    def create
     @user = User.new(user_params)
    end
    
    def update
     @user = User.find(params[:id])
     if @user.update(user_params)
        redirect_to user_path(current_user.id)
     else
        render :edit
    end
   end
    
    private
    def user_params
        params.require(:user).permit(:introduction, :name, :image)
    end
end