class PostsController < ApplicationController
  
  # http_basic_authenticate_with name: "andresvicen@yopmail.com", password: "saxosaxo", except: [:index, :show]
  before_filter :authorize_blogger!, :except => [:index, :show, :search]
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
 
  def create
    @post = Post.new(params[:post].permit(:title, :text))
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
  end
  
  def update
    @post = Post.find(params[:id])
   
    if @post.update(params[:post].permit(:title, :text))
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
  
  def search
    @post = Post.new
  end
  
  def find
    @post = Post.find(2)
  end
 
private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  
end
