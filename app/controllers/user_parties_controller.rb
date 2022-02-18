# frozen_string_literal: true

class UserPartiesController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:name])
    party = Party.find(params[:id])
    user_party = UserParty.create(user_id: user, party_id: party)
    redirect_to "/users/#{user.id}"
  end
end
