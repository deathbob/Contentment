class ContentsController < ApplicationController
	
  def index
    @contents = Content.order("tipe ASC, position ASC")
    respond_to do |format|
      format.html 
    end
  end

  def show
    @content = Content.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @content = Content.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def create
    @content = Content.new(params[:content])
    respond_to do |format|
      if @content.save
        format.html { redirect_to edit_content_path(@content.id), :notice =>  'Content was successfully created.'  }
      else
        format.html { redirect_to new_content_path, :notice => "There was a problem creating that content" + @content.errors.full_messages.join(', ') }
      end
    end
  end

  def update
    @content = Content.find(params[:id])
    @content.update_attributes(params[:content])
    respond_to do |format|
      if @content.save
        format.html { redirect_to edit_content_path(@content.id), :notice =>  'Content was successfully updated.'  }
      else
        format.html { redirect_to new_content_path, :notice => "There was a problem updating that content" + @content.errors.full_messages.join(', ') }
      end
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    respond_to do |format|
      format.html { redirect_to(contents_url) }
    end
  end
  
end
