class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @booking = Booking.new
    @this_week_courses_unsorted = []
    @this_week_courses_unsorted = @courses.select do |course|
      if course.date.cweek == Date.today.cweek
        @this_week_courses_unsorted << course 
      end
    end
    @this_week_courses = @this_week_courses_unsorted.sort_by {|course| course.date}

    @upcoming_courses_unsorted = []
    @upcoming_courses_unsorted = @courses.select do |course|
      if course.date.cweek > Date.today.cweek
        @upcoming_courses_unsorted << course 
      end
    @upcoming_courses = @upcoming_courses_unsorted.sort_by {|course| course.date}
    end

    @passed_courses_unsorted = []
    @passed_courses_unsorted = @courses.select do |course|
      if course.date.cweek < Date.today.cweek
        @passed_courses_unsorted << course 
      end
    end
    @passed_courses = @passed_courses_unsorted.sort_by {|course| course.date}
  end

  def show
    @course = Course.find(params[:id])
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
    params.require(:course).permit(:address, :date, :time, :number_of_places, :remaining_places)
  end
end
