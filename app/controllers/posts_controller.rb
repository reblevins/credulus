class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @posts = Post.search(params[:search]).order('created_at DESC')
    @posts = @posts.page(params[:page]).per(2)
    unless params[:tag].nil?
      @posts = @posts.tagged_with(params[:tag])
    end
  end

  def show
  end

  def new
  end

  def create
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end
  
  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
  
  def destroy
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end
end
