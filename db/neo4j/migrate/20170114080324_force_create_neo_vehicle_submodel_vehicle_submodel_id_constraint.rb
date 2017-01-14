class ForceCreateNeoVehicleSubmodelVehicleSubmodelIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoVehicleSubmodel, :vehicle_submodel_id, force: true
  end

  def down
    drop_constraint :NeoVehicleSubmodel, :vehicle_submodel_id
  end
end
