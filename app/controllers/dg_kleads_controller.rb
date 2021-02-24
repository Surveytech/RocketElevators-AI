class DgKleadsController < ApplicationController
  before_action :set_dg_klead, only: %i[ show edit update destroy ]

  # GET /dg_kleads or /dg_kleads.json
  def index
    @dg_kleads = DgKlead.all
  end

  # GET /dg_kleads/1 or /dg_kleads/1.json
  def show
  end

  # GET /dg_kleads/new
  def new
    @dg_klead = DgKlead.new
  end

  # GET /dg_kleads/1/edit
  def edit
  end

  # POST /dg_kleads or /dg_kleads.json
  def create
    @dg_klead = DgKlead.new(dg_klead_params)

    respond_to do |format|
      if @dg_klead.save
        format.html { redirect_to @dg_klead, notice: "Dg klead was successfully created." }
        format.json { render :show, status: :created, location: @dg_klead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dg_klead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dg_kleads/1 or /dg_kleads/1.json
  def update
    respond_to do |format|
      if @dg_klead.update(dg_klead_params)
        format.html { redirect_to @dg_klead, notice: "Dg klead was successfully updated." }
        format.json { render :show, status: :ok, location: @dg_klead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dg_klead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dg_kleads/1 or /dg_kleads/1.json
  def destroy
    @dg_klead.destroy
    respond_to do |format|
      format.html { redirect_to dg_kleads_url, notice: "Dg klead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dg_klead
      @dg_klead = DgKlead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dg_klead_params
      params.require(:dg_klead).permit(:fullNameOfTheContact, :companyName, :email, :phone, :projectName, :projectDescription, :departmentInChargeOfTheElevators, :message, :attachedFileStoredAsABinaryFile, :dateOfTheContactRequest)
    end
end
