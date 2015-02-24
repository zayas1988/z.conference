class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :session_account
  def session_account
  	@session_account ||= Marchal.load(session[:account])
  end
  def set_session_account(account)
  	session[:account] = Marchal.dump(user)
  end
  set_session_account(Account.new)
  session_account.awesome = 'rad'
  session_account.save!
  private
  def current_account
    @_current_account ||= session[:current_account_id] &&
      Account.find_by_id(session[:current_account_id])
  end
end
