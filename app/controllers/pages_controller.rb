class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @courses = Course.all
    @weekly_courses = []
    @weekly_courses = @courses.select do |course|
      if course.date.cweek == Date.today.cweek
        @weekly_courses << course 
      end
    end
  end
end
