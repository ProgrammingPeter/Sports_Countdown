class PostController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      # If save succeeds, redirect to the index action
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      # If update succeeds, redirect to the index action
      redirect_to(:action => 'show', :id => @post.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy 
    post = Post.find(params[:id]).destroy
  end


  private

    def post_params
      # same as using "params[:post]", except that it:
      # - raises an error if :post is not present
      # - allows listed attributes to be mass-assigned
      params.require(:post).permit(:title, :text)
    end


end
