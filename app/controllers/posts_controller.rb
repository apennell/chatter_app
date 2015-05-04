class PostsController < ApplicationController
  # ensure user is logged in before they can view anything in this control
  before_action :logged_in?
  before_action :find_user_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    render :index
  end

  def show
    id = params[:id]
    @post = Post.find(id)
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    new_post = params.require(:post).permit(:content)
    post = current_user.posts.create(new_post)
    redirect_to "/posts/#{post.id}"
  end

  def edit
    # id = params[:id]
    @post = current_user.posts.find(params[:id])
    render :edit
  end

  def update
    # post_id = params[:id]
    @post = current_user.posts.find(params[:id])

    # get updated data
    updated_attributes = params.require(:post).permit(:content)
    # update post
    @post.update_attributes(updated_attributes)

    redirect_to "/posts/#{post_id}"
  end

  def destroy
    # id = params[:id]
    @post = current_user.posts.find(params[:id])
    @post.destroy()
    redirect_to "/posts"
  end

  private

    def find_user_post
      @post = current_user.posts.find(params[:id])
        unless @article
          redirect_to "/posts"
    end
  end
end
