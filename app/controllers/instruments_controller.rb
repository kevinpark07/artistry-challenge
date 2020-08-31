class InstrumentsController < ApplicationController
    before_action :find_instrument, except: [:index, :new, :create]

    def index
        @instruments = Instrument.all
    end

    def show
    end

    def new
        @instrument = Instrument.new
    end

    def create
        @instrument = Instrument.create(instrument_params)
        
        if @instrument.valid?
            redirect_to instrument_path(@instrument)
        else
            flash[:errors] = @instrument.errors.full_messages
            redirect_to new_instrument_path
        end 
    end

    def edit
    end

    def update
        if @instrument.update(instrument_params)
            redirect_to instrument_path(@instrument)
        else
            flash[:errors] = @instrument.errors.full_messages
            redirect_to edit_instrument_path(@instrument)
        end
    end

    def destroy
        @instrument.destroy
        redirect_to instruments_path
    end

    private

    def instrument_params
        params.require(:instrument).permit(:name, :classification)
    end

    def find_instrument
        @instrument = Instrument.find(params[:id])
    end

end
