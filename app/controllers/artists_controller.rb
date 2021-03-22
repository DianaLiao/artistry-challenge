class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order(:name)
  end

  def show
    set_artist
  end

  def new
    @artist = Artist.new
    @errors = flash[:errors]
  end

  def create
    @artist = Artist.create(artist_params)

    if @artist.valid?
      redirect_to artist_path(@artist.id)
    else
      flash[:errors] = @artist.errors.full_messages
      redirect_to new_artist_path
    end
  end


  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :title, :age)
  end

end
