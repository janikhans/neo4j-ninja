# README
make sure Java 8 is installed
make sure postgres is installed and running

clone repo
bundle install
rake db:create
rake db:migrate
rake db:seed

For neo4j information http://neo4jrb.readthedocs.io/en/7.2.x/

install new neo4j server: rake neo4j:install[community-latest,development]
Start neo4j server: rake neo4j:start[development]
migrate neo4j migrations rake neo4j:migrate
build neo4j database from postgres recordss rake neo4j:build_ninja_db

visit http://localhost:7474/browser/ to have access to neo4j server

If you need to drop neo4j database (i.e recreate it)
- rake neo4j:stop[development]
- delete db/neo4j/development/data/databases/graph.db
- rake neo4j:start[development]
- rake neo4j:migrate
- rake neo4j:build_ninja_db
