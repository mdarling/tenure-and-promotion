class User < ActiveRecord::Base
	validates_presence_of :acces_level
	validates_presence_of :Committee_id
	validates_presence_of :Department_College_id
	validates_presence_of :Department_id 
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => "Must Be Valid"
    validates_format_of :last_name, :with => /\A([-a-zA-Z])+\z/i, :on => :create, :message => "Must Be Valid"
    validates_format_of :first_name, :with => /\A([-a-zA-Z])+\z/i, :on => :create, :message => "Must Be Valid"
end

