### Start

### Here MongoDB is using. To start: before: 

__sudo service mongod start__

__sudo service mongod stop__
__sudo service mongod restart__

### Import data to MongoDB collection

File with json data to be seeded - seeds/jobs_seed.json:


{ "company": "MoGo", "name": "Sinatra React", "place": "Remote" }
{ "company": "Wirkkle", "name": "Ruby + React", "place": "Contract" }
{ "company": "Artesis", "name": "React", "place": "Remote" }


In terminal - in project folder put command (having Mongo server already started):


__ mongoimport --db mongo_hirer_dev --collection jobs --file seeds/jobs_seed.json__
__ mongoimport --db mongo_hirer_dev --collection companies --file seeds/companies_seed.json__
__ mongoimport --db mongo_hirer_dev --collection geeks --file seeds/geeks_seed.json__
__ mongoimport --db mongo_hirer_dev --collection applies --file seeds/applies_seed.json__


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


Output terminal:

2017-02-09T12:17:18.062+0300	connected to: localhost
2017-02-09T12:17:18.064+0300	imported 3 documents

#### Working with MongoDB shell in terminal Ubuntu
#### https://docs.mongodb.com/manual/reference/mongo-shell/

$ sudo service mongod start
[sudo] password for flyingminer: 
flyingminer@flyingminer-hp-envy-x360-convertible:~/RubymineProjects/Sinatra/api_hirer$ mongo
MongoDB shell version v3.4.2

> show dbs
admin            0.000GB
local            0.000GB
mongo_hirer_dev  0.000GB
> use mongo_hirer_dev 
switched to db mongo_hirer_dev
> db
mongo_hirer_dev
> show collections
geeks
jobs
>
db.geeks.help()
DBCollection help
	db.geeks.find().help() - show DBCursor help
	db.geeks.bulkWrite( operations, <optional params> ) - bulk execute write operations, optional parameters are: w, wtimeout, j

