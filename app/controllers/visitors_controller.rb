class VisitorsController < ApplicationController
  def manage
    project =  Project.where(domain: params[:domain])[0]
    project.visitors.create(ip: params[:ip], arrival: params[:arrival], departure: params[:leave], clicks: params[:clicks], city: params[:city], country: params[:country])
    p "********************"
    p project.visitors
    p "**********************"
  end

  private

  def params_require
    # params.require(:ip, :country, :clicks, :city, :departure, :arrival, :domain)
  end
end
