class ForceCreateNeoVehicleTypeVehicleTypeIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoVehicleType, :vehicle_type_id, force: true
  end

  def down
    drop_constraint :NeoVehicleType, :vehicle_type_id
  end
end
