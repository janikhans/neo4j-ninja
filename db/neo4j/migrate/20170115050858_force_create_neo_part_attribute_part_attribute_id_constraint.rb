class ForceCreateNeoPartAttributePartAttributeIdConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :NeoPartAttribute, :part_attribute_id, force: true
  end

  def down
    drop_constraint :NeoPartAttribute, :part_attribute_id
  end
end
