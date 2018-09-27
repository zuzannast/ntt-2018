class ScheduleController < ApplicationController
  def index
    @upcoming = Talk.upcoming.first
    @upcoming_talks = Talk.in_rooms.first_by_place
  end
end
