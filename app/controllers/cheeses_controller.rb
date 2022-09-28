class CheesesController < ApplicationController

  # GET /cheeses using the only: serialization option
  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :name, :price, :is_best_seller]
  end

  # GET /cheeses using the except: serialization option
  def index
    cheeses = Cheese.all
    render json: cheeses, except: [:created_at, :updated_at]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    render json: {
      id: cheese.id,
      name: cheese.name,
      price: cheese.price,
      is_best_seller: cheese.is_best_seller
    }
  end

  # GET /cheese using the methods option
  def show
    cheese = Cheese.find_by(id: params[:id])
    render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
  end

  # Using the nil false-y value to write our own error messaging
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
      # status: :will produce a 404 code
      render json: { error: 'Cheese not found' }, status: :not_found
    end
  end

end
