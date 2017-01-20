class ForceCreateNeoFitmentFitmentIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoFitment, :fitment_id, force: true
  end

  def down
    drop_constraint :NeoFitment, :fitment_id
  end
end
