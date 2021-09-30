
1. start the server by ./bin/rails server
2. routes defined in ./config/routes, while define the connection between controller and action(defined in Application_controller)
---- scaffolding start ----
3. rails generate scaffold User name:string email:string (id will be created automatically and used as the primary key)
4. rails db:migrate ---> rails server