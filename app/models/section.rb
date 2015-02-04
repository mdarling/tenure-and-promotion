class Section < ActiveRecord::Base
  has_many :department_sections, dependent: :destroy

  def pdf?
    pdf ? "Yes" : "No"
  end
end
