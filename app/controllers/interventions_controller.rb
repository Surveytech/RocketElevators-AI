class InterventionsController < ApplicationController
    # authorize_resource

    def index   
        @customers = Customer.all   
    end

    def get_customers
        @customers = Customer.all
    end

    def get_buildings
        if params[:customer].present?
            @buildings = Customer.find(params[:customer]).buildings
        else
            @buildings = Building.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {buildings: @buildings}
                }
            end
        end
    end

    def get_batteries
        if params[:building].present?
            @batteries = Building.find(params[:building]).batteries
        else
            @batteries = Battery.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {batteries: @batteries}
                }
            end
        end
    end
    
    def get_columns
        if params[:battery].present?
            @columns = Battery.find(params[:battery]).columns
        else
            @columns = Column.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {columns: @columns}
                }
            end
        end
    end
end
