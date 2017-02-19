class UsersController < ApplicationController

  def index
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to "/login"
    end
  end

  def show
    @user = current_user
  end

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

end
