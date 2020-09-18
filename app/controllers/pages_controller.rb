class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @courses = Course.all
    @weekly_courses_unsorted = []
    @weekly_courses_unsorted = @courses.select do |course|
      if course.date.cweek == Date.today.cweek
        @weekly_courses_unsorted << course 
      end
    end
    @weekly_courses = @weekly_courses_unsorted.sort_by {|course| course.date }
  end
end
