class LoginController < ApplicationController
  def create
    if account = Account.authenticate(params[:email], params[:password])
      # Сохраняем ID пользователя в сессии, так что он может быть использован
      # в последующих запросах
      session[:current_account_id] = account.id
      redirect_to root_url
    end
  end
  def destroy
    # Убираем id пользователя из сессии
    @_current_account = session[:current_account_id] = nil
    flash[:notice] = "Выход выполнен успешно"
    redirect_to root_url
  end
end
