class BookingsController < ApplicationController

  def new
    @course = Course.find(params[:course_id])
    @booking = Booking.new
  end
  
  def create 
    @booking = Booking.new(booking_params)
    @course = Course.find(params[:course_id].to_i)
    @booking.course = @course
    @booking.user = current_user
    if @booking.save
      redirect_to root_path, notice: "Réservation réussie"
    else 
      flash[:alert] = "Réservation échouée, veuillez réessayer"
      render :new
    end
  end

  private 

  def booking_params 
    params.require(:booking).permit(:number_of_people, :user_id, :course_id)
  end
end
