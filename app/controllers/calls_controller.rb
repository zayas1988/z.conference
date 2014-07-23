class CallsController < ApplicationController
	def drop
	@call = Call.find(params[:id])
	@call.drop
        redirect_to root_path
        flash[:success] = "Вызов прекращен #{@call.raw}"
        @call.destroy
	end
end
