class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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
      flash.now[:alert] = @memo.errors.full_messages.join(', ')
      render :new
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy

    redirect_to @city, notice: "You have deleted the memo"
  end

  private

  def memo_params
    params.require(:memo).permit(:memo)
  end

  def set_city
    @city = City.find(params[:city_id])
  end

end
