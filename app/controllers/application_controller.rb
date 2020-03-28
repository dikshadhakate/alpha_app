class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def hello
  # 	render html: "hello world!"
  # end

  helper_method :current_user, :logged_in?  #whatever we write in application controller, it avialable for all controller but it is not availbale for views so we make them availbale by adding thios helper_method in our application controller

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user # !! is used to convert in boolean
  end

  def require_user
  	if !logged_in? #if not logged_in? 
  		flash[:danger] = "You need to login to continue"
  		redirect_to root_path
  	end	
  end

end
