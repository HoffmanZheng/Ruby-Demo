class Article < ApplicationRecord
    # ---> validations are rules that checked before a model obj is saved.
    # if any check fail, the save will be anorted, and error messages will be added to 
    # the `error` attribute of the model obj
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}
    # ---> Active Record automatically defines model attributes for
    # every table column, where ????

    has_many :comments
    # ---> enable automatic behavior, like `@article.comments`
    # could retrieve all the comments as an array belonging to that article
end
