class PrototypesController < ApplicationController
      before_action :authenticate_user! , only: [:new,:edit,:destroy]
      
        def index
        @prototypes = Prototype.all
        end

        def new
        @prototype = Prototype.new
        end

        def create
         @prototype = Prototype.new(prototype_params)
          if @prototype.save!
        redirect_to root_path
        else
        render :new
        redirect_to root_path
        end
        end

        def show
        @prototype = Prototype.find(params[:prototype_id] || params[:id])
        @comment = Comment.new
        @comments = @prototype.comments.includes(:user)
        end
        
  
        def edit
         @prototype = Prototype.find(params[:id])
         end
         
  
         def update
             prototype = Prototype.find(params[:id])
            if  prototype.update(prototype_params)
            redirect_to root_path
          else
            render :edit
          end
        end
   
        def destroy
          @prototype = Prototype.find(params[:id])
          @prototype.destroy
      
         end
        
        
         private
  
        def prototype_params
        params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
        end
        
end