db.geeks.count( query = {}, <optional params> ) - count the number of documents that matches the query, optional parameters are: limit, skip, hint, maxTimeMS
> db.geeks.count()
9

	db.geeks.copyTo(newColl) - duplicates collection by copying all documents to newColl; no indexes are copied.
	db.geeks.convertToCapped(maxBytes) - calls {convertToCapped:'geeks', size:maxBytes}} command
	db.geeks.createIndex(keypattern[,options])
	db.geeks.createIndexes([keypatterns], <options>)
	db.geeks.dataSize()
	db.geeks.deleteOne( filter, <optional params> ) - delete first matching document, optional parameters are: w, wtimeout, j
	db.geeks.deleteMany( filter, <optional params> ) - delete all matching documents, optional parameters are: w, wtimeout, j
	db.geeks.distinct( key, query, <optional params> ) - e.g. db.geeks.distinct( 'x' ), optional parameters are: maxTimeMS
	db.geeks.drop() drop the collection
	db.geeks.dropIndex(index) - e.g. db.geeks.dropIndex( "indexName" ) or db.geeks.dropIndex( { "indexKey" : 1 } )
	db.geeks.dropIndexes()
	db.geeks.ensureIndex(keypattern[,options]) - DEPRECATED, use createIndex() instead
	db.geeks.explain().help() - show explain help
	db.geeks.reIndex()
	db.geeks.find([query],[fields]) - query is an optional query filter. fields is optional set of fields to return.
	                                              e.g. db.geeks.find( {x:77} , {name:1, x:1} )
	db.geeks.find(...).count()
	db.geeks.find(...).limit(n)
	db.geeks.find(...).skip(n)
	db.geeks.find(...).sort(...)
	db.geeks.findOne([query], [fields], [options], [readConcern])
	db.geeks.findOneAndDelete( filter, <optional params> ) - delete first matching document, optional parameters are: projection, sort, maxTimeMS
	db.geeks.findOneAndReplace( filter, replacement, <optional params> ) - replace first matching document, optional parameters are: projection, sort, maxTimeMS, upsert, returnNewDocument
	db.geeks.findOneAndUpdate( filter, update, <optional params> ) - update first matching document, optional parameters are: projection, sort, maxTimeMS, upsert, returnNewDocument
	db.geeks.getDB() get DB object associated with collection
	db.geeks.getPlanCache() get query plan cache associated with collection
	db.geeks.getIndexes()
	db.geeks.group( { key : ..., initial: ..., reduce : ...[, cond: ...] } )
	db.geeks.insert(obj)
	db.geeks.insertOne( obj, <optional params> ) - insert a document, optional parameters are: w, wtimeout, j
	db.geeks.insertMany( [objects], <optional params> ) - insert multiple documents, optional parameters are: w, wtimeout, j
	db.geeks.mapReduce( mapFunction , reduceFunction , <optional params> )
	db.geeks.aggregate( [pipeline], <optional params> ) - performs an aggregation on a collection; returns a cursor
	db.geeks.remove(query)
	db.geeks.replaceOne( filter, replacement, <optional params> ) - replace the first matching document, optional parameters are: upsert, w, wtimeout, j
	db.geeks.renameCollection( newName , <dropTarget> ) renames the collection.
	db.geeks.runCommand( name , <options> ) runs a db command with the given name where the first param is the collection name
	db.geeks.save(obj)
	db.geeks.stats({scale: N, indexDetails: true/false, indexDetailsKey: <index key>, indexDetailsName: <index name>})
	db.geeks.storageSize() - includes free space allocated to this collection
	db.geeks.totalIndexSize() - size in bytes of all the indexes
	db.geeks.totalSize() - storage allocated for all data and indexes
	db.geeks.update( query, object[, upsert_bool, multi_bool] ) - instead of two flags, you can pass an object with fields: upsert, multi
	db.geeks.updateOne( filter, update, <optional params> ) - update the first matching document, optional parameters are: upsert, w, wtimeout, j
	db.geeks.updateMany( filter, update, <optional params> ) - update all matching documents, optional parameters are: upsert, w, wtimeout, j
	db.geeks.validate( <full> ) - SLOW
	db.geeks.getShardVersion() - only for use with sharding
	db.geeks.getShardDistribution() - prints statistics about data distribution in the cluster
	db.geeks.getSplitKeysForChunks( <maxChunkSize> ) - calculates split points over all chunks and returns splitter function
	db.geeks.getWriteConcern() - returns the write concern used for any operations on this collection, inherited from server/db if set
	db.geeks.setWriteConcern( <write concern doc> ) - sets the write concern for writes to the collection
	db.geeks.unsetWriteConcern( <write concern doc> ) - unsets the write concern for writes to the collection
	db.geeks.latencyStats() - display operation latency histograms for this collection
> 

> db.geeks.find().help()
find(<predicate>, <projection>) modifiers
	.sort({...})
	.limit(<n>)
	.skip(<n>)
	.batchSize(<n>) - sets the number of docs to return per getMore
	.collation({...})
	.hint({...})
	.readConcern(<level>)
	.readPref(<mode>, <tagset>)
	.count(<applySkipLimit>) - total # of objects matching query. by default ignores skip,limit
	.size() - total # of objects cursor would return, honors skip,limit
	.explain(<verbosity>) - accepted verbosities are {'queryPlanner', 'executionStats', 'allPlansExecution'}
	.min({...})
	.max({...})
	.maxScan(<n>)
	.maxTimeMS(<n>)
	.comment(<comment>)
	.snapshot()
	.tailable(<isAwaitData>)
	.noCursorTimeout()
	.allowPartialResults()
	.returnKey()
	.showRecordId() - adds a $recordId field to each returned object

Cursor methods
	.toArray() - iterates through docs and returns an array of the results
	.forEach(<func>)
	.map(<func>)
	.hasNext()
	.next()
	.close()
	.objsLeftInBatch() - returns count of docs left in current batch (when exhausted, a new getMore will be issued)
	.itcount() - iterates through documents and counts them
	.getQueryPlan() - get query plans associated with shape. To get more info on query plans, call getQueryPlan().help().
	.pretty() - pretty print each document, possibly over multiple lines
