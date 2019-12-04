class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class String
  def drop_type
      self.itself.gsub(/[_-]/, ' ').split(' ').map(&:capitalize).join(' ')
  end
end
