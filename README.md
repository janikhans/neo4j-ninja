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

# Happy Graphing!
