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

  def process_photos
    @album = Album.find(params[:id])

    file_list = Dir.glob.join(@album.path, "*.{jpg,jpeg,JPG}") # Vind alle JPEG files in de directory
    file_list.sort! # Sorteren op alfabet (maw volgens de 'juiste' volgorde van de foto's)
    render html: '<b> <%=basename%> <b/>'.html_safe

    total = file_list.length
        file_list.each do |file|
        basename = File.basename(file)
        @album.photos.create(:photo => basename)
        end
  end

end

private
def album_params
  params.require(:album).permit(:id, :name, :title)
end

end
