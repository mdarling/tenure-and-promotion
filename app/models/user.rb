class User < ActiveRecord::Base
has_many :Uploads, dependent: :destroy
end
