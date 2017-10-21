class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :update, :destroy]

  # GET /components
  def index
    if params[:ship_id]
      @components = Ship.find(params[:ship_id]).components
    else
      @components = Component.all
    end
    # json_response(params)
    json_response(@components)
  end

  # POST /components
  def create
    @component = Component.create!(component_params)
    json_response(@component, :created)
  end

  # GET /components/:id
  def show
    json_response(@component)
  end

  # PUT /components/:id
  def update
    @component.update(component_params)
    head :no_content
  end

  # DELETE /components/:id
  def destroy
    @component.destroy
    head :no_content
  end

  private

  def component_params
    # whitelist params
    params.permit(:name, :affect)
  end

  def set_component
    @component = Component.find(params[:id])
  end
end
