class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89120&distance=0&API_KEY=5672202A-065C-45FC-BEE1-1EA360D26C32'
    @uri = URI(@url) 
    @response = Net::HTTP.get(@uri) 
    @output = JSON.parse(@response)


    if @output.empty?
      @final_result = "Error"
    else
      @final_result = @output[0]['AQI']
    end



    if @final_result == 'Error'
      @api_color = 'gray'


    elsif @final_result <= 50
      @api_color = 'green'
    elsif @final_result >= 51 && @final_result <= 100
      @api_color = 'yellow'
       elsif @final_result >= 101 && @final_result <= 150
      @api_color = 'orange'
       elsif @final_result >= 151 && @final_result <= 200
      @api_color = 'red'
       elsif @final_result >= 201 && @final_result <= 300
      @api_color = 'purple'
       elsif @final_result >= 301 && @final_result <= 500
      @api_color = 'maroon'
        
    end

  end
end
