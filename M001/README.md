
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
```
db.routes.find({ "$or" :[
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