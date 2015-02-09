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
  def update
  	@account = Account.find(params[:id])
    
    #if @account.update_attributes(params[:account])
    #  if @dhcpserver.lock = true
    #    @tftps = Tftp.all
    #    @dhcpserver.generate_config
    #    @dhcpserver.update_attributes(params[lock=false])
    #    flash[:success] = "Reconfigure OK"
    #    redirect_to main_path
    #  else
      
        flash[:success] = "Account updated"
        redirect_to main_path
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
end
