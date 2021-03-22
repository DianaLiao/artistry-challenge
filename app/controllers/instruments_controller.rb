class InstrumentsController < ApplicationController

  def index
    @instruments = Instrument.all.order(:name)
  end

end
