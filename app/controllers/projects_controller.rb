class ProjectsController < ApplicationController
  def data
    respond_to do |format|
      format.json {
        render :json => [1,2,3,4,5]
      }
    end
  end

  def index
  end

  def show
    @project = Project.find(params[:id])
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
      p "****************************"
    p params
      p "***************************"
    if request.xhr?
      p request["ip"]
    end
  end

# end
