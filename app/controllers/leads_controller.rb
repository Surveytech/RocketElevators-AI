require 'zendesk_api'
require "google/cloud/vision"
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
    @badimg = false
    image_annotator = Google::Cloud::Vision.image_annotator
    if(lead_params[:file].present?)
      @file = lead_params[:file]
      if (@file.content_type.to_s.include? "image/" )
        response = image_annotator.safe_search_detection image: @file.tempfile

        response.responses.each do |res|
          safe_search = res.safe_search_annotation

          if(safe_search.adult.to_s == "VERY_LIKELY" || safe_search.racy.to_s == "VERY_LIKELY" || safe_search.violence.to_s == "VERY_LIKELY")
            @badimg = true
          end
        end
      end

      if(@badimg != true)
        filename = @file.original_filename
        filedata = @file.read
        filetype = @file.content_type
        @lead = Lead.new(lead_params.except(:file))
        @lead.file_data = filedata
        @lead.file_name = filename
        @lead.file_type = filetype
        @lead.save
      end

    else
      @lead = Lead.new(lead_params.except(:file))
      @lead.save
    end


    respond_to do |format|
      if verify_recaptcha(model: @lead) && @lead.save
        createTicket()
        SendGridMailer.send_signup_email(@lead).deliver
        format.html  { redirect_to "/", notice: 'Thank You!' }
      elsif (@badimg == true)
        format.html  { redirect_to "/", notice: "Sorry the file didn't pass our requirements." }
      else
        format.html  { redirect_to "/", notice: "Sorry the file didn't pass our requirements." }
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
