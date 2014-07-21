class MainController < ApplicationController
  def new
  end
  def index
    @users= User.all
    @numbers= Number.all
    #@conference = Array.new
    @user = User.new
    @number = Number.new
    2.times { @user.numbers.build}
  end
  def makeconf
  	@users.ea
  end
end
