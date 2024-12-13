class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    @tags = Tag.new(tag_params)

    if @tags.save
      redirect_to @tags
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @tags = Tag.find(params[:id])
  end

  private
  def tag_params
      params.require(:tags).permit(:name)
  end

end
