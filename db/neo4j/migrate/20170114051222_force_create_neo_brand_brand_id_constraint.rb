class ForceCreateNeoBrandBrandIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoBrand, :brand_id, force: true
  end

  def down
    drop_constraint :NeoBrand, :brand_id
  end
end
