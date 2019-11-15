class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit,:show,:update,:destroy]
  before_action :authenticate_admin


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # binding.pry
      redirect_to admin_users_path
      flash[:notice] = "ユーザを更新しました"
    else
      render :edit
    end
  end

  def destroy
    if current_user != @user
      @user.destroy
      redirect_to admin_users_path
      flash[:notice] = "ユーザーを削除しました"
    else
      redirect_to admin_users_path
      flash[:notice] = "ユーザーを削除できません"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmatin,:admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authenticate_admin
    redirect_to root_url unless current_user.admin?
  end

end
