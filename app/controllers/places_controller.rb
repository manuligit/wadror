class PlacesController < ApplicationController
  before_action :places_params, only: [:show]

  def index
  end

  def show

    ##kovakoodataan, korjataan viikon lopuksi jos keretään ":D":
    api_key = "957c1617fea569179866595a11eeb265"
    url ="http://beermapping.com/webservice/locquery/#{api_key}/"
    response = HTTParty.get "#{url}#{params[:id]}"

    @name = response.parsed_response["bmp_locations"]["location"]["name"]
    @street = response.parsed_response["bmp_locations"]["location"]["street"]
    @city = response.parsed_response["bmp_locations"]["location"]["city"]
    @zip = response.parsed_response["bmp_locations"]["location"]["zip"]
    @map = response.parsed_response["bmp_locations"]["location"]["blogmap"]
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      render :index
    end
  end

  def places_params
    params.require(:id)
  end

end
