class UserController < ApplicationController
  def new
  end
  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
end
