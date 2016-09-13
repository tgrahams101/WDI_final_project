class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new ,:create, :destroy]

  def new

  end

  def create
    # render plain: params
    @user = User.confirm(params)
  
    if @user
        login (@user)
        redirect_to @user

    else
      #
      redirect_to signup_path

    end


  end

  def destroy

    logout

  end



end
