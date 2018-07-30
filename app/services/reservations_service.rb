class ReservationsService
  def initialize start_date, end_date
    @start_date = start_date
    @end_date = end_date
  end
  
  def days
    (@end_date - @start_date).to_i + 1    
  end
end
