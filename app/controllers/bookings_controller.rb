class BookingsController < ApplicationController
  def create 
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
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
    params.require(:booking).permit(:address, :date, :time, :number_of_places)
  end
end
