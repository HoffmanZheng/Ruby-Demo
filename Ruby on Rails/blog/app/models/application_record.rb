# ---> by inheriting from ActiveRecord, our model objects gain the 
# ---> ability to communicate with the database, treat the database
# ---> columns as Ruby attributes, and so on.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
