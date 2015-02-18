class ConferencesController < ApplicationController
  def new
  	@conference = Conference.new
  end
end
