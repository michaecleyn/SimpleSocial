class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # this is a devise majic thing
  # def after_sign_in_path_for(user)
  # 	dashboard path
  # end
end
