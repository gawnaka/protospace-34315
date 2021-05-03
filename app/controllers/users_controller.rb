class UsersController < ApplicationController
  
  def show
    @prototypes = Prototype.all
    @user = User.find(params[:id])
    @name = current_user.name
    @profile = current_user.profile
    @occupation = current_user.occupation
    @position = current_user.position
    @prototype = current_user.prototype
    end

    private

    def user_params
    params.require(:user).permit(:name, :profile, :occupation, :position ,:presence,:image ).merge(user_id: current__user.id)
  
    end
end 
    