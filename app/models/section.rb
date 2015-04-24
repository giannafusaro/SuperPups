class Section < ActiveRecord::Base
  serialize :data, JSON
end