> 
 db.geeks.find()
{ "_id" : ObjectId("589c3843b19518ab5b3d3419"), "name" : "Mike", "stack" : "Sinatra React", "resume" : "Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d341a"), "name" : "Alex", "stack" : "Ruby React", "resume" : "Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d341b"), "name" : "Martha", "stack" : "Rails", "resume" : "Not Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d341c"), "name" : "Juri", "stack" : "Java", "resume" : "Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d341d"), "name" : "Andrew", "stack" : "PHP", "resume" : "Not Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d341e"), "name" : "Nina", "stack" : "Node", "resume" : "Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d341f"), "name" : "Bob", "stack" : "Front end", "resume" : "Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d3420"), "name" : "Kate", "stack" : "PHP", "resume" : "Not Uploaded" }
{ "_id" : ObjectId("589c3843b19518ab5b3d3421"), "name" : "Boris", "stack" : "Full stack", "resume" : "Uploaded" }
> db.geeks.findOne({"_id": ObjectId("589c3843b19518ab5b3d341c")})
  {
  	"_id" : ObjectId("589c3843b19518ab5b3d341c"),
  	"name" : "Juri",
  	"stack" : "Java",
  	"resume" : "Uploaded"
  }
  > > var res = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})
    > res
    {
            "_id" : ObjectId("589eef5766b82271b17efb78"),
            "name" : "Вася",
            "stack" : "Algol"
    }
    > res["stack"]
    Algol
    > var res = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})["stack"]
    > res
    Algol
    > var res = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})["_id"]
    > res
    ObjectId("589eef5766b82271b17efb78")
    
    >db.geeks.updateOne({"_id": ObjectId("589eef5766b82271b17efb78")}, $set: { "name" : "Коля" } )
     2017-02-11T14:13:43.975+0300 E QUERY    [thread1] SyntaxError: missing ) after argument list @(shell):1:70
     > db.geeks.updateOne({"_id": ObjectId("589eef5766b82271b17efb78")}, { $set: { "name" : "Коля" } } )
     { "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
     > var res = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})["name"]
     > res
     Коля
     > 
     
> var res = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})["_id"]
> res
ObjectId("589eef5766b82271b17efb78")
> db.geeks.updateOne({"_id": ObjectId("589eef5766b82271b17efb78")}, { $set: { "name" : res } } )
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
> var res = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})["name"]
> res
ObjectId("589eef5766b82271b17efb78")
> var res = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})
> res
{
        "_id" : ObjectId("589eef5766b82271b17efb78"),
        "name" : ObjectId("589eef5766b82271b17efb78"),
        "stack" : "Algol"
}
> 

 var name = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})["name"]
> name
ObjectId("589eef5766b82271b17efb78")
> var geek_one = db.geeks.findOne({"name": name})["name"]
> geek_one
ObjectId("589eef5766b82271b17efb78")
> var geek_one = db.geeks.findOne({"name": name})
> geek_one
{
        "_id" : ObjectId("589eef5766b82271b17efb78"),
        "name" : ObjectId("589eef5766b82271b17efb78"),
        "stack" : "Algol"
}


 idGeek = db.geeks.findOne({"_id": ObjectId("589eef5766b82271b17efb78")})["_id"]
ObjectId("589eef5766b82271b17efb78")
> idGeek
ObjectId("589eef5766b82271b17efb78")
> foundGeek = db.geeks.findOne({"_id": idGeek })
{
        "_id" : ObjectId("589eef5766b82271b17efb78"),
        "name" : ObjectId("589eef5766b82271b17efb78"),
        "stack" : "Algol"
}
>

