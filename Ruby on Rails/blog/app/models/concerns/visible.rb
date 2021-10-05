module Visible
    # ---> validations are methods called at the class level
    # the `ActiveSupport::Concern` gives us a simpler way to include them
    extend ActiveSupport::Concern

    VALID_STATUSES = ['public', 'private', 'archived']

    included do
        validates :status, inclusion: { in: VALID_STATUSES }
    end

    # ---> display a count of public articles or comments on main pages
    # class methods could be called in html.erb
    class_methods do
        def public_count
            where(status: 'public').count
        end
    end

    def archived?
        status == 'archived'
    end
end