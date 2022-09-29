class SpicesController < ApplicationController
    # index spices
    def index
        spices = Spice.all 
        render json: spices
    end

    # show spices 
    def show
        spice = Spice.find_by(id: params[:id])
        if spice
            render json: spice
        else 
            render json: {error: "No spice found"}, status: :not_found
        end 
    end 

    # post spices

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end 

    #patch spices 

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else
            render json: {error: "No spice found"}, status: :not_found
        end 
    end

    #delete spices

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else 
            render json: {error: "No spice found"}, status: :not_found
        end 
    end 

    private 
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end 
end
