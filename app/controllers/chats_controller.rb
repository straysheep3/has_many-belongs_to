class ChatsController < ApplicationController
  def index

  end

  def show
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    @room = Room.find(params[:room_id])
    @chat = @room.chats.create(params[:chat].permit(:comment))
    if @chat.save
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  private
    def chat_params
      params.require(:chat).permit(:comment)
    end
end
