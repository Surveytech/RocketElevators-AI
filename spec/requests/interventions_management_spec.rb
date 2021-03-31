require "rails_helper"


RSpec.describe "Interventions management", :type => :request do

    it "creates an intervention and redirects to the index" do

        post "/interventions", :params => { :intervention => {:author => 1, :employee_id => 1, :customer_id => 1} }
        expect(response).to have_http_status(302)
        # flash[:notice].should eql("Intervention was successfully created.")
        # expect(flash[:notice]).to eql("Intervention was successfully created.")

        follow_redirect!
        
        expect(response).to have_http_status(:success)
    end

end