class SessionsController < ApplicationController
  def new
 end
def create
 user = User.find_by(email: params[:email])
 if user && user.authenticate(params[:password])
  session[:user_id] = user.id
  flash[:success] = 'Successfully Logged In!'
  tmp = Order.find_by(user_id:user.id,state:0)
  #byebug
  if !tmp.nil?
    tmp1=Order.find_by(id:cookies[:cart])
    #byebug
      if !tmp1.nil?
        tmp1.destroy
      end
    cookies[:cart]=tmp.id
  else
    tmp=Order.find_by(id:cookies[:cart])
      if !tmp.nil?
        tmp.user_id=user.id
        tmp.save
      end
  end
  redirect_to '/'
 else
  flash[:alert] = 'Invalid Username or Password'
  redirect_to '/login'
 end
end
 def destroy
  session[:user_id] = nil
  cookies[:cart]=nil
  flash[:success] = 'Successfully Logged Out!'
  redirect_to '/login'
 end
end
