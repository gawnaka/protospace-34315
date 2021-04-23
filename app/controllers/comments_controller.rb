class CommentsController < ApplicationController
  def index
    @comment= Comment.new
    @Prototypes= Prototypes.find(params[:Prototypes_id])

    def create
      @Prototypes = Prototypes.find(params[:Prototypes_id])
      @comment = @Prototypes.comment.new(comment_params)
      @comment.save
      redirect_to Prototypes_comment_path(@comment)
    else
      @comment = @Prototypes.comment.includes(:user)
      render :index
    end
  end
  

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
