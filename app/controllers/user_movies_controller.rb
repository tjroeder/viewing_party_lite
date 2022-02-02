class UserMoviesController < ApplicationController
  def index
    query_params
    @user = User.find(user_params)
    # if query_params == 'top_20_rated'
    #   @user = User.find(user_params)
    # else 

    # end 
  end

  def show
  end

  private

  def user_params
    params.require(:user_id)
  end

  def query_params
    params.require(:q)
  end
end
