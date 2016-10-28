class ArticlesController < ApplicationController


  def index
    @articles = Article.all
    # respond_to do |format|
    #   format.html
    #   format.json { render json: @articles }
    # end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @owner = Owner.find(params[:owner_id]) if params[:owner_id]
    @article = @owner.article.new(article_params)
    # @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "article created successfully."
    end
  end

  def update
  end

  def destroy
  end


  private

  def article_params
    params.require(:article).permit(:name, :description, :price)
  end
end
