
# Chapter 1: What is MongoDB?
###### Introduction to Atlas, and the MongoDB Shell



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
