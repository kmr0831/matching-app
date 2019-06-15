class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(21)
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
  end
end
