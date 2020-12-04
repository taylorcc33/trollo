class ListsController < ApplicationController
  before_action :set_user
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)

    if @list.save
      redirect_to user_board_path(@user, @board)

    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @list.update(list_params)
      redirect_to user_board_path(@user, @board)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to user_board_path(@user, @board)
  end

  private
    def set_user
      @user = current_user
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
