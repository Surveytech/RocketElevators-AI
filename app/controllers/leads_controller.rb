class LeadsController < ApplicationController

  def index
    @leads = Lead.all
  end

  def show
  end

  def new
    @lead = Lead.new
  end

  def edit
  end


  def create
    file = lead_params[:file]

    filename = file.original_filename
    filedata = file.read

    @lead = Lead.new(lead_params.except(:file))
    @lead.file_data = filedata
    @lead.file_name = filename
    @lead.save


  end



  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(
        :full_name,
        :company_name,
        :email,
        :phone,
        :project_name,
        :project_description,
        :department_in_charge_of_the_elevators,
        :message,
        :file_name,
        :file_type,
        :file_data,
        :created_at,
        :updated_at,
        :file
      )
    end
end
