class ArtistInstrumentsController < ApplicationController

  def new
    @relationship = ArtistInstrument.new
    @errors = flash[:errors]
  end

  def create
    @relationship = ArtistInstrument.new(ai_params)

    if @relationship.valid?
      @relationship.save
      redirect_to artist_path(@relationship.artist_id)
    else
      flash[:errors] = @relationship.errors.full_messages
      redirect_to new_artist_instrument_path
    end

  end

  private

  def ai_params
    params.require(:artist_instrument).permit(:artist_id, :instrument_id)
  end





end
