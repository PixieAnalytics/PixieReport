class ProjectsController < ApplicationController
  def data
    project = Project.find(params[:project_id])
    durations = []
    cities = {}
    links = {}
    project.visitors.each do |visitor|
      durations << (visitor.departure - visitor.arrival)/60
      if cities[visitor.city]
        cities[visitor.city] += 1
      else
        cities[visitor.city] = 1
      end
      if links[visitor.destination]
        links[visitor.destination] += 1
      else
        links[visitor.destination] = 1
      end
    end
    cities_array = []
    links_array = []
    cities.each do |city, value|
      cities_array << {label: city, value: value}
    end
    links.each do |link, value|
      copy = link
      copy = "External Link" if link == nil
      copy = copy.gsub("http://", "")
      copy =copy.gsub(/(.com)\*/, ".com")
      links_array << {label: copy, value: value}
    end

    respond_to do |format|
      format.json {
        render :json => {duration: durations, cities: cities_array, links: links_array}
      }
    end
  end

  def index
  end

  def show
    @project = Project.find(params[:id])
    @average_stay=0
    @project.visitors.each do |visitor|
      @average_stay += ((visitor.departure - visitor.arrival)/(60 * @project.visitors.all.length)).floor
    end
  end
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

# end
