class PostsController < ApplicationController
  before_action :set_target_post, only: %i[show destroy]
  before_action :require_user_logged_in?

  def index
    @pagy, @posts = pagy(params[:category_id].present? ? Category.find(params[:category_id]).posts.order('id DESC') : Post.order('id DESC'))
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "「#{@post.title}」を作成しました"
      redirect_to @post
    else   
      flash.now[:danger] = '投稿できませんでした'
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "「#{@post.title}」を削除しました"
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :image, :category_id)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end
end
