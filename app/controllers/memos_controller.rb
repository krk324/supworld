class MemosController < ApplicationController

  before_action :set_city


  def new
    @memo = Memo.new
  end

  def create
    @memo = @city.memos.new(memo_params)
    @memo.user_id = current_user.id

    if @memo.save
      redirect_to @city
    else
      flash.now[:alert] = @comment.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:memo)
  end

  def set_city
    @city = City.find(params[:city_id])
  end

end
