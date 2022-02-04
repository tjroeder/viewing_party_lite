# frozen_string_literal: true

class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @movie = MovieFacade.create_movie(params[:movie_id])
    @users = User.all
    @party = Party.new
  end

  def create
    @user = User.find(params[:user_id])
    @movie = MovieFacade.create_movie(params[:movie_id])
    @users = User.all
    @party = Party.new
    if @movie.runtime.to_i >= params[:duration].to_i
      redirect_to "/users/#{@user.id}/movies/#{@movie.movie_id}/viewing_party/new"
    else
      new_party = Party.create(movie_id: params[:movie_id], date: params[:date], time: params[:time], img_url: params[:img_url], movie_title: params[:movie_title], runtime: params[:runtime], duration: params[:duration])
      @users.each do |user|
        if params[user.name] == "1"
          UserParty.create(user_id: user.id, party_id: new_party.id)
        end
      end
      redirect_to "/users/#{@user.id}"
    end
  end

  private

  def party_params
    params.require(:party).permit(:movie_id, :date, :time, :img_url, :movie_title, :runtime, :duration)
  end
end
