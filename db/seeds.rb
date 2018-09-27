file_path = File.expand_path('../config/schedule.yml', __FILE__)
schedule = YAML::load_file(file_path)
schedule.each do |talk|
  Talk.create(
    category: talk["category"],
    name: talk["name"],
    description: talk["description"],
    start_time: talk["start_time"],
    duration: talk["duration"],
    place: talk["place"],
    speaker: talk["speaker"],
  )
end
