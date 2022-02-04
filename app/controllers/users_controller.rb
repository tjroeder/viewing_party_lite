# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_parties = UserParty.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user)
  end

  def discover
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
