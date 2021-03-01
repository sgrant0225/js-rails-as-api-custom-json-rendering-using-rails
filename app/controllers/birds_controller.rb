class BirdsController < ApplicationController
  # def index
  #   birds = Bird.all
  #   render json: birds
  # end

  def index #we can add in the only: option directly after listing an object we want to render to JSON:
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    #render json: birds, except: [:created_at, :updated_at] # we can exclude specific info that we dont want show or render
  end 

  # def show 
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species }
  # end 
  
  # def show #2nd example
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species) 
  #   #Rather than having to spell out each key, the Hash slice method 
  #   #returns a new hash with only the keys that are passed into slice
  #   #Returns a hash containing only the given keys and their values.
  # end 

  def show 
    bird = Bird.find_by(id: params[:id])
    if bird #true #if found
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else #nil #not found
      render json: { message: 'Bird not found' }
    end
  end   
end

#Reminder: No need for instance variables anymore, since we're immediately > rendering birds 
#and bird to JSON and are not going to be using ERB.