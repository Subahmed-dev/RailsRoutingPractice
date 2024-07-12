class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  #this will find the post id for these particular actions itself
  
  def index
    @posts = Post.all.order("created_at DESC") #by default field is created at evrey table 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post  #redirect to @post show page (see routes)
    else
      puts @post.errors.full_messages
      redirect_to @post
    end
  end


  def show #have to make erb file in views 
    # @post = Post.find(params[:id])
    # now this is done in controller action
  end


  def edit
  end 

  def update
    # @post = Post.find(params[:id]) this adds repetition nin code so make before action 
    if @post.update(post_params)  
      redirect_to @post
    else
      render 'new'
    end
    
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end


  private 

  def find_post
    @post = Post.find(params[:id])
    
  end

  def post_params
    params.require(:post).permit(:title, :body)  #by this these attributes are saved
  end



end
