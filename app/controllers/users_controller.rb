class UsersController < ApplicationController
  before_action :require_user_logged_in?, only: %i[show edit likes]
  before_action :correct_user_page, only: %i[edit likes]
  before_action :set_target_user, only: %i[show edit update likes]

  def show
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザー登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールを編集しました'
      redirect_to @user
    else
      render :edit
    end
  end

  def likes
    @posts = @user.posts
    @like_posts = @user.like_posts
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :profile)
  end

  def set_target_user
    @user = User.find(params[:id])
  end

  def correct_user_page
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