#### After new seeds of Companys and Jobs loded:
> show collections
companys
geeks
jobs
> companyId = db.companys.findOne({"name": "MoGo" })["_id"]
ObjectId("589ef7185a49894908146cc3")
> 
> companyId = db.compnys.findOne({"name": "MoGo" })["_id"]
2017-02-11T15:01:20.347+0300 E QUERY    [thread1] TypeError: db.compnys.findOne(...) is null :
@(shell):1:13
> companyId = db.companys.findOne({"name": "MoGo" })["_id"]
ObjectId("589ef7185a49894908146cc3")
> jobsCompany = db.jobs.find({"company_id": companyId})
{ "_id" : ObjectId("589efc745a49894908146dd7"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Sinatra React", "place" : "Remote", "description" : "This is a nice remote job." }
{ "_id" : ObjectId("589efc745a49894908146dda"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Node React", "place" : "Permanent", "description" : "Perspective Node.js job for Team-lead." }
>

Write and update Job to other company

> companyId1 = db.companys.findOne({"name": "MoGo" })["_id"]
ObjectId("589ef7185a49894908146cc3")
> companyId2 = db.companys.findOne({"name": "Wirkkle" })["_id"]
ObjectId("589ef7185a49894908146cc4")
> job4 = db.jobs.findOne({"company_id": companyId1,"name": "Node React"})
{
        "_id" : ObjectId("589efe015a49894908146e33"),
        "company_id" : ObjectId("589ef7185a49894908146cc3"),
        "name" : "Node React",
        "place" : "Permanent",
        "description" : "Perspective Node.js job for Team-lead."
}
> db.jobs.find({"company_id": companyId1 } )
{ "_id" : ObjectId("589efe015a49894908146e30"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Sinatra React", "place" : "Remote", "description" : "This is a nice remote job." }
{ "_id" : ObjectId("589efe015a49894908146e33"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Node React", "place" : "Permanent", "description" : "Perspective Node.js job for Team-lead." }
> db.jobs.find({"company_id": companyId2 } )
{ "_id" : ObjectId("589efe015a49894908146e31"), "company_id" : ObjectId("589ef7185a49894908146cc4"), "name" : "Ruby React", "place" : "Contract", "description" : "Contract job with a lot of deadlines." }
> db.jobs.updateOne({"company_id": companyId2}, { $set: { "company_id" : companyId2 } } )
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 0 }
> db.jobs.find({"company_id": companyId2 } )
{ "_id" : ObjectId("589efe015a49894908146e31"), "company_id" : ObjectId("589ef7185a49894908146cc4"), "name" : "Ruby React", "place" : "Contract", "description" : "Contract job with a lot of deadlines." }
> db.jobs.find({"company_id": companyId1 } )
{ "_id" : ObjectId("589efe015a49894908146e30"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Sinatra React", "place" : "Remote", "description" : "This is a nice remote job." }
{ "_id" : ObjectId("589efe015a49894908146e33"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Node React", "place" : "Permanent", "description" : "Perspective Node.js job for Team-lead." }
> db.jobs.updateOne({"company_id": companyId2}, { $set: { "company_id" : companyId1 } } )
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 1 }
> db.jobs.find({"company_id": companyId1 } )
{ "_id" : ObjectId("589efe015a49894908146e30"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Sinatra React", "place" : "Remote", "description" : "This is a nice remote job." }
{ "_id" : ObjectId("589efe015a49894908146e31"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Ruby React", "place" : "Contract", "description" : "Contract job with a lot of deadlines." }
{ "_id" : ObjectId("589efe015a49894908146e33"), "company_id" : ObjectId("589ef7185a49894908146cc3"), "name" : "Node React", "place" : "Permanent", "description" : "Perspective Node.js job for Team-lead." }
> db.jobs.find({"company_id": companyId2 } )
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
      "$oid": "58a07a44885ce7e31f253360"
    },
    "geek_id": {
      "$oid": "589f01c85a49894908146ee5"
    },
    "invited": false,
    "job_id": {
      "$oid": "58a07a44885ce7e31f253360"
    },
    "read": true
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



##Usage

  Run in project folder (irb): __source 'start.rb'__
  
  can run the application by running from the same folder (say, /home/user/code/my_sinatra_app):
  
  rackup
  
  This starts WEBrick, which serves your application. You will notice that WEBRick tells you what IP and port it is serving; take note.
   You can access your application at http://IP:port.
  
  App usage example:
  
```
co = tem)
price = co.total

``` 
