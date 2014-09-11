#### This application is intended to be used to manage the documents and flow of Tenure & Promotion


## General Recursive structure:

## General Feature

 * ### Subfeature

 {Implemented parts}
  * What it does
  * How it works (nontechnical details)
  * Technical details

 {Nonimplemented Parts}
  * _What it will do_
  * _How it will work (nontechnical details)_
  * _Technical details_

Features:

## CAS Authentication
* ### User logs in by UNM Net ID

 #### What it does:
 * Allows users to be automatically identified and registered by UNM Net ID

 #### How it works:
 * Redirects to UNM CAS to log in before allowing anybody to get into the application

 #### Technical Details:
 * Uses RubyCAS rails, code for class
 ```
 Here is the code
 ```

* ### Allow external reviewers through

 #### What it does:
 * Allows external reviewers to log in without a Net ID

 #### How it works:
 * The CAS Redirection is not enabled for some pages, requiring a regular login instead

 #### Technical Details:
 * RubyCAS is defined in a class, the class is escaped for certain pages
 * An external reviewer would be authenticated internally against a database
 ```
 RubyCAS escape code
 ```

## Role-based user registration

* ### Pre-defined roles (can be reconfigured)
#### What it does:
 * Roles allow users to do what they are supposed to do within the scope of the application.

 #### How it works:
 * Roles are currently defined as follows:
   * Senior Vice Provost
   * Provost's Admin
   * Provost's Committee Faculty
   * College Admin
   * College Committee Faculty
   * Department Faculty
   * Department Admin
   * Full Professor Candidate
   * Mid-Probationary Candidate
   * Tenure and Promotion Candidate
   * Tech User

 #### Technical details
  * These roles are currently processed from a CSV file
  * This CSV file has two fields, role and owner.
  * If an owner owns a role, he can manage users that have that role within his or her scope
  * These can be loaded into the database, allowing for higher reconfigurability
```
Code for CSV file
```

* ### Senior Vice Provost Role

 #### What it does:
 * Senior Vice Provost is allowed to add other users at the Provost level

 #### How it works
 * Senior Vice Provost can register the following users:
   * Senior Vice Provost
   * Provost's Admin
   * Provost's Committee Faculty

  #### Technical Details
 * Senior Vice Provost owns the following roles in the CSV (roles.csv):
   * "Senior Vice Provost"
   * "Provost's Admin"
   * "Provost's Committee Faculty"

* ### Provost's Admin Role

 #### What it does:
 * Provost's Admin is allowed to add Provost's Committee and College Admins.

 #### How it works:
 * Provost's Admin can register the following users:
   * Provost's Admin
   * College Admin

 #### Technical Details:
 * Provost's Admin owns the following roles in the CSV (roles.csv):
   * "Provost's Admin"
   * "College Admin"

* ### Provost's Committee Faculty Role

 #### What it does:
 * Provost's Committee Faculty does not register any users

 #### How it works:
 * Provost's Committee Faculty does not need to register any users

 #### Technical Details:
 * Provost's Committee Faculty does not own any roles in the CSV (roles.csv)

* ### College Admin Role

 #### What it does:
 * College Admin is allowed to add other users at the College level

 #### How it works:
 * College Admin can register the following users:
   * College Admin
   * College Committee Faculty
   * Department Admin

 #### Technical Details:
 * College Admin owns the following roles in the CSV (roles.csv):
   * "College Admin"
   * "College Committee Faculty"
   * "Department Admin"

* ### College Committee Faculty Role

 #### What it does:
 * College Committee Faculty does not register any users

 #### How it works:
 * College Committee Faculty does not need to register any users

 #### Technical Details:
 * College Committee Faculty does not own any users in the CSV (roles.csv)

* ### Department Faculty Role

 #### What it does:
 * Department Committee Faculty does not register any users

 #### How it works:
 * Department Committee Faculty does not need to register any users

 #### Technical Details:
 * Department Committee Faculty does not own any users in the CSV (roles.csv)

