class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: login_params[:email])

    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.email}!"
      redirect_to discover_path(@user)
    else
      flash[:alert] = 'Email and/or password does not match a record on file'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def login_params
    params.permit(:email, :password, :password_confirmation)
  end
end
