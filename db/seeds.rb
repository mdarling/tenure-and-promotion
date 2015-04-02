# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#"owner","role"

# Do all this in one transaction
ActiveRecord::Base.transaction do

  [ # Default Roles
    # Levels are
    # 0 for candidate
    # 1 for department
    # 2 for college
    # 3 for provost (all university)
    # name,level
    ["Tenure and Promotion Candidate",0],
    ["Mid-Probationary Candidate",0],
    ["Full Professor Candidate",0],
    ["Department Admin",1],
    ["Department Faculty",1],
    ["College Commitee Faculty",2],
    ["College Admin",2],
    ["Provost's Committee Faculty",3],
    ["Provost's Admin",3],
    ["Senior Vice Provost",3],
    ["Tech User",4]
  ].each  { |r| Role.create name: r.first, level: r.last }
  
  
  [ # Colleges
    "Anderson School of Management",
    "College of Arts & Sciences",
    "College of Education",
    "College of Fine Arts",
    "College of Nursing",
    "College of Pharmacy",
    "College of University Libraries & Learning Sciences",
    "School of Architecture and Planning",
    "School of Engineering",
    "School of Law",
    "School of Medicine",
    "School of Public Administration",
  ].each { |c| College.create name: c }
  
  [ # Departments
    # college,department
    ["Anderson School of Management","Accounting"],
    ["Anderson School of Management","Finance, International, Technology and Entrepreneurship (FITE)"],
    ["Anderson School of Management","Department of Marketing, Information Systems, Information Assurance, & Operations Management Faculty (MIDS)"],
    ["Anderson School of Management","Department of Organizational Studies (DOS)"],
    ["College of Arts & Sciences","American Studies"],
    ["College of Arts & Sciences","Anthropology"],
    ["College of Arts & Sciences","Biology"],
    ["College of Arts & Sciences","Chemistry and Chemical Biology"],
    ["College of Arts & Sciences","Communication & Journalism"],
    ["College of Arts & Sciences","Earth & Planetary Sciences"],
    ["College of Arts & Sciences","Economics"],
    ["College of Arts & Sciences","English"],
    ["College of Arts & Sciences","Foreign Languages & Literature"],
    ["College of Arts & Sciences","Geography"],
    ["College of Arts & Sciences","History"],
    ["College of Arts & Sciences","Linguistics"],
    ["College of Arts & Sciences","Mathematics & Statistics"],
    ["College of Arts & Sciences","Philosophy"],
    ["College of Arts & Sciences","Physics & Astronomy"],
    ["College of Arts & Sciences","Political Science"],
    ["College of Arts & Sciences","Psychology"],
    ["College of Arts & Sciences","Sociology"],
    ["College of Arts & Sciences","Spanish & Portuguese"],
    ["College of Arts & Sciences","Speech & Hearing Sciences"],
    ["College of Education","Educational Specialties"],
    ["College of Education","Health, Exercise, and Sports Sciences (HESS)"],
    ["College of Education","Individual, Family, and Community Education (IFCE)"],
    ["College of Education","Language, Literacy, and Sociocultural Studies (LLSS)"],
    ["College of Education","Teacher Education, Educational Leadership & Policy (TEELP)"],
    ["College of Fine Arts","Art & Art History"],
    ["College of Fine Arts","Music"],
    ["College of Fine Arts","Theatre & Dance"],
    ["College of Fine Arts","Cinematic Arts"],
    ["College of Nursing","College of Nursing"],
    ["College of Pharmacy","College of Pharmacy"],
    ["College of University Libraries & Learning Sciences","College of University Libraries & Learning Sciences"],
    ["School of Architecture and Planning","Architecture"],
    ["School of Architecture and Planning","Community & Regional Planning"],
    ["School of Architecture and Planning","Landscape Architecture"],
    ["School of Architecture and Planning","Historic Preservation & Regionalism"],
    ["School of Architecture and Planning","Urban & Regional Design"],
    ["School of Engineering","Chemical & Biological Engineering"],
    ["School of Engineering","Civil Engineering"],
    ["School of Engineering","Computer Science"],
    ["School of Engineering","Electrical & Computer Engineering"],
    ["School of Engineering","Mechanical Engineering"],
    ["School of Engineering","Nuclear Engineering"],
    ["School of Law","School of Law"],
    ["School of Medicine","Anesthesiology & Critical Care Medicine"],
    ["School of Medicine","Biochemistry & Molecular Biology"],
    ["School of Medicine","Cell Biology and Physiology"],
    ["School of Medicine","Dental Medicine"],
    ["School of Medicine","Dermatology"],
    ["School of Medicine","Emergency Medicine"],
    ["School of Medicine","Family and Community Medicine"],
    ["School of Medicine","Internal Medicine"],
    ["School of Medicine","Molecular Genetics & Microbiology"],
    ["School of Medicine","Neurology"],
    ["School of Medicine","Neurosciences"],
    ["School of Medicine","Neurosurgery"],
    ["School of Medicine","Obstetrics & Gynecology"],
    ["School of Public Administration","School of Public Administration"]
  ].each { |d| Department.create college: College.find_by_name(d.first),name: d.last }
  
  [ # Dossier Sections
    ["Curriculum Vitae","Candidate",true],
    ["Teaching Statement or Portfolio","Candidate",true],
    ["Research Statement","Candidate",true],
    ["Teaching Record","Candidate",true],
    ["Service Statement","Candidate",true],
    ["Course Materials","Candidate",true],
    ["Supplemental Materials","Candidate",false],
    ["Annual Reviews","Department", true],
    ["External Reviews","Department",true],
    ["Department Vote and Comments","Department",true],
    ["Letter from Department Chair","Department",true],
    ["College Committee Vote and Comments","College",true],
    ["Letter from Dean","College",true],
    ["Senior Vice Provost's Letter","Provost",true],
    ["Provost Decision","Provost",true]
  ].each { |s| Section.create name: s[0], level: s[1], pdf: s[2] }
  
  # Dossier Section to Department Connections
  Department.all.product Section.all do |department,section|
    DepartmentSection.create department: department, section: section
  end

  # Exceptions
  Section.create name: "Statement of Librarianship", level: "Candidate", pdf: true
  library = Department.find_by_name "College of University Libraries & Learning Sciences"
  DepartmentSection.create department: library, section: Section.find_by_name("Statement of Librarianship")
  
  [ # Initial users
    # name,netid,role,department
#    ["Ricardo Piro-Rael","fdisk122","Tech User","Electrical & Computer Engineering"],
#    ["Greg Heileman","heileman","Tech User","Electrical & Computer Engineering"]
#    ["Jennifer Rose Love","jenlov22","Provost's Admin","Civil Engineering"],
#    ["Karen Gardner","krgard11","College Admin","Economics"],
#    ["Theresa Ramos","tramos","Provost's Committee Faculty","Neurology"],
#    ["Kathleen Garcia","garciak","College Admin","College of University Libraries & Learning Sciences"],
#    ["Carol Parker","cparker","Senior Vice Provost","School of Law"]
    # Initial users during testing phase
    ["Candidate","candidate","Tenure and Promotion Candidate","English"],
    ["Department Admin","departmentadmin","Department Admin","English"],
    ["College Admin","collegeadmin","College Admin","English"],
    ["Provost's Admin","provostadmin","Provost's Admin","English"]
  ].each { |u| User.create name: u[0], netid: u[1], role: Role.find_by_name(u[2]), department: Department.find_by_name(u[3]) }
  
  # Initial users' sections
  User.all.each do |user|
    user.department.department_sections.each do |section|
      user.categories.create name: section.section.name
    end
  end

end
