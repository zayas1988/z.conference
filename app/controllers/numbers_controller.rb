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
  def destroy
     @users = User.all
     @number = Number.find(params[:id])
     @number.destroy
     flash[:success] = "�^�оме�^� го�^�падина обновлен"
     redirect_to root_path()
     
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
  def setactive
    @number = Number.find(params[:id])
    @numbers = Number.all
    @numbers.each do |number|
      if number.user_id == @number.user_id then
        @num = Number.find_by_id(number.id)
        if number.id == @number.id then
          if @number.active == true then
            @num.update_attribute("active", false)
          else
            @num.update_attribute("active", true)
          end
          
        else
          @num.update_attribute("active", false)
          
        end
      end
    end
    redirect_to root_path()
  end

  private
  def number_params
  	params.require(:number).permit(:num,:user_id, :active)
  end

end
