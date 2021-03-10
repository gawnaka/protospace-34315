class PrototypesController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototypes.all
  end

  def new
    @prototypes = Prototypes.new
  end

  def create
    Prototypes.create(Prototypes_params)
  end

  def destroy
    prototypes = Prototypes.find(params[:id])
    prototypes.destroy
  end

  def edit
  end

  def update
    prototypes = Prototypes.find(params[:id])
    prototypes.update(tweet_params)
  end

  def show
  end

  private
  def Prototypes_params
    params.require(:Prototypes).permit(:image,:text,:name, :email,:encrypted_password,:profile,:occupation,:position)
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
  
