require 'zendesk_api'
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

    if(lead_params[:file].present?)
      file = lead_params[:file]

      filename = file.original_filename
      filedata = file.read
      filetype = file.content_type

      @lead = Lead.new(lead_params.except(:file))
      @lead.file_data = filedata
      @lead.file_name = filename
      @lead.file_type = filetype
      @lead.save
    else
      @lead = Lead.new(lead_params.except(:file))
      @lead.save
    end

    respond_to do |format|
      if @lead.save
        createTicket()
        SendGridMailer.send_signup_email(@lead).deliver
        format.html  { redirect_to "/", notice: 'Thank You!' }

      end
    end
  end

  def createTicket()
    client = ZendeskAPI::Client.new do |config|
        config.url = ENV['ZENDESK_URL']
        config.username = ENV['ZENDESK_EMAIL']
        config.token = ENV['ZENDESK_API']
      end

      ZendeskAPI::Ticket.create!(client,
        :subject => "#{@lead.full_name} from #{@lead.company_name}",
        :comment => { :value =>
          "The contact #{@lead.full_name} from company #{@lead.company_name} can be reached at email  #{@lead.email} and at phone number #{@lead.phone}.
          #{@lead.department_in_charge_of_the_elevators} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators.
          #{@lead.project_description}
          Attached Message: #{@lead.message}
          The Contact uploaded an attachment" },
        :type => "question",
        :priority => "normal")
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
