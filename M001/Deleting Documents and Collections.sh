# Commands used in this lesson:
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"

use sample_training

# ---------------------
# Look at all the docs that have test field equal to 1.

db.inspections.find({ "test": 1 }).pretty()

# ---------------------
# Look at all the docs that have test field equal to 3.

db.inspections.find({ "test": 3 }).pretty()

# ---------------------
# Delete all the documents that have test field equal to 1.

db.inspections.deleteMany({ "test": 1 })

# ---------------------
# Delete one document that has test field equal to 3.

db.inspections.deleteOne({ "test": 3 })

# ---------------------
# Inspect what is left of the inspection collection.

db.inspection.find().pretty()

# ---------------------
# View what collections are present in the sample_training collection.

show collections

# ---------------------
# Drop the inspection collection.

db.inspection.drop()
