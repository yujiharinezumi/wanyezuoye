class UsersController < ApplicationController
  before_action :login_user, only: [:new]
  before_action :set_user, only:[:show]
  before_action :check_user,only:[:show]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
    # binding.pry
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def login_user
    if logged_in?
      redirect_to tasks_path
    end
  end

  def check_user
      if @user.id != current_user.id
        redirect_to tasks_path,notice:"権限がありません"
      end
  end

end
