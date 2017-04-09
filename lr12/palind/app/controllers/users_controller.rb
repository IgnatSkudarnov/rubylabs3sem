class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.xml { render xml: @users.map { |user| { user: { 
                                                           id: user.id,
                                                           login: user.login,
                                                           password: user.password_filtered,
                                                           created_at: user.created_at,
                                                           updated_at: user.updated_at
                                                           } } } }
    end
  end

  def show
    set_user
  end

  def new
    @user = User.new
  end

  def edit
    set_user
  end

  include SessionHelper

  def create
    @user = User.new(user_params)
    if @user.save_new_user
      sign_in @user
      redirect_to root_path
    else
      redirect_to signin_path, notice: 'user' + user_params[:login] + 'exists'
    end
  end

  def update
    set_user
    if @user.update_exist_user(user_params)
      redirect_to user_path, notice: 'user' + @user.login + 'updated'
    else
      redirect_to user_edit_path, notice: 'user' + user_params[:login] + 'exists'
    end
  end

  def destroy
    set_user
    @user.destroy
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find session[:current_user_id]
    end

    def user_params
      params.require(:user).permit(:login, :password)
    end
end
