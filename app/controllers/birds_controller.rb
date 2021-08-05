class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # line of code below is the opposite way of doing the same thing as above
    # render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
    # this line below does the same thing as the one on line 12, works well for a single hash, but won't work for an array of hashes
    # render json: bird.slice(:id, :name, :species)
  end
end