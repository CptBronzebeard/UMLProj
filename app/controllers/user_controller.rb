class UserController < ApplicationController
  def new
  end
  def create
    user = User.new(name: params[:name], email: params[:email], password_digest: params[:password])
    if user.save
      session[:user_id]=user.id
      flash[:success]="Success"
      redirect_to '/'
    else
      flash[:warning]="Warn"
      render :new
    end
end
end
