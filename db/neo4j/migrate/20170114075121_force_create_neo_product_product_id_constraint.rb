class ForceCreateNeoProductProductIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoProduct, :product_id, force: true
  end

  def down
    drop_constraint :NeoProduct, :product_id
  end
end
