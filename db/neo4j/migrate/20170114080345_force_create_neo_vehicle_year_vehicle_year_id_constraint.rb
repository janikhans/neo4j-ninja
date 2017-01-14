class ForceCreateNeoVehicleYearVehicleYearIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoVehicleYear, :vehicle_year_id, force: true
  end

  def down
    drop_constraint :NeoVehicleYear, :vehicle_year_id
  end
end
