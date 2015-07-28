class ReportsController < ApplicationController

  def new # get request shows us the form for filing a report
    # Require for the form_for syntax
    # @report = Report.new
    if logged_in?
      render 'new_report'
    else
      redirect_to new_user_path
    end
  end

  def show # show is a get request
    @report = Report.find_by(id: params[:id])
    @car = @report.car
    render "show"
  end

  def create # a post request, so never render inside
    unless @car = Car.find_by(state: params[:car][:state], plate: params[:plate].upcase)
      @car = Car.create!(state: params[:car][:state], plate: params[:plate].upcase)
    end

    @car.reports << @report = Report.create(car_id: @car.id, user_id: current_user.id, title: params[:title], text: params[:text])

    redirect_to report_path(@report)
  end

end
