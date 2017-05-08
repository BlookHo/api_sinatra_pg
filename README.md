#### add new favicon You have to reload the page skipping the cache. - place it to /public
#### then: Ctrl + Shift + R
#### OR Ctrl + F5



## Start

### Here Postgresql is using. To start: before:
 
```bash
# Installing Postgres
sudo apt-get -y install postgresql postgresql-contrib postgresql-server-dev-9.5
# Creating the role with privileges
# -s makes a superuser, -r allows role creation, -d allows DB creation
sudo -u postgres createuser -srd sinatra_admin

# Creating the DBs
sudo -u postgres createdb sinatra_seq_dev
sudo -u postgres createdb sinatra_seq_test
sudo -u postgres createdb sinatra_seq_prod
# Allowing Postgres to listen all ports
echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/9.5/main/postgresql.conf
echo "host all all all trust" | sudo tee -a /etc/postgresql/9.5/main/pg_hba.conf
sudo -u postgres psql -c "ALTER ROLE sinatra_admin WITH PASSWORD 'password';"
sudo service postgresql restart
```

### Create ActiveRecord migrations for Postgresql databases: 

``bush
rake db:create_migration NAME=geeks
db/migrate/20170218112044_geeks.rb
``
__repeat for jobs, companies and applies__

## Sequel - see main DOC's here:

Getting Started with Sequel [Getting Startedl: ](http://tutorials.jumpstartlab.com/topics/sql/sequel.html)

Diff between [AR and Sequel: ](https://mrbrdo.wordpress.com/2013/10/15/why-you-should-stop-using-activerecord-and-start-using-sequel/)

Sequel [for SQL Users](http://sequel.jeremyevans.net/rdoc/files/doc/sql_rdoc.html)

ActiveRecord users transition to [Sequel](http://sequel.jeremyevans.net/rdoc/files/doc/active_record_rdoc.html)

Sequel main [README](http://sequel.jeremyevans.net/rdoc/files/README_rdoc.html)

Sequel [Cheat Sheet](http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html)

Sequel [ClassMethods](http://sequel.jeremyevans.net/rdoc/classes/Sequel/Model/ClassMethods.html)

Sequel [Dataset Filtering](http://sequel.jeremyevans.net/rdoc/files/doc/dataset_filtering_rdoc.html)


### Connect to database

````
DB = Sequel.connect(
  adapter: :postgres,
  database: 'sinatra_seq_dev',
  host: 'localhost',
  password: 'password',
  user: 'sinatra_admin',
  max_connections: 10,
  # logger: Logger.new('log/db.log')
  )
  
  OR
  
DB = Sequel.connect('postgres://sinatra_admin:password@localhost/sinatra_seq_dev')
````

### Create Sequel migrations for Postgresql databases: 
In terminal project folder:

__sequel -d postgres://sinatra_admin:password@localhost/sinatra_seq_dev > db/migrate/001_create_jobs_migration.rb__

### To create a database with all the tables by RUN all migrations:
In terminal project folder: (sequel -m path/to/migrations postgres://host/database)

__bundle exec sequel -m db/migrate postgres://db/sinatra_seq_dev__
or
__sequel -m db/migrate postgres://sinatra_admin:password@localhost/sinatra_seq_dev__

### RUN all migrations: - by rake task hand made:
In terminal project folder:
__rake db:migrate__
Migrated to latest

#### NOTE: Migrations should run (have numbers) in accordance with content apperance.

Sequel was not designed specifically with Rails in mind, and unfortunately does not integrate with Rails by itself 

 Sequel:

Plays nice with threads, unlike ActiveRecord which has problems I discuss at the end of the post.
Allows you to avoid SQL code fragments 99% of the time, if you want and without screwing with core Ruby classes.
Modular design with plugins and extensions.
Foreign key constraint support in migrations out of the box.
Left join support. Heh.
More powerful association preloading.
Querying in Sequel is immensely more powerful compared to ActiveRecord. You can do almost anything without writing any SQL.


### Import data to Postgres database

Files with json data to be seeded - in ./seeds/ folder:

#### Create seed file for model :companies

```
Sequel.seed(:development, :test) do # Applies only to "development" and "test" environments
  def run

    dataset = DB[:companies]

    dataset.insert(:name => 'MoGo', :location => 'New York')
    dataset.insert(:name => 'Wirkkle', :location => 'London')
    dataset.insert(:name => 'Artesis', :location => 'Saint-Petersburg')
    dataset.insert(:name => 'BuildEmpire', :location => 'London')
  end
end
```

#### To seed from created files:
```
Sequel::Seed.setup :development
Sequel.extension :seed
Sequel::Seeder.apply(DB, './seeds')
```
## SEQUEL Console to DataBase

In terminal:
````
$ sequel postgres://sinatra_admin:password@localhost/sinatra_seq_dev
=> Your database is stored in DB...
dataset = DB[:companies]
=> #<Sequel::Postgres::Dataset: "SELECT * FROM \"companies\"">
irb(main):005:0> dataset.all
=> [{:id=>1, :name=>"MoGo", :location=>"New York", :created_at=>nil, :upated_at=>nil}, {:id=>2, :name=>"Wirkkle", :location=>"London", :created_at=>nil, :upated_at=>nil}, {:id=>3, :name=>"Artesis", :location=>"Saint-Petersburg", :created_at=>nil, :upated_at=>nil}, {:id=>4, :name=>"BuildEmpire", :location=>"London", :created_at=>nil, :upated_at=>nil}]
irb(main):006:0> dataset.count
=> 4
irb(main):007:0> dset_jobs=DB[:jobs]
=> #<Sequel::Postgres::Dataset: "SELECT * FROM \"jobs\"">
irb(main):008:0> dset_jobs.count
=> 7
````


####  In terminal:

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

#### 5. All jobs of one company

__GET http://localhost:4567/api/v1/jobs_company/Wirkkle__

where Wirkkle - name of company

response:

[
  {
    "id": 2,
    "name": "Ruby React",
    "company_id": 2,
    "place": "Contract"
  },
  {
    "id": 8,
    "name": "Jira",
    "company_id": 2,
    "place": "Remote"
  },
]




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

#### 11. All invited/denied applications

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


