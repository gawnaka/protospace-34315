class CommentsController < ApplicationController
  def index
    @comments = Comments.new
    @prototypes = Prototypes.find(params[:prototypes_id])

  def create
    @prototypes = Prototypes.find(params[:prototypes_id])
    @comments = @prototypes.comments.new(comments_params)
  if  @comments.save
    redirect_to room_comments_path(@prototypes)
  else
    @comments = @prototypes.comments.includes(:user)
    render :index
   end
  end

  private

  def comments_params
    params.require(:comments).permit(:content).merge(user_id: current_user.id)
  end
end
