class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :name, :is_best_seller], methods: [:summary]
    # methods: from cheese model
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
  # error message when rendering json data
  if cheese
    render json: cheese, exept: [:created_at, :updated_at]
  else
    render json: {error:"Cheese not found!"}, status: :not_found
  end
  end

end
