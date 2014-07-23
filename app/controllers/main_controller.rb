class MainController < ApplicationController
  def new
  end
  def index
    @users= User.all
    @numbers= Number.all
    @calls = Call.all
    #@conference = Array.new
    @user = User.new
    @number = Number.new
    2.times { @user.numbers.build}
    @meet = Meet.first
  end
  def makeconf
  	@users.ea
  end
end
