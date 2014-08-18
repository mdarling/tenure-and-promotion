class User < ActiveRecord::Base
has_many :Uploads, dependent: :destroy
has_many :Converts, dependent: :destroy
end
