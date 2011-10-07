class CatwalksController < ApplicationController
  def new
    @catwalk=Catwalk.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catwalk }
    end
  

  def create
    @catwalk=Catwalk.new(params[:catwalk])
    respond_to do |format|
      if @catwalk.save
      format.html {redirect_to (@catwalk)}# new.html.erb
      format.xml  { render :xml => @catwalk }
    else
      format.html {render :action => "new"}# new.html.erb
      format.xml  { render :xml => @catwalk.errors, :status => :unprocessable_entity }
      
    end
  end

  def show
    @catwalk=Catwalk.find(params[:id])
    respond_to do |format|
      format.html # sho.html.erb
      format.xml  { render :xml => @catwalk }
    end
  end

  def destroy
  end

end
