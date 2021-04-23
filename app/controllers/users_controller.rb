class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
  
  def show
      @name = current_user.name
      @profile = current_user.profile
      @occupation = current_user.occupation
      @position = current_user.position
      @protospace = current_user.protospace
    end