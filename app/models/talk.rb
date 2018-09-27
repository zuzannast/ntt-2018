class Talk < ApplicationRecord
  LUNCH_BREAK_START = "2018-09-29 13:00"
  LUNCH_BREAK_END = "2018-09-29 14:00"

  enum category: {
    "general" => 0,
    "presentation" => 1,
    "workshop" => 2,
    "lightning_talk" => 3,
  }

  enum place: {
    "lounge" => 0,
    "main_stage" => 1,
    "workshop_room_1" => 2,
    "workshop_room_2" => 3,
  }

  scope :upcoming, -> { where("start_time > ?", Time.now).order(:start_time) }
  scope :before_lunch, -> { where("start_time < ?", LUNCH_BREAK_START) }
  scope :after_lunch, -> { where("start_time >= ?", LUNCH_BREAK_END) }
  scope :in_rooms, -> { where.not(place: "lounge") }

  def self.first_by_category
    upcoming.group_by(&:category).map { |k, v| { k => v.first } }
  end

  def self.first_by_place
    upcoming.group_by(&:place).map { |k, v| { k => v.first } }
  end

  def end_time
    start_time + duration.minutes
  end

  def pretty_time
    "#{start_time.strftime("%H:%M")} - #{end_time.strftime("%H:%M")}"
  end
end
