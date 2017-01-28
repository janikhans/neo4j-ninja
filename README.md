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
    MERGE (p:NeoBrand { brand_id: toInteger(csvLine.id), name: csvLine.name, created_at: TIMESTAMP(), updated_at: TIMESTAMP() });

    // VehicleTypes
    LOAD CSV WITH HEADERS FROM "file:///vehicle_types.csv" AS csvLine
    MERGE (p:NeoVehicleType { vehicle_type_id: toInteger(csvLine.id), name: csvLine.name, created_at: TIMESTAMP(), updated_at: TIMESTAMP() });

    // VehicleYears
    LOAD CSV WITH HEADERS FROM "file:///vehicle_years.csv" AS csvLine
    MERGE (p:NeoVehicleYear { vehicle_year_id: toInteger(csvLine.id), year: toInteger(csvLine.year), created_at: TIMESTAMP(), updated_at: TIMESTAMP() });

    // Categories:1
    LOAD CSV WITH HEADERS FROM "file:///categories.csv" AS csvLine
    MERGE (category:NeoCategory { category_id: toInteger(csvLine.id), name: csvLine.name, created_at: TIMESTAMP(), updated_at: TIMESTAMP() });

    // Categories:2
    LOAD CSV WITH HEADERS FROM "file:///categories.csv" AS csvLine
    MATCH (category:NeoCategory { category_id: toInteger(csvLine.id)})
    MATCH (parent_category:NeoCategory { category_id: toInteger(csvLine.parent_id)})
    CREATE (parent_category)-[:HAS_SUBCATEGORY]->(category);

    // Part Attributes:1
    LOAD CSV WITH HEADERS FROM "file:///part_attributes.csv" AS csvLine
    MERGE (part_attribute:NeoPartAttribute { part_attribute_id: toInteger(csvLine.id), name: csvLine.name, created_at: TIMESTAMP(), updated_at: TIMESTAMP() });

    // Part Attributes:2
    LOAD CSV WITH HEADERS FROM "file:///part_attributes.csv" AS csvLine
    MATCH (part_attribute:NeoPartAttribute { part_attribute_id: toInteger(csvLine.id)})
    MATCH (parent_attribute:NeoPartAttribute { part_attribute_id: toInteger(csvLine.parent_id)})
    CREATE (parent_attribute)-[:HAS_VARIATION]->(part_attribute);

    // VehicleModels
    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///vehicle_models.csv" AS csvLine
    MATCH (brand:NeoBrand { brand_id: toInteger(csvLine.brand_id) }), (vtype:NeoVehicleType {vehicle_type_id: toInteger(csvLine.vehicle_type_id)})
    CREATE (model:NeoVehicleModel { vehicle_model_id: toInteger(csvLine.id), name: csvLine.name, created_at: TIMESTAMP(), updated_at: TIMESTAMP()})
    CREATE (brand)-[:HAS_MODEL]->(model)
    CREATE (vtype)-[:HAS_TYPE_MODEL]->(model)

    // VehicleSubmodels
    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///vehicle_submodels.csv" AS csvLine
    MATCH (model:NeoVehicleModel { vehicle_model_id: toInteger(csvLine.vehicle_model_id) })
    CREATE (submodel:NeoVehicleSubmodel { vehicle_submodel_id: toInteger(csvLine.id), name: csvLine.name, created_at: TIMESTAMP(), updated_at: TIMESTAMP()})
    CREATE (model)-[:HAS_SUBMODEL]->(submodel)

    // Vehicles
    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///vehicles.csv" AS csvLine
    MATCH (submodel:NeoVehicleSubmodel { vehicle_submodel_id: toInteger(csvLine.vehicle_submodel_id) }), (year:NeoVehicleYear {vehicle_year_id: toInteger(csvLine.vehicle_year_id)})
    MERGE (vehicle:NeoVehicle { vehicle_id: toInteger(csvLine.id), created_at: TIMESTAMP(), updated_at: TIMESTAMP()})
    MERGE (submodel)-[:HAS_VEHICLE]->(vehicle)
    MERGE (year)-[:HAS_YEAR_VEHICLE]->(vehicle)

    // Vehicles: vehicle year relationships
    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///vehicles.csv" AS csvLine
    MATCH (vehicle:NeoVehicle { vehicle_id: toInteger(csvLine.id) }), (year:NeoVehicleYear {vehicle_year_id: toInteger(csvLine.vehicle_year_id)})
    MERGE (year)-[:HAS_YEAR_VEHICLE]->(vehicle)

    // Products
    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///products.csv" AS csvLine
    MATCH (brand:NeoBrand { brand_id: toInteger(csvLine.brand_id) })
    MATCH (category:NeoCategory { category_id: toInteger(csvLine.category_id) })
    CREATE (product:NeoProduct { product_id: toInteger(csvLine.id), name: csvLine.name, description: csvLine.description, created_at: TIMESTAMP(), updated_at: TIMESTAMP()})
    CREATE (brand)-[:HAS_PRODUCT]->(product)
    CREATE (category)-[:HAS_CATEGORY_PRODUCT]->(product)

    // Products: relationships
    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///products.csv" AS csvLine
    MATCH (brand:NeoBrand { brand_id: toInteger(csvLine.brand_id) })
    MATCH (category:NeoCategory { category_id: toInteger(csvLine.category_id) })
    MATCH (product:NeoProduct { product_id: toInteger(csvLine.id) })
    MERGE (category)-[:HAS_CATEGORY_PRODUCT]->(product)
    MERGE (brand)-[:HAS_PRODUCT]->(product)

    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///products.csv" AS csvLine
    MATCH (category:NeoCategory { category_id: toInteger(csvLine.category_id) })
    MATCH (product:NeoProduct { product_id: toInteger(csvLine.id) })
    MERGE (category)-[:HAS_CATEGORY_PRODUCT]->(product)

    // Parts
    USING PERIODIC COMMIT 1000
    LOAD CSV WITH HEADERS FROM "file:///parts.csv" AS csvLine
    MATCH (product:NeoProduct { product_id: toInteger(csvLine.product_id) })
    CREATE (part:NeoPart { part_id: toInteger(csvLine.id), part_number: csvLine.part_number, note: csvLine.note, created_at: TIMESTAMP(), updated_at: TIMESTAMP()})
    CREATE (product)-[:HAS_PART]->(part)

    // Part Attributes:3
    LOAD CSV WITH HEADERS FROM "file:///part_attributions.csv" AS csvLine
    MATCH (part_attribute:NeoPartAttribute { part_attribute_id: toInteger(csvLine.part_attribute_id)})
    MATCH (part:NeoPart { part_id: toInteger(csvLine.part_id)})
    CREATE (part_attribute)-[:HAS_ATTRIBUTE_PART]->(part);

    // FITMENTS
    USING PERIODIC COMMIT 10000
    LOAD CSV WITH HEADERS FROM "file:///fitments.csv" AS csvLine
    MATCH (part:NeoPart { part_id: toInteger(csvLine.part_id)})
    MATCH (vehicle:NeoVehicle { vehicle_id: toInteger(csvLine.vehicle_id)})
    CREATE (fitment:NeoFitment { fitment_id: toInteger(csvLine.id), note: csvLine.note, source: csvLine.source, created_at: TIMESTAMP(), updated_at: TIMESTAMP()})
    CREATE (part)-[:HAS_PART_FITMENT]->(fitment)
    CREATE (vehicle)-[:HAS_VEHICLE_FITMENT]->(fitment)


### Cypher Cheatsheet

https://neo4j.com/docs/cypher-refcard/current/

# Happy Graphing!
