# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#"owner","role"
#"Department Admin","Tenure and Promotion Candidate"
#"Department Admin","Mid-Probationary Candidate"
#"Department Admin","Full Professor Candidate"
#"Provost's Admin","Department Admin"
#super_user,"Department Faculty"
#"College Admin","College Committee Faculty"
#"Provost's Admin","College Admin"
#"Provest's Admin","Provost's Committee Faculty"
#super_user,"Provost's Admin"
#super_user,"Senior Vice Provost"
#"Provost's Admin""Associate Vice Provost Faculty"

DefaultRole.create(role: "Tenure and Promotion Candidate", owner: "Department Admin")
DefaultRole.create(role: "Mid-Probationary Candidate", owner: "Department Admin")
DefaultRole.create(role: "Full Professor Candidate", owner: "Department Admin")
DefaultRole.create(role: "Department Admin", owner: "College Admin")
DefaultRole.create(role: "Department Faculty", owner: "Department Admin")
DefaultRole.create(role: "College Commitee Faculty", owner: "College Admin")
DefaultRole.create(role: "College Admin", owner: "Provost's Admin")
DefaultRole.create(role: "Provost's Committee Faculty", owner: "Provost's Admin")
DefaultRole.create(role: "Provost's Admin", owner: "Tech User")
DefaultRole.create(role: "Senior Vice Provost", owner: "Tech User")
DefaultRole.create(role: "Tech User", owner: "Tech User") 
