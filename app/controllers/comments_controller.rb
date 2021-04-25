class CommentsController < ApplicationController

     def index
     @comment= Comment.new
     @Prototypes= Prototypes.find(params[:Prototypes_id])
     end

     def create
      if
        @comment = Comment.new(comment_params)
        redirect_to "/prototypes/#{@comment.prototype.id}" 
      else
        @prototype = @comment.prototype
        @comments = @prototype.comments
        render "prototypes/show"
      end
     end

     private

    def comment_params
    params.require(:comment).permit(:comment,:image).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    
  end
end