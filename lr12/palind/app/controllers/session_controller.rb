class SessionController < ApplicationController
  def new
  end

  def create
    user = User.authenticate params[:session][:login], params[:session][:password]
    
    if user.nil?
      redirect_to signin_path, notice: 'invalid_login_password'
    else
      sign_in user
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
