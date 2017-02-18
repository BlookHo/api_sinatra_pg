### Start

### Here MongoDB is using. To start: before: 

__sudo service mongod start__

__sudo service mongod stop__
__sudo service mongod restart__

### Import data to MongoDB collection

Files with json data to be seeded - in ./seeds/ folder:

#### To seed:
In terminal - in project folder put command (having Mongo server already started):

__mongoimport --db mongo_hirer_dev --collection jobs --file seeds/jobs_seed.json__

__mongoimport --db mongo_hirer_dev --collection companies --file seeds/companies_seed.json__

__mongoimport --db mongo_hirer_dev --collection geeks --file seeds/geeks_seed.json__

__mongoimport --db mongo_hirer_dev --collection applies --file seeds/applies_seed.json__


####  In terminal:

__mongo__

> __use mongo_hirer_dev__
switched to db mongo_hirer_dev

> __show collections__
companys
geeks
jobs
> db.jobs.drop()
true
> db.jobs.find()
> 


## API endpoints

### Root
__GET http://localhost:4567__

### Geeks

#### 1. All geeks, filtered by name and stack

__GET http://localhost:4567/api/v1/geeks?name=mi__

where mi - name of geek 'Mike'

response:
[
  {
    "_id": {
      "$oid": "589f01c85a49894908146ee0"
    },
    "name": "Mike",
    "resume": true,
    "stack": "Sinatra React"
  }
]

__GET http://localhost:4567/api/v1/geeks?stack=jA__

where mi - name of geek stack 'Java'

response:
[
  {
    "_id": {
      "$oid": "589f01c85a49894908146ee3"
    },
    "name": "Juri",
    "resume": true,
    "stack": "Java"
  }
]

#### 2. Create new geek (by self geek)
__POST http://localhost:4567/api/v1/geek?name=Sergey;stack=Руби он Рейлс;resume=false__
where : 
__request.params = {"name":"Sergey","stack":"Руби он Рейлс","resume":"false"}__

response:
[
  "_id": {
    "$oid": "58a71adae6183721cbb726f7"
  },
  "name": "Sergey",
  "resume": false,
  "stack": "Руби он Рейлс"
]

#### 3. Delete geek (by Admin)
__DELETE http://localhost:4567/api/v1/geek/58a566d6e61837294749441a__
where id of geek 58a566d6e61837294749441a.

response:
geek id = BSON::ObjectId('58a566d6e61837294749441a') 
Status = 204


#### 4. All read/unread applications OR read/unread app-s of one geek.
__GET http://localhost:4567/api/v1/geek_applies_read__
__GET http://localhost:4567/api/v1/geek_applies_unread__
__GET http://localhost:4567/api/v1/geek_applies_read?name=mi__
__GET http://localhost:4567/api/v1/geek_applies_unread?name=mi__

where mi - name of geek 'Mike'

response:
[
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f25335e"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee0"
    },
    "invited": true,
    "job_id": {
      "$oid": "589f01385a49894908146ebb"
    },
    "read": true
  }
]

#### 5. All invitations (invited applications) of one geek OR denied apps.
__GET http://localhost:4567/api/v1/geek_applies_invited?name=mi__
__GET http://localhost:4567/api/v1/geek_applies_denied?name=mi__

where mi - name of geek 'Mike'

response:
[
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f25335e"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee0"
    },
    "invited": true,
    "job_id": {
      "$oid": "589f01385a49894908146ebb"
    },
    "read": true
  }
]

#### 6. Update info of one geek (by self geek)
__PUT http://localhost:4567/api/v1/geek/58a5e6fbe618370d771f708a?name=AlBina;stack=Haml__
where id of geek 58a5e6fbe618370d771f708a. Params to be updated: 
__request.params = {"name"=>"AlBina", "stack"=>"Haml"}__

response:
[
  {
    "_id": {
      "$oid": "58a5e6fbe618370d771f708a"
    },
    "name": "AlBina",
    "resume": false,
    "stack": "Haml"
  }
]

#### 7. Upload resume (update) by one geek
__PUT http://localhost:4567/api/v1/upload_resume/58a70760e6183712d5064c36__
where id of geek 58a70760e6183712d5064c36. Field to be updated: 
__{resume: true}__

response:
[
  {
    "_id": {
      "$oid": "58a70760e6183712d5064c36"
    },
    "name": "Anna",
    "resume": true,
    "stack": "Rails"
  }
]

#### 8. Get one geek ID

__GET http://localhost:4567/api/v1//geek_id?name=a__

where a - name of geek 'Alex'

response:
{
  "$oid": "589f01c85a49894908146ee1"
}

#### 9. All applications of one geek, filtered by geek's name
__GET http://localhost:4567/api/v1/geek_applied?name=mi__

where mi - name of geek 'Mike'

response:
[
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f25335e"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee0"
    },
    "invited": true,
    "job_id": {
      "$oid": "589f01385a49894908146ebb"
    },
    "read": true
  }
]

### Jobs

#### 1. All jobs, filtered by __name__ and __place__

__GET http://localhost:4567/api/v1/jobs?name=si__

where si - name of job 'Sinatra React'

