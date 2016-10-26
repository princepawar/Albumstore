class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      flash[:notice] = "Successfully created."
      # redirect_to
    else
      render 'new'
    end
  end

  def update
    @album = Album.find(params[:id])
    @album.update_attributes(params[:album])
    if @album.update_attributes(params[:album])
      respond_with @album
      flash[:notice] = "successfully album updated"
    else
      render 'edit'
    end
  end

  def detroy
    @album = Album.find(params[:id])
    @album.destroy
    @id = @album.id
  end

  private

    def album_params
      params.require(:album).permit(:name)
    end
end
