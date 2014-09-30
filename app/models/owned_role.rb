class OwnedRole < ActiveRecord::Base
  belongs_to :user
end
