class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def profile
    redirect_to user_path(current_user)
  end

  def index
    @user = User.all
  end

  def show
    @boards = @user.boards
  end

  def new
  end

  def edit
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

end
