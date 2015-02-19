class ConferencesController < ApplicationController
  def new
    @conference = Conference.new
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
    private
    def account_params
  	  params.require(:conference).permit(:num,:account_ids, account_attributes: [:conference_id, :account_id])
    end
end
