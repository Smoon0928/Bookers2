class UsersController < ApplicationController
    def edit
     @User = User.find(params[:id])
    end
    
    def index
    end  
    
    def updadte
        
    end
end