class ForceCreateNeoVehicleModelVehicleModelIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoVehicleModel, :vehicle_model_id, force: true
  end

  def down
    drop_constraint :NeoVehicleModel, :vehicle_model_id
  end
end
