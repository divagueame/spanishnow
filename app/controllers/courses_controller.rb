class CoursesController < ApplicationController
  before_action :authenticate_admin, only: %i[ new edit create update destroy ]
  before_action :authenticate_user!, only: %i[ index show]
  before_action :set_course, only: %i[ show ] 

  before_action only: %i[ show ] do
    filter_active(@course)
  end

  def index

  end
 
  def show
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :active)
    end
end
