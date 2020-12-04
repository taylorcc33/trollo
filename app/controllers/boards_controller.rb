class BoardsController < ApplicationController
  before_action :set_user
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  
  def index
    @boards = @user.boards
  end

  def show
    @lists = @board.lists
  end

  def new
    @board = @user.boards.new
  end
  
  def create
    @board = @user.boards.new(board_params)

    if @board.save
      redirect_to [@user, @board]

    else
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to [@user, @board]
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:name)
    end
end