response:
[
  {
    "_id": {
      "$oid": "58a19b8197e086e9ceb02500"
    },
    "company_id": {
      "$oid": "58a0226677af2390cbccd265"
    },
    "description": "This is a nice remote job.",
    "name": "Sinatra React",
    "place": "Remote"
  }
]

#### 2. Create new job by one company
__POST http://localhost:4567/api/v1/job?company_id=58a0226677af2390cbccd265;name=Jira;place=Remote__
where : 
__request.params = {"name":"Sergey","stack":"Руби он Рейлс","resume":"false"}__

response:
[
{
  "_id": {
    "$oid": "58a807bde618372710b2b680"
  },
  "company_id": "58a0226677af2390cbccd265",
  "description": null,
  "name": "Jira",
  "place": "Remote"
}
]

#### 3. Delete job (Admin)
__DELETE http://localhost:4567/api/v1/job/58a566d6e61837294749441a__
where id of job 58a566d6e61837294749441a.

response:
job id = BSON::ObjectId('58a566d6e61837294749441a') 
Status = 204

#### 4. Update info of one job (by one company)
__to be done as exercise__


### Companies

#### 1. All companies, filtered

__GET http://localhost:4567/api/v1/companies__

response:
[
  {
    "_id": {
      "$oid": "58a0226677af2390cbccd265"
    },
    "location": "New York",
    "name": "MoGo"
  },
  {
    "_id": {
      "$oid": "58a0226677af2390cbccd266"
    },
    "location": "London",
    "name": "Wirkkle"
  },
  {
    "_id": {
      "$oid": "58a0226677af2390cbccd267"
    },
    "location": "Saint-Petersburg",
    "name": "Artesis"
  },
  {
    "_id": {
      "$oid": "58a0226677af2390cbccd268"
    },
    "location": "London",
    "name": "BuildEmpire"
  }
]

#### 2. Create new company
__to be done as exercise__

#### 3. Delete company (Admin)
__DELETE http://localhost:4567/api/v1/job/58a566d6e61837294749441a__
where id of job 58a566d6e61837294749441a.

response:
job id = BSON::ObjectId('58a566d6e61837294749441a') 
Status = 204

#### 4. Update info of one company (by self company)
__to be done as exercise__

#### 5. All jobs of one company

__GET http://localhost:4567/api/v1/company_jobs?name=bu__

where bu - name of company 'BuildEmpire'

response:
[
  {
    "_id": {
      "$oid": "58a19b8197e086e9ceb02504"
    },
    "company_id": {
      "$oid": "58a0226677af2390cbccd268"
    },
    "description": "Big refactoring and RSpec job for production project.",
    "name": "Ruby on Rails",
    "place": "Remote"
  },
  {
    "_id": {
      "$oid": "58a19b8197e086e9ceb02505"
    },
    "company_id": {
      "$oid": "58a0226677af2390cbccd268"
    },
    "description": "Huge ambitious startup.",
    "name": "Node",
    "place": "Permanent"
  },
  {
    "_id": {
      "$oid": "58a19b8197e086e9ceb02506"
    },
    "company_id": {
      "$oid": "58a0226677af2390cbccd268"
    },
    "description": "A lot of front end design.",
    "name": "Javascript CSS HTML",
    "place": "Permanent"
  }
]


### Applications

#### 1. All applications, filtered. (Admin)

__GET http://localhost:4567/api/v1/applies__

response:
[
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f25335e"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee0"
    },
    "invited": true,
    "job_id": {
      "$oid": "589f01385a49894908146ebb"
    },
    "read": true
  },
...
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f253361"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee8"
    },
    "invited": false,
    "job_id": {
      "$oid": "589f01385a49894908146ec1"
    },
    "read": false
  }
]

#### 2. Create new application - to apply to one job by one geek. Can not create application without resume uploaded by geek.
__to be done as exercise__

#### 3. All applications to one job of one company
__to be done as exercise__

#### 4. All geeks, applied to one company
__to be done as exercise__

#### 6. Delete application (by Admin)
__DELETE http://localhost:4567/api/v1/applies/58a566d6e61837294749441a__
where id of applies 58a566d6e61837294749441a.

response:
job id = BSON::ObjectId('58a566d6e61837294749441a') 
Status = 204

#### 7. Read one application (update) by company applied to
__to be done as exercise__

#### 9. Invite geek of one application (update) by company applied to
__to be done as exercise__

#### 10. All read/unread applications

__GET http://localhost:4567/api/v1/applies_read__
 or 
__GET http://localhost:4567/api/v1/applies_unread__
response (unread):

[
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f25335f"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee1"
    },
    "invited": false,
    "job_id": {
      "$oid": "589f01385a49894908146ebc"
    },
    "read": false
  },
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f253361"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee8"
    },
    "invited": false,
    "job_id": {
      "$oid": "589f01385a49894908146ec1"
    },
    "read": false
  }
]

#### 11. All read/unread applications

__GET http://localhost:4567/api/v1/applies_invited__
 or 
__GET http://localhost:4567/api/v1/applies_denied__
response (invited):

[
  {
    "_id": {
      "$oid": "58a07a44885ce7e31f25335e"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee0"
    },
    "invited": true,
    "job_id": {
      "$oid": "589f01385a49894908146ebb"
    },
    "read": true
  }
]


