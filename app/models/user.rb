class User < ActiveRecord::Base
has_many :Categories, dependent: :destroy
end
