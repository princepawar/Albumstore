class ImagesController < ApplicationController
  before_filter :set_album

  def index
    @images = @album.images.all
  end

  def show
    @image = @album.images.find(params[:id])
  end

  def new
    @image = @album.images.new
  end

  def edit
  end

  def create

    @image = @album.images.new(image_params)

    @image.album = @album
    if @image.save
      flash[:notice] = "Successfully added image!"
      redirect_to [@album, :images]
    else
      render :new
      flash[:notice] = "Did not successfully add image :("
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_album
    @album = Album.find(params[:album_id])
  end

  def image_params
    params.require(:image).permit(:avatar)
  end

end
