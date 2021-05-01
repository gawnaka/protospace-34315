class CommentsController < ApplicationController

     def create
          if @prototype = Prototype.find(params[:prototype_id] || params[:id])
           @comment = Comment.new
           @comments = @prototype.comments.includes(:user)
           @comment.save
           
           redirect_to Prototypes_comment_path(@comment)
        else
          redirect_to prototype_path(@prototype.id)
        end
      end

     private

     def comment_params
     params.require(:comment).permit(:comment).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    
  end
end