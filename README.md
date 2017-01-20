## Neo4j and The Parts Ninja

### What is Neo4j?

> Neo4j is a highly scalable native graph database that leverages data relationships as first-class entities, helping enterprises build intelligent applications to meet today’s evolving data challenges.

For more information: https://neo4j.com/

### Rails + Neo4j
This app useses the neo4j.rb gem to mimic ActiveRecord ORM to communicate with the neo4j database.
For neo4j.rb information http://neo4jrb.readthedocs.io/en/7.2.x/

### Getting Setup
Make sure the following are installed and/or running

    Java 8
    Postgres

### Setting up Rails and Postgres database

    clone repo https://github.com/janikhans/neo4j-ninja
    bundle install
    rake db:create
    rake db:migrate
    rake db:seed

### Setting up the Neo4j database

    Install server - rake neo4j:install[community-latest,development]
    Start server - rake neo4j:start[development]
    Migrate neo4j migrations - rake neo4j:migrate
    Neo4j admin panel - http://localhost:7474/browser/

To seed the Neo4j database from the seeds in the Postgres database, run the following rake task

    rake neo4j:build_ninja_db

If you need to drop neo4j database (i.e recreate it)

    rake neo4j:stop[development]
    delete db/neo4j/development/data/databases/graph.db
    rake neo4j:start[development]
    rake neo4j:migrate
    rake neo4j:build_ninja_db

### Exporting Postgres models to CSV
In psql terminal run the following code for each table you'd like to export

    \copy (Select * From table) To 'table.csv' With CSV header

### Importing Neo4j from postgres CSVs

    Move .csvs into neo4j/development/import

    // Brands
    LOAD CSV WITH HEADERS FROM "file:///brands.csv" AS csvLine
    CREATE (p:NeoBrand { brand_id: toInteger(csvLine.id), name: csvLine.name })

    // VehicleTypes
    LOAD CSV WITH HEADERS FROM "file:///vehicle_types.csv" AS csvLine
    CREATE (p:NeoVehicleType { vehicle_type_id: toInteger(csvLine.id), name: csvLine.name })

    // VehicleYears
    LOAD CSV WITH HEADERS FROM "file:///vehicle_years.csv" AS csvLine
    CREATE (p:NeoVehicleYear { vehicle_year_id: toInteger(csvLine.id), year: toInteger(csvLine.year) })

    // Categories:1
    LOAD CSV WITH HEADERS FROM "file:///categories.csv" AS csvLine
    MERGE (category:NeoCategory { category_id: toInteger(csvLine.id), name: csvLine.name })

    // Categories:2
    LOAD CSV WITH HEADERS FROM "file:///categories.csv" AS csvLine
    MATCH (category:NeoCategory { category_id: toInteger(csvLine.id)})
    MATCH (parent_category:NeoCategory { category_id: toInteger(csvLine.parent_id)})
    CREATE (parent_category)-[:HAS_SUBCATEGORY]->(category)

    // VehicleModels
    USING PERIODIC COMMIT
    LOAD CSV WITH HEADERS FROM "file:///vehicle_models.csv" AS csvLine
    MATCH (brand:NeoBrand { brand_id: toInteger(csvLine.brand_id) }), (vtype:NeoVehicleType {vehicle_type_id: toInteger(csvLine.vehicle_type_id)})
    CREATE (model:NeoVehicleModel { vehicle_model_id: toInteger(csvLine.id), name: csvLine.name})
    CREATE (brand)-[:HAS_MODEL]->(model)
    CREATE (vtype)-[:HAS_TYPE_MODEL]->(model)

    // VehicleSubmodels
    USING PERIODIC COMMIT
    LOAD CSV WITH HEADERS FROM "file:///vehicle_submodels.csv" AS csvLine
    MATCH (model:NeoVehicleModel { vehicle_model_id: toInteger(csvLine.vehicle_model_id) })
    CREATE (submodel:NeoVehicleSubmodel { vehicle_submodel_id: toInteger(csvLine.id), name: csvLine.name})
    CREATE (model)-[:HAS_SUBMODEL]->(submodel)

    // Vehicles
    USING PERIODIC COMMIT
    LOAD CSV WITH HEADERS FROM "file:///vehicles.csv" AS csvLine
    MATCH (submodel:NeoBrand { vehicle_submodel_id: toInteger(csvLine.vehicle_submodel_id) }), (year:NeoVehicleYear {vehicle_year_id: toInteger(csvLine.vehicle_year_id)})
    MERGE (vehicle:NeoVehicle { vehicle_id: toInteger(csvLine.id)})
    MERGE (submodel)-[:HAS_VEHICLE]->(vehicle)
    MERGE (year)-[:HAS_YEAR_VEHICLE]->(model)

    // Products
    USING PERIODIC COMMIT
    LOAD CSV WITH HEADERS FROM "file:///products.csv" AS csvLine
    MATCH (brand:NeoBrand { brand_id: toInteger(csvLine.brand_id) })
    MATCH (category:NeoCategory { category_id: toInteger(csvLine.category_id) })
    CREATE (product:NeoProduct { product_id: toInteger(csvLine.id), name: csvLine.name, description: csvLine.description})
    CREATE (brand)-[:HAS_PRODUCT]->(product)
    CREATE (category)-[:HAS_CATEGORY_PRODUCT]->(product)

### Cypher Cheatsheet

https://neo4j.com/docs/cypher-refcard/current/

# Happy Graphing!
