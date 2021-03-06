class CommentsController < ApplicationController
       def create
        @prototype = Prototype.find(params[:prototype_id] || params[:id])
        @comment = Comment.new(comment_params)
        if @comment.save
        @comments = @prototype.comments.includes(:user)
        @comments = @prototype.comments
        redirect_to prototype_path(@prototype.id)
        else
          render "prototypes/show"
        end
        end

  

     private

     def comment_params
     params.require(:comment).permit(:comments).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    
  end
end