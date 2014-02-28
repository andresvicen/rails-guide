class PostsController < ApplicationController
  
  before_filter :authorize_blogger!
  
  def new
    @post = Post.new
  end
  
  def index
    title = params[:title]
    if title.blank?
      @posts = Post.all
      @title_filter = ''
    else
      @posts = Post.search_by_title(title)
      @title_filter = title
    end
    
  end
 
  def create
    @post = Post.new(post_params)
    @post.user = current_user;
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to @post
    end
  end
  
  def update
    @post = Post.find(params[:id])
   
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
   
    redirect_to posts_path
  end
 
private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  
end
