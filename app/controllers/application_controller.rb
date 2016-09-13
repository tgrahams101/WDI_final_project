class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  include ApplicationHelper
  include SessionsHelper

  def authorize
    redirect_to root_path unless loggedin?

  end
end
