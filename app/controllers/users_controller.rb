class UsersController < ApplicationController

  def index
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      redirect_to "/login"
    end
  end

  def show
    @user = User.find(params[:id]);
  end

  def new
    @user = User.new
    render 'new.html.erb'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Card.all.each do |card|
        unless card.name == "back"
          MyCard.create(
                  user_id: @user.id,
                  card_id: card.id,
                  deck: true      
                  )
        end
      end
      session[:user_id] = @user.id
      flash[:success] = 'Successfully created account!'

      redirect_to "/users/#{session[:user_id]}"
      
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation)
  end

end
