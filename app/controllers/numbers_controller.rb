class NumbersController < ApplicationController
  def new
  	@number = Number.new
  end
  def create
  	@number = Number.new(number_params)
  	if @number.save
  		flash[:success] = "Телефон господина успешно добавлен"
  		redirect_to root_path
  	else
    	flash[:error]= "Алярм! что то не то!!!"
    	redirect_to root_path
    end
  end
  private
  def number_params
  	params.require(:number).permit(:num,:user_id)
  end

end
