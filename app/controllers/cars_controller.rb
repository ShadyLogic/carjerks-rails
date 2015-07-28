class CarsController < ApplicationController

  def show
    @car = Car.find_by(id: params[:id])
    @reports = @car.reports
    render 'show'
  end

end
