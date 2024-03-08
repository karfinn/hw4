class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @places = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @places["id"], "user_id" => @current_user["id"] })
    end 


  def new
    @place=Place.new
  end

     def create
      @user = User.find_by({ "id" => session["user_id"] })
      if @user != nil
        @place = Place.new
        @place["name"] = params["name"]
        @place.save
        redirect_to "/"
      else
        flash["notice"] = "Sign-up or Login first."
        redirect_to "/login"
      end
    end
  end

