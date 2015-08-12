class Admin::SessionsController < AdminController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_fisheries_path
    else
      redirect_to admin_login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_login_path
  end

end
