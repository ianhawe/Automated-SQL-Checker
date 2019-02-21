<img src="https://media.licdn.com/dms/image/C560BAQHGBikARgsz5A/company-logo_200_200/0?e=2159024400&v=beta&t=ooHEmQP3Cswkus82FU4hMSwZJU-1z1nD-J2j4lMe5zI" height="100" width="100"> 

# Sparta-Project-2 / SQL-Automation-Checker-App

## Description
For this project, we have created an automated SQL checker application which automatically compares the answers written by trainees during their SQL assessment against the expected answers stored in a created database. Once trainees have completed their assessments, test results are produced for the trainers in Sparta Global which avoids the chance of human error or ambiguities when marking the assessments manually. The automated application provides an efficient way for trainers to evaluate their streams as a collective as well as individual trainee performance. This application is now integrated with the Internal Management System.

## Technologies used
* Ruby
* JavaScript
* HTML
* CSS
* Jira
* GitHub
* Microsoft Teams
* VS Code
* Google Chrome Dev Tools

# Frameworks
* Sinatra
* Bootstrap

## Prerequisites/Installation
* Have the internal management system running (If you do not have it go to: <https://github.com/spartaglobal/InternalManagementSystem>)

### Clone Repo 
``` 
git clone https://github.com/ianhawe/Automated-SQL-Checker.git
```

### Creating the database
 Manually create the database called spartaaapsql then run the seed file:
 
```
  psql -U postgres
  CREATE DATABASE spartaappsql
  \q
```

Then in terminal run: 

```
psql -U postgres -d user_management -f seed.sql
```

**You will also need to create the [Internal Mangement System](https://github.com/spartaglobal/InternalManagementSystem ) database for it to work**

Run `bundle` to install all of the gems needed to run. 

Type in: 
`
rackup -p 3000` This will run the sql checker on port 3000.

Open Chrome and type in `localhost:3000`

**You will need to have the [Internal Management System](https://github.com/spartaglobal/InternalManagementSystem) running**

## Challenges
1. Connecting with the TAR file
2. Normalisation of the database tables 
3. Translating the SQL queries from the student selected SQL language (datatypes)
4. Calling from the API
5. Sessions and cookies
6. Time constraints

## Learning points
1. Better understanding of Ruby/Sinatra and how to apply gems in a full stack application
2. Understanding the importance of normalisation within database schemas

## To do
1. Make it look according to the wireframes
2. Hosted on Heroku
3. Refine query check

### Created by:
*Engineering-21*
