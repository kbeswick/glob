class PostsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :update, :edit, :destroy]

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created') }
        format.xml { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.user_id)

    respond_to do |format|
      format.html
      format.xml { render :xml => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml { head :ok }
    end
  end

end
