json.array!(@scrims) do |scrim|
  json.extract! scrim, :id, :player, :mmr, :location
  json.url scrim_url(scrim, format: :json)
end
