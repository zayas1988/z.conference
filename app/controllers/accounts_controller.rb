class AccountsController < ApplicationController
  def new
  @account = Account.new
  end
  def create
  	@account = Account.new(params[:account])
  	if @account.save
  	  flash[:success] = "Account added"
  	  redirect_to main_path
  	else
  		 render :adction => :new
    end
  end
  def edit
   	@account = Account.find(params[:id])
  end
  def index
    @accounts = Account.all
#    @users= User.all
#    @numbers= Number.all
#    @calls = Call.all
    #@conference = Array.new
#    @user = User.new
#    @number = Number.new
#    2.times { @user.numbers.build}
#    @meet = Meet.first
  end

  def update
  	@account = Account.find(params[:id])
    
    if @account.update_attributes(account_params)
      #(params[:account])
    #  if @dhcpserver.lock = true
    #    @tftps = Tftp.all
    #    @dhcpserver.generate_config
    #    @dhcpserver.update_attributes(params[lock=false])
    #    flash[:success] = "Reconfigure OK"
    #    redirect_to main_path
    #  else
      
        flash[:success] = "Account updated"
        redirect_to accounts_path
    #  end
    else
      render :action => :edit
    end
  end
  def destroy
  	Account.find(params[:id]).destroy
  	flash[:success] = "Account deleted"
  	redirect_to main_path
  end

  private
  def account_params
  	params.require(:account).permit(:name,:email, conferences_attributes: [:id, :num, :account_id])
  end
  

end
