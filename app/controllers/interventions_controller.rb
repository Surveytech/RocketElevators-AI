class InterventionsController < ApplicationController
    # authorize_resource

    def index   
        @customers = Customer.all  
        @intervention = Intervention.new 
    end

    def get_customers
        @customers = Customer.all
    end

    def create 
        
    end

    def get_buildings
        if params[:customer].present?
            if (params[:building] != "None")
                @buildings = Customer.find(params[:customer]).buildings
            else 
                @buildings = []
            end
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
            if (params[:building] != "None")
                @batteries = Building.find(params[:building]).batteries
            else 
                @batteries = []
            end
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
            if (params[:battery] != "None")
                @columns = Battery.find(params[:battery]).columns
            else 
                @columns = []
            end
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

    def get_elevators
        if params[:column].present?
            if (params[:column] != "None")
                @elevators = Column.find(params[:column]).elevators
            else 
                @elevators = []
            end
        else
            @elevators = Elevator.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {elevators: @elevators}
                }
            end
        end
    end
end
