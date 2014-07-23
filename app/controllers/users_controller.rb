class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Господин успешно добавлен"
  		redirect_to root_path
  	else
    	#flash[:error]= "Алярм! что то не то!!!"
    	redirect_to root_path
    end
  end
  def update
   @user = User.find(params[:id])
   #@user.number = Number.new
   if @user.update_attributes(user_params)
      flash[:success] = "Госпадин обновлен"
      redirect_to root_path
    else
     #render :action => :edit
      redirect_to root_path
    end
  end
  def edit
    @user = User.find(params[:id])
    #user.numbers.build
  end
  def call
    redirect_to root_path
  end

  private
  def user_params
  	params.require(:user).permit( :name, numbers_attributes: [:id, :user_id, :num, :active])
  end

end
