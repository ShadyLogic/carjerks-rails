class UsersController < ApplicationController

  def new
    @user = User.new
    render 'register'
  end

  def create
    @user = User.new(username: params[:user][:username])
    @user.password = params[:user][:password]
    if @user.save!
      login_user(@user)
      # redirect to '/users/:id', their profile page
      # we have a route but no action in the controller for it.
      redirect_to(@user)
    else
      raise 'i forgot to handel the fdailurte caDSA'
    end
  end

  def logout
    p session.to_hash
    session.clear
    redirect_to '/'
  end

  def show
    @user = User.find_by(id: params[:id])
    @reports = @user.reports
    render 'show'
  end

end
