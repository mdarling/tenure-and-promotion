class HomeController < ApplicationController
  def index
    all_links = 
      { provost: [["Roles",roles_path],
                 ["Colleges",colleges_path],
                 ["Departments",departments_path],
                 ["Calendar",cal_path]],
        department: [["Faculty",users_path]],
        candidate: [["Your Dossier",categories_path]] }
    @links=[]
    all_links.each do |level,links|
      if current_user.role[:level] >= Role.levels[level]
        links.each { |link| @links.push link }
      end
    end

  end
end
