namespace :neo4j do

  desc "Builds Neo4j database from exisiting Postgres data"
  task :build_ninja_db => :environment do
    VehicleType.build_neo_nodes
    puts "Created VehicleType Nodes"
    VehicleYear.build_neo_nodes
    puts "Created VehicleYear Nodes"
    Category.build_neo_nodes
    puts "Created Category Nodes"
    Brand.build_neo_nodes
    puts "Created Brand Nodes"
    VehicleModel.build_neo_nodes
    puts "Created VehicleModel Nodes"
    VehicleSubmodel.build_neo_nodes
    puts "Created VehicleSubmodel Nodes"
    Vehicle.build_neo_nodes
    puts "Created Vehicle Nodes"
    Product.build_neo_nodes
    puts "Created Product Nodes"
    Part.build_neo_nodes
    puts "Created Part Nodes"
    Fitment.build_neo_nodes
    puts "Created Fitment Relationships"
  end
end
