class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def oquequero
    @variavelteste = "mandar esta variavel para o userHTML" 
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      
      log_in @user #loggar mal criamos o user

      
      flash[:success] = "Welcome to the Sample App!"  
      # Handle a successful save. 
      redirect_to @user #ou redirect_to user_url(@user)
    
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
