class Role < ActiveRecord::Base
  enum level: [ :candidate, :department, :college, :provost ]
end
