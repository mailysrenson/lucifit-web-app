class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @booking = Booking.new
    @this_week_courses = []
    @this_week_courses = @courses.select do |course|
      if course.date.cweek == Date.today.cweek
        @this_week_courses << course 
      end
    end

    @upcoming_courses = []
    @upcoming_courses = @courses.select do |course|
      if course.date.cweek > Date.today.cweek
        @upcoming_courses << course 
      end
    end

    @passed_courses = []
    @passed_courses = @courses.select do |course|
      if course.date.cweek < Date.today.cweek
        @passed_courses << course 
      end
    end

  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else 
      render :new
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to courses_path
  end

  private 

  def course_params 
    params.require(:course).permit(:address, :date, :time, :number_of_places)
  end
end
