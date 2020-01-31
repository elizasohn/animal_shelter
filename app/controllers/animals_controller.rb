class AnimalsController < ApplicationController

    def index
        @animals = Animal.all
        json_response(@animals)
    end

    def show
        @animal = Animal.find(params[:id])
        json_response(@animal)
    end

    def create
        @animal = Animal.create!(animal_params)
        json_response(@animal, 201)
    end

    def update
        @animal = Animal.find(params[:id])
        if @animal.update!(animal_params)
            render status: 200, json: {
                message: "This animal has been updated successfully."
            }
        end
    end

    def destroy
        @animal = Animal.find(params[:id])
        if @animal.destroy!
            render status: 200, json: {
                message: "This animal has been destroyed."
            }
        end
    end

    def random
      @animal = Animal.find(rand(40))
      json_response(@animal)
    end 

    private

    def animal_params
        params.permit(:name, :kind, :breed, :age)
    end

    def json_response(object, status = :ok)
      render json: object, status: status
    end
end
