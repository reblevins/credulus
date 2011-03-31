class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :tag_cloud
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
  private

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
