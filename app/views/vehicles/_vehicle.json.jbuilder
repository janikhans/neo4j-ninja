json.extract! vehicle, :id, :vehicle_submodel_id, :vehicle_year_id, :name, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)