* ### Department Admin Role

 * #### What it does:
 * Department Admin is allowed to add other users at the Department level
 * #### How it works:
 * Department Admin is allowed to add the following users:
   * Department Admin
   * Department Faculty
   * Full Professor Candidate
   * Mid-Probationary Candidate
   * Tenure and Promotion Candidate

 #### Technical Details:
 * Department Admin owns the following roles in the CSV:
   * Department Admin
   * Department Faculty
   * Full Professor Candidate
   * Mid-Probationary Candidate
   * Tenure and Promotion Candidate

* ### Full Professor Candidate Role

 #### What it does:
 * Full Professor Candidate does not register any users

 #### How it works:
 * Full Professor Candidate does not need to register any users

 #### Technical Details:
 * Full Professor Candidate does not own any users in the CSV (roles.csv)
 * Full Professor Candidate is denied access to the user list page

* ### Mid-Probationary Candidate Role

 #### What it does:
 * Mid-Probationary Candidate does not register any users

 #### How it works:
 * Mid-Probationary Candidate does not need to register any users

 #### Technical Details:
 * Mid-Probationary Candidate does not own any users in the CSV (roles.csv)
 * Mid-Probationary Candidate is denied access to the user list page

* ### Tenure and Promotion Candidate Role

 #### What it does:
 * Tenure and Promotion Candidate does not register any users

 #### How it works:
 * Tenure and Promotion Candidate does not need to register any users

 #### Technical Details:
 * Tenure and Promotion Candidate does not own any users in the CSV (roles.csv)
 * Tenure and Promotion Candidate is denied access to the user list page

* ### Tech User Role

 #### What it does:
 * Tech User registers any user

 #### How it works:
 * Tech User can register any user role

 #### Technical details:
 * Tech user doesn't own any users in the CSV (roles.csv)
 * Tech users are put into a CSV before the app is launched (superuser.csv)
 * A special method is called for tech users called **super_user** in **application_controller.rb**
```
Code for super_user
```

## College and Department Based User Matching
* ### Pre-defined Colleges and Departments (can be reconfigured)

 #### What it does:
 * Colleges and departments define a scope for College and Department level users to work in

 #### How it works:
 * Colleges and Departments are defined as follows:
   * Anderson School of Management
     * Accounting
     * Finance, International, Technology and Entrepreneurship (FITE)
     * Department of Marketing, Information Systems, Information Assurance, & Operations Management Faculty (MIDS)
     * Department of Organizational Studies (DOS)
  * College of Arts & Sciences
    * American Studies
    * Anthropology
    * Biology
    * Chemistry and Chemical Biology
    * Communication & Journalism
    * Earth & Planetary Sciences
    * Economics
    * English
    * Foreign Languages & Literature
    * Geography
    * History
    * Linguistics
    * Mathematics & Statistics
    * Philosophy
    * Physics & Astronomy
    * Political Science
    * Psychology
    * Sociology
    * Spanish & Portuguese
    * Speech & Hearing Sciences
  * College of Education
    * Educational Specialties
    * Health, Exercise, and Sports Sciences (HESS)
    * Individual, Family, and Community Education (IFCE)
    * Language, Literacy, and Sociocultural Studies (LLSS)
    * Teacher Education, Educational Leadership & Policy (TEELP)
  * College of Fine Arts
    * Art & Art History
    * Music
    * Theatre & Dance
    * Cinematic Arts
  * College of Nursing
    * College of Nursing
  * College of Pharmacy
    * College of Pharmacy
  * College of University Libraries & Learning Sciences
    * College of University Libraries & Learning Sciences
  * College of Architecture and Planning
    * Architecture
    * Community & Regional Planning
    * Landscape Architecture
    * Historic Preservation & Regionalism
    * Urban & Regional Design
  * School of Engineering
    * Chemical & Bioloigical Engineering
    * Civil Engineering
    * Computer Science
    * Electrical & Computer Engineering
    * Mechanical Engineering
    * Nuclear Engineering
  * School of Law
    * School of Law
  * School of Medicine
    * Anesthesiology & Critical Care Medicine
    * Biochemistry & Molecular Biology
    * Cell Biology and Physiology
    * Dental Medicine
    * Dermatology
    * Emergency Medicine
    * Family and Community Medicine
    * Internal Medicine
    * Molecular Genetics & Microbiology
    * Neurology
    * Neurosciences
    * Neurosurgery
    * Obstetrics & Gynecology
  * School of Public Administration
    * School of Public Administration

 #### Technical Details:
 * These values are stored in a CSV files (departments.csv) as college,department
 * These can be pulled into the database for storage if it's preferable.

