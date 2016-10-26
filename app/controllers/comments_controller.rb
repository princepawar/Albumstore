class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])

  end

  def new
    @Comment = Comment.new
  end

  def edit
  end

  def create
    @image = Image.find(params[:image_id]) if params[:image_id]
    @comment = @image.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "successfully created comment"
      redirect_to :back
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.present?
      @comment.destroy
      flash[:success] = "comment deleted succcefully"
    end
    redirect_to root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
