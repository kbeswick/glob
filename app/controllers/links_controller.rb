class LinksController < ApplicationController
  def index
    @links = Link.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @links }
    end
  end

  def new
    @link = Link.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @link }
    end
  end

  def create
    @link = Link.new(params[:link])
    @link.user_id = current_user.id
    
    respond_to do |format|
      if @link.save
        format.html { redirect_to(@link, :notice => 'Link was successfully created') }
        format.xml { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @link }
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to(@link, :notice => 'Link was successfully updated') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(links_url) }
      format.xml { head :ok }
    end
  end


end