* ### Users operate within their own scope

 #### What it does:
 * Users only see other users and files within their own scope
 * Users can attach files to users within their scope

 #### How it works:
 * Users are assigned to the Provost, College, Department, or Personal level
 * Users at the Provost level can see all files at the college level.
 * Users at the college level can see all files at the department level within their college
 * Users at the department level can see all files at the personal level within their department
 * Users at the personal level can see their own files
 * Users are assigned as follows:
   * Provost Level
     * Senior Vice Provost
     * Provost's Admin
     * Provost's Committee Faculty
   * College Level
     * College Admin
     * College Committee Faculty
   * Department Level
     * Department Admin
     * Department Faculty
   * Personal Level
     * Full Professor Candidate
     * Mid-Probationary Candidate
     * Tenure and Promotion Candidate
     * Tech User

 #### Technical Details:
 * The roles belonging to users in the User Registration are also constrained by this scope
 * Tech users cannot see anyone's files, even though they can register any user

## Dossier Creation and Categories

* ### Pre-defined Categories (can be reconfigured)

 #### What it does
 * Categories are pre-defined for each candidate according to a convention

 #### How it works
 * When a candidate is registered, categories are created for him or her.
 * The categories are as follows:
   * Curriculum Vitae
   * Teaching Statement
   * Research Statement
   * Teaching Record
   * Summary of Student Evaluations
   * Course Materials
   * External Reviews
   * Department Vote and Comments
   * Letter from Department Chair
   * College Committee Vote and Comments
   * Letter from Dean
   * Supplemental Materials
  * These categories will each have different users put files into them, but will all belong to a single candidate

 #### Technical Details:
 * These are defined in a CSV file (categories.CSV)
 * They may be defined in a database instead if convenient
 * When a user is created, the following is called:
   ```
   Code for user creation
   ```


* ### All files fit into a category, owned by a user

 #### What it does:
 * All files uploaded into a dossier for a candidate fit into a category

 #### How it works:
 * Multiple files may be uploaded to each category
 * Only users who own each category can upload to it
 * Category ownership is as follows:
   * Candidate:
     * Curriculum Vitae
     * Teaching Statement
     * Research Statement
     * Teaching Record
     * Summary of Student Evaluations
     * Course Materials
     * Supplemental Materials
   * Department Admin
     * External Reviews
     * Department Vote and Comments
     * Letter from Department Chair
   * College Admin
     * College Committee Vote and Comments
     * Letter from Dean

 #### Technical Details:
 * Each user will be able to see that all categories exist, but will be allowed access based on scope
 * There will have to be a system in which College Admins and Department Admins operate within the scope of a candidate to access candidates' categories

