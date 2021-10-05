class Comment < ApplicationRecord
  # sets up an Active Record association
  belongs_to :article
end
