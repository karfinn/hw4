class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["first_name"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
    @user.save
    redirect_to "/places"
  end
end
