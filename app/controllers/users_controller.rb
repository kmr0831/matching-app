class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(21)
  end

  def show
    @user = User.find(params[:id])
    @relationship = Relationship.new
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  def matchers
   @user = User.find(params[:id])
   @users = @user.matchers
   render 'matchers'
  end
  
end
