class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.alphabetical.paginate(:page => params[:page]).per_page(10)
  end


  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end


  def edit
    @article = Article.find(params[:id])
  end


  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to article_path(@article)
    else
      render :action => "new"
    end
  end


  def update
    if @article.update_attributes(article_params)
      flash[:notice] = 'Article was successfully updated.'
      redirect_to article_path(@article)
    else
      render :action => "edit"
    end
  end


  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :category_id, :active)
    end
end
