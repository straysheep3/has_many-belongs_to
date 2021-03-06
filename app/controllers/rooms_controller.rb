class RoomsController < ApplicationController
  before_action :find_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all.order("created_at DESC")
  end

  def show
    
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room
    else
      render "new"
    end
  end

  def edit
    #code
  end

  def update
    if @room.save
      redirect_to @room
    else
      render "edit"
    end
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end

  private
    def room_params
      params.require(:room).permit(:title, :description)
    end

    def find_room
      @room = Room.find(params[:id])
    end
end
