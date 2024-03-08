class SessionsController < ApplicationController
  def new
  end

  def create
  @user = User.find_by({ "username" => params["username"] })
  if @user != nil
    if BCrypt::Password.new(@user["password"]) == params["password"]
      session["user_id"] = @user["id"]
      redirect_to "/"
    else
      flash["notice"] = "Invalid username or password."
      redirect_to "/login"
    end
  else
    redirect_to "/login"
  end
end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye!"
    redirect_to "/login"
  end
end