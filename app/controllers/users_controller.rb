class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new]

  def new
    @user = User.new

  end

  def create

  @user =  User.new(sanitized_params(params))

      if @user.save
        puts @user.inspect
        login(@user)
        # render plain: @current_user.inspect
        redirect_to @user

      else
        render plain: @user.inspect
        render 'new'

      end




  end

  def show
    # render plain: current_user

    @user = User.find(params[:id])

  end

  def edit

    @user = User.find(params[:id])



  end

  def update

    @user = User.find(params[:id])

     if @user.update(sanitized_params(params))
       redirect_to @user
     else
       render 'edit'

     end

  end


  private


  def sanitized_params(params)
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
