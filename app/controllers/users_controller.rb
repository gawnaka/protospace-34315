class UsersController < ApplicationController
  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  
  def show
      user = User.find(params[:id])
      @name = user.name
      @profile = current_user.profile
      @occupation = current_user.occupation
      @position = current_user.position
      @protospace = user.protospace
    end
  end
end 