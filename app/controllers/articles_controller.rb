class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
   
  def index
    @article = Article.all
    @tags = Tag.all
    @profiles = Profile.all
    respond_to do |format|
      format.html
      format.rss { render :layout => false }
    end
    
    if params[:tag]
      @article = Article.tagged_with(params[:tag])
    else
      @article = Article.all
    end
  end

  def show
     himg_config(width: 720, height: 405, disable_fetch: false, base_url: "file:///home/kat/rubytest/blog/")
    @article = Article.friendly.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.friendly.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.friendly.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :icon, :tag_id)
    end
end
