class CallsController < ApplicationController
	def drop
		Call.find(params[:id]).drop
        redirect_to root_path
	end
end