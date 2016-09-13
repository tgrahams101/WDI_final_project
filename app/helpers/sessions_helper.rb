module SessionsHelper

  def login(user)
    session[:user_id] = user.id

    @current_user = user



  end



  def current_user

    @current_user ||=  User.find(session[:user_id]) if loggedin?

  end

  def loggedin?

  !!session[:user_id]

  end


  def ensure_loggedin

  redirect_to login_path unless session[:user_id]

  end



  def logout

  @current_user = session[:user_id] = nil

  redirect_to root_path
  end




end
