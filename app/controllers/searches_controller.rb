class SearchesController < ApplicationController
  def index
  end
  def search
      @searchresult = User.where("name like ?", params[:search]).order("created_at DESC")
      if @searchresult.any?
        puts @searchresult.name
      	render 'index'
      else
        flash[:errors]= "Cannot be blank"
      	redirect_to(:back)
      end
  end
  def enter
    @ruser = User.find(params[:search])
    redirect_to "/users/#{@ruser.id}"
  end
end
