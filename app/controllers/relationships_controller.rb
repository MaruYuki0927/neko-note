class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    relationship = current_user.relationships.build(followed_id: params[:user_id])
    relationship.save

    redirect_to user_path(params[:user_id])
  end

  def destroy
    relationship = current_user.relationships.find_by(followed_id: params[:user_id])
    relationship.destroy

    redirect_to user_path(params[:user_id])
  end
end