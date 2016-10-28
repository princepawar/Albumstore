module Api
  module V1
    class ArticlesController < ApplicationController
      respond_to :json

      def index
        respond_with Article.all
      end

      def show
        respond_with Article.find(params[:id])
      end

      def new
        respond_with Article.new
      end

      def edit
      end

      def create
        respond_with Article.create(params[:article])
        # @owner = Owner.find(params[:owner_id]) if params[:owner_id]
        # @article = @owner.article.new(article_params)
        # # @article = Article.new(params[:article])
        # if @article.save
        #   flash[:notice] = "article created successfully."
        # end
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

  end

end
