class HomeController < ApplicationController
  def index
    @links = links current_user.role.level
  end

  private

  def links role
    { tech:       [["Roles",roles_path],
                   ["Colleges",colleges_path],
                   ["Departments",departments_path],
                   ["Calendar",cal_path]],
      provost:    [["Recusals",recusals_path],
                   ["Add Reviewers", users_path],
                   ["Faculty Candidates", users_path]],
      college:    [["Add Reviewers", users_path],
                   ["Faculty Candidates", users_path]],
      department: [["Faculty Candidates",users_path]],
      candidate:  [["Your Dossier",categories_path]] }[role.to_sym]
  end

end
