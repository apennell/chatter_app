class PostsController < ApplicationController
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
    new_post = params.require(:post).permit(:user, :content)
    post = Post.create(new_post)
    redirect_to "/posts/#{post.id}"
  end

  def edit
    id = params[:id]
    @post = Post.find(id)
    render :edit
  end

  def update
    post_id = params[:id]
    post = Post.find(post_id)

    # get updated data
    updated_attributes = params.require(:post).permit(:content)
    # update post
    post.update_attributes(updated_attributes)

    redirect_to "/posts/#{post_id}"
  end
end
