class PrototypesController < ApplicationController
  before_action :set_Prototypes, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototypes.all
  end

  def new
    @prototypes = Prototypes.new
  end

  def create
    Prototypes.create(prototypes_params)
    
  end

  def destroy
    prototypes = Prototypes.find(params[:id])
    prototypes.destroy
    redirect_to root_path
    
  def edit 
  end

  def update
    prototypes = Prototypes.find(params[:id])
    prototypes.update( prototypes_params)
  end

  def show
    @comment = Comment.new
    @comments = @ prototypes.comments.includes(:user)
  end

  private
  
  def Prototypes_params
    params.require(:Prototypes).permit(:image,:text,:name,:email,:encrypted_password,:profile,:occupation,:position).merge(user_id: current_user.id)
  end

  def set_Prototypes
    @prototypes = Prototypes.find(params[:id])
  end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
  end
 end
end