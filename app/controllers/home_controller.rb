class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
    @links = Link.order("created_at DESC")

    respond_to do |format|
      format.html
    end
  end

end
