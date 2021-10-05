
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
11. rails generate controller ControllerName <optional action names>; ---> ./bin/rails generate controller StaticPages home help
12. Ruby uses CamelCase for class names, and snake-case for file names
13. **undo** things in Rails: `rails destroy` + model User / controller StaticPages home help
14. rails db:migrate  ---> rails db:rollback (VERSION=0)
15. **test** controller tests, model tests, and integration tests
16. test - routes - controller - view html
17. dynamic pages -> make titles changes on each page -> seems does not work in the Chrome??
18. DRY -> embedded Ruby in views - provide and yield function - <% ... %> and <%= ... %>
19. extract the common yield title into the application.html.erb, remove the html structure in home,about,help, only leave the interior content
20. advanced testing setup: enhanced reporter and automated test runner that detects file changes ---> using minitest/reporters + Guard
21. `bundle exec guard init` -> Guardfile
---- Rails Guide ----
22. article = ..new, article.save; Article.all, Article.find(1); 
23. `./bin/rails` routes could inspect all maped routes, Prefix + suffix like '_url' or '_path' form the helpers name
24. submitted form data via params[:article][:title] would be passed individually to Article.new, which would be verbose and possibly error-prone. (become worse as more fields are added)
25. instead, the form values will be passed through a single Hash. We must **specify** what values are allowed in that Hash to avoid malicious form fields submission.
26. `edit` form looks the same as our `new` form, thanks to the Rails form builder and resourceful routing. The form builder **automatically** configures the form to make the appropriate kind of request, based on whether the model object has been previously saved.
27. A partial's filename must be prefixed with an underscore, e.g. _form.html.erb. But when rendering, it is referenced without the underscore, e.g. render "form".
28. how is update action working? submit in _form.html.erb, could automatically use POST / PATCH request ??? 
29. after placing comments in articles/show.html.erb, it's getting long and awkward -> use partial to clean it up.
30. `<%= render 'comments/form' %>`, Rails is smart enough to spot the forward slash in the string, and realize that you want to render _form.html.erb in the views/comments directory.
31. Concerns: make large controllers or models easier to understand and manage. duplicated logic in comments/article -> the methods in our concern is related to the visibility of model
32. def class_method in Concern, which could be called in html.erb
33. bin/rails generate migration AddStatusToArticles status:string; bin/rails generate migration AddStatusToComments status:string -> then permit status in the strong parameter -> add a select box to the forms, specify the default status as public