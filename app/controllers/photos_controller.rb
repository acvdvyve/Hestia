class PhotosController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  before_filter :set_album
  def index
    @photo = @album.photos.all
    authorize @photo
  end

  def show
    @photo = @album.photos.find params[:id]
    authorize @photo
  end

  def new
    @photo = @album.photos.new params[:photo]
    authorize @photo
  end

  def create
    @photo = @album.photos.new(photo_params)
    @photo.album = @album
    @photo.image = Pathname.new(@photo.path)
    authorize @photo
    if @photo.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @photo = @album.photos.find params[:id]
    authorize @photo
  end

  def update
    @photo = @album.photos.find params[:id]
    authorize @photo
    if @photo.update_attributes params[:photo]
      redirect_to @album
    else
      render :edit
    end
  end

  private
  def set_album
    @album = Album.find params[:album_id]
  end
  def photo_params
    params.require(:photo).permit(:file, :image, :name, :album_id)
  end
end
