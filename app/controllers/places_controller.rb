class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entry = Entry.where({ "place_id" => @place["id"] })
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
      else
        flash["notice"] = "Login first."
        redirect_to "/login"
        end
      end
  end

