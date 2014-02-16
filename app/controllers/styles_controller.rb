class StylesController < ApplicationController
  before_action :set_style, only: [:show]


  # GET /breweries
  # GET /breweries.json
  def index
    @styles = Style.all
  end

  # GET /breweries/1
  # GET /breweries/1.json
  def show
    @style = Style.find(params[:id])
  end

  # GET /breweries/new
  def new
  end

  # GET /breweries/1/edit
  def edit
  end

  # POST /breweries
  # POST /breweries.json
  def create
  end

  # PATCH/PUT /breweries/1
  # PATCH/PUT /breweries/1.json
  def update
  end

  # DELETE /breweries/1
  # DELETE /breweries/1.json
  def destroy
  end

  private

  def set_style
    @style = Style.find(params[:id])
  end
end
