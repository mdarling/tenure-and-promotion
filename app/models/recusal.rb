class Recusal < ActiveRecord::Base
  belongs_to :user
  belongs_to :candidate, class_name: 'User' 
end
