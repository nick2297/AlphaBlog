class ArticlesController < ApplicationController

  def index

    @articles = Article.all

  end

  def new

    @article = Article.new

  end

  def edit

    @article = Article.find(params[:id])

  end

  def create 

    #render plain: params[:article].inspect --> will shows us our data
    @article = Article.new(article_params)  #creates a new article with the attributes gotten from the HTML form via the params hash
    if @article.save
      flash[:notice] = "Article was created"
      redirect_to article_path(@article)
    else
      render :new
    end

  end

  def update

    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Update succesful"
      redirect_to article_path(@article)
    else
      render :edit
    end

  end

  def show

    @article = Article.find(params[:id])

  end

  def destroy 

    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to article_path

  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end