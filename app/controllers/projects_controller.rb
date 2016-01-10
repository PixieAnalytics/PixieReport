class ProjectsController < ApplicationController
  include ProjectsHelper
  def data
    project = Project.find(params[:project_id])
    durations = visitor_durations(project)
    cities = visitor_cities(project)
    links = visitor_destinations(project)

    respond_to do |format|
      format.json {
        render :json => {duration: durations, cities: cities, links: links}
      }
    end
  end

  def index
  end

  def show
    @project = Project.find(params[:id])
    @average_stay=0
    @num_clicks =0
    @project.visitors.each do |visitor|
      @average_stay += ((visitor.departure - visitor.arrival)/(60 * @project.visitors.all.length)).floor
      @num_clicks += (visitor.clicks.to_f/@project.visitors.all.length).floor
    end
  end


  def new
    @project = Project.new
  end

  def create
    @user.projects.create(title: params_require[:title], domain: params_require[:domain], description: params_require[:description])
    redirect_to @user
  end

  def edit
  end

  def destroy
  end

  def update
  end
  private

  def params_require
    params.require(:project)

  end

end
