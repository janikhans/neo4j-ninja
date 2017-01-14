namespace :neo4j do

  desc "Builds Neo4j database from exisiting Postgres data"
  task :build_ninja_db do
    VehicleType.build_neo_nodes
    VehicleYear.build_neo_nodes
    Category.build_neo_nodes
    Brand.build_neo_nodes
    VehicleModel.build_neo_nodes
    VehicleSubModel.build_neo_nodes
    Vehicle.build_neo_nodes
    Product.build_neo_nodes
    Part.build_neo_nodes
    Fitment.build_neo_nodes
  end
end
