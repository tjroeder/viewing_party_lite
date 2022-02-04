class UserMoviesController < ApplicationController
  def index
    @user = User.find(user_params)
    @query_params = query_params

    if @query_params == 'top_20_rated'
      @movies = MovieFacade.top_20_movie_list
    elsif @query_params.is_a?(String)
      @movies = MovieFacade.search_movie_list(@query_params)  
    end
  end

  def show
    @user = User.find(user_params)
    @movie = MovieFacade.create_movie(movie_id_param)
  end

  private

  def user_params
    params.require(:user_id)
  end

  def query_params
    params.require(:q)
  end

  def movie_id_param
    params.require(:id)
  end
end
