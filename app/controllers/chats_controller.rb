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
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
    def chat_params
      params.require(:chat).permit(:comment)
    end
end
