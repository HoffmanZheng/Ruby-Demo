
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
---- static pages ----
11. ./bin/rails generate controller StaticPages home help
12. Ruby uses CamelCase for class names, and snake-case for file names
13. **undo** things in Rails: `rails destroy` + model User / controller StaticPages home help
14. rails db:migrate  ---> rails db:rollback (VERSION=0)
15. **test** controller tests, model tests, and integration tests
16. test - routes - controller - view html
17. dynamic pages -> make titles changes on each page -> seems does not work in the Chrome??
18. DRY -> embedded Ruby in views - provide and yield function - <% ... %> and <%= ... %>
19. 

