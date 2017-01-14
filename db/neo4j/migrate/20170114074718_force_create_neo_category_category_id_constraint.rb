class ForceCreateNeoCategoryCategoryIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoCategory, :category_id, force: true
  end

  def down
    drop_constraint :NeoCategory, :category_id
  end
end
