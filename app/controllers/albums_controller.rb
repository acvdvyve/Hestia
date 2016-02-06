class AlbumsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def new
    @album = Album.new
    authorize @album
  end

  def index
    @album = Album.all
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    authorize @album
    if @album.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    authorize @album
  end

  def edit
    @album = Album.find(params[:id])
    authorize @album
  end

  def update
    @album = Album.find(params[:id])
    authorize @album
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
