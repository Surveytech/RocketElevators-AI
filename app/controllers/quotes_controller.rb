class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]

  # GET /quotes or /quotes.json
  def index
    @quotes = Quote.all
    @quotesList = Quote.where(user_id: current_user.id)
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)
    @quote.user_id = current_user.id
    @quote.save!
    respond_to do |format|
      if @quote
        format.html { redirect_to @quote, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: "quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:name, :company_name, :number_of_apartments, :number_of_floors, :number_of_basements, :number_of_companies, :number_of_parking_spots, :number_of_elevators, :number_of_corporations, :maximum_occupancy, :business_hours, :building_type, :product_line, :elevator_unit_price, :elevator_total_price, :installation_price, :total_price)
    end



    #  def quote21_params
    #   params.require(:quote, :name, :building_type, :product_line, :elevator_unit_price, :elevator_total_price, :installation_price, :total_price)
# .permit(
# :number_of_apartments,
# :floors,
# :basements,
# :companies,
# :parkings,
# :elevators,
# :corporation,
# :occupants,
# :hours
    #   )
    # end



end
