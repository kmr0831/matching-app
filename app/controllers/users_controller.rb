class UsersController < ApplicationController
  def index
    @users = current_user.matchers
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
  end
end
