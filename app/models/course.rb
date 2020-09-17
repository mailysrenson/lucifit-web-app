class Course < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :address, :date, :number_of_places, :time, presence: true

  before_create :add_remaining_places

  private

  def add_remaining_places
    self.remaining_places = self.number_of_places
  end
end
