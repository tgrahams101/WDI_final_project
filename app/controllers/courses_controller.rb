class CoursesController < ApplicationController
  def index

    @search_term = params[:q]|| 'jhu'
    @courses = Coursera.for(@search_term)['elements']
    # render plain: @courses.
    puts @courses
  end
end
