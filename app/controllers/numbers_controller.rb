class NumbersController < ApplicationController
  def new
  	@number = Number.new
    @users = User.all
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
  def edit
   @number = Number.find(params[:id])
   @users = User.all
   #user.numbers.build
  end
  def update
     @users = User.all
     @number = Number.find(params[:id])
     if @number.update_attributes(number_params)
       flash[:success] = "Номер госпадина обновлен"
       redirect_to root_path()
      else
        render :action => :edit
      end
  end

  private
  def number_params
  	params.require(:number).permit(:num,:user_id, :active)
  end

end
