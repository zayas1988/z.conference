class AccountsController < ApplicationController
  def new
    @account = Account.new
  end
  def create
    @acccount = Account.new(params[:account])
    if @account.save
      flash[:success] = "Account added"
      redirect_to main_path
    else
      render :adction => :new
    end
  end
  def edit
   	@account = Acccount.find(params[:id])
  end

  private
  def accounts_params
  	params.require(:account).permit(:name,:email,:account_id, :active)
  end

end
