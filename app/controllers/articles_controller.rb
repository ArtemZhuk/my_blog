class ArticlesController < ApplicationController
  before_action :authorize_user, only: [:create, :my, :destroy, :show]
  before_action :find_article, only:[:show, :edit,:update, :destroy]

 def index
    if params[:my]
      @name = "Мои статьи"
      @article = current_user.article.all
    elsif params[:all]
      @name = "Все статьи"
      @article = Article.all
    else
      @name = "Последние статьи"
      @article = Article.select(params[:id]).first(10).reverse
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(article_params.merge({user_id: current_user}))
    @article.user = current_user
    if @article.save
      flash["alert-succes"] = "Статья добавлена"
      redirect_to article_path(@article.id)
     else
      flash[:error] = 'Ошибка!'
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Статья удалена'
  end

  private

    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
end
