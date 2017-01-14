# README

bundle install
rake db:create
rake db:migrate
rake db:seed

For neo4j information http://neo4jrb.readthedocs.io/en/7.2.x/

download and install new neo4j server rake neo4j:install[community-latest,development]
Starting the neo4j server: rake neo4j:start[development]

visit http://localhost:7474/browser/ to have access to neo4j server
