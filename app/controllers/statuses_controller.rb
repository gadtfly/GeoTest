class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def create
    @status = current_user.statuses.new(status_params)
    @status.location = Location.geocode(params[:location])
    @status.save
    redirect_to @status
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @status.location = Location.geocode(params[:location])
    @status.update_attributes(status_params)
    redirect_to @status
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
  end

private

  def status_params
    params.require(:status).permit(:content)
  end
end
