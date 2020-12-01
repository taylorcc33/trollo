class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  
  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end
end
