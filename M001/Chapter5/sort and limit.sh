# Connect to the Atlas cluster:
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"

use sample_training

db.zips.find().sort({ "pop": 1 }).limit(1)

db.zips.find({ "pop": 0 }).count()

db.zips.find().sort({ "pop": -1 }).limit(1)

db.zips.find().sort({ "pop": -1 }).limit(10)

db.zips.find().sort({ "pop": 1, "city": -1 })