* ### All files are converted into standard PDF

 #### What it does:
 * After being uploaded, all files that can be converted into a PDF will be converted into a PDF

 #### How it works:
 * After uploading files, the person who uploaded clicks a button, and the app converts them to PDF
 * This conversion is done by an external service called [CloudConvert](http://cloudconvert.org).
 * Files that can't be converted to PDF are stored in file storage and linked to from a PDF.
 * Each file is stored as an individual PDF

 #### Technical Details:
 * This runs a loop and sends each file in the dossier to CloudConvert
 * After conversion is complete the app redownloads it
 * This must be done asynchronously, or the client will experience lag (that is the case now)
 * These raw files must either be deleted or secured after the conversion
 * Here's how it currently works:
 ```
 CloudConvert code
 ```

* ### PDFs are merged into a single PDF, indexed, and served with all files relevant to a user

 #### What it does:
 * When a user download's a candidate's dossier, he or she receives a single file with all files that fall within his or her scope.

 #### How it works:
 * The application checks which categories the user owns relevant to the cadidate
 * The application takes the individual stored PDFs and merges them into a large one
 * The application creates an index that has the following structure:
   * Category
     * File
       * Page 1
       * Page 2
     * File
       * Page 1
       * Page 2
   * Category
     * File
       * Page 1

 #### Technical Details:
 * The indexing needs to be able to retrieve the file names
 * This is also dependent on other users being able to work within a candidate's scope
 * This is currently done within a big nasty loop:
 ```
 shrimp code here
 ```

## E-mail Reminders

* ### Invitation sent when users are registered (Welcome e-mail)

 #### What it does:
 * Users are sent a link to the application when they are registered

 #### How it works:
 * A template is stored within the application as a welcome e-mail
 * This template sends the e-mail to the user based on netid@unm.edu, and includes his or her name
 * This template will be made editable
 * The e-mail is sent when a user is registered

 #### Technical Details:
 * This e-mail is sent using Action Mailer and Mandrill.
 * In order to be editable, we will need to provide the user with an HTML/ERB editor.
 * This code is called when a user is created:
 ```
 user.create
 ```

* ### E-mail reminders by date

 #### What it does:
 * When deadlines are coming up, faculty members are automatically sent e-mail reminders

 #### How it works:
 * Deadline dates will be saved in the application
 * The e-mail will be sent to all staff signed up for the application before the deadline

 #### Technical Details:
 * This is dependent on the dates being stored somewhere
 * The dates can be stored in a CSV (dates.csv) or in the database
 * This is dependent on the server periodically checking time, perhaps we run some kind of scheduler on the server.

* ### E-mail reminders by event

 #### What it does:
 * E-mails are automatically sent when a user needs to take an action

 #### How it works:
 * When documents are submitted within the application, the next user in the chain is notified.
 * The chain looks like this:
   1. Candidate submits dossier >> Department Faculty and Department Admin are notified
   2. Departmin Admin submits letter >> College Admin is notified
   3. College Admin verifies Department process >> College Committee Faculty is notified
   4. College Admin submits letter >> Provost's Admin is notified
   5. Provost's Admin verifies College process >> Provost's Committee Faculty and Senior Vice Provost are notified
 * These e-mails will be based on templated in the application

 #### Technical Details:
 * Each of these events needs to trigger a mailer
 * This would be the same event that locks users out of their categories
 * Something needs to be done about negative decisions

## Archiving

* ### Long-term storage

 #### What it does:
 * Stores dossier files for the long-term

 #### How it works:
 * After the process is complete, the files are moved (right now manually) to long-term storage
 * The final PDF that was seen at the Provost level, along with materials linked to from the PDF will be included.
 * A Provost's Admin may save his or her version of the PDF, or a Tech User may be granted a special permission to create the PDF.
 * This long-term storage will be secure.

 ### Technical Details:
 * Provost's Admins would be best suited to this role, so Tech Users do not have to access privileged information
 * This long-term storage could be within UNM IT, or on a local hard drive, or in a secure cloud
 * This archive should have AT LEAST one backup

* ### Deleting Files

 #### What it does:
 * Clears files out of the application and archives

 #### How it works:
 * A Provost Admin or specially designated Tech User will delete files (right now manually)
 * Files may be deleted from the application once they are put into long-term storage
 * Files may be deleted from long-term storage once a certain length of time has passed

 #### Technical Details:
 * A Tech User may be best suited to this role, as he or she can delete files without being able to view them.
 * Deleting files from the app may be somehat tricky.
 * Deleting a candidate from the app currently deletes all files from within his or her categories
