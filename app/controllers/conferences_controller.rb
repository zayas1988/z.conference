class ConferencesController < ApplicationController
  def new
    @conference = Conference.new
  end
  def create
  	@conference = Conference.new(conference_params)
  	if @conference.save
  	  flash[:success] = "Conference added"
  	  redirect_to root_path
  	else
  		 render :action => :new
    end
  end
  def update
  	@conference = Conference.find(params[:id])
    
    if @conference.update_attributes(conference_params)
      #(params[:account])
    #  if @dhcpserver.lock = true
    #    @tftps = Tftp.all
    #    @dhcpserver.generate_config
    #    @dhcpserver.update_attributes(params[lock=false])
    #    flash[:success] = "Reconfigure OK"
    #    redirect_to main_path
    #  else
      
        flash[:success] = "Account updated"
        redirect_to conferences_path
    #  end
    else
      render :action => :edit
    end
  end
  def index
      @conferences = Conference.all
    end
    def conf
      @conference = Conference.find(params[:id])
      @users= @conference.users
      #@numbers= @users.numbers.all
      @calls = Call.all
      #@conference = Array.new
      @user = User.new
      @number = Number.new
      2.times { @user.numbers.build}
      @meet = Meet.first
    end
    def destroy
      Conference.find(params[:id]).destroy
      flash[:success] = "Conference deleted"
      redirect_to root_path
    end
    def edit
      @conference = Conference.find(params[:id])
    end
    private
    def conference_params
  	  params.require(:conference).permit( :num, account_ids: [], user_ids: [] )
    end
end
