class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email])
    	if user.authenticate(params[:password])
    		session[:user_id] = user.id
    		redirect_to "/users/#{session[:user_id]}"
    	else
    	flash[:error]='Password and Email not matched!'
    	redirect_to '/'
    	end
	end
	def make
		user = User.from_omniauth(env["omniauth.auth"])
	    session[:user_id] = user.id
	    redirect_to "/users/#{user.id}"
	end
	def destroy
		session[:user_id]=nil
		session[:omniauth] = nil
		redirect_to '/'
	end
	private

end
