
# Chapter 1: What is MongoDB?
###### Introduction to Atlas, and the MongoDB Shell

mongo Shell Quick Reference
https://docs.mongodb.com/manual/reference/mongo-shell/

# Chapter 2: Importing, Exporting, and Querying Data
###### BSON, JSON, importing and exporting data, and Basic Queries

* Optional reading:

JSON vs BSON
https://www.mongodb.com/json-and-bson

Read more about BSON
http://bsonspec.org/

# Chapter 3: Creating and Manipulating Documents

* Update Operators

Example: ```$inc``` , ``` $set ``` , ``` $unset ```
###### Insert, Update, and Delete operations
* Update Operators

https://docs.mongodb.com/manual/reference/operator/update/#id1

# Chapter 4: Advanced CRUD Operations
###### Query Operators
Provide additional ways to locate within the database

###### Comparison Operators

 * Query Operators - Comparison

``` $eq ``` = EQual to
``` $ne ``` = Not Equal to
``` $gt ``` > Greater than
``` $lt ``` < Less than
``` $gte ``` >= Greater than or equal to
``` $lte ``` <= Less than or equal to

``` $eq ``` - ```$ne``` - ```$gt``` - ```$lt``` - ```$gte``` - ```$lte``` all this operators use the same sintax the
```{ <field> : { <operator> : <value> } }
```
------------------------------------------------------------------------------------------------

 * Query Operators - Logic

Logical Query Operators Documentation https://docs.mongodb.com/manual/reference/operator/query-logical/

```$and```  Match all of the specified query clauses
```$or```   At least one of the query clauses is matched
```$nor``` Fail to match both given clauses
```$not``` Returns or documents that not match the query

```$and``` - ```$or``` - ```$nor``` this operators use this sintax ``` {<operator> : [{statment1}, {statment2}, ...]} ```

```$not``` use this sintax ``` { $not: {statment1}} ```

------------------------------------------------------------------------------------------------
* Implicit $and

Find which student ids are > 25 and < 100 in the sample_training.grades collection.

``` {"student_id": {"$gt" : 25, "$lt" : 100}} ```

* Explicit $and

Explicitly use ```$and``` when you need to include the same operator more than once in a query.

``` db.routes.find({ "$or" :[
                 { "dst_airport": "KZN" },
                 { "src_airport": "KZN" }
              ] },
              { "$or" :[
                   { "airplane": "CR2" },
                   { "airplane": "A81" } 
              ] }).count()   // returns 56
```

```
db.routes.find({ "$and": [ { "$or" :[ { "dst_airport": "KZN" },
                                    { "src_airport": "KZN" }
                                  ] },
                          { "$or" :[ { "airplane": "CR2" },
                                     { "airplane": "A81" } ] }
                         ]}).count() // returns 18
```

* Expressive Query Operator

```$expr``` allows the use of aggregasion expressions within the query language

``` {$expr: { <expression> } }  ```

```$expr``` allows the use variables and conditional statments

* Array Operators

To learn more about all available update operators in MQL, visit our excellent documentation page. https://docs.mongodb.com/manual/reference/operator/update/#id1

``` {<array field> : {"$size" : <number>}} ```
Returns a cursor with all documents where the specified array field is exactly the given length.

``` {<array field> : {"$all" : <array>}} ```
Returns a cursor with all documents in which the specified array field contains all the given elements regardless of their order in the array.

Quering an array field using documents
An array returns only exact array matches
A single element will return all documents whre the specified array field contains this given element.

* Array Operators and Projection

Projection Syntax

``` db.<collection>.find({ <query> }, { <projection> }) ```

```1``` - include the field
```0``` - exclude the field
Use only 1s or only 0s

``` db.<collection>.find({ <query> }, { <field1>: 1, <field2>: 1 }) ```
or
``` db.<collection>.find({ <query> }, { <field1>: 0, <field2>: 0 }) ```
exception: 
``` db.<collection>.find({ <query> }, { <field1>: 1, "_id": 0 }) ``` 
Only one exception - can exclude only "_id" with included fields

``` {<field> : {"$elemMatch" : { <field> : <value> }}} ```
Matches documents that contain an array field with at least one element that matches the specified query criteria.
or
Projects only the array elements with at least one element that matches the specified criteria.

* Array Operators and Sub-Documents

To learn more about querying arrays using MQL visit our excellent documentation page. To learn more about the $regex operator check out this documentation page.
https://docs.mongodb.com/manual/tutorial/query-arrays/
https://docs.mongodb.com/manual/reference/operator/query/regex/index.html

# Chapter 5 Indexing and Aggregation Pipeline

* Aggregation Framework

To learn more about aggregation, take our Aggregation Course!

https://university.mongodb.com/courses/M121/about

* Index

To learn more about performance and indexing with MongoDB, take our MongoDB Performance Course! https://university.mongodb.com/courses/M201/about

* Introduction to Data Modeling

Data modeling - a way to organize fields in a document to support your application performance and querying capabilities.

To learn more about data modeling with MongoDB, take our Data Modeling Course! Check out our documentation and blog.

https://university.mongodb.com/courses/M320/about

https://docs.mongodb.com/manual/core/data-modeling-introduction/

https://www.mongodb.com/blog/post/building-with-patterns-a-summary

* Upsert - Update or Insert?

# Chapter 6 Next Step

* Atlas Features - More Data Explorer

Try out Atlas Search by following this tutorial!
https://docs.atlas.mongodb.com/reference/atlas-search/tutorial/#fts-tutorial-ref

* Atlas Products and Options

To learn more about Realm check out our Realm documentation. https://docs.mongodb.com/realm/

To learn about application development with MongoDB take a course from our Developer series. https://university.mongodb.com/learning_paths/developer

Check out this Charts tutorial! https://docs.mongodb.com/charts/saas/tutorial/order-data/order-data-tutorial-overview/

* What is MongoDB Compass?

Documentation about the Validation tab in Compass. https://docs.mongodb.com/compass/current/validation/

Schema Validation with MongoDB Documentation. https://docs.mongodb.com/manual/core/schema-validation/

JSON Schema Validation - Locking down your model the smart way. https://www.mongodb.com/blog/post/json-schema-validation--locking-down-your-model-the-smart-way

JSON Schema Validation - Checking Your Arrays https://www.mongodb.com/blog/post/json-schema-validation--checking-your-arrays

* Why MongoDB? 

At this point you have learned enough to start having a meaningful conversation about why developers, DBAs, and companies choose MongoDB as their database.

This can also help you decide whether MongoDB is the right choice for you.

To help you learn more about specific use cases, we put together case studies and articles about some of our customers and community members.

We also added a link to the MongoDB Developer Hub and Community Forums where you can ask questions, learn new things, and connect with others who are diving into MongoDB content and products.

Take a look and feel free to browse for more information.

MongoDB Developer Hub https://developer.mongodb.com/
MongoDB Community Forums https://developer.mongodb.com/community/forums/
Case study: Bosch Leads Charge into Internet of Things https://www.mongodb.com/customers/bosch
Case study: Coinbase https://www.mongodb.com/who-uses-mongodb
Case study: SEGA https://www.mongodb.com/blog/post/sega-hardlight-migrates-to-mongodb-atlas-simplify-ops-improve-experience-mobile-gamers
How the Financial Sector Uses MongoDB https://www.mongodb.com/industries/financial-services