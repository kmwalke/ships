class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :update, :destroy]

  # GET /ships
  def index
    @ships = Ship.all
    json_response(@ships)
  end

  # POST /ships
  def create
    @ship = Ship.create!(ship_params)
    json_response(@ship, :created)
  end

  # GET /ships/:id
  def show
    json_response(@ship)
  end

  # PUT /ships/:id
  def update
    @ship.update(ship_params)
    head :no_content
  end

  # DELETE /ships/:id
  def destroy
    @ship.destroy
    head :no_content
  end

  private

  def ship_params
    # whitelist params
    params.permit(:name, :color)
  end

  def set_ship
    @ship = Ship.find(params[:id])
  end
end
