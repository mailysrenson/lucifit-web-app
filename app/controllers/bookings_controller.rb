class BookingsController < ApplicationController
  respond_to :html, :xml, :json

  def new
    @course = Course.find(params[:course_id])
    @booking = Booking.new
    respond_modal_with @course
  end
  
  def create
    @booking = Booking.new(booking_params)
    @course = Course.find(params[:course_id].to_i)
    @booking.course = @course
    @booking.user = current_user
    if @course.remaining_places >= booking_params[:number_of_people].to_i
      if @booking.save
        redirect_to root_path, notice: "Réservation réussie"
        @course.remaining_places -= @booking.number_of_people.to_i
        @course.save
      else 
        flash[:alert] = "Réservation échouée, veuillez réessayer"
        render :new
      end
    else
      flash[:alert] = "Problème"
    end

  end

  def own_bookings
    @bookings = current_user.bookings
  end

  private 

  def booking_params 
    params.require(:booking).permit(:number_of_people, :user_id, :course_id)
  end
end
