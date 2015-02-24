# UNM Candidate Review Application

This application is intended to assist the UNM provost's office, as well as
every college and department, with Candidate Review.

This begins with a candidate dossier upload, which gets converted to PDF.

The dossier then begins the review process.

# Running the application in production
This application needs [foreman](https://github.com/ddollar/foreman), as it uses
environment variables. Copy `development.env` to `.env`, and edit the file to
update it with your own credentials. You will need a
[CloudConvert](https://cloudconvert.com/) API Key, a
[Mandrill](https://mandrill.com/) API Key, and a
[CAS](http://jasig.github.io/cas/4.0.x/index.html) server for authentication.

After creating the `.env` file:

``` bash
$ RAILS_ENV=production rake db:schema:load
$ RAILS_ENV=production rake db:seed
$ foreman start
```
