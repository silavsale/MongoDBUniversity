# Use dbs and show collections for available namespaces

# find() returns a cursor with documents that match the find query

# count() returns the number of documents that match the find query

# pretty() formats the documents in the cursor

show dbs

use sample_training

show collections

db.zips.find({"state": "NY"})

db.zips.find({"state": "NY"}).count()

db.zips.find({"state": "NY", "city": "ALBANY"})

db.zips.find({"state": "NY", "city": "ALBANY"}).pretty()