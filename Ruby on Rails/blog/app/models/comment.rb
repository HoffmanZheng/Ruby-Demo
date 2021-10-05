class Comment < ApplicationRecord
  # sets up an Active Record association
  belongs_to :article

  # ---> Concerns: add status
  include Visible
  # VALID_STATUSES = ['public', 'private', 'archived']
  # validates :status, inclusion: { in: VALID_STATUSES }

  # def archived?
  #     status == 'archived'
  # end
end
