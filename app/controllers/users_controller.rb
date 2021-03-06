class UsersController < ApplicationController
  def create
  	@user=User.new(user_params)
  	if @user.save 
  		flash[:success] = "Welcome to FlyHappy!"
      sign_in(@user)
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

end

private 

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :industry)

end