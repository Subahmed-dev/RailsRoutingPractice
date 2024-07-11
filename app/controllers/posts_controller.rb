class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create_post
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post  #redirect to @post show page (see routes)
    else
      render 'new'
    end
  end


  def show #make erb file in views
    
  end

  private 

  def post_params
    params.require(:post).permit(:title, :body)  #by this these attributes are saved
  end

end
