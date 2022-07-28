class ApplicationRecord < ActiveRecord::Base
  max_paginates_per 7
  self.abstract_class = true
end
