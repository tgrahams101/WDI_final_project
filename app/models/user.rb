class User < ApplicationRecord

  has_secure_password


  def self.confirm(params)
    user = User.find_by(email: params[:email])

    if user

    user = user.authenticate(password: params[:password])
    puts user
    user

    else
    redirect_to signup_path
    end

  end

end
