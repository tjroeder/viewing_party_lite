# frozen_string_literal: true

class UserMoviesController < ApplicationController
  def index
    @user = User.find(user_params)
    @query_params = query_params

    case @query_params
    when 'top_20_rated'
      @movies = MovieFacade.top_20_movie_list
    when String
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
