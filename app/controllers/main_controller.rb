class MainController < ApplicationController
  def new
  end
  def index
    @users= User.all
    @numbers= Number.all
    @conference = Array.new
  end
  def makeconf
  	@users.ea
  end
end
