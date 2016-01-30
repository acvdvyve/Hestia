class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def index
    @album = Album.all
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

if @album.update(album_params)
  redirect_to @album
else
  render :edit
end
  end

  private
  def album_params
    params.require(:album).permit(:id, :title)
  end

end
