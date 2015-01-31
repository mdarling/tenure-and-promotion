# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#"owner","role"


[ # Initial users
{ name: "Ricardo Piro-Rael", netid: "fdisk122", role: "Tech User"}
].each &User.method(:create)


[ # Default Roles
"Tenure and Promotion Candidate",
"Mid-Probationary Candidate",
"Full Professor Candidate",
"Department Admin",
"Department Faculty",
"College Commitee Faculty",
"College Admin",
"Provost's Committee Faculty",
"Provost's Admin",
"Senior Vice Provost",
"Tech User"
].each  { |r| DefaultRole.create role: r }


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
"Anderson School of Management","Accounting",
"Anderson School of Management","Finance, International, Technology and Entrepreneurship (FITE)",
"Anderson School of Management","Department of Marketing, Information Systems, Information Assurance, & Operations Management Faculty (MIDS)",
"Anderson School of Management","Department of Organizational Studies (DOS)",
"College of Arts & Sciences","American Studies",
"College of Arts & Sciences","Anthropology",
"College of Arts & Sciences","Biology",
"College of Arts & Sciences","Chemistry and Chemical Biology",
"College of Arts & Sciences","Communication & Journalism",
"College of Arts & Sciences","Earth & Planetary Sciences",
"College of Arts & Sciences","Economics",
"College of Arts & Sciences","English",
"College of Arts & Sciences","Foreign Languages & Literature",
"College of Arts & Sciences","Geography",
"College of Arts & Sciences","History",
"College of Arts & Sciences","Linguistics",
"College of Arts & Sciences","Mathematics & Statistics",
"College of Arts & Sciences","Philosophy",
"College of Arts & Sciences","Physics & Astronomy",
"College of Arts & Sciences","Political Science",
"College of Arts & Sciences","Psychology",
"College of Arts & Sciences","Sociology",
"College of Arts & Sciences","Spanish & Portuguese",
"College of Arts & Sciences","Speech & Hearing Sciences",
"College of Education","Educational Specialties",
"College of Education","Health, Exercise, and Sports Sciences (HESS)",
"College of Education","Individual, Family, and Community Education (IFCE)",
"College of Education","Language, Literacy, and Sociocultural Studies (LLSS)",
"College of Education","Teacher Education, Educational Leadership & Policy (TEELP)",
"College of Fine Arts","Art & Art History",
"College of Fine Arts","Music",
"College of Fine Arts","Theatre & Dance",
"College of Fine Arts","Cinematic Arts",
"College of Nursing","College of Nursing",
"College of Pharmacy","College of Pharmacy",
"College of University Libraries & Learning Sciences","College of University Libraries & Learning Sciences",
"School of Architecture and Planning","Architecture",
"School of Architecture and Planning","Community & Regional Planning",
"School of Architecture and Planning","Landscape Architecture",
"School of Architecture and Planning","Historic Preservation & Regionalism",
"School of Architecture and Planning","Urban & Regional Design",
"School of Engineering","Chemical & Biological Engineering",
"School of Engineering","Civil Engineering",
"School of Engineering","Computer Science",
"School of Engineering","Electrical & Computer Engineering",
"School of Engineering","Mechanical Engineering",
"School of Engineering","Nuclear Engineering",
"School of Law","School of Law",
"School of Medicine","Anesthesiology & Critical Care Medicine",
"School of Medicine","Biochemistry & Molecular Biology",
"School of Medicine","Cell Biology and Physiology",
"School of Medicine","Dental Medicine",
"School of Medicine","Dermatology",
"School of Medicine","Emergency Medicine",
"School of Medicine","Family and Community Medicine",
"School of Medicine","Internal Medicine",
"School of Medicine","Molecular Genetics & Microbiology",
"School of Medicine","Neurology",
"School of Medicine","Neurosciences",
"School of Medicine","Neurosurgery",
"School of Medicine","Obstetrics & Gynecology",
"School of Public Administration","School of Public Administration"
].each { |d| Department.create college: College.find_by_name(d.first),name: d.last }
