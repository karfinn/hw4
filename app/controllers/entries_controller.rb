class EntriesController < ApplicationController

  def new
    # renders new view connected to Place_id
    @place = Place.find_by({ "id" => params["place_id"] })
   end 

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    if @user != nil
        @entry = Entry.new
        @entry["title"] = params["title"]
        @entry["description"] = params["description"]
        @entry["occurred_on"] = params["occurred_on"]
        @entry["place_id"] = params["place_id"]
        @entry["user_id"] = @current_user["id"]
        @entry.uploaded_image.attach(params["entry"]["uploaded_image"])
        @entry.save
        redirect_to "/places/#{@entry["place_id"]}"
    else
      flash["notice"] = "Login first."
      redirect_to "/login"
    end
  end

  before_action :allow_cors #cross origin...security
  def allow_cors
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
    response.headers['Access-Control-Max-Age'] = '1728000'
  end
end 