class Api::V1::DestinationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    destination = Destination.new(destination_params)
    if destination.save
      render status: 200, json: {
        message: "Successfully created destination.",
        destination: destination
        }.to_json
    else
     render json: {erros: destination.errors},status: 422
    end

  end

  def update
    destination = Destination.find(params[:id])
    if destination.update(destination_params)
      render json: destination, status:200
    else
     render json: {erros: destination.errors},status: 422
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.destroy
    render status: 200, json: {
      message: "Successfully deleted destination.",
      destination: destination
      }.to_json
  end

  private

  def destination_params
    params.permit(:id, :name, :description)
  end

end