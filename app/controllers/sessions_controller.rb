class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			flash[:success] = "You have successfully logged in."
			#information is being stored in session hash 
			session[:user_id] = user.id  #storing user_id in session hash so browser cookies are going to handle this wheater the user is login or not
			redirect_to user_path(user)
		else
			flash.now[:danger] = "There is something wrong with your login credential." #because there is no model for this there is no validation message, flash consist every new http rerquest and show the msg on the next page as we are not redirecting anywhere so we use flash.now it doesn't consider any http request.
			render 'new'
		end	
	end

	def destroy
		session[:user_id] = nil #setting user_id to nil
		flash[:success] = "You have successfully logged out."
		redirect_to root_path
	end
end