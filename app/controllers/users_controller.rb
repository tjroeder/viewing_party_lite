# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_parties = UserParty.where(user_id: @user.id)
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Please include name, email and matching passwords.'
      redirect_to register_path
    end
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def login_form
  end

  def login_user
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      redirect_to user_discover_path(@user)
    else
      flash[:alert] = 'Email and/or password does not match a record on file'
      redirect_to login_path
    end
  end

  private

  def login_params
    params.permit(:email, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
