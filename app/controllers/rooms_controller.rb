class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @messages = Message.where(room_id: params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    # render plain: params[:room].inspect
    @room = Room.new(room_params)

    if @room.save
      flash[:notice] = "ルームの作成に成功しました"
      redirect_to room_path(@room)
    else
      flash.now[:alert] = "ルーム作成に失敗しました"
      render 'new'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def room_params
    params.require(:room).permit(:title, :text)
  end
end
