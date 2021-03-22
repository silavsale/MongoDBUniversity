# Connect to the Atlas cluster:
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"

# Switch to this database:
use sample_training

# Find all documents where the tripduration was less than or equal to 70 seconds and the usertype was not Subscriber:
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": { "$ne": "Subscriber" } }).pretty()

# Find all documents where the tripduration was less than or equal to 70 seconds and the usertype was Customer using a redundant equality operator:
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": { "$eq": "Customer" }}).pretty()

# Find all documents where the tripduration was less than or equal to 70 seconds and the usertype was Customer using the implicit equality operator:
db.trips.find({ "tripduration": { "$lte" : 70 },
                "usertype": "Customer" }).pretty()