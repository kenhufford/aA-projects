class PostsController < ApplicationController
  before_action :require_current_user
  def new
    # debugger
    @subs = Sub.all
    @post = Post.new
    render :new
  end

  def create

    @post = Post.new(post_params)
    @post.author_id = current_user.id  
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id == @post.author_id 
      render :edit  
    else
      flash[:errors]=['Only the author can edit the post']
      redirect_to post_url(@post)
    end
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.author_id 
      @post.destroy 
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors]=['Only the author can delete the post']
      redirect_to post_url(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
  end
end
