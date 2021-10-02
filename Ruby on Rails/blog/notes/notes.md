
1. start the server by ./bin/rails server
2. routes defined in ./config/routes, while define the connection between controller and action(defined in Application_controller)
---- scaffolding start ----
3. rails generate scaffold User name:string email:string (id will be created automatically and used as the primary key)
4. rails db:migrate ---> rails server
5. weakness of scafford user model: no data validations; no authentication; no tests, no style or layout
6. rails generate scaffold Micropost context:text user_id:integer ---> rails db:migrate
7. model.micropost: validates :content, length: { maximum: 140}
8. form association between different data models ---> has_many and belongs_to
9. use `rails console` to examine the implications:
```Ruby
first_user = User.first
first_user.microposts
micropost = first_user.microposts.first
micropost.user
exit
```
---- vscode ruby debugger ----
